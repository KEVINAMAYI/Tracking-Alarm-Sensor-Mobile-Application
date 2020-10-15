import 'dart:async';
import 'package:share/share.dart';
import 'package:shake/shake.dart';
import 'package:sensors/sensors.dart';
import 'package:flutter/material.dart';
import 'package:ringtone/ringtone.dart';
import 'package:atrack/services/imei.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Security extends StatefulWidget {
  @override
  _SecurityState createState() => _SecurityState();
}

class _SecurityState extends State<Security> with AutomaticKeepAliveClientMixin {

  @override bool get wantKeepAlive => true;

  bool alarmAlertValue=false;
  bool takePhotoValue=false;
  bool shareIphoneIdValue=false;
  bool shareImeiValue=false;
  bool updateValue=false;

  List<double> useraccelerometerValues = [];
  List<double> gyroscopeValues = [];


  List<StreamSubscription<dynamic>> streamSubscriptions =
  <StreamSubscription<dynamic>>[];





  @override
  Widget build(BuildContext context) {

    ImeiService _imeiService=ImeiService();



    return ListView(
      children: <Widget>[
        Container(
          color:Colors.white,
          padding:EdgeInsets.only(bottom:10),
          child: ListTile(

            leading:Icon(
              Icons.alarm_on,
              color:Colors.redAccent,
            ),
            title:Text('Alert Owner',
              style:TextStyle(
                  fontWeight:FontWeight.bold,
                  fontSize:ScreenUtil().setSp(35),
                  color:Colors.redAccent
              ),),
            subtitle:Text('Be alerted on phone touch',
                style:TextStyle(
                    fontWeight:FontWeight.bold,
                    fontSize:ScreenUtil().setSp(28),
                    color:Colors.redAccent
                )),
              trailing:Switch(
                value: alarmAlertValue,
                onChanged:(value) async {

                  setState((){
                    alarmAlertValue= value;
                  });

                  if(alarmAlertValue == true) {

                    //GET SENSORS INTIAL SENSORS VALUES USERACCELEROMETER AND GYROSCOPE
                      streamSubscriptions.add(
                          userAccelerometerEvents.listen((
                              UserAccelerometerEvent event) {
                            setState(() {
                              useraccelerometerValues =
                              <double>[event.x, event.y, event.z];
                            });
                          })
                      );

                      streamSubscriptions.add(
                          gyroscopeEvents.listen((GyroscopeEvent event) {
                            setState(() {
                              gyroscopeValues =
                              <double>[event.x, event.y, event.z];
                            });
                          })
                      );



//                  CANCEL THE STREAM SUBSCRIPTIONS AFTER GETTING INTIAL VALUES
                    void cancelStreamsSubscription() async
                    {
                      streamSubscriptions.forEach((streamSubscription) {
                        streamSubscription.cancel();
                      });
                    }

                    await cancelStreamsSubscription();

//                    // LISTEN TO ANY SENSORS CHANGES
                    void alertUseronPhoneShake() async
                    {

                      //USER ACCELEROMETER EVENTS
                      userAccelerometerEvents.listen((
                          UserAccelerometerEvent event) {
                          setState(() {
                          final newuseraccelerometerValues = <double>[event.x, event.y, event.z ];
                          if( (newuseraccelerometerValues[0] > useraccelerometerValues[0]) ||
                              (newuseraccelerometerValues[0] < useraccelerometerValues[1]) ||
                              (newuseraccelerometerValues[1] > useraccelerometerValues[1]) ||
                              (newuseraccelerometerValues[1] < useraccelerometerValues[1]) ||
                              (newuseraccelerometerValues[2] > useraccelerometerValues[2]) ||
                              (newuseraccelerometerValues[2] < useraccelerometerValues[2])
                          ){

                            Ringtone.play();

                          }
                        });
                      });


                      //GYROSCOPE EVENTS
                      gyroscopeEvents.listen((GyroscopeEvent event) {
                        setState(() {
                          final newgyroscopeValues = <double>[event.x, event.y, event.z];
                          if( (newgyroscopeValues[0] > gyroscopeValues[0]) ||
                              (newgyroscopeValues[0] < gyroscopeValues[1]) ||
                              (newgyroscopeValues[1] > gyroscopeValues[1]) ||
                              (newgyroscopeValues[1] < gyroscopeValues[1]) ||
                              (newgyroscopeValues[2] > gyroscopeValues[2]) ||
                              (newgyroscopeValues[2] < gyroscopeValues[2])
                          ){

                            Ringtone.play();

                          }
                        });
                      });


                    }

                    await alertUseronPhoneShake();
                  }
                  else {
                    void disposeSensors() async{
                      streamSubscriptions.forEach((streamSubscription) {
                        streamSubscription.cancel();
                      });
                    }

                    await disposeSensors();

                    void stopRingtone() async
                    {
                      Ringtone.stop();
                    }

                    await stopRingtone();


                  }
                 },
                activeTrackColor: Colors.redAccent,
                activeColor: Colors.red,
              ),

          ),
        ),
        Container(
          padding:EdgeInsets.only(bottom:10),
          color:Colors.white,
          child: ListTile(
            leading:Icon(
                Icons.photo,
                color:Colors.redAccent
            ),
            title:Text('Take Photo',
              style:TextStyle(
                  fontWeight:FontWeight.bold,
                  fontSize:ScreenUtil().setSp(35),
                  color:Colors.redAccent
              ),),
            subtitle:Text('Take Photo of when phone is touched',
                style:TextStyle(
                    fontWeight:FontWeight.bold,
                    fontSize:ScreenUtil().setSp(28),
                    color:Colors.redAccent
                )),
            trailing:Switch(
              value: takePhotoValue,
              onChanged:(value) {
                setState(() {
                  takePhotoValue = value;
                });

                if (takePhotoValue == true) {

                  return;

                }

              }
            ),

          ),
        ),
        Container(
          padding:EdgeInsets.only(bottom:15),
          color:Colors.white,
          child: ListTile(
            leading:Icon(
                Icons.share,
                color:Colors.redAccent
            ),
            title:Text('Share  IMEI Number',
              style:TextStyle(
                  fontWeight:FontWeight.bold,
                  fontSize:ScreenUtil().setSp(35),
                  color:Colors.redAccent
              ),),
            subtitle:Text('Share Imei Number for phone tracking',
                style:TextStyle(
                    fontWeight:FontWeight.bold,
                    fontSize:ScreenUtil().setSp(28),
                    color:Colors.redAccent
                )),
            trailing:Switch(
              value: shareImeiValue,
              onChanged:(value) async{

                setState((){
                  shareImeiValue= value;
                });

                 if(shareImeiValue == true)
                  {
                    var emailsubject="Share your Phone Imei Number";
                    dynamic result =await _imeiService.getPhoneImei();
                    share(context, result,emailsubject);
                    shareImeiValue=false;


                  }

              },
              activeTrackColor: Colors.red,
              activeColor: Colors.redAccent,
            ),
          ),
        ),
        Container(
          padding:EdgeInsets.only(bottom:15),
          color:Colors.white,
          child: ListTile(
            leading:Icon(
                Icons.share,
                color:Colors.redAccent
            ),
            title:Text('Share  Phone Id',
              style:TextStyle(
                  fontWeight:FontWeight.bold,
                  fontSize:ScreenUtil().setSp(35),
                  color:Colors.redAccent
              ),),
            subtitle:Text('Share Phone Id for phone tracking',
                style:TextStyle(
                    fontWeight:FontWeight.bold,
                    fontSize:ScreenUtil().setSp(28),
                    color:Colors.redAccent
                )),
            trailing:Switch(
              value: shareIphoneIdValue,
              onChanged:(value) async{

                setState((){
                  shareIphoneIdValue= value;
                });

                if(shareIphoneIdValue == true)
                {

                  var emailsubject="Share your Phone Id ";
                  dynamic result =await _imeiService.getPhoneId();
                  share(context, result,emailsubject);
                  shareIphoneIdValue=false;


                }

              },
              activeTrackColor: Colors.red,
              activeColor: Colors.redAccent,
            ),
          ),
        ),
        Container(
          padding:EdgeInsets.only(bottom:10),
          color:Colors.white,
          child: ListTile(
            leading:Icon(
                Icons.update,
                color:Colors.redAccent
            ),
            title:Text('Updates',
              style:TextStyle(
                  fontWeight:FontWeight.bold,
                  fontSize:ScreenUtil().setSp(35),
                  color:Colors.redAccent
              ),),
            subtitle:Text('Be Updated on new security features',
                style:TextStyle(
                    fontWeight:FontWeight.bold,
                    fontSize:ScreenUtil().setSp(28),
                    color:Colors.redAccent
                )),
            trailing:Switch(
              value: updateValue,
              onChanged:(value){
                setState((){
                  updateValue= value;
                });

                if(updateValue == true){


                }

              },
              activeTrackColor: Colors.red,
              activeColor: Colors.redAccent,
            ),
          ),
        ),

      ],


    );

  }

  void share(BuildContext context,dynamic content,String emailsubject){

    final RenderBox box=context.findRenderObject();
    Share.share(
        content,
        subject:emailsubject,
        sharePositionOrigin:box.localToGlobal(Offset.zero) & box.size);


  }
}
