import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:atrack/screens/pages/mainpage.dart';
import 'package:atrack/commonimplentations/user.dart';
import  'package:atrack/screens/authentication/signin.dart';



class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    final user=Provider.of<User>(context);

    //RETURN HOME SCREEN IF USER IS LOGED IN OR SIGN IN PAGE IF NOT LOGGED IN
    if(user == null)
    {

      return SignIn();

    }
    else
    {

      return MyHomePage(user: user);

    }

  }

}
