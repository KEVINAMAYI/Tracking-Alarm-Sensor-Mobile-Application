import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sweetalert/sweetalert.dart';
import 'package:atrack/services/database.dart';
import 'package:atrack/commonimplentations/user.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class NameReset extends StatefulWidget {
  @override
  _NameResetState createState() => _NameResetState();
}

class _NameResetState extends State<NameReset> {

  final _formkey=GlobalKey<FormState>();

  String name='';

  @override
  Widget build(BuildContext context) {

    final user=Provider.of<User>(context);
    DatabaseService _databaseService=DatabaseService(uid:user.uid);

    return Dialog(
        shape:RoundedRectangleBorder(
            borderRadius:BorderRadius.circular(18.0)
        ),
        child:Container(
          width:ScreenUtil().setWidth(700.0),
          height:ScreenUtil().setHeight(632),
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
                padding:EdgeInsets.only(left:16.0,right:16.0,top:24.0),
                child:Column(
                    crossAxisAlignment:CrossAxisAlignment.start,
                    children:<Widget>[
                      Text("Edit Your Name Here",style:TextStyle(
                        fontSize:ScreenUtil().setSp(38.0),
                        fontFamily:"Poppins-Bold",
                        fontWeight:FontWeight.bold,
                        letterSpacing:1.0,

                      )),
                      SizedBox(
                          height:ScreenUtil().setHeight(32.0)),
                      Text("Name",style:TextStyle(
                        fontSize:ScreenUtil().setSp(35.0),
                        fontFamily:"Poppins-Medium",
                        fontWeight:FontWeight.bold,
                        letterSpacing:2.0,


                      )),
                      TextFormField(
                          validator:(val)=>val.isEmpty ? 'please Enter a Name': null,
                          onChanged:(val){
                            setState(() {
                              name=val;
                            });
                          },
                          decoration:InputDecoration(
                              hintText:"User Name",
                              hintStyle:TextStyle(
                                color:Colors.grey,
                                letterSpacing:1.0,
                                fontSize:ScreenUtil().setSp(40.0),


                              )
                          )
                      ),
                      SizedBox(
                          height:ScreenUtil().setHeight(35.0)),
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

                                                bool result=await _databaseService.editUserName(name);
                                                if(result ==true)
                                                {
                                                      SweetAlert.show(context,
                                                      title: "Success",
                                                      subtitle: 'UserName Changed',
                                                      style: SweetAlertStyle.success);

                                                }
                                                else
                                                {
                                                      SweetAlert.show(context,
                                                      title: "Error ",
                                                      subtitle: 'Failed to change Name',
                                                      style: SweetAlertStyle.error);

                                                }

                                              }

                                            },
                                            child:Center(
                                                child:Text("EDIT NAME",
                                                    style:TextStyle(color:Colors.white,fontFamily:"Poppins-Bold",fontSize:ScreenUtil().setSp(30.0),letterSpacing:1.0))
                                            )
                                        )
                                    )
                                )


                            )]),
                      GestureDetector(
                        onTap:(){
                          Navigator.of(context).pop();
                        },
                        child: Padding(
                          padding:EdgeInsets.only(top:20,right:10),
                          child: Row(
                            mainAxisAlignment:MainAxisAlignment.end,
                            children: <Widget>[
                              Text('CANCEL',style:TextStyle(
                                  color:Colors.redAccent,
                                  fontWeight:FontWeight.bold,
                                  fontSize:ScreenUtil().setSp(34.0)
                              ))
                            ],
                          ),
                        ),
                      ),

                    ]
                )
            ),
          ),



        )


    );
  }
}
