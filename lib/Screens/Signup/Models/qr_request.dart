class QrRequests {
  String? id;
  String? propertyName;
  String? time;
  String? date;
  String? numberOfPeople;
  String? status;



  QrRequests({this.id, this.propertyName , this.time,this.date,this.numberOfPeople, this.status});

  // Reciving Data From Server

  factory QrRequests.fromMap(map){
    return QrRequests(
        id: map['id'],
        propertyName: map['propertyName'],
        time: map['time'],
        date: map['date'],
      numberOfPeople: map['numberOfPeople'],
      status: map['status'],

    );
  }


// Sending Data to Server

  Map<String , dynamic> toMap(){
    return{
      'id' : id,
      'propertyName' : propertyName,
      'time' : time,
      'date' : date,
      'numberOfPeople' : numberOfPeople,
      'status' : status,


    };
  }
}