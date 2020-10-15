import 'package:atrack/services/auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:atrack/commonimplentations/singleuser.dart';
import 'package:atrack/commonimplentations/membersdetails.dart';

class DatabaseService{

  final String uid;
  final String groupName;
  final _authService=AuthService();

  DatabaseService({this.uid,this.groupName});


  //FIREBASE INSTANCE
  final CollectionReference atrackusers=Firestore.instance.collection("users");

  //UPDATE
   Future updateUserData(String UserName,String Email,String ImageUrl,GeoPoint userLocation,var groups) async {

     return await atrackusers.document(uid).setData({
       'username':UserName,
       'email':Email,
       'profilephoto':ImageUrl,
       'userlocation':userLocation,
       'groupsamin':groups

     });

   }

   //USERS DATA LIST FROM A SNAPSHOT
   List<Members> _membersListFromSnapshot(QuerySnapshot querySnapshot){
        return querySnapshot.documents.map((doc){
          return Members(
            documentId: doc.documentID ?? '',
            username:doc.data['username'] ?? '',
            geoPoint:doc.data['userlocation'] ?? '',
            imageUrl:doc.data['profilephoto'] ?? '',
            usersgroups:doc.data['groupsamin'] ?? []
          );

        }).toList();

   }

  //GET MULTIPLE USER DATA
  Stream<List<Members>> get Users{

     return atrackusers.snapshots().map(_membersListFromSnapshot);

  }


  //USERDATA FROM A SNAPSHOT
  SingleUser  _singleUserFromSnapShot(DocumentSnapshot documentSnapshot)
  {
    return SingleUser(
        uid:uid,
        username:documentSnapshot.data['username'] ?? '',
        geoPoint:documentSnapshot.data['userlocation'] ?? '',
        imageUrl:documentSnapshot.data['profilephoto'] ?? '',
        usersgroups:documentSnapshot.data['groupsamin'] ?? ''
    );

  }


  //SINGLE USER DATA
  Stream<SingleUser> get singleUserData{

     return atrackusers.document(uid).snapshots().map(_singleUserFromSnapShot);

  }





  //RETURN SPECIFIC GROUP MEMBERS
  Stream<List<Members>> get groupUsers{

     return atrackusers.where('groupsamin',arrayContains: groupName).snapshots().map(_membersListFromSnapshot);

  }


  //REMOVE USERS FROM THE GROUP
  Future removeUserFromGroup(String groupName) async
  {


         DocumentReference documentReference=await atrackusers.document(uid);
         DocumentSnapshot documentSnapshot=await documentReference.get();
         List usersgroups=documentSnapshot.data['groupsamin'];
         if(usersgroups.contains(groupName) == true )
         {

           documentReference.updateData({
              'groupsamin' : FieldValue.arrayRemove([groupName])

           });

           return true;

         }
         else{

           return false;

         }


  }


  //CREATE NEW GROUP TO ADD MEMBERS
  Future createGroup(String groupName) async
  {

    DocumentReference documentReference=await atrackusers.document(uid);
    DocumentSnapshot documentSnapshot=await documentReference.get();
    List usersgroups=documentSnapshot.data['groupsamin'];
    if(usersgroups.contains(groupName) == true )
    {

      return false;

    }
    else{

      documentReference.updateData({
        'groupsamin' : FieldValue.arrayUnion([groupName])

      });

      return true;

    }


  }



  // EDIT USERNAME
  Future editUserName(String newName) async
  {

    await atrackusers.document(uid).updateData({
        'username' : newName
      });

      return true;

  }


  //UPDATE USER EMAIL
  Future editEmail(String email) async
  {

    bool result=await _authService.updateEmail(email);

    if(result == true)
    {
      await atrackusers.document(uid).updateData({
        'email' : email
      });

      return true;

    }
    else{

      return false;
    }

  }

  //UPDATE USER PROFILE IMAGE
  Future editUserImageUrl(String imageUrl) async
  {

    await atrackusers.document(uid).updateData({
      'profilephoto' : imageUrl
    });

    return true;

  }



  //UPDATE USER LOCATION
  Future editUserLocation(GeoPoint userLocation) async
  {

    await atrackusers.document(uid).updateData({

      'userlocation':userLocation

    });


  }


  //ADD MEMBERS TO A GROUP


}