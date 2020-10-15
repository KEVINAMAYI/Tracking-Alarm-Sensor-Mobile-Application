import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:sweetalert/sweetalert.dart';
import 'package:atrack/services/database.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class GroupMembers extends StatelessWidget {

  String name;
  String groupName;
  String documentId;

  GroupMembers(String name, String documentId, String groupName) {
    this.name = name;
    this.documentId = documentId;
    this.groupName = groupName;
  }

  randomNumbersGenerator() {
    var rng = new Random();
    for (var i = 0; i < 10; i++) {
      return (rng.nextInt(100));
    }
  }

  //CAPITALIZE THE FIRST CHARACTER OF A STRING
  CapitalizeStringfiy(String name) {
    return name[0].toUpperCase();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        showDialog<void>(
          context: context,
          builder: (BuildContext dialogContext) {
            return AlertDialog(
              title: Text('ADD MEMBER',
                style:TextStyle(
                  color:Colors.purple
                ) ,),
              content: Text('${name} will be added to ${groupName} Group'),
              actions: <Widget>[
                FlatButton(
                  child: Text('CANCEL',
                  style:TextStyle(
                    color: Colors.deepPurple,
                    fontWeight:FontWeight.bold
                  ),),
                  color:Colors.transparent,
                  onPressed: () {
                    Navigator.of(dialogContext).pop(); // Dismiss alert dialog
                  },
                ),
                FlatButton(
                  child: Text('ADD',
                    style:TextStyle(
                        color: Colors.deepPurple,
                        fontWeight:FontWeight.bold
                    ),),
                  color:Colors.transparent,
                  onPressed: () async {

                     await DatabaseService(uid:documentId).createGroup(groupName);
                     Navigator.of(dialogContext).pop();
                     // Dismiss alert dialog
                  },
                ),
              ],
            );
          },
        );


      },
      child: ListTile(
        leading: CircleAvatar(

          backgroundColor: this.name.length % (3) == 0 ? Colors.red : Colors
              .blue,
          child: Text(
            CapitalizeStringfiy(this.name),
            style: TextStyle(
                color: Colors.white,
                fontSize: ScreenUtil().setSp(40),
                fontWeight: FontWeight.bold
            ),
          ),
        ),
        title: Text(this.name,
          style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: ScreenUtil().setSp(40),
              color: Colors.black54
          ),),
        subtitle: Text(this.groupName,
            style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: ScreenUtil().setSp(32),
                color: Colors.black45
            )),
        trailing: IconButton(
          icon: Icon(Icons.add
          ),
          color: Colors.black,
        ),

      ),
    );
  }

}





