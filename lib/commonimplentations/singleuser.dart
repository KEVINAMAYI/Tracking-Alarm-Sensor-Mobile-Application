import 'package:cloud_firestore/cloud_firestore.dart';

class SingleUser{

  String uid;
  String username;
  GeoPoint geoPoint;
  String imageUrl;
  var usersgroups=[];

  SingleUser({this.uid,this.username,this.geoPoint,this
      .imageUrl,this.usersgroups});

}



