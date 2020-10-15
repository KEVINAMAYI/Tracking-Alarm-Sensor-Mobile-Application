import 'package:flutter/material.dart';
import 'dart:async';
import 'package:flutter_mailer/flutter_mailer.dart';



class EmailService {

  final MailOptions mailOptions = MailOptions(
    body: 'a long body for the email <br> with a subset of HTML',
    subject: 'the Email Subject',
    recipients: ['kevinamayi20@gmail.com'],
    isHTML: true,
  );


  Future<void> sendEmail() async{

    try{

      await FlutterMailer.send(mailOptions);
      print("success");
    }
    catch(e){

      print(e.toString());

    }

  }

}
