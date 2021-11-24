import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:treeko/services/auth.dart';

import 'pages/home_page.dart';
import 'pages/signin_page.dart';
import 'pages/singnup_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // const MyApp(MyApp myApp, {Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Treeko",
      color: Colors.white,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primaryColor: Colors.greenAccent),
      home: FutureBuilder(
        future: AuthMethods().getCurrentUser(),
        builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
          if(snapshot.hasData){
            return const HomePage();
          }
          else{
            return const SignUpPage();
          }
        },
      ),
    );
  }
}
