import 'package:jaspr/jaspr.dart';

class MemberVerificationComponent extends StatelessComponent {
  const MemberVerificationComponent({super.key});

  @override
  Iterable<Component> build(BuildContext context) sync* {
    yield div(classes: 'verification-container', [
      div(classes: 'verification-ktp', [
        img(src: '/images/ktp.png', alt: 'KTP Image', classes: 'ktp-image'),
      ]),
      // Form Section
      div(classes: 'verification-form', [
        div(classes: 'form-field', [
          label([text('Nama Pelanggan')]),
          input([], value: 'Agus Sutikno', disabled: true),
        ]),
        div(classes: 'form-field', [
          label([text('No. WhatsApp')]),
          input([], value: '082255710410', disabled: true),
        ]),
        div(classes: 'form-field', [
          label([text('NIK')]),
          input([], value: '3129127371610461', disabled: true),
        ]),
        div(classes: 'form-field', [
          label([text('Alamat KTP')]),
          input([], value: 'Jl. Pegadaian, RT/RW 05/0002', disabled: true),
        ]),
        div(classes: 'form-field', [
          label([text('Kelurahan')]),
          input([], value: 'Gadai Hulu', disabled: true),
        ]),
        div(classes: 'form-field', [
          label([text('Kecamatan')]),
          input([], value: 'Gadai', disabled: true),
        ]),
        div(classes: 'form-field', [
          label([text('Kabupaten')]),
          input([], value: 'Sleman', disabled: true),
        ]),
        div(classes: 'form-field', [
          label([text('Provinsi')]),
          input([], value: 'DIY Yogyakarta', disabled: true),
        ]),
        button(classes: 'verification-button verify', [text('VERIFIKASI')]),
        button(classes: 'cancel-button', [text('KEMBALI')]),
      ]),
    ]);
  }
}
