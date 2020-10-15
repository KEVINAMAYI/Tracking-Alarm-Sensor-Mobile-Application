import 'package:flutter/material.dart';
import 'package:atrack/services/database.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:atrack/commonimplentations/membersdetails.dart';



class MembersLocation extends StatefulWidget {

  final String groupName;

  MembersLocation({this.groupName});

  @override
  _MembersLocationState createState() => _MembersLocationState(GroupName:groupName);
}

class _MembersLocationState extends State<MembersLocation> {

  final String GroupName;


  _MembersLocationState({this.GroupName});

  GoogleMapController  mapController;




  @override
  Widget build(BuildContext context) {

    List<Marker> _markers = <Marker>[];
    final DatabaseService _dataBaseServices=DatabaseService(groupName: GroupName);
    GeoPoint _geoPoint;


    CameraPosition _initialPosition = CameraPosition(target: LatLng(26.8206, 30.8025),
                                                      );


    return StreamBuilder<List<Members>>(
        stream:_dataBaseServices.groupUsers,
        builder:(context,snapshot){
      if(snapshot.hasData){

        List<Members> members=snapshot.data;

        members.forEach((member){
          _geoPoint=member.geoPoint;

          _markers.add(
              Marker(
                  markerId: MarkerId(member.username),
          position: LatLng(_geoPoint.latitude, _geoPoint.longitude),
          infoWindow: InfoWindow(title: member.username, snippet: member.username),
          icon:BitmapDescriptor.defaultMarkerWithHue(
          BitmapDescriptor.hueRed
          )
              )  );

        });

        return  Scaffold(
            appBar:AppBar(
              title:Text('View Group Members location'),
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
                  markers:Set<Marker>.of(_markers)
                ),
              ]),
        );

      }else{

        return Container();

      }
        }

    );


  }







}


