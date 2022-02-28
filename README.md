
# E-invoice Generator

the package generates Qr code compitable with Electronice invoice in KSA

## Installation 

1. Add the latest version of package to your pubspec.yaml (and run`dart pub get`):
```yaml
dependencies:
  e_invoice_generator: ^0.0.1
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


<img  src="https://user-images.githubusercontent.com/67749770/156076878-77b5efef-5d58-436c-92de-41cdb99411a3.jpg"  width="400">

