import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class PofileCardInfo extends StatelessWidget {
  final String text;
  final IconData icon;
  Function onPressed;

  PofileCardInfo({@required this.text,@required this.icon,this.onPressed});



  @override
  Widget build(BuildContext context) {
    
    ScreenUtil.init(context,width:750,height:1334,allowFontScaling:true);

    return GestureDetector(
      onTap:onPressed,
      child: Card(

        margin:EdgeInsets.symmetric(vertical:10,horizontal:25),
        color:Colors.white,
        child:Container(
          decoration:BoxDecoration(
              gradient:LinearGradient(
                  colors:[
                    Colors.redAccent,
                    Color(0xFF6078ea)
                  ]
              ),
          ),


          child: ListTile(
            leading:Icon(
                icon,
                color:Colors.white
            ),
            title:Text(
                text,
                style:TextStyle(
                    fontFamily:'Source Sans Pro',
                    color:Colors.white,
                    fontSize:ScreenUtil().setSp(31.0)
                )
            ),
            trailing:Icon(
                Icons.edit,
                color:Colors.white,
                size:16.0
            ),
          ),
        ),
      ),
    );
  }
}
