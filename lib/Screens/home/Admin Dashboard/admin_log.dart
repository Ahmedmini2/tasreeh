import 'package:flutter/material.dart';

import 'package:tsareeh/Screens/home/components/admin_log-body.dart';
import 'package:tsareeh/components/admin_coustom_bottom_nav_bar.dart';
import 'package:cloud_firestore/cloud_firestore.dart';



import '../../../enums.dart';
import '../components/body.dart';

class AdminLog extends StatelessWidget {
  static String routeName = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      backgroundColor: Color(0xFFE9E9EA),
      appBar:  AppBar(
        backgroundColor: Color(0xFFE9E9EA),
      bottomOpacity: 0,
      elevation: 0.0,
      shadowColor: Colors.black,
      toolbarHeight: 100,
      automaticallyImplyLeading: false,
      centerTitle: false,
      title: Text('Log File' ,style: TextStyle(fontSize: 25 , color: Colors.black),),

      ),
      body: StreamBuilder<QuerySnapshot>(
          stream: FirebaseFirestore.instance.collection('logfile').snapshots(),
          builder:
              (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
            if (!snapshot.hasData) {
              return Center(
                child: CircularProgressIndicator(),
              );
            }

            return ListView(
              children: snapshot.data!.docs.map((
                  DocumentSnapshot doc) {
                return Center(
                  child: Container(
                    width: MediaQuery.of(context).size.width / 1.05,
                    height: MediaQuery.of(context).size.height / 4,
                    child: Row(

                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Flexible(

                          child: Card(

                            shadowColor: Color(0x4d4c4c4c),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(18.0),
                                side: BorderSide(color: Color(0xff4c4b4b))
                            ),
                            elevation: 20,
                            child: Column(
    
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text("Time: " + doc['time'].toString(), maxLines: 3, style: TextStyle(fontSize: 20 , fontWeight: FontWeight.bold),),
                                  ],
                                ),
                                SizedBox(height: 20.0,),

                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text("QR-CODE: \n" ,style: TextStyle(fontSize: 20),maxLines: 2,),


                                  ],
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(doc['qrcode'].toString(), style: TextStyle(fontSize: 15) , maxLines: 2,),


                                  ],
                                ),

                                SizedBox(height: 20.0,),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text('Scanned By : Admin' ,style: TextStyle(fontSize: 15)),
                                  ],
                                )


                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              }).toList(),
            );
          }),
      bottomNavigationBar: AdminCustomBottomNavBar(selectedMenu: MenuState.home),
    );
  }
}
