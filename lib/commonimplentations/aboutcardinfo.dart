import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AboutCardInfo extends StatelessWidget {
  final String text;
  final IconData icon;
  Function onPressed;

   AboutCardInfo({@required this.text,@required this.icon,this.onPressed});



  @override
  Widget build(BuildContext context) {

    ScreenUtil.init(context,width:750,height:1334,allowFontScaling:true);

    return GestureDetector(
      onTap:onPressed,
      child: Card(
        shape:RoundedRectangleBorder(
            borderRadius:BorderRadius.circular(27.0)
        ),
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
                borderRadius:BorderRadius.circular(27.0),
                boxShadow:[
                  BoxShadow(
                      color:Colors.green.withOpacity(.3),
                      offset:Offset(0.0,8.0),
                      blurRadius:8.0
                  )

                ]

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
                    fontSize:ScreenUtil().setSp(30)
                )
            ),
            trailing:Icon(
              Icons.arrow_forward_ios,
              color:Colors.white,
              size:16.0
            ),
          ),
        ),
      ),
    );
  }
}
