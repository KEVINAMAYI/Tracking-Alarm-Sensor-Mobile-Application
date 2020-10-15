import 'package:atrack/services/location.dart';
import 'package:atrack/services/database.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:atrack/commonimplentations/user.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class AuthService
{
  //INSTANCE OF USER'S CURRENT LOCATION
  GeoPoint _geoPoint;
  LocationServices _locationServices=new LocationServices();


  final FirebaseAuth _auth=FirebaseAuth.instance;

  //USER OBJ BASE ON FIREBASE OBJECT
  User _userFromFirebase(FirebaseUser user){
    return user != null ? User(uid: user.uid):null;
  }

  //STREAM OF USER
  Stream<User> get userStream
  {
    return _auth.onAuthStateChanged.map(_userFromFirebase);

  }


  //SIGN IN ANON
  Future signIn() async{
   try
   {
     AuthResult result= await _auth.signInAnonymously();
     FirebaseUser user=result.user;
     return _userFromFirebase(user);

   }
   catch(e)
   {
     print(e.toString());
     return null;

   }

  }



  //SIGN IN WITH EMAIL AND PASSWORD
  Future signInWithEmailAndPassword(String email, String password) async
  {
    try
    {
      AuthResult result=await _auth.signInWithEmailAndPassword(email: email, password: password);
      FirebaseUser user=result.user;
      return _userFromFirebase(user);
    }
    catch(e)
    {
      print(e.toString());
      return null;

    }


  }


  //REGISTER WITH EMAIL AND PASSWORD
  Future createUserWithEmailAndPassword(String name,String email, String password,String Imageurl) async
  {
    try
    {
      AuthResult result=await _auth.createUserWithEmailAndPassword(email: email, password: password);
      FirebaseUser user=result.user;

      //CREATE A NEW DOCUMENT FOR REGISTERED USER
      _geoPoint=await _locationServices.userLocation();
       await DatabaseService(uid:user.uid).updateUserData(name,email, Imageurl, _geoPoint,['flutter','Kansoul'] );

      return _userFromFirebase(user);
    }
    catch(e)
    {
      print(e.toString());
      return null;

    }


  }


  //SIGN OUT
  Future signOut() async{

    try
    {
       await _auth.signOut();
       return null;

    }
    catch(e)
    {
      print(e.toString());
    }


  }


  //UPDATE USER EMAIL
  Future updateEmail(String Email) async
  {

    FirebaseUser user= await _auth.currentUser();
    if (user != null) {
      user.updateEmail(Email);

      return true;
    }


  }

  //UPDATE USER PASSWORD
  Future updatePassword(String Password) async
  {

    FirebaseUser user= await _auth.currentUser();
    if (user != null) {
      user.updatePassword(Password);
      return true;

    }


  }



}