import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:atrack/services/auth.dart';
import 'package:atrack/services/location.dart';
import 'package:atrack/services/database.dart';
import 'package:atrack/screens/pages/about.dart';
import 'package:atrack/screens/pages/profile.dart';
import 'package:atrack/screens/pages/reports.dart';
import 'package:atrack/screens/pages/security.dart';
import 'package:atrack/screens/authentication/signin.dart';
import 'package:atrack/commonimplentations/groupsdata.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:atrack/commonimplentations/singleuser.dart';



class MyHomePage extends StatefulWidget {
  final user;
  MyHomePage({this.user});

  @override
  _MyHomePageState createState() => _MyHomePageState(user:user);
}

class _MyHomePageState extends State<MyHomePage> {

  final user;

  _MyHomePageState({this.user});

  final AuthService _authService= AuthService();

  @override
  final GlobalKey<ScaffoldState> _scaffoldKey=new GlobalKey<ScaffoldState>();

  Widget build(BuildContext context){
    return StreamProvider<SingleUser>.value(
      value:DatabaseService(uid: user.uid).singleUserData,
      child: DefaultTabController(
          length:3,
          child:Scaffold(
          key:_scaffoldKey,
          drawer:Drawer(
            child:ListView(
              padding:EdgeInsets.zero,
              children: <Widget>[
             DrawerHeader(
                  child:Text('Test'),
                  decoration:BoxDecoration(
                    image:DecorationImage(
                      image:AssetImage(
                        'assets/map.jpg'
                      ),
                      fit:BoxFit.cover
                    )
                  ),
                ),
                Padding(
                  padding:EdgeInsets.only(left:20.0,top:10.0),
                    child:Text("Features",
                  style:TextStyle(
                    fontWeight:FontWeight.bold,
                    fontSize:16.0,
                    color:Colors.black87,

                  ),
                 )),
                Divider(
                  color:Colors.black54,
                ),
                Padding(
                    padding: EdgeInsets.only(top:10,bottom: 10,left:8,right:8),
                    child:Row(
                        mainAxisAlignment:MainAxisAlignment.spaceEvenly,
                        children:<Widget>[
                          Icon(
                              Icons.home,
                              color:Colors.redAccent

                          ),
                          InkWell(
                              child:Container(
                                  width:ScreenUtil().setWidth(520.0),
                                  height:ScreenUtil().setHeight(100.0),
                                  decoration:BoxDecoration(
                                      gradient:LinearGradient(
                                          colors:[
                                            Colors.redAccent,
                                            Color(0xFF6078ea)
                                          ]
                                      ),
                                      borderRadius:BorderRadius.circular(40.0),
                                      boxShadow:[
                                        BoxShadow(
                                            color:Colors.green.withOpacity(.3),
                                            offset:Offset(0.0,8.0),
                                            blurRadius:8.0
                                        )

                                      ]

                                  ),
                                  child:Material(
                                      color:Colors.transparent,
                                      child:InkWell(
                                          onTap:(){

                                            Navigator.push((context),MaterialPageRoute(builder:(context)=>MyHomePage(user:user)));

                                          },
                                          child:Center(
                                              child:Text("HOME",
                                                  style:TextStyle(color:Colors.white,fontFamily:"Poppins-Bold",fontSize:ScreenUtil().setSp(30.0),letterSpacing:1.0))
                                          )
                                      )
                                  )
                              )


                          ),])),

                Padding(
                  padding: EdgeInsets.only(top:10,bottom: 20,left:8,right:8),
                  child:Row(
                      mainAxisAlignment:MainAxisAlignment.spaceEvenly,
                      children:<Widget>[
                        Icon(
                          Icons.info,
                          color:Colors.redAccent

                        ),
                      InkWell(
                    child:Container(
                        width:ScreenUtil().setWidth(520.0),
                        height:ScreenUtil().setHeight(100.0),
                        decoration:BoxDecoration(
                            gradient:LinearGradient(
                                colors:[
                                  Colors.redAccent,
                                  Color(0xFF6078ea)
                                ]
                            ),
                            borderRadius:BorderRadius.circular(40.0),
                            boxShadow:[
                              BoxShadow(
                                  color:Colors.green.withOpacity(.3),
                                  offset:Offset(0.0,8.0),
                                  blurRadius:8.0
                              )

                            ]

                        ),
                        child:Material(
                            color:Colors.transparent,
                            child:InkWell(
                                onTap:(){

                                  Navigator.push((context),MaterialPageRoute(builder:(context)=>AboutPage()));


                                },
                                child:Center(
                                    child:Text("ABOUT",
                                        style:TextStyle(color:Colors.white,fontFamily:"Poppins-Bold",fontSize:ScreenUtil().setSp(30.0),letterSpacing:1.0))
                                )
                            )
                        )
                    )


                ),])),
                Padding(
                    padding: EdgeInsets.only(top:10,bottom: 20,left:8,right:8),
                    child:Row(
                        mainAxisAlignment:MainAxisAlignment.spaceEvenly,
                        children:<Widget>[
                          Icon(
                              Icons.insert_chart,
                              color:Colors.redAccent

                          ),
                          InkWell(
                              child:Container(
                                  width:ScreenUtil().setWidth(520.0),
                                  height:ScreenUtil().setHeight(100.0),
                                  decoration:BoxDecoration(
                                      gradient:LinearGradient(
                                          colors:[
                                            Colors.redAccent,
                                            Color(0xFF6078ea)
                                          ]
                                      ),
                                      borderRadius:BorderRadius.circular(40.0),
                                      boxShadow:[
                                        BoxShadow(
                                            color:Colors.green.withOpacity(.3),
                                            offset:Offset(0.0,8.0),
                                            blurRadius:8.0
                                        )

                                      ]

                                  ),
                                  child:Material(
                                      color:Colors.transparent,
                                      child:InkWell(
                                          onTap:(){

                                            Navigator.push((context),MaterialPageRoute(builder:(context)=>Reports()));


                                          },
                                          child:Center(
                                              child:Text("REPORTS",
                                                  style:TextStyle(color:Colors.white,fontFamily:"Poppins-Bold",fontSize:ScreenUtil().setSp(30.0),letterSpacing:1.0))
                                          )
                                      )
                                  )
                              )


                          ),])),

            Padding(
              padding: EdgeInsets.only(bottom: 10,left:8,right:8),
                child:Row(
                    mainAxisAlignment:MainAxisAlignment.spaceAround,
                    children:<Widget>[
                      Icon(
                          Icons.exit_to_app,
                          color:Colors.redAccent

                      ),InkWell(
                    child:Container(
                        width:ScreenUtil().setWidth(520.0),
                        height:ScreenUtil().setHeight(100.0),
                        decoration:BoxDecoration(
                            gradient:LinearGradient(
                                colors:[
                                  Colors.redAccent,
                                  Color(0xFF6078ea)
                                ]
                            ),
                            borderRadius:BorderRadius.circular(40.0),
                            boxShadow:[
                              BoxShadow(
                                  color:Colors.green.withOpacity(.3),
                                  offset:Offset(0.0,8.0),
                                  blurRadius:8.0
                              )

                            ]

                        ),
                        child:Material(
                            color:Colors.transparent,
                            child:InkWell(
                                onTap:() async {
                                  await _authService.signOut();
                                  Navigator.push((context),MaterialPageRoute(builder:(context)=>SignIn()));
                                },
                                child:Center(
                                    child:Text("LOGOUT",
                                        style:TextStyle(color:Colors.white,fontFamily:"Poppins-Bold",fontSize:ScreenUtil().setSp(30.0),letterSpacing:1.0))
                                )
                            )
                        )
                    )


                ),])),
//              Divider(
//                color:Colors.black54,
//              ),

              ],

            ),






          ),
          appBar:PreferredSize(
            preferredSize:Size.fromHeight(105.0),
            child:AppBar(
              leading:IconButton(
                  icon:Icon(Icons.menu), onPressed:()=>_scaffoldKey.currentState.openDrawer()),
              automaticallyImplyLeading:false,
              backgroundColor:Colors.blueGrey,
              elevation:0,
              centerTitle:true,
              title:const Text("A-track",
                style:TextStyle(
                  color:Colors.white,
                  fontSize:18.0,
                  fontWeight:FontWeight.bold,

                ),),
              bottom:PreferredSize(
                  child:Padding(
                      padding:EdgeInsets.only(left:3.0,bottom:3.0,right:3),
                      child:TabBar(
                          unselectedLabelColor:Colors.white,
                          indicatorSize:TabBarIndicatorSize.tab,
                          indicator:BoxDecoration(
                              gradient:LinearGradient(
                                  colors:[Colors.redAccent,Colors.orangeAccent]),
                              borderRadius:BorderRadius.circular(50),
                              color:Colors.redAccent


                          ),
                          tabs:[
                            Tab(

                                child:Container(


                                    child:Align(
                                        alignment:Alignment.center,
                                        child:Text("GROUPS")
                                    )
                                )

                            ),
                            Tab(
                                child:Container(

                                    child:Align(
                                        alignment:Alignment.center,
                                        child:Text("SECURITY")
                                    )
                                )

                            ),
                            Tab(
                                child:Container(
//
                                    child:Align(
                                        alignment:Alignment.center,
                                        child:Text("PROFILE")
                                    )
                                )

                            )

                          ]
                      ))),
            ),
          ),

          body:TabBarView(
            children: <Widget>[
              GroupData(),
              Security(),
              Profile()

            ],
          ),

        )
      ),
    );

  }

  @override
  void initState() {
    super.initState();
    final locationStream = LocationServices().locationStream;
    locationStream.listen(
        (userLocation){
          print(userLocation.longitude);
          print(userLocation.latitude);
          DatabaseService(uid:user.uid).editUserLocation(userLocation);
        });
  }
}






