class UserModel {
  String? uid;
  String? email;
  String? userName;
  String? qrCode;



  UserModel({this.uid , this.email, this.userName, this.qrCode,});

  // Reciving Data From Server

factory UserModel.fromMap(map){
  return UserModel(
    uid: map['uid'],
    email: map['email'],
    userName: map['username'],
      qrCode: map['qrcode']

  );
}


// Sending Data to Server

Map<String , dynamic> toMap(){
  return{
    'uid' : uid,
    'email' : email,
    'username' : userName,
    'qrcode' : qrCode,

  };
}
}