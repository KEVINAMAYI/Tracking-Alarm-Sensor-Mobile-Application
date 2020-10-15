import 'dart:math';
import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:atrack/screens/pages/groupmemberlocationonmap.dart';

class GroupMembers extends StatelessWidget {

  String name;
  String groupName;
  GeoPoint geoPoint;

  GroupMembers(String name, GeoPoint geoPoint,String groupName) {
    this.name = name;
    this.groupName = groupName;
    this.geoPoint=geoPoint;
  }

  randomNumbersGenerator() {
    var rng = new Random();
    for (var i = 0; i < 10; i++) {
      return (rng.nextInt(100));
    }
  }

  //CAPITALIZE THE FIRST CHARACTER OF A STRING
  CapitalizeStringfiy(String name){

    return name[0].toUpperCase();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap:(){

        Navigator.push(context, MaterialPageRoute(builder:(context)=>MemberLocation(name:name,geoPoint:geoPoint)));

      },
      child: ListTile(
        leading:CircleAvatar(

          backgroundColor:this.name.length %(3) == 0 ? Colors.red : Colors.blue,
          child:Text(
            CapitalizeStringfiy(this.name),
            style:TextStyle(
                color:Colors.white,
                fontSize:ScreenUtil().setSp(40),
                fontWeight:FontWeight.bold
            ),
          ),
        ),
        title:Text(this.name,
          style:TextStyle(
              fontWeight:FontWeight.bold,
              fontSize:ScreenUtil().setSp(40),
              color:Colors.black54
          ),),
        subtitle:Text(this.groupName,
            style:TextStyle(
                fontWeight:FontWeight.bold,
                fontSize:ScreenUtil().setSp(32),
                color:Colors.black45
            )),
        trailing:IconButton(
          icon:Icon(Icons.location_on
          ),
          color:Colors.white,
        ),

      ),
    );
  }
}







