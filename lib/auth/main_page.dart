import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_to_do_list/auth/auth_page.dart';
import 'package:flutter_to_do_list/screen/home.dart';

class Main_Page extends StatelessWidget {
  const Main_Page({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            // While waiting for Firebase state to change, you could show a loading screen
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasData) {
            // If user is signed in, show Home Screen
            return Home_Screen();
          } else {
            // If user is not signed in, show Auth Page (login/signup)
            return Auth_Page();
          }
        },
      ),
    );
  }
}
