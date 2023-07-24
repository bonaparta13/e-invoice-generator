import 'dart:convert';
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:qr_bar_code/qr/qr.dart';

class EinvoiceGenerator extends StatelessWidget {
  const EinvoiceGenerator({
    Key? key,
    required this.sellerName,
    required this.sellerTRN,
    required this.vatPrice,
    required this.totalWithVat,
    this.backgroundColor = Colors.transparent,
    this.size = 200,
    this.eyeStyle,
  }) : super(
          key: key,
        );
  final String sellerName;
  final String sellerTRN;
  final String vatPrice;
  final String totalWithVat;
  final double size;
  final Color backgroundColor;
  final QREyeStyle? eyeStyle;

  String _getQrCodeContent() {
    var dateTime = DateTime.now();
    final invoiceDate =
        "${dateTime.year}-${dateTime.month}-${dateTime.day} ${dateTime.hour}:${dateTime.minute}";
    final bytesBuilder = BytesBuilder();
    // 1. Seller Name
    bytesBuilder.addByte(1);
    final sellerNameBytes = utf8.encode(sellerName);
    bytesBuilder.addByte(sellerNameBytes.length);
    bytesBuilder.add(sellerNameBytes);
    // 2. VAT Registration
    bytesBuilder.addByte(2);
    final vatRegistrationBytes = utf8.encode(sellerTRN);
    bytesBuilder.addByte(vatRegistrationBytes.length);
    bytesBuilder.add(vatRegistrationBytes);
    // 3. Time
    bytesBuilder.addByte(3);
    final time = utf8.encode(invoiceDate);
    bytesBuilder.addByte(time.length);
    bytesBuilder.add(time);
    // 4. total with vat
    bytesBuilder.addByte(4);
    final p1 = utf8.encode(totalWithVat);
    bytesBuilder.addByte(p1.length);
    bytesBuilder.add(p1);
    // 5.  vat
    bytesBuilder.addByte(5);
    final p2 = utf8.encode(vatPrice);
    bytesBuilder.addByte(p2.length);
    bytesBuilder.add(p2);

    final qrCodeAsBytes = bytesBuilder.toBytes();
    const b64Encoder = Base64Encoder();
    return b64Encoder.convert(qrCodeAsBytes);
  }

  @override
  Widget build(BuildContext context) {
    return QRCode(
      data: _getQrCodeContent(),
      size: size,
      eyeStyle: eyeStyle ??
          const QREyeStyle(
            eyeShape: QREyeShape.square,
            color: Colors.black,
          ),
      backgroundColor: backgroundColor,
    );
  }
}
