import 'package:jaspr/jaspr.dart';
import 'package:membership_app_client/membership_app_client.dart' as mem;
import 'dart:async';

@client
class ChartDartComponent extends StatefulComponent {
  const ChartDartComponent({super.key});

  @override
  State createState() => _ChartDartComponentState();
}

class _ChartDartComponentState extends State<ChartDartComponent> {
  final client = mem.Client('http://localhost:8080/');

  String mode = 'monthly'; // monthly / yearly
  String period = '2025'; // default
  Map<String, int> chartData = {};

  // State untuk Tooltip
  String? tooltipText;
  double tooltipX = 0;
  double tooltipY = 0;
  bool showTooltip = false;

  @override
  void initState() {
    super.initState();
    fetchChartData();
  }

  Future<void> fetchChartData() async {
    try {
      final data = await client.dashboard.getMemberChartData(
        mode: mode,
        period: period,
      );
      setState(() {
        chartData = data;
      });
    } catch (e) {
      print('Error fetching chart data: $e');
    }
  }

  int roundToNiceNumber(int value) {
    if (value == 0) return 10; 
    int magnitude = (value / 10).ceil();
    return magnitude * 10; // Membulatkan ke kelipatan 10
  }

  @override
  Iterable<Component> build(BuildContext context) sync* {
    final labels = chartData.keys.toList();
    final values = chartData.values.toList();

    if (labels.isEmpty) {
      yield div([text('Tidak ada data grafik')]);
      return;
    }

    final maxVal = roundToNiceNumber(values.reduce((a, b) => a > b ? a : b));
    final width = 1300;
    final height = 650;
    final padding = 50;
    final stepX = (width - 2 * padding) / (labels.length - 1);
    final stepY = (height - 2 * padding) / (maxVal == 0 ? 1 : maxVal);

    double valueToY(double val) {
      return height - padding - (val * stepY);
    }

    yield div(classes: 'chart-container', [
      h3([text('Jumlah Member Baru')]),
      // Dropdown 1: yearly / monthly
      select(
        [
          option(value: 'yearly', selected: (mode == 'yearly'), [text('Per Tahun')]),
          option(value: 'monthly', selected: (mode == 'monthly'), [text('Per Bulan')]),
        ],
        onChange: (val) {
          setState(() {
            mode = val.first;
            period = mode == 'yearly' ? '2025' : 'Januari';
          });
          fetchChartData();
        },
      ),
      // Dropdown 2: isi bergantung mode
      if (mode == 'yearly')
        select(
          [
            for (final year in ['2022', '2023', '2024', '2025'])
              option(value: year, selected: (period == year), [text(year)])
          ],
          onChange: (val) {
            setState(() => period = val.first);
            fetchChartData();
          },
        )
      else
        select(
          [
            for (final m in ['Januari', 'Februari', 'Maret', 'April', 'Mei'])
              option(value: m, selected: (period == m), [text(m)])
          ],
          onChange: (val) {
            setState(() => period = val.first);
            fetchChartData();
          },
        ),

      // SVG Grafik
      DomComponent(
        tag: 'svg',
        attributes: {
          'viewBox': '0 0 $width $height',
          'width': '100%', // Buat responsif
          'height': '100%', // Penuhi container
          'preserveAspectRatio': 'none',
          'style': 'background: white; border: 1px solid #ccc;'
        },
        children: [
          // Garis sumbu X
          DomComponent(tag: 'line', attributes: {
            'x1': '$padding',
            'y1': '${height - padding}',
            'x2': '${width - padding}',
            'y2': '${height - padding}',
            'stroke': 'black',
            'stroke-width': '2',
          }),
          // Garis sumbu Y
          DomComponent(tag: 'line', attributes: {
            'x1': '$padding',
            'y1': '$padding',
            'x2': '$padding',
            'y2': '${height - padding}',
            'stroke': 'black',
            'stroke-width': '2',
          }),

          // Grid garis horizontal
          for (int i = 1; i <= 5; i++)
            DomComponent(tag: 'line', attributes: {
              'x1': '$padding',
              'y1': '${height - padding - (i * stepY * (maxVal / 5))}',
              'x2': '${width - padding}',
              'y2': '${height - padding - (i * stepY * (maxVal / 5))}',
              'stroke': '#ddd',
              'stroke-width': '1',
            }),

          // Label sumbu Y
          for (int i = 0; i <= 5; i++)
            DomComponent(tag: 'text', attributes: {
              'x': '${padding - 10}',
              'y': '${height - padding - (i * stepY * (maxVal / 5))}',
              'text-anchor': 'end',
              'font-size': '12px'
            }, children: [text('${(i * maxVal ~/ 5)}')]),

          // Garis Grafik
          DomComponent(
            tag: 'polyline',
            attributes: {
              'points': labels.asMap().entries.map((entry) {
                final i = entry.key;
                final x = padding + i * stepX;
                final y = valueToY(values[i].toDouble());
                return '$x,$y';
              }).join(' '),
              'fill': 'none',
              'stroke': '#16A34A',
              'stroke-width': '2',
            },
          ),

          // Garis putus-putus dari titik ke sumbu X
          for (final entry in labels.asMap().entries)
            DomComponent(tag: 'line', attributes: {
              'x1': '${padding + entry.key * stepX}',
              'y1': '${valueToY(values[entry.key].toDouble())}',
              'x2': '${padding + entry.key * stepX}',
              'y2': '${height - padding}',
              'stroke': 'gray',
              'stroke-dasharray': '5, 5', // Garis putus-putus
            }),

          // Titik-titik dengan tooltip
          for (final entry in labels.asMap().entries)
            DomComponent(
              tag: 'circle',
              attributes: {
                'cx': '${padding + entry.key * stepX}',
                'cy': '${valueToY(values[entry.key].toDouble())}',
                'r': '5',
                'fill': '#16A34A',
                'data-label': '${entry.value}: ${values[entry.key]} Member'
              },
              events: {
                'mouseenter': (event) {
                  setState(() {
                    showTooltip = true;
                    tooltipText = '${entry.value}: ${values[entry.key]} Member';
                    tooltipX = padding + entry.key * stepX;
                    tooltipY = valueToY(values[entry.key].toDouble()) - 10;
                  });
                },
                'mouseleave': (event) {
                  setState(() {
                    showTooltip = false;
                  });
                }
              },
            ),

          // Tooltip
          if (showTooltip)
            DomComponent(tag: 'text', attributes: {
              'x': '$tooltipX',
              'y': '$tooltipY',
              'text-anchor': 'middle',
              'font-size': '12px',
              'fill': 'black',
              'background': 'white'
            }, children: [text(tooltipText!)]),

          // Label sumbu X
          for (final entry in labels.asMap().entries)
            DomComponent(tag: 'text', attributes: {
              'x': '${padding + entry.key * stepX}',
              'y': '${height - padding + 15}',
              'text-anchor': 'middle',
              'font-size': '12px'
            }, children: [text(entry.value)]),
        ],
      ),
    ]);
  }
}
