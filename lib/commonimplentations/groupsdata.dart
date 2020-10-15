import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:atrack/commonimplentations/user.dart';
import 'package:atrack/screens/pages/managegroups.dart';
import 'package:atrack/commonimplentations/spinkit.dart';
import 'package:atrack/commonimplentations/singleuser.dart';
import 'package:atrack/commonimplentations/mainpagefloatingbutton.dart';


class GroupData extends StatefulWidget {
  @override
  _GroupDataState createState() => _GroupDataState();
}

class _GroupDataState extends State<GroupData> {
  bool loading=false;

  @override
  Widget build(BuildContext context) {


    final user=Provider.of<SingleUser>(context);
    final loggedinUser=Provider.of<User>(context);

    return user == null ? SpinKit() : Stack(
        children: <Widget>[
            Container(
            // decoration: BoxDecoration(color: Color.fromRGBO(58, 66, 86, 1.0)),
            child: ListView.builder(
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
              itemCount: user.usersgroups.length,
              itemBuilder: (BuildContext context, int index) {
                return Card(
                  shape:RoundedRectangleBorder(
                      borderRadius:BorderRadius.circular(45.0)
                  ),
                  elevation: 8.0,
                  color:Colors.white,
                  margin: new EdgeInsets.symmetric(horizontal: 10.0, vertical: 6.0),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Color.fromRGBO(64, 75, 96, .9),
                      gradient:LinearGradient(
                          colors:[
                            Colors.redAccent,
                            Color(0xFF6078ea)
                          ]
                      ),
                      borderRadius:BorderRadiusDirectional.circular(45.0),
                    ),
                    child: ListTile(

                      contentPadding:
                      EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
                      leading: Container(
                        padding: EdgeInsets.only(right: 12.0),
                        decoration: new BoxDecoration(

                            border: new Border(
                                right: new BorderSide(width: 8.0, color:Colors.white))),
                        child: Icon(Icons.autorenew, color: Colors.white),
                      ),
                      title: Text(
                        user.usersgroups[index],
                        style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                      ),


                      subtitle: Row(

                        children: <Widget>[
                          Expanded(
                              flex: 1,
                              child: Container(
                                // tag: 'hero',
                                child: LinearProgressIndicator(
                                    backgroundColor: Color.fromRGBO(209, 224, 224, 0.2),
                                    value: user.usersgroups.length.toDouble(),
                                    valueColor: AlwaysStoppedAnimation(Colors.green)),
                              )),
                          Expanded(
                            flex: 4,
                            child: Padding(
                                padding: EdgeInsets.only(left: 10.0),
                                child: Text(user.usersgroups[index],
                                    style: TextStyle(color: Colors.white))),
                          )
                        ],
                      ),
                      trailing:
                      Icon(Icons.arrow_forward_ios, color: Colors.white, size: 20.0),
                      onTap: () {

                        Navigator.push(
                            context, MaterialPageRoute(builder: (context) => ManageGroups(GroupName:user.usersgroups[index],uid:loggedinUser.uid,user:loggedinUser)));
                      },

                    ),
                  ),
                );
              },
            ),
            color:Colors.white,
            padding:EdgeInsets.only(top:10)
            ),
          MainPageFloatingButton()

        ],
      );

  }
}


