import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:treeko/helperfunctions/sharedpref_helper.dart';
import 'package:treeko/pages/home_page.dart';
import 'database.dart';

class AuthMethods{
  final FirebaseAuth auth = FirebaseAuth.instance;

  getCurrentUser() async {
    return await auth.currentUser;
  }

  signInWithGoogle(BuildContext context) async{


    final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
    final GoogleSignIn _googleSingIn = GoogleSignIn();

    final GoogleSignInAccount? googleSignInAccount = await _googleSingIn.signIn();

    final GoogleSignInAuthentication googleSignInAuthentication = await googleSignInAccount!.authentication;

    final AuthCredential credential = GoogleAuthProvider.credential(
        idToken: googleSignInAuthentication.idToken,
        accessToken: googleSignInAuthentication.accessToken
    );


    UserCredential result = await _firebaseAuth.signInWithCredential(credential);

    // notifyListeners();

    User? userDetails = result.user;


    SharedPreferencesHelper.saveUserEmail(userDetails!.email.toString());
    SharedPreferencesHelper.saveUserId(userDetails.uid.toString());
    SharedPreferencesHelper.saveDisplayName(userDetails.displayName.toString());
    SharedPreferencesHelper.saveUserProfileUrl(userDetails.photoURL.toString());

    Map<String, dynamic> userInfoMap = {
      "email": userDetails.email,
      "username": userDetails.email!.replaceAll("@gmail.com", ""),
      "name": userDetails.displayName,
      "imgUrl" :userDetails.photoURL
    };

    DatabaseMethods().addUserInfoToDB(userDetails.uid, userInfoMap).then((value) {
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> const HomePage()));
    });

  }
}