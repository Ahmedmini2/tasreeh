import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:tsareeh/Screens/Request%20Qr%20Code/Components/rounded_company_name.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:tsareeh/Screens/Signup/Models/qr_request.dart';
import 'package:tsareeh/Screens/Signup/Models/user_modle.dart';
import 'package:tsareeh/Screens/home/home_screen.dart';
import 'package:tsareeh/components/rounded_button.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../constants.dart';
import 'home_header.dart';
import 'package:intl/intl.dart';


class Body extends StatefulWidget  {



  _Body createState() => _Body();
}
class _Body extends State<Body> {
  final _auth = FirebaseAuth.instance;


  final CompanyName = new TextEditingController();
  TextEditingController timeinput = TextEditingController();
  TextEditingController dateinput = TextEditingController();
  TextEditingController count = TextEditingController();
  String? ydate;
  String? mdate;
  String? ddate;







  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height:20),
            HomeHeaderRequest(),
            SizedBox(height:50),
            RoundedCompanyName(
              hintText: "Company Name",
              icon: Icons.home_work_outlined,
              onChanged: (value) {},
              controller: CompanyName,
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: 10),
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
              width: size.width * 0.8,
              decoration: BoxDecoration(
                color: kPrimaryLightColor,
                borderRadius: BorderRadius.circular(29),
              ),

              child: TextField(
                cursorColor: kPrimaryColor,
              controller: timeinput, //editing controller of this TextField
              decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: "Enter Time",
                  icon: Icon(Icons.timer , color: kPrimaryColor,), //icon of text field

              ),
              readOnly: true,  //set it true, so that user will not able to edit text
              onTap: () async {
                TimeOfDay? pickedTime =  await showTimePicker(
                  initialTime: TimeOfDay.now(),
                  context: context,
                );

                if(pickedTime != null ){
                  print(pickedTime.format(context));   //output 10:51 PM
                  DateTime parsedTime = DateFormat.jm().parse(pickedTime.format(context).toString());
                  //converting to DateTime so that we can further format on different pattern.
                  print(parsedTime); //output 1970-01-01 22:53:00.000
                  String formattedTime = DateFormat('HH:mm:ss').format(parsedTime);
                  print(formattedTime); //output 14:59:00
                  //DateFormat() is from intl package, you can format the time on any pattern you need.

                  setState(() {
                    timeinput.text = formattedTime; //set the value of text field.
                  });
                }else{
                  print("Time is not selected");
                }
              },
            ),

            ),

        Container(
          margin: EdgeInsets.symmetric(vertical: 10),
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
          width: size.width * 0.8,
          decoration: BoxDecoration(
            color: kPrimaryLightColor,
            borderRadius: BorderRadius.circular(29),
          ),

          child: TextField(
              cursorColor: kPrimaryColor,
              controller: dateinput, //editing controller of this TextField
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: "Enter Date",
                icon: Icon(Icons.timer , color: kPrimaryColor,), //icon of text field

              ),
              readOnly: true,  //set it true, so that user will not able to edit text
              onTap: () {
                DatePicker.showDatePicker(context,
                    showTitleActions: true,
                    minTime: DateTime(2022, 1, 1),
                    maxTime: DateTime(2030, 12, 31),
                    onChanged: (date) {
                      print('change $date');
                      dateinput.text =
                          ydate.toString() + " / " +  mdate.toString() + " / " + ddate.toString() ;
                    },
                    onConfirm: (date) {
                      print('confirm $date');
                      ydate = date.year.toString();
                      mdate = date.month.toString();
                      ddate = date.day.toString();
                      dateinput.text =
                          ydate.toString() + " / " +  mdate.toString() + " / " + ddate.toString() ;
                    },

                    currentTime: DateTime.now(),
                    locale: LocaleType.en);

                setState(() {
                  dateinput.text =
                      ydate.toString() + " / " +  mdate.toString() + " / " + ddate.toString() ; //set the value of text field.
                });
              }
          ),
        ),


        Container(
          margin: EdgeInsets.symmetric(vertical: 10),
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
          width: size.width * 0.8,
          decoration: BoxDecoration(
            color: kPrimaryLightColor,
            borderRadius: BorderRadius.circular(29),
          ),

          child: TextField(
            controller: count,
              decoration: new InputDecoration(
                border: InputBorder.none,
                hintText: "Enter Number Of People"
              ),

              keyboardType: TextInputType.number,
              cursorColor: kPrimaryColor,

              inputFormatters: <TextInputFormatter>[
                FilteringTextInputFormatter.digitsOnly
              ], // Only numbers can be entered
            ),





),

            SizedBox(height:80),

            RoundedButton(
              text: "Request",
              press: () async {
                postDetailsToFireStore();
                Scaffold.of(context).showSnackBar(SnackBar(
                  content:  Text('Your Request have been Confirmed')
                ));
              },
            ),

          ],
        ),
      ),
    );
  }

  postDetailsToFireStore() async
  {
    final prefs = await SharedPreferences.getInstance();
    int? ramp = prefs.getInt('counter');
    prefs.setInt('counter', ramp!+1);
    final counter = prefs.getInt('counter') ?? 0;
    // calling firestore
    //calling user model
    // sending these values

    FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
    User? user = _auth.currentUser;

    QrRequests qrRequests = QrRequests();


    qrRequests.id = user!.uid;
    qrRequests.propertyName = CompanyName.text;
    qrRequests.time = timeinput.text;
    qrRequests.date = dateinput.text;
    qrRequests.numberOfPeople = count.text;
    qrRequests.status = "Pending";

    print(qrRequests.id);
    print(qrRequests.propertyName);
    print(qrRequests.time);
    print(qrRequests.date);
    print(qrRequests.numberOfPeople);




    await firebaseFirestore.collection("qrrequest")
        .doc()
        .set(qrRequests.toMap());
    Fluttertoast.showToast(msg: 'QR Added Seccesfully to Log File');

    Navigator.pushAndRemoveUntil(context,
        MaterialPageRoute(builder: (context) => HomeScreen()),
            (route) => false);

  }
}

