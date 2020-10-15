import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:atrack/services/auth.dart';
import 'package:sweetalert/sweetalert.dart';
import 'package:basic_utils/basic_utils.dart';
import 'package:atrack/commonimplentations/spinkit.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:atrack/screens/authentication/signuppage.dart';



class SignIn extends StatefulWidget
{
  SignIn({Key key,this.title}): super(key:key);

  final String title;


  _SignInState createState()=>_SignInState();

}

class _SignInState extends State<SignIn>{

  final AuthService _authService= AuthService();
  final _formKey=GlobalKey<FormState>();
  bool loading=false;


  //TEXT FIELD STATES
  String email='';
  String password='';
  String error='';



  bool _isSelected=false;

  void _radio(){
    setState((){
      _isSelected=!_isSelected;

    });

  }

  Widget radioButton(bool isSelected)=>Container(
      width:16.0,
      height:16.0,
      padding:EdgeInsets.all(2.0),
      decoration:BoxDecoration(
          shape:BoxShape.circle,
          border:Border.all(width:2.0,color:Colors.black)),
      child:isSelected? Container(
          width:double.infinity,
          height:double.infinity,
          decoration:BoxDecoration(
              shape:BoxShape.circle,
              color:Colors.black
          )
      ): Container(

      )
  );

  Widget horinzontalLine() => Padding(


      padding:EdgeInsets.symmetric(horizontal:16.0),
      child:Container(
          width:120.0,
          color:Colors.black26.withOpacity(.2)
      )
  );

