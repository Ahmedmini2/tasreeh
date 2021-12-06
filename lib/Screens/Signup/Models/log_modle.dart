class LogModle {
  String? time;
  String? uid;
  String? qrCode;



  LogModle({this.time, this.uid , this.qrCode,});

  // Reciving Data From Server

  factory LogModle.fromMap(map){
    return LogModle(
        time: map['time'],
        uid: map['uid'],
        qrCode: map['qrcode']

    );
  }


// Sending Data to Server

  Map<String , dynamic> toMap(){
    return{
      'time' : time,
      'uid' : uid,

      'qrcode' : qrCode,

    };
  }
}