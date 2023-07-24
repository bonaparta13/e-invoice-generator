# E-invoice Generator

the package generates Qr code compatible with Electronic Invoice in KSA

## Installation

1. Add the latest version of package to your pubspec.yaml (and run`dart pub get`):

```yaml
dependencies:
  e_invoice_generator: ^0.1.2
```

2. Import the package and use it in your Flutter App.

```dart
import 'package:e_invoice_generator/e_invoice_generator.dart';
```

```dart
   EinvoiceGenerator(
              sellerName: 'bonaparta',
              sellerTRN: '123456789012345',
              totalWithVat: '150',
              vatPrice: '30',
              size: 200,
            ),
```

# Code result

<img  src="https://user-images.githubusercontent.com/67749770/156078667-3be275d4-5419-4b08-a4f0-f07b76c27fa2.png"  width="400">

you can scan the code only with any KSA E-invoice Qr Reader [try one](https://play.google.com/store/apps/details?id=com.posbankbh.einvoiceqrreader)

# Scan result

<img  src="https://user-images.githubusercontent.com/67749770/156076878-77b5efef-5d58-436c-92de-41cdb99411a3.jpg"  width="400">