  Widget build(BuildContext context)
  {
    ScreenUtil.init(context,width:750,height:1334,allowFontScaling:true);

     return loading ? SpinKit() : Scaffold(
            backgroundColor:Colors.white,
            resizeToAvoidBottomPadding:true,
            body:Stack(
                fit:StackFit.expand,
                children:<Widget>[
                  Column(
                      crossAxisAlignment:CrossAxisAlignment.end,
                      children:<Widget>[
                        Padding(
                          padding: EdgeInsets.only(top:20.0),
                          child:Container(
                              height:ScreenUtil().setHeight(500.0),
                              decoration:BoxDecoration(
                                  image:DecorationImage(
                                      image:AssetImage('assets/drawerbg.jpg')
                                  )
                              )
                          ),
                        ),
                        Expanded(
                            child:Container()

                        )
//                Image.network()

                      ]
                  ),
                  Form(
                      key:_formKey,
                      child:SingleChildScrollView(
                          child:Padding(
                              padding:EdgeInsets.only(left:20.0,right:20.0,top:60.0),
                              child:Column(
                                  children:<Widget>[
                                    Row(
                                        children:<Widget>[
//                  Image.network(

//                  )


                                        ]

                                    ),

                                    SizedBox(
                                        height:180.0

                                    ),
                                    Container(
                                        width:double.infinity,
                                        height:ScreenUtil().setHeight(650.0),
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

                                        child:Padding(
                                            padding:EdgeInsets.only(left:16.0,right:16.0,top:10.0),
                                            child:Column(
                                                crossAxisAlignment:CrossAxisAlignment.start,
                                                children:<Widget>[
                                                  Text("Login",style:TextStyle(
                                                    fontSize:ScreenUtil().setSp(40.0),
                                                    fontFamily:"Poppins-Bold",
                                                    fontWeight:FontWeight.bold,
                                                    letterSpacing:1.0,

                                                  )),
                                                  SizedBox(
                                                      height:ScreenUtil().setHeight(40.0)),
                                                  Text("Email",style:TextStyle(
                                                    fontSize:ScreenUtil().setSp(26.0),
                                                    fontFamily:"Poppins-Medium",
                                                    fontWeight:FontWeight.bold,
                                                    letterSpacing:2.0,


                                                  )),
                                                  TextFormField(
                                                      validator:(val)=>val.isEmpty ? 'Enter an Email': null,
                                                      onChanged:(val){
                                                        setState(() {
                                                          email=val;
                                                        });
                                                      },
                                                      decoration:InputDecoration(
                                                          hintText:"Email",
                                                          hintStyle:TextStyle(
                                                            color:Colors.grey,
                                                            letterSpacing:1.0,
                                                            fontSize:ScreenUtil().setSp(40.0),


                                                          )
                                                      )
                                                  ),
                                                  SizedBox(
                                                      height:ScreenUtil().setHeight(25.0)),
                                                  Text("Password",style:TextStyle(
                                                    fontSize:ScreenUtil().setSp(26.0),
                                                    fontWeight:FontWeight.bold,
                                                    fontFamily:"Poppins-Medium",
                                                    letterSpacing:2.0,

                                                  )),
                                                  TextFormField(
                                                      validator:(val)=>val.length < 6 ? 'Enter a password 6+ chars long': null,
                                                      onChanged:(val){
                                                        setState(() {
                                                          password=val;
                                                        });
                                                      },
                                                      obscureText:true,
                                                      decoration:InputDecoration(
                                                          hintText:"Password",
                                                          hintStyle:TextStyle(
                                                            color:Colors.grey,
                                                            letterSpacing:1,
                                                            fontSize:ScreenUtil().setSp(40.0),


                                                          )
                                                      )
                                                  ),
                                                  SizedBox(
                                                      height:ScreenUtil().setHeight(40.0)),
                                                  Row(
                                                      mainAxisAlignment:MainAxisAlignment.end,

                                                      children:<Widget>[

                                                        Text(
                                                            "Forgot Password ?",
                                                            style:TextStyle(
                                                                color:Colors.blue,
                                                                fontSize:ScreenUtil().setSp(30.0),
                                                                fontFamily:"Poppins-Medium",
                                                                fontWeight:FontWeight.bold
                                                            )
                                                        )


                                                      ]
                                                  )




                                                ]
                                            )
                                        )


                                    ),

                                    SizedBox(
                                        height:ScreenUtil().setHeight(60.0)),
                                    Row(
                                        mainAxisAlignment:MainAxisAlignment.spaceBetween,
                                        children:<Widget>[
                                          Row(
                                              children:<Widget>[
                                                SizedBox(width:ScreenUtil().setWidth(8.0)),
                                                GestureDetector(
                                                    onTap: _radio,
                                                    child:radioButton(_isSelected)

                                                ),
                                                SizedBox(
                                                    width:5.0
                                                ),
                                                Text("Remember Me",
                                                    style:TextStyle(
                                                        fontSize:ScreenUtil().setSp(20.0),
                                                        fontFamily:"Poppins-Medium"

                                                    ))

                                              ]

                                          ),

                                          InkWell(
                                              child:Container(
                                                  width:ScreenUtil().setWidth(280.0),
                                                  height:ScreenUtil().setHeight(100.0),
                                                  decoration:BoxDecoration(
                                                      gradient:LinearGradient(
                                                          colors:[
                                                            Colors.green,
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


                                                              if (_formKey
                                                                  .currentState
                                                                  .validate()) {
                                                                setState(() {
                                                                  loading =
                                                                  true;
                                                                });


                                                              }


                                                              dynamic result = await _authService.signInWithEmailAndPassword(email, password);

                                                              //METHOD FOR VALIDATING EMAIL AND PASSWORD
                                                              void checkDetail(dynamic result) async {
                                                                if(result == null)

                                                                {
                                                                  setState(() {
                                                                    error='please enter valid details';
                                                                    loading=false;
                                                                  });

                                                                      SweetAlert.show(context,
                                                                      title: "Error Login ",
                                                                      subtitle: error,
                                                                      style: SweetAlertStyle.error);

                                                                }

                                                              }

                                                              await checkDetail(result);


                                                          },
                                                          child:Center(
                                                              child:Text("SIGNIN",
                                                                  style:TextStyle(color:Colors.white,fontFamily:"Poppins-Bold",fontSize:ScreenUtil().setSp(20.0),letterSpacing:1.0))
                                                          )
                                                      )
                                                  )



                                              ))


                                        ]

                                    ),

                                    SizedBox(height:ScreenUtil().setHeight(60.0)),

                                    Row(
                                        mainAxisAlignment:MainAxisAlignment.center,
                                        children:<Widget>[

                                          InkWell(
                                              child:Container(
                                                  width:ScreenUtil().setWidth(500.0),
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
                                                          onTap:(){

                                                            Navigator.push(context, MaterialPageRoute(builder:(context)=>SignupPage()));

                                                          },
                                                          child:Center(
                                                              child:Text("SIGNUP",
                                                                  style:TextStyle(color:Colors.white,fontFamily:"Poppins-Bold",fontSize:ScreenUtil().setSp(30.0),letterSpacing:1.0))
                                                          )
                                                      )
                                                  )



                                              ))


                                        ]




                                    ),


                                    SizedBox(height:ScreenUtil().setHeight(40.0)),

                                  ]
                              )

                          )

                      ))

                ]


            )
    );
  }


}




              
              
