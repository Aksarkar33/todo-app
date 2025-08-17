import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:todo_app/services/auth_services.dart';
import 'package:todo_app/services/home_screen.dart';

import 'LoginScreen.dart';

class SigninScreen extends StatelessWidget {
  final AuthServices _auth = AuthServices();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF1d2630),
      appBar: AppBar(
        backgroundColor: Color(0xFF1d2630),
        foregroundColor: Colors.white,
        title: Text("Create Account"),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            SizedBox(height: 50),
            Text(
              "welcome",
              style: TextStyle(
                fontSize: 35,
                fontWeight: FontWeight.w500,
                color: Colors.white,
              ),
            ),
            SizedBox(height: 5),
            Text(
              "Register here",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w500,
                color: Colors.white,
              ),
            ),

            TextField(
              controller: _emailController,
              style: TextStyle(color: Colors.white),
              decoration: InputDecoration(
                labelText: "Email",
                labelStyle: TextStyle(color: Colors.white60),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(color: Colors.white60),
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
            SizedBox(height: 40),
            TextField(
              controller: _passController,
              style: TextStyle(color: Colors.white),
              obscureText: true,
              decoration: InputDecoration(
                labelText: "password",
                labelStyle: TextStyle(color: Colors.white60),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(color: Colors.white60),
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
            SizedBox(height: 50),
            SizedBox(
              height: 55,
              width: MediaQuery.of(context).size.width / 1.5,
              child: ElevatedButton(
                onPressed: () async {
                  User? user = await _auth.registerWithEmailAndPassword(
                    _emailController.text,
                    _passController.text,
                  );
                  if (user != null) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => HomeScreen()),
                    );
                  }
                },
                child: Text("Register"),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white, // button background
                  foregroundColor: Colors.indigo, // text color
                  fixedSize: Size(200, 50),
                  padding: EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
            ),
            SizedBox(height: 20),
            Text("OR", style: TextStyle(color: Colors.white)),
            SizedBox(height: 20),
            TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Loginscreen()),
                );
              },
              child: Text(
                "Log in",
                style: TextStyle(color: Colors.indigo, fontSize: 18),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
