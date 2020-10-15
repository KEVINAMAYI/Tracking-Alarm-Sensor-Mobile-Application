import 'dart:io';
import 'package:path/path.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sweetalert/sweetalert.dart';
import 'package:atrack/services/database.dart';
import 'package:image_picker/image_picker.dart';
import 'package:atrack/commonimplentations/user.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:atrack/commonimplentations/namereset.dart';
import 'package:atrack/commonimplentations/emailreset.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:atrack/commonimplentations/singleuser.dart';
import 'package:atrack/commonimplentations/profilecardinfo.dart';


const email='kevinamayi20@gmail.com';
const name='Kevin Amayi';
const password='pass1234';

class ProfilePage extends StatelessWidget{


  Widget build(BuildContext context){
    return MaterialApp(
        debugShowCheckedModeBanner:false,
        home:Profile()
    );
  }
}

class Profile extends StatefulWidget {
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {

  File _image;
  String _imageurl='';

  Future getImage() async
  {
    var image=await ImagePicker.pickImage(source: ImageSource.gallery);
    setState(() {
      _image=image;
    });

  }


  Future uploadImage(BuildContext context) async
  {

    String fileName=basename(_image.path);
    StorageReference firebaseStorageRef=FirebaseStorage.instance.ref().child(fileName);
    StorageUploadTask uploadTask=firebaseStorageRef.putFile(_image);
    StorageTaskSnapshot taskSnapshot=await uploadTask.onComplete;
    var imageurl=await taskSnapshot.ref.getDownloadURL();

    setState(() {

      Scaffold.of(context).showSnackBar(SnackBar(content:Text('Upload Successful')));
      _imageurl=imageurl;

    });

  }


  @override
  Widget build(BuildContext context) {

    final userDetails=Provider.of<SingleUser>(context);
    final user=Provider.of<User>(context);
    DatabaseService _databaseService=DatabaseService(uid:user.uid);

    return Builder(
      builder:(context) => SafeArea(
          child: ListView(
              children: <Widget>[
                SizedBox(
                    height:35
                ),
                Stack(
                  children: <Widget>[
                    Align(
                      alignment:Alignment.center,
                      child: Column(
                          children:<Widget>[
                            CircleAvatar(
                              radius:47,
                              backgroundColor:Colors.redAccent,
                              child: ClipOval(
                                child:SizedBox(
                                    width: 90,
                                    height:90,
                                    child: ( _image != null ) ? Image.file(_image,fit:BoxFit.fill):Image.network(userDetails.imageUrl)
                                ),

                              ),
                            ),
                            Text('Profile Photo',
                                style: TextStyle(
                                  fontSize: 17.0,
                                  color: Colors.redAccent,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: 'Pacifico',
                                )),
                            Padding(
                              padding:EdgeInsets.only(top:10),
                              child: InkWell(
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

                                                 uploadImage(context);

                                                  await _databaseService.editUserImageUrl(_imageurl);


                                              },
                                              child:Center(
                                                  child:Text("SET PROFILE IMAGE",
                                                      style:TextStyle(color:Colors.white,fontFamily:"Poppins-Bold",fontSize:ScreenUtil().setSp(25.0),letterSpacing:1.0))
                                              )
                                          )
                                      )

                                  )),
                            )

                          ]
                      ),
                    ),
                    Align(
                        alignment:Alignment(0.4,-1),
                        child:FloatingActionButton(
                            onPressed:() async {
                              getImage();
                            },
                            backgroundColor:Colors.redAccent,
                            child:Icon(
                              Icons.add,
                              color:Colors.white,

                            )
                        )
                    )

                  ],

                ),
                SizedBox(
                  height: 10,
                  width: 100,

                ),
                PofileCardInfo(
                    text:name,
                    icon:Icons.person,
                    onPressed:(){
                    showDialog(
                    context:context,
                    builder:(context){
                      return NameReset();

                    });
                    }
                ),
                PofileCardInfo(
                    text:email,
                    icon:Icons.email,
                    onPressed:(){
                      showDialog(
                          context:context,
                          builder:(context){
                            return EmailReset();

                          });
                    }
                ),



              ]
          )
      ),
    );
  }
}

