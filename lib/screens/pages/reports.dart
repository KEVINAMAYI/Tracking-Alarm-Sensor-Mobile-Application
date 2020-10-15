import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:expandable/expandable.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:flutter_screenutil/flutter_screenutil.dart';


class Reports extends StatefulWidget {
  @override
  _ReportsState createState() => _ReportsState();
}

class _ReportsState extends State<Reports> {

  final List<charts.Series<GroupModel,String>> _seriesPieData=[
    charts.Series(
      data:[
        new GroupModel('Flutter', 13.8,charts.ColorUtil.fromDartColor(Colors.yellow)),
        new GroupModel('Kansoul', 15.3,charts.ColorUtil.fromDartColor(Colors.green)),
        new GroupModel('CS ', 40.7,charts.ColorUtil.fromDartColor(Colors.orange)),
      ],
      domainFn:(GroupModel group,_)=>group.groupName,
      measureFn:(GroupModel group,_)=>group.membersNumber,
      colorFn:(GroupModel group,_)=>group.colorValue,
      id:'Groups Am In Data',
      labelAccessorFn:(GroupModel group,_)=>'${group.membersNumber}',
    ),

  ];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
        title:Text('Reports'),
        backgroundColor: Colors.redAccent,
      ),
      body: ListView(
        children:<Widget>[
      Padding(
        padding:EdgeInsets.only(bottom:15),
        child: Container(
          color:Colors.white,
          child: ExpandablePanel(
          header:Container(
            padding: EdgeInsets.only(top: 0, bottom: 10),
            color: Colors.white,
            child: ListTile(
              onTap: () {},

              title: Text('Location',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: ScreenUtil().setSp(35),
                    color: Colors.redAccent
                ),),
              subtitle: Text('location summary ',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: ScreenUtil().setSp(28),
                      color: Colors.redAccent
                  )),


            ),
          ),
          expanded: Column(
            children:<Widget>[
              Container(
                color: Colors.white,
                child: ListTile(
                  onTap: () {},

                  title: Text('Last Known Location : ',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: ScreenUtil().setSp(30),
                        color: Colors.redAccent
                    ),),
                    subtitle: Text('Latitude : 45.568 ,Longitude : 3.451 ',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: ScreenUtil().setSp(28),
                            color: Colors.redAccent
                        ))

                ),
              ),
              Container(
                color: Colors.white,
                child: ListTile(
                  onTap: () {},

                  title: Text('Current Location : ' ,
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: ScreenUtil().setSp(30),
                        color: Colors.redAccent
                    ),),
                    subtitle: Text('Latitude : 45.568 ,Longitude : 3.451 ',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: ScreenUtil().setSp(28),
                            color: Colors.redAccent
                        ))

                ),
              )

            ]
          )
    ),
        ),
      ),
          Container(
            padding: EdgeInsets.only(top: 10, bottom: 0),
            color: Colors.white,
            child: ListTile(
              onTap: () {},

              title: Text('Group',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: ScreenUtil().setSp(35),
                    color: Colors.redAccent
                ),),
              subtitle: Text('group summary ',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: ScreenUtil().setSp(28),
                      color: Colors.redAccent
                  )),


            ),
          ),

          Padding(
          padding:EdgeInsets.only(top:0),
          child:Container(
            height:400,
            width:400,
            color:Colors.white,
            padding:EdgeInsets.only(top:30.0),
            child:charts.PieChart(
                _seriesPieData,
                animate:true,
                animationDuration:Duration(seconds: 4),
                behaviors:[
                  charts.DatumLegend(
                    outsideJustification:charts.OutsideJustification.endDrawArea,
                    horizontalFirst:false,
                    desiredMaxRows:2,
                    cellPadding:EdgeInsets.only(right:4,bottom:4),
                    entryTextStyle:charts.TextStyleSpec(
                      color:charts.MaterialPalette.purple.shadeDefault,
                      fontFamily:'Georgia',
                      fontSize:15,

                    )
                  )
                ],
                defaultRenderer:charts.ArcRendererConfig(
                  arcWidth:80,
                  arcRendererDecorators: [
                    charts.ArcLabelDecorator(
                      labelPosition:charts.ArcLabelPosition.inside
                    )
                  ]
                ),
          )
        )
        )],
      ),
    );
  }
}


//GROUPS MODEL
class GroupModel
{

  String groupName;
  double membersNumber;
  charts.Color colorValue;

  GroupModel(this.groupName,this.membersNumber,this.colorValue);


}



