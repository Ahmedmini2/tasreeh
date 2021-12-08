import 'dart:io';
import 'dart:typed_data';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:tsareeh/Screens/QR-Code/componants/qr_header.dart';
import 'package:tsareeh/components/rounded_button.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:tsareeh/Screens/Signup/Models/user_modle.dart';
import 'package:intl/intl.dart';
import 'package:gallery_saver/gallery_saver.dart';
import 'package:path_provider/path_provider.dart';
import 'package:share/share.dart';

import '../../../constants.dart';





class BodyRandom extends StatefulWidget {

  _BodyRandom createState() => _BodyRandom();


}
class _BodyRandom extends State<BodyRandom> {

  User? user = FirebaseAuth.instance.currentUser;
  UserModel loggedInUser = UserModel();
  DateTime now = DateTime.now();
  String get formattedDate => DateFormat('kk:mm:ss \n EEE d MMM yy').format(now);


  @override
  void initState(){


    super.initState();
    FirebaseFirestore.instance
        .collection("users").doc(user!.uid)
        .get()
        .then((value) {
      this.loggedInUser = UserModel.fromMap(value.data());
      setState(() {

      });
    });

  }


  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height:50),
            QRHeader(),
            SizedBox(height:80),
            QrImage(

              data: 'Access For ${loggedInUser.userName} Visitor \n Time Stamp :'+ formattedDate,
              size: 300,
            ),


            TextField(



              cursorColor: kPrimaryColor,
              decoration: InputDecoration(

                labelText: 'Access For ${loggedInUser.userName} Visitor \n Time Stamp : 30M' ,
                enabled: false,
                border: InputBorder.none,
              ),
            ),

            SizedBox(height:40),



            RoundedButton(
              text: "Share",
              press: () async {
                String path = await createQrPicture(loggedInUser.qrCode.toString());


                await Share.shareFiles(
                    [path],
                    mimeTypes: ["image/png"],
                    subject: 'My QR code',
                    text: 'Please scan me'
                        ' QR Inviter : ${loggedInUser.userName}'
                );
              },
            ),




            SizedBox(height: 30),


            SizedBox(height: 30),
          ],
        ),
      ),
    );
  }
  Future<String> createQrPicture(String qr) async {

    final qrValidationResult = QrValidator.validate(
      data: '${loggedInUser.qrCode}',
      version: QrVersions.auto,
      errorCorrectionLevel: QrErrorCorrectLevel.L,
    );
    qrValidationResult.status == QrValidationStatus.valid;
    qrValidationResult.error;
    QrCode? qrCode = qrValidationResult.qrCode;

    final painter = QrPainter.withQr(
      qr: qrCode!,
      color: const Color(0xFFFFFFFF),
      gapless: true,
      embeddedImageStyle: null,
      embeddedImage: null,
    );

    Directory tempDir = await getTemporaryDirectory();
    String tempPath = tempDir.path;
    final ts = DateTime.now().millisecondsSinceEpoch.toString();
    String path = '$tempPath/$ts.png';
    final picData = await painter.toImageData(2048, format: ImageByteFormat.png);
    await writeToFile(picData!, path);


    return path;
  }

  Future<void> writeToFile(ByteData data, String path) async {
    final buffer = data.buffer;
    await File(path).writeAsBytes(
        buffer.asUint8List(data.offsetInBytes, data.lengthInBytes)
    );
  }
}
