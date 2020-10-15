import 'package:atrack/wrapper.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:atrack/services/auth.dart';
import 'package:atrack/commonimplentations/user.dart';


void main()=>runApp(MyMainPage());

class MyMainPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamProvider<User>.value(
        value:AuthService().userStream,
        child: MaterialApp(
            debugShowCheckedModeBanner:false,
            home:Wrapper()
        ),
      );;
  }
}







