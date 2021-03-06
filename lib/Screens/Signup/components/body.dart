import 'package:flutter/material.dart';
import 'package:tsareeh/Screens/Login/login_screen.dart';
import 'package:tsareeh/Screens/Signup/Models/user_modle.dart';
import 'package:tsareeh/Screens/Signup/components/social_icon.dart';
import 'package:tsareeh/Screens/Signup/providers/apple_auth.dart';
import 'package:tsareeh/Screens/home/home_screen.dart';
import 'package:tsareeh/components/already_have_an_account_acheck.dart';
import 'package:tsareeh/components/rounded_button.dart';
import 'package:tsareeh/components/rounded_input_field.dart';
import 'package:tsareeh/components/rounded_password_field.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';
import 'package:the_apple_sign_in/the_apple_sign_in.dart';
import 'package:google_sign_in/google_sign_in.dart';

import 'background.dart';
import 'or_divider.dart';

class Body extends StatefulWidget {
  _Body createState() => _Body();

}
class _Body extends State<Body> {
  GoogleSignIn _googleSignIn = GoogleSignIn(scopes: ['email']);
  final _auth = FirebaseAuth.instance;

  final userNameController = new TextEditingController();
  final emailController = new TextEditingController();
  final passwordController = new TextEditingController();



  @override
  Widget build(BuildContext context) {
    GoogleSignInAccount? user = _googleSignIn.currentUser;

    Size size = MediaQuery.of(context).size;
    return Background(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SizedBox(height: size.height * 0.03),
            Text(
              "SIGNUP",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            SizedBox(height: size.height * 0.03),
            Image.asset(
              "assets/icons/signup.png",
              height: size.height * 0.25,
            ),
            SizedBox(height: size.height * 0.03),
            RoundedInputField(
              hintText: "Username",
              onChanged: (value) {},
              controller: userNameController,

            ),
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
              text: "SIGNUP",
              press: () {
                signup(emailController.text, passwordController.text);
                // Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => LoginScreen()));
              },
            ),
            SizedBox(height: size.height * 0.03),
            AlreadyHaveAnAccountCheck(
              login: false,
              press: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return LoginScreen();
                    },
                  ),
                );
              },
            ),
            OrDivider(),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[

                SocalIcon(
                  iconSrc: "assets/icons/apple-seeklogo.com.svg",
                  press: () {
                    _signInWithApple(context);
                  },
                ),
                SocalIcon(
                  iconSrc: "assets/icons/google-plus.svg",
                  press: () async {
                    await signInWithGoogle();

                      setState(() {});

                  },
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  void signup(String email , String password) async {
    if (emailController.text != "" || passwordController.text != "" || userNameController.text != "")
    {
      await _auth.createUserWithEmailAndPassword(email: email, password: password).then((value) => {
        postDetailsToFireStore()

      }).catchError((e)
      {
        Fluttertoast.showToast(msg: e!.message);
      });
    }
  }

  postDetailsToFireStore() async
  {
    // calling firestore
    //calling user model
    // sending these values

    FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
    User? user = _auth.currentUser;

    UserModel userModel = UserModel();

    // writing all values

    userModel.email = user!.email;
    userModel.uid = user.uid;
    userModel.userName = userNameController.text;
    userModel.qrCode = userNameController.text+user.uid;



    await firebaseFirestore.collection("users")
        .doc(user.uid)
        .set(userModel.toMap());
    Fluttertoast.showToast(msg: 'Account Created Successfully');

    Navigator.pushAndRemoveUntil(context,
        MaterialPageRoute(builder: (context) => HomeScreen()),
            (route) => false);

  }

  // Apple Sign in Method

  Future<void> _signInWithApple(BuildContext context) async {
    try {
      final authService = Provider.of<AuthService>(context, listen: false);
      final appleuser = await authService.signInWithApple(
          scopes: [Scope.email, Scope.fullName]);
      print('uid: ${appleuser.uid}');




      FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
      User? user = _auth.currentUser;

      UserModel userModel = UserModel();

      // writing all values

      userModel.email = Scope.email as String?;
      userModel.uid = user?.uid;
      userModel.userName = Scope.fullName as String;
      userModel.qrCode = userModel.userName.toString() + user!.uid;



      await firebaseFirestore.collection("users")
          .doc(user?.uid)
          .set(userModel.toMap());
      Fluttertoast.showToast(msg: 'Account Created Successfully');

      Navigator.pushAndRemoveUntil(context,
          MaterialPageRoute(builder: (context) => HomeScreen()),
              (route) => false);

    } catch (e) {
      // TODO: Show alert here
      print(e);
    }
  }




  // Google Sign In


  Future signInWithGoogle() async {
    // Trigger the authentication flow
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

    // Obtain the auth details from the request
    final GoogleSignInAuthentication googleAuth = await googleUser!.authentication;

    // Create a new credential
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );

    await  FirebaseAuth.instance.signInWithCredential(credential);

    FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
    User? user = _auth.currentUser;

    UserModel userModel = UserModel();

    // writing all values

    userModel.email = googleUser.email;
    userModel.uid = user!.uid;
    userModel.userName = googleUser.displayName;
    userModel.qrCode = userModel.userName.toString() + userModel.uid.toString();



    await firebaseFirestore.collection("users")
        .doc(user?.uid)
        .set(userModel.toMap());
    Fluttertoast.showToast(msg: 'Account Created Successfully');


    // Once signed in, return the UserCredential
    Navigator.pushAndRemoveUntil(context,
        MaterialPageRoute(builder: (context) => HomeScreen()),
            (route) => false);
  }



}
