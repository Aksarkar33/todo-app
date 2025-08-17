// import 'package:flutter/foundation.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:todo_app/services/auth_services.dart';
import 'package:todo_app/services/home_screen.dart';
import 'package:todo_app/signin_screen.dart';
import 'LoginScreen.dart';
void main()async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}



class MyApp extends StatelessWidget {
 final FirebaseAuth _auth= FirebaseAuth.instance;



  @override
  Widget build(BuildContext context) {
    return MaterialApp(
  debugShowCheckedModeBanner:false,
    title: "ToDo",
      theme: ThemeData(primarySwatch:Colors.indigo),
      home: _auth.currentUser!=null?HomeScreen():Loginscreen(),
    );
  }
}
