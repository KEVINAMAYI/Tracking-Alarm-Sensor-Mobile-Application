import 'package:firebase_messaging/firebase_messaging.dart';

class FirebaseMessagingServices{

  FirebaseMessaging firebaseMessaging=FirebaseMessaging();


  //GET DEVICE TOKEN
  getToken(){
    firebaseMessaging.getToken().then((deviceToken){
      print("Device Toke $deviceToken");

    });
  }


  //CONFIGURE DIFFERENT APP STATE
  configureFirebaseListeners(){
    firebaseMessaging.configure(
      onMessage:(Map<String , dynamic> message) async{
        setMessage(message);
      },
      onLaunch:(Map<String , dynamic> message) async{
        setMessage(message);
      },
      onResume:(Map<String , dynamic> message) async{
        setMessage(message);
      }

    );
  }


  setMessage(Map<String,dynamic> message){
    final notification=message['notification'];
    final data=message['data'];
    final String title=notification['title'];
    final String body=notification['body'];
    final String notMessage=data['message'];

  }

}