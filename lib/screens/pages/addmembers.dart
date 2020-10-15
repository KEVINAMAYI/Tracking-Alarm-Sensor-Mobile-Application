import 'package:flutter/material.dart';
import 'package:basic_utils/basic_utils.dart';
import 'package:atrack/services/database.dart';
import 'package:atrack/commonimplentations/membersdetails.dart';
import 'package:atrack/commonimplentations/addinggroupmembers.dart';



class AddMembers extends StatefulWidget {

  final String groupName;

  AddMembers({this.groupName});

  @override
  _AddMembersState createState() => _AddMembersState(groupName:this.groupName);
}

class _AddMembersState extends State<AddMembers> {

  List<GroupMembers> list;
  final String groupName;

  _AddMembersState({this.groupName});

  void initState(){

    list=List();

  }


  @override
  Widget build(BuildContext context) {

    return StreamBuilder<List<Members>>(
      stream:DatabaseService().Users,
      builder:(context,snapshot){
        if(snapshot.hasData){

          List<Members> members=snapshot.data;

          list.clear();
          members.forEach((member){

            list.add(GroupMembers(member.username,member.documentId,groupName));

          });

          return  Scaffold(
              appBar:AppBar(
                title:Text('Add Member'),
                backgroundColor:Colors.redAccent,
                  actions:<Widget>[
                    IconButton(
                      icon:Icon(Icons.search),onPressed:(){
                      showSearch(context: context, delegate: MembersData(membersList: list));

                    },
                    )

                  ]
              ),
              body:ListView(
                children: buidMembersList()
              )
          );


        }
        else{

        return  Container(
        color:Colors.white
        );

        }
      }

    );
  }

  buidMembersList(){
    return list;
  }


  @override
  void dispose(){

    super.dispose();

  }

}


class MembersData extends SearchDelegate<String>{


  List membersList;

  MembersData({this.membersList});

  List<GroupMembers> returnList(){
    return membersList;
  }

  @override
  List<Widget> buildActions(BuildContext context) {
    // ACTIONS ON THE APPBAR
    return[
      IconButton(
          icon:Icon(Icons.clear),onPressed:(){
        query="";
      }
      )
    ];

  }

  @override
  Widget buildLeading(BuildContext context) {
    // LEADING ICON OF THE APPBAR
    return IconButton(
      icon:AnimatedIcon(
        icon:AnimatedIcons.menu_arrow,
        progress:transitionAnimation,
      ),onPressed:(){
      close(context, null);
    },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    // SHOW RESULTS

  }

  @override
  Widget buildSuggestions(BuildContext context) {

    // WHEN USER SEARCHES SOMETHING
    List<GroupMembers> buildSearchList(){

      List<GroupMembers> searchList=List();
      searchList.clear();

      if(query.isEmpty){

        return membersList;
      }
      else{
        membersList.forEach((groupmember){

          if(groupmember.name.contains(StringUtils.capitalize(query))){

            searchList.add(groupmember);
          }

        });

        return searchList.toSet().toList();

      }

    }

    return ListView(
        padding:EdgeInsets.symmetric(vertical:8.0),
        children:buildSearchList()

    );
  }
}