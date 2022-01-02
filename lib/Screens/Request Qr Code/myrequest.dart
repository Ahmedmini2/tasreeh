import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:tsareeh/Screens/home/components/admin_log-body.dart';
import 'package:tsareeh/components/admin_coustom_bottom_nav_bar.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:qr_flutter/qr_flutter.dart';




import '../../../enums.dart';


class MyRequest extends StatelessWidget {
  User? user = FirebaseAuth.instance.currentUser;

  static String routeName = "";
  @override
  Widget build(BuildContext context) {
    final _auth = FirebaseAuth.instance;
    User? user = _auth.currentUser;
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
        title: Text('My Requests' ,style: TextStyle(fontSize: 25 , color: Colors.black),),

      ),
      body: StreamBuilder<QuerySnapshot>(
          stream: FirebaseFirestore.instance.collection('qrrequest').where('id', isEqualTo: user!.uid).snapshots(),
          builder:
              (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
            if (!snapshot.hasData) {
              return Center(
                child: CircularProgressIndicator(),
              );
            }

            return ListView(
              scrollDirection: Axis.horizontal,
              children: snapshot.data!.docs.map((
                  DocumentSnapshot doc) {
                return Center(
                  child: Container(
                    width: MediaQuery.of(context).size.width / 1.05,
                    height: MediaQuery.of(context).size.height / 1,
                    child: Row(

                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Flexible(


                          child: Card(

                           color: doc['status'].toString() == 'Pending' ? Color(
                               0x79928600) : doc['status'].toString() == 'Approved' ? Color(0x6b41ac02) : Color(
                        0x6b800303),

                            shadowColor: Color(0x4d4c4c4c),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(18.0),
                                side: BorderSide(color: Color(0xff4c4b4b))
                            ),
                            elevation: 20,
                            child: Column(

                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: <Widget>[
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  
                                  children: [
                                    Padding(padding: EdgeInsets.only(left: 20, top: 70)),
                                    Text("Event Name: " +"\n"+ doc['propertyName'].toString(), maxLines: 3, style: TextStyle(fontSize: 18 , fontWeight: FontWeight.bold , color: Colors.white),),
                                    SizedBox(width: 100,),
                                    Text(doc['date'].toString() + "\n" + doc['time'].toString(), style: TextStyle(fontSize: 16, color: Colors.white) , maxLines: 2,),
                                  ],
                                ),
                                SizedBox(height: 20.0,),

                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text("Email: "+user.email.toString() ,style: TextStyle(fontSize: 16 , color: Colors.white),)



                                  ],
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [



                                  ],
                                ),

                                SizedBox(height: 20.0,),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    doc['status'].toString() == 'Pending' ?
                                    Text(doc['status'].toString() ,style: TextStyle(fontSize: 18 , color: Colors.black, fontWeight: FontWeight.bold))
                                        :  Text(doc['status'].toString() ,style: TextStyle(fontSize: 18 , color: Colors.black, fontWeight: FontWeight.bold))
                                  ],
                                ),

                                SizedBox(height: 100,),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    QrImage(
                                      data: '${user.uid+doc['propertyName'].toString()+doc['date'].toString()}',
                                      size: 200,
                                      foregroundColor: Colors.white,
                                    ),
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
