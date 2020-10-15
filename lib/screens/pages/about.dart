import 'package:flutter/material.dart';
import 'package:atrack/services/auth.dart';
import 'package:atrack/screens/pages/mainpage.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:url_launcher/url_launcher.dart' as Launcher;
import 'package:atrack/commonimplentations/aboutcardinfo.dart';

const Url='shorturl.at/szRUY';
const Email='kevinamayi20@gmail.com';
const phone= '+254 795704301';
const location='Nairobi';

class AboutPage extends StatelessWidget{

  Widget build(BuildContext context){
    return MaterialApp(
      debugShowCheckedModeBanner:false,
      home:About()
    );
  }
}

class About extends StatelessWidget {

  final AuthService _authService= AuthService();


  void _showDialog(BuildContext context,{String title,String message}){

    final dialog =AlertDialog(
      title:Text(title),
      content:Text(message),
      actions: <Widget>[
        RaisedButton(
          color:Colors.teal,
          onPressed:(){
            Navigator.pop(context);
          },
          child:Text('close',
          style:TextStyle(
            color:Colors.white
          ))
        )
      ],
    );
   showDialog(context: context,builder: (x)=>dialog);

  }




  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar:new AppBar(
        backgroundColor:Colors.redAccent,
        title:Text('About',
            style: TextStyle(
                fontSize: 17.0,
                color: Colors.redAccent,
                fontFamily: 'Source Sans Pro',
                fontWeight: FontWeight.bold
            )),
        ),
        drawer:Drawer(
          child:ListView(
            padding:EdgeInsets.zero,
            children: <Widget>[
              Container(
                  height:ScreenUtil().setHeight(480.0),
                  child:DrawerHeader(
                    child:Text('Text'),
                    decoration:BoxDecoration(
                        image:DecorationImage(
                            image:AssetImage(
                                'assets/map.jpg'
                            ),
                            fit:BoxFit.cover
                        )
                    ),
                  )),
              Padding(
                  padding:EdgeInsets.only(left:20.0,top:20.0),
                  child:Text("Features",
                    style:TextStyle(
                      fontWeight:FontWeight.bold,
                      fontSize:16.0,
                      color:Colors.black45,

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
                                          Navigator.push((context),MaterialPageRoute(builder:(context)=>MyHomePage()));

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

                                        },
                                        child:Center(
                                            child:Text("ABOUT",
                                                style:TextStyle(color:Colors.white,fontFamily:"Poppins-Bold",fontSize:ScreenUtil().setSp(30.0),letterSpacing:1.0))
                                        )
                                    )
                                )
                            )


                        ),])),
//              Divider(
//                color:Colors.black54,
//              ),
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
        body: SafeArea(
            child: Column(
              children: <Widget>[
                SizedBox(
                  height:20
                ),
                CircleAvatar(
                  radius: 45,
                  backgroundImage: AssetImage('assets/kevinamayi.jpg'),
                ),
                Text('Kevin Amayi',
                    style: TextStyle(
                      fontSize: 17.0,
                      color: Colors.redAccent,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Pacifico',
                    )),
                Text('SoftWare Developer',
                    style: TextStyle(
                        fontSize: 17.0,
                        color: Colors.redAccent,
                        fontFamily: 'Source Sans Pro',
                        fontWeight: FontWeight.bold
                    )),
                SizedBox(
                  height: 20,
                  width: 200,
                  child: Divider(
                      color: Colors.teal.shade700
                  ),
                ),
                AboutCardInfo(
                  text:phone,
                  icon:Icons.phone,
                  onPressed:() async {
                    String removeSpacesFromPhoneNumber=phone.replaceAll(new RegExp(r"\s+\b|\b\s"),"");
                    final telphoneNumber='tel:$removeSpacesFromPhoneNumber';
                    if (await Launcher.canLaunch(telphoneNumber)) {
                      await Launcher.launch(telphoneNumber);
                    } else {
                      _showDialog(
                        context,
                        title:'Sorry',
                        message: 'Sorry phone number could not be called,try agin',
                      );

                    }

                  }
                ),
                AboutCardInfo(
                  text:Email,
                  icon:Icons.email,
                  onPressed:() async {
                    final emailAddress='mailto:$Email';
                    if (await Launcher.canLaunch(emailAddress)) {
                    await Launcher.launch(emailAddress);
                    } else {
                      _showDialog(
                        context,
                        title:'Sorry',
                        message: 'Sorry email could not be sent',
                      );


                    }

                  },
                ),

                AboutCardInfo(
                  text:location,
                  icon:Icons.location_on,
                  onPressed:(){

                  },
                )
              ],
            )
        )
    );
  }
}
