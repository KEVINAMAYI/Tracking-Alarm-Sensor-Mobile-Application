import 'package:cloud_firestore/cloud_firestore.dart';

class Members{


  String documentId;
  String username;
  GeoPoint geoPoint;
  String imageUrl;
  var usersgroups = [];

  Members({this.documentId,this.username,this.geoPoint,this
  .imageUrl,this.usersgroups});


}