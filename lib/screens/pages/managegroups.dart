import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:sweetalert/sweetalert.dart';
import 'package:atrack/services/database.dart';
import 'package:carousel_pro/carousel_pro.dart';
import 'package:atrack/screens/pages/mainpage.dart';
import 'package:atrack/screens/pages/addmembers.dart';
import 'package:atrack/screens/pages/searchmember.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:atrack/screens/pages/groupmemberslocationonmap.dart';




class ManageGroups extends StatefulWidget {

  final String GroupName;
  final  user;
  final String uid;

  ManageGroups({this.GroupName,this.uid,this.user});

  @override
  _ManageGroupsState createState() => _ManageGroupsState(groupName:this.GroupName,uid:this.uid,user:this.user);


}

class _ManageGroupsState extends State<ManageGroups> {

  final String groupName;
  final String uid;
  final user;


  _ManageGroupsState({this.groupName,this.uid,this.user});

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.redAccent,
            centerTitle: true,
            title: Text('${groupName} Group',
              style: TextStyle(
                  color: Colors.white
              ),),),
          body: ListView(

            children: <Widget>[
              SizedBox(
                  height: 220.0,
                  width: MediaQuery
                      .of(context)
                      .size
                      .width,
                  child: Carousel(
                    images: [
                      ExactAssetImage("assets/exit.jpg"),
                      ExactAssetImage("assets/map.jpg"),
                      ExactAssetImage("assets/members.jpg")
                    ],
                    dotSize: 7.0,
                    dotSpacing: 10.0,
                    dotColor: Colors.redAccent,
                    indicatorBgPadding: 15.0,
                    dotBgColor: Colors.white12,
                    borderRadius: false,
                    moveIndicatorFromBottom: 180.0,
                    noRadiusForIndicator: true,
                    overlayShadow: true,
                    overlayShadowColors: Colors.blueGrey,
                    overlayShadowSize: 0.7,
                  )
              ),
              Container(
                padding: EdgeInsets.only(top: 20, bottom: 10),
                color: Colors.white,
                child: ListTile(
                  onTap: () {
                    Navigator.push((context),
                        MaterialPageRoute(builder: (context) => AddMembers(groupName:groupName)));
                  },
                  leading: Icon(
                    Icons.person_add,
                    color: Colors.redAccent,
                  ),
                  title: Text('Add Group Members',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: ScreenUtil().setSp(35),
                        color: Colors.redAccent
                    ),),
                  subtitle: Text('Here you can add Members to the group',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: ScreenUtil().setSp(28),
                          color: Colors.redAccent
                      )),
                  trailing: Icon(
                      Icons.arrow_forward_ios,
                      size: 20,
                      color: Colors.redAccent
                  ),

                ),
              ),
              Container(
                padding: EdgeInsets.only(top: 0, bottom: 10),
                color: Colors.white,
                child: ListTile(
                  onTap: () {
                    Navigator.push((context), MaterialPageRoute(
                        builder: (context) =>
                            SearchMembers(groupName: groupName)));
                  },
                  leading: Icon(
                    Icons.people,
                    color: Colors.redAccent,
                  ),
                  title: Text('View Group Members',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: ScreenUtil().setSp(35),
                        color: Colors.redAccent
                    ),),
                  subtitle: Text('Here you can view the group members and their corresponding location ',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: ScreenUtil().setSp(28),
                          color: Colors.redAccent
                      )),
                  trailing: Icon(
                      Icons.arrow_forward_ios,
                      size: 20,
                      color: Colors.redAccent
                  ),

                ),
              ),
              Container(
                color: Colors.white,
                padding: EdgeInsets.only(bottom: 10),
                child: ListTile(
                  onTap: () {
                    Navigator.push((context), MaterialPageRoute(
                        builder: (context) => MembersLocation(groupName: groupName)));
                  },
                  leading: Icon(
                    Icons.location_on,
                    color: Colors.redAccent,
                  ),
                  title: Text('View  Members Location',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: ScreenUtil().setSp(35),
                        color: Colors.redAccent
                    ),),
                  subtitle: Text('Here you can view the group members',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: ScreenUtil().setSp(28),
                          color: Colors.redAccent
                      )),
                  trailing: Icon(
                      Icons.arrow_forward_ios,
                      size: 20,
                      color: Colors.redAccent
                  ),

                ),
              ),
              Container(
                color: Colors.white,
                child: ListTile(
                  onTap: () async {
                    bool result = await DatabaseService(uid:uid).removeUserFromGroup(groupName);
                    void exitGroup(bool result) async
                    {
                      if(result == true)
                      {
                        Navigator.push((context),MaterialPageRoute(builder:(context) => MyHomePage(user:user)));

                      }

                    }

                    await exitGroup(result);

                  },
                  leading: Icon(
                      Icons.exit_to_app,
                      color: Colors.redAccent
                  ),
                  title: Text('Exit Group',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: ScreenUtil().setSp(35),
                        color: Colors.redAccent
                    ),),
                  subtitle: Text('Here you can  Exit the Group',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: ScreenUtil().setSp(28),
                          color: Colors.redAccent
                      )),
                  trailing: Icon(
                      Icons.arrow_forward_ios,
                      size: 20,
                      color: Colors.redAccent
                  ),

                ),
              ),

            ],
          )
      );
  }
}
