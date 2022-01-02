import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:file_picker/file_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';

import 'package:path/path.dart';
import 'package:image_picker/image_picker.dart';

import 'firebase_api.dart';

class ProfilePic extends StatefulWidget {
  _ProfilePic createState() => _ProfilePic();

}
class _ProfilePic extends State<ProfilePic> {
   File? _image;

  @override
  Widget build(BuildContext context) {
    final imagePicker = ImagePicker();

    getImage() async {

      PickedFile? image = await imagePicker.getImage(source: ImageSource.gallery);

      setState(() {
        _image = image as File?;
        print('Image Path $_image');
      });

    }

    Future uploadPic(BuildContext context) async{
      String fileName = basename(_image!.path);
      final ref = FirebaseStorage.instance.ref(fileName);
      UploadTask uploadTask = ref.putFile(_image!);
      TaskSnapshot taskSnapshot = await uploadTask.whenComplete(() {
        setState(() {
          print("Profile Picture uploaded");
          Scaffold.of(context).showSnackBar(SnackBar(content: Text('Profile Picture Uploaded')));
        });
      });

    }
    return SizedBox(
      height: 115,
      width: 115,
      child: Stack(
        fit: StackFit.expand,
        clipBehavior: Clip.none,
        children: [
           CircleAvatar(
            radius: 100,
            backgroundColor: Color(0xff476cfb),
            child: ClipOval(
              child: new SizedBox(
                width: 180.0,
                height: 180.0,
                child: (_image!=null)?Image.file(
                  _image!,
                  fit: BoxFit.fill,
                ):Image.asset(
                  "assets/images/applogo2.png",
                  fit: BoxFit.fill,
                ),
              ),
            ),
          ),
          Positioned(
            right: -16,
            bottom: 0,
            child: SizedBox(
              height: 46,
              width: 46,
              child: TextButton(
                style: TextButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50),
                    side: BorderSide(color: Colors.white),
                  ),
                  primary: Colors.white,
                  backgroundColor: Color(0xFFF5F6F9),
                ),
                onPressed: () {
                  getImage();
                  uploadPic(context);
                },
                child: SvgPicture.asset("assets/icons/Camera Icon.svg"),
              ),
            ),
          )

        ],

      ),

    );

  }

  Future selectFile() async {
    final result = await FilePicker.platform.pickFiles(allowMultiple: false);

    if(result == null ) return;
    final path = result.files.single.path;
    setState(() => _image = File(path!) ,);
    uploadFile();


  }

    Future uploadFile() async {
    if(_image == null ) return;


    final fileName = basename(_image!.path);
    final destination = 'files/$fileName';

    FirebaseApi.uploadFile(destination,_image!);
    }
}
