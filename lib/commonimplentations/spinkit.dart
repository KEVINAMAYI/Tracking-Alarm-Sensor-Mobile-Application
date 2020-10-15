import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class SpinKit extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width:MediaQuery.of(context).size.width,
      height:MediaQuery.of(context).size.height,
      color:Colors.white,
      child:Center(
        child: SpinKitThreeBounce(
          color: Colors.blue,
          size: 50.0,
//          controller: AnimationController(duration: const Duration(milliseconds: 1200)),
        ),
      ),
    );
  }
}
