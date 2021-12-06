import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tsareeh/Screens/Signup/signup_screen.dart';
import 'package:tsareeh/Screens/home/Admin%20Dashboard/dashboard.dart';
import 'package:tsareeh/Screens/home/home_screen.dart';
import 'package:tsareeh/components/already_have_an_account_acheck.dart';
import 'package:tsareeh/components/rounded_button.dart';
import 'package:tsareeh/components/rounded_input_field.dart';
import 'package:tsareeh/components/rounded_password_field.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'background.dart';

class Body extends StatefulWidget {
  _Body createState() => _Body();

}
class _Body extends State<Body> {
  final emailController = new TextEditingController();
  final passwordController = new TextEditingController();


  final _auth = FirebaseAuth.instance;
  _Body() : super();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Background(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              "LOGIN",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            SizedBox(height: size.height * 0.03),
            Image.asset(
              "assets/icons/login1.png",
              height: size.height * 0.35,
            ),
            SizedBox(height: size.height * 0.03),
            RoundedInputField(
              hintText: "Your Email",
              onChanged: (value) {},
              controller: emailController,


            ),
            RoundedPasswordField(
              onChanged: (value) {},
              controller: passwordController,

            ),
            RoundedButton(
              text: "LOGIN",
              press: () {
                if(emailController.text == "admin@gmail.com" && passwordController.text == "tasreeh@2021"){
                  signin2(emailController.text, passwordController.text);
                }else {
                  signin(emailController.text, passwordController.text);
                }
                // Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => HomeScreen()));
              },
            ),
            SizedBox(height: size.height * 0.03),
            AlreadyHaveAnAccountCheck(
              press: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return SignUpScreen();
                    },
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  void signin(String email, String password) async
  {

    if(emailController.text != "" && passwordController.text != "")
    {


      await _auth.signInWithEmailAndPassword(email: email, password: password)
          .then((uid) => {
        Fluttertoast.showToast(msg: "Login Successful"),
        Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => HomeScreen()))
      }).catchError((e) {
        print(e);
      });
    }
    else
    {
      Fluttertoast.showToast(msg: "Verify Your Email Please");
    }
  }

  void signin2(String email, String password) async
  {

    if(emailController.text != "" && passwordController.text != "")
    {


      await _auth.signInWithEmailAndPassword(email: email, password: password)
          .then((uid) => {
        Fluttertoast.showToast(msg: "Login Successful"),
        Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => Dashboard()))
      }).catchError((e) {
        print(e);
      });
    }
    else
    {
      Fluttertoast.showToast(msg: "Verify Your Email Please");
    }
  }
}
