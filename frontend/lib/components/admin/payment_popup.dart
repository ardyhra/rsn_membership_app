import 'package:jaspr/jaspr.dart';

class PaymentPopup extends StatefulComponent {
  final List<String> paymentUrls;
  final int currentIndex;
  final VoidCallback onClose;

  const PaymentPopup({
    required this.paymentUrls,
    required this.currentIndex,
    required this.onClose,
    super.key,
  });

  @override
  State<StatefulComponent> createState() => _PaymentPopupState();
}

class _PaymentPopupState extends State<PaymentPopup> {
  late int currentPaymentIndex;

  @override
  void initState() {
    super.initState();
    currentPaymentIndex = component.currentIndex;
  }

  void nextImage() {
    if (currentPaymentIndex < component.paymentUrls.length - 1) {
      setState(() => currentPaymentIndex++);
    }
  }

  void prevImage() {
    if (currentPaymentIndex > 0) {
      setState(() => currentPaymentIndex--);
    }
  }

  @override
  Iterable<Component> build(BuildContext context) sync* {
    yield div(
      classes: 'payment-popup-overlay',
      events: {'click': (_) => component.onClose()},
      [
        div(
          classes: 'payment-popup-content',
          events: {'click': (evt) => evt.preventDefault()},
          [
            // Carousel Container
            img(
              src: component.paymentUrls[currentPaymentIndex],
              alt: 'Payment',
              classes: 'payment-image',
            ),
            div(classes: 'carousel-controls', [
              button(
                classes: 'carousel-prev',
                onClick: prevImage,
                [text('<')],
              ),
              button(
                classes: 'carousel-next',
                onClick: nextImage,
                [text('>')],
              ),
            ]),
            button(
              classes: 'close-button',
              onClick: component.onClose,
              [text('Tutup')],
            ),
          ],
        ),
      ],
    );
  }
}
