import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tsareeh/Screens/QR-Code/componants/qr_header2.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:tsareeh/Screens/Signup/Models/log_modle.dart';
import 'package:tsareeh/Screens/Signup/Models/user_modle.dart';
import 'package:intl/intl.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:tsareeh/Screens/home/Admin%20Dashboard/dashboard.dart';






class Body2 extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _Body2();

}

class _Body2 extends State<Body2> {

  final _auth = FirebaseAuth.instance;

  UserModel loggedInUser = UserModel();
  final qrkey = GlobalKey(debugLabel: 'QR');
   QRViewController? controller;
   Barcode? barcode;

  @override
  void dispose(){
    controller?.dispose();
    super.dispose();
  }

  @override
  void reassemble() async{
    super.reassemble();

    if(Platform.isAndroid){
      await controller!.pauseCamera();
    }
    controller!.resumeCamera();
  }

  @override
  Widget build(BuildContext context) => SafeArea(
      child: Scaffold(
        body: Stack(
          alignment: Alignment.center,
          children: <Widget>[
            buildQrView(context),
            Positioned(bottom: 10, child: buildResult()),
            Positioned(top: 10, child: buildControlButtons()),
          ],
        ),
      ),
    );


 Widget buildQrView(BuildContext context) => QRView(
      key: qrkey,
      onQRViewCreated: onQRViewCreated,
       overlay: QrScannerOverlayShape(
         borderRadius: 15,
       borderWidth: 10,
       borderLength: 20,
       borderColor: Color(0xFF79B033),
       cutOutSize: MediaQuery.of(context).size.width *0.8,
       ),
    );




  void onQRViewCreated(QRViewController controller) {
    setState(() {
      this.controller = controller;
    });

    controller.scannedDataStream.listen((barcode) => setState(() =>
      this.barcode = barcode
    ));
  }

 Widget buildResult() =>
    Container(
      padding: EdgeInsets.all((12)),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: Colors.white24,
      ),
        child: barcode != null
            ? IconButton(onPressed:() {
          postDetailsToFireStore();
        }, icon: Icon(Icons.save_outlined),)
            : Icon(Icons.desktop_access_disabled),
      );

 Widget buildControlButtons() =>
     Container(
       padding: EdgeInsets.symmetric(horizontal: 16),
       decoration: BoxDecoration(
         borderRadius: BorderRadius.circular(8),
         color: Colors.white24,
       ),
       child: Row(
         mainAxisSize: MainAxisSize.max,
         mainAxisAlignment: MainAxisAlignment.center,
         children: <Widget>[
         IconButton(onPressed:() async{
           await controller?.toggleFlash();
           setState(() {

           });
         },
             icon: FutureBuilder<bool?>(
             future: controller?.getFlashStatus(),
             builder: (context, snapshot) {
               if(snapshot.data != null) {
                 return Icon(
                     snapshot.data! ? Icons.flash_on : Icons.flash_off);
               } else {
                 return Container();
               }
             },
             ),
         ),


           IconButton(onPressed:() async{
             await controller?.flipCamera();
           },
               icon: FutureBuilder<bool?>(
                    future: controller?.getFlashStatus(),
                    builder: (context, snapshot) {
                    if(snapshot.data != null) {
                    return Icon(
                      Icons.switch_camera);
                        } else {
                      return Container();
                      }
                    },
              ),),
         ],
       ),
     );

  postDetailsToFireStore() async
  {
    // calling firestore
    //calling user model
    // sending these values

    FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
    User? user = _auth.currentUser;

    LogModle logModle = LogModle();

    // writing all values
    DateTime now = DateTime.now();
    String formattedDate = DateFormat('kk:mm:ss \n EEE d MMM yy').format(now);
    logModle.time = formattedDate;
    logModle.uid = user?.uid;
    logModle.qrCode = barcode!.code;

    print(logModle.time);
    print(logModle.uid);
    print(logModle.qrCode);



    await firebaseFirestore.collection("logfile")
        .doc()
        .set(logModle.toMap());
    Fluttertoast.showToast(msg: 'QR Added Seccesfully to Log File');

    Navigator.pushAndRemoveUntil(context,
        MaterialPageRoute(builder: (context) => Dashboard()),
            (route) => false);

  }
}

