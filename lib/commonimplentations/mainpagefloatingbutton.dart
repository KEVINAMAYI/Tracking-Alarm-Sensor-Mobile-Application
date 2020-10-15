import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sweetalert/sweetalert.dart';
import 'package:atrack/services/database.dart';
import 'package:atrack/commonimplentations/user.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class MainPageFloatingButton extends StatefulWidget {

  @override
  _MainPageFloatingButtonState createState() => _MainPageFloatingButtonState();
}

class _MainPageFloatingButtonState extends State<MainPageFloatingButton> {


  String groupName='';
  final _formkey=GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {

    final loggedinUser=Provider.of<User>(context);
    DatabaseService  _databaseService=new DatabaseService(uid:loggedinUser.uid);

    return Container(
        padding:EdgeInsets.only(bottom:20,right:20,top:325,left:245),
        child:FloatingActionButton(
          backgroundColor:Colors.white,
          child:Icon(
              Icons.add,
              color:Colors.blue
          ),
          onPressed:()=>showDialog(
              context:context,
              builder:(BuildContext context){
                return Dialog(
                    shape:RoundedRectangleBorder(
                        borderRadius:BorderRadius.circular(18.0)
                    ),
                    child:Container(
                      width:ScreenUtil().setWidth(700.0),
                      height:ScreenUtil().setHeight(500.0),
                      decoration:BoxDecoration(
                          color:Colors.white,
                          borderRadius:BorderRadius.circular(8.0),
                          boxShadow:[
                            BoxShadow(
                                color:Colors.black12,
                                offset:Offset(0.0,15.0),
                                blurRadius:15.0
                            ),
                            BoxShadow(
                                color:Colors.black12,
                                offset:Offset(0.0,15.0),
                                blurRadius:15.0
                            ),

                          ]),

                      child:Form(
                        key:_formkey,
                        child: Padding(
                            padding:EdgeInsets.only(left:16.0,right:16.0,top:10.0),
                            child:Column(
                                crossAxisAlignment:CrossAxisAlignment.start,
                                children:<Widget>[
                                  Text("Group to Share Location",style:TextStyle(
                                    fontSize:ScreenUtil().setSp(38.0),
                                    fontFamily:"Poppins-Bold",
                                    fontWeight:FontWeight.bold,
                                    letterSpacing:1.0,

                                  )),
                                  SizedBox(
                                      height:ScreenUtil().setHeight(40.0)),
                                  Text("Group Name",style:TextStyle(
                                    fontSize:ScreenUtil().setSp(35.0),
                                    fontFamily:"Poppins-Medium",
                                    fontWeight:FontWeight.bold,
                                    letterSpacing:2.0,


                                  )),
                                  TextFormField(
                                      validator:(val)=>val.isEmpty ? 'please Enter a groupName': null,
                                      onChanged:(val){
                                        setState(() {
                                          groupName=val;
                                        });
                                      },
                                      decoration:InputDecoration(
                                          hintText:"Group Name",
                                          hintStyle:TextStyle(
                                            color:Colors.grey,
                                            letterSpacing:1.0,
                                            fontSize:ScreenUtil().setSp(40.0),


                                          )
                                      )
                                  ),
                                  SizedBox(
                                      height:ScreenUtil().setHeight(40.0)),
                                  Row(
                                      mainAxisAlignment:MainAxisAlignment.center,
                                      children: <Widget>[
                                        InkWell(
                                            child:Container(
                                                width:ScreenUtil().setWidth(400.0),
                                                height:ScreenUtil().setHeight(100.0),
                                                decoration:BoxDecoration(
                                                    gradient:LinearGradient(
                                                        colors:[
                                                          Colors.redAccent,
                                                          Color(0xFF6078ea)
                                                        ]
                                                    ),
                                                    borderRadius:BorderRadius.circular(23.0),
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

                                                            if(_formkey.currentState.validate()){

                                                               await _databaseService.createGroup(groupName);

                                                            }

                                                            Navigator.of(context).pop();

                                                        },
                                                        child:Center(
                                                            child:Text("CREATE GROUP",
                                                                style:TextStyle(color:Colors.white,fontFamily:"Poppins-Bold",fontSize:ScreenUtil().setSp(30.0),letterSpacing:1.0))
                                                        )
                                                    )
                                                )
                                            )


                                        )])

                                ]
                            )
                        ),
                      ),



                    )


                );
              }
          ),
        ));
  }
}



