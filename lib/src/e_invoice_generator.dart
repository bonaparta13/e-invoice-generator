import 'dart:convert';
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';

class EinvoiceGenerator extends StatelessWidget {
  EinvoiceGenerator({
    Key? key,
    required this.sellerName,
    required this.sellerTRN,
    required this.vatPrice,
    required this.totalWithVat,
    this.size = 200,
  }) : super(key: key);
  String sellerName;
  String sellerTRN;
  String vatPrice;
  String totalWithVat;
  double size;

  @override
  Widget build(BuildContext context) {
    String _getQrCodeContent() {
      var dateTime = DateTime.now();
      String invoiceDate =
          "${dateTime.year}-${dateTime.month}-${dateTime.day} ${dateTime.hour}:${dateTime.minute}";
      BytesBuilder bytesBuilder = BytesBuilder();
// 1. Seller Name
      bytesBuilder.addByte(1);
      List<int> sellerNameBytes = utf8.encode(sellerName);
      bytesBuilder.addByte(sellerNameBytes.length);
      bytesBuilder.add(sellerNameBytes);
// 2. VAT Registration
      bytesBuilder.addByte(2);
      List<int> vat_registrationBytes = utf8.encode(sellerTRN);
      bytesBuilder.addByte(vat_registrationBytes.length);
      bytesBuilder.add(vat_registrationBytes);
// 3. Time
      bytesBuilder.addByte(3);
      List<int> time = utf8.encode(invoiceDate);
      bytesBuilder.addByte(time.length);
      bytesBuilder.add(time);
// 4. total with vat
      bytesBuilder.addByte(4);
      List<int> p1 = utf8.encode(totalWithVat);
      bytesBuilder.addByte(p1.length);
      bytesBuilder.add(p1);
// 5.  vat
      bytesBuilder.addByte(5);
      List<int> p2 = utf8.encode(vatPrice);
      bytesBuilder.addByte(p2.length);
      bytesBuilder.add(p2);
      //
      Uint8List qrCodeAsBytes = bytesBuilder.toBytes();

      Base64Encoder b64Encoder = const Base64Encoder();
      return b64Encoder.convert(qrCodeAsBytes);
    }

    return QrImage(
      data: _getQrCodeContent(),
      version: QrVersions.auto,
      size: size,
    );
  }
}
