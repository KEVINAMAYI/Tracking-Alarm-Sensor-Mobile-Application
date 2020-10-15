import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';


class MemberLocation extends StatefulWidget {

  GeoPoint geoPoint;
  String name;

  MemberLocation({this.name,this.geoPoint});

  @override
  _MemberLocationState createState() => _MemberLocationState(Name:this.name,MembergeoPoint:this.geoPoint);
}

class _MemberLocationState extends State<MemberLocation> {

   GeoPoint MembergeoPoint;
   String Name;

  _MemberLocationState({this.Name,this.MembergeoPoint});

  GoogleMapController  mapController;
  final Set<Marker> _markers = Set();

  @override
  Widget build(BuildContext context) {
    CameraPosition _initialPosition = CameraPosition(target: LatLng(26.8206, 30.8025),
    );

              _markers.add(
                  Marker(
                      markerId: MarkerId(Name),
                      position: LatLng(MembergeoPoint.latitude, MembergeoPoint.longitude),
                      infoWindow: InfoWindow(title:Name, snippet:Name),
                      icon:BitmapDescriptor.defaultMarkerWithHue(
                          BitmapDescriptor.hueRed
                      )
                  )  );


            return  Scaffold(
              appBar:AppBar(
                  title:Text('View Group Member location'),
                  backgroundColor:Colors.redAccent,

              ),
              body: Stack(
                  children: <Widget>[
                    GoogleMap(
                        mapType: MapType.hybrid,
                        myLocationEnabled: true,
                        onMapCreated: (GoogleMapController controller) {
                          mapController=controller;
                        },
                        initialCameraPosition:_initialPosition,
                        myLocationButtonEnabled:true,
                        markers:_markers


                    ),

                  ]),
            );


        }


}


