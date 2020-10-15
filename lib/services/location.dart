import 'dart:async';
import 'package:location/location.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class LocationServices{

  Location location=new Location();

  //A STREAM FOR CONTINOUS CHANGING LOCATION
  StreamController<GeoPoint> locationController = StreamController<GeoPoint>.broadcast();

  LocationServices(){
        location.onLocationChanged().listen((locationData){
          if(locationData != null){
            locationController.add(GeoPoint(locationData.latitude,locationData.longitude));
          }

        });

  }


  //GET LOCATION STREAM
  Stream<GeoPoint> get locationStream => locationController.stream;


  //USER LOCATION ON SINGING UP SINGLE INSTANCE
  Future userLocation() async {

    try{

      var position= await location.getLocation();
      return GeoPoint(position.latitude,position.longitude);

    }
    catch(e)
    {
      print(e.toString());
    }


  }



}