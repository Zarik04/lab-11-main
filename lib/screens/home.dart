import 'package:flutter/material.dart';
import 'package:lab_11_main/models/user.dart';
import 'package:lab_11_main/sercice/auth.dart';

class HomePage extends StatelessWidget {
  final CustomUser? user;
  const HomePage({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.indigo,
        title: const Text(
          'Home Page',
          style: TextStyle(
            fontWeight: FontWeight.w700,
            color: Colors.white,
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 30.0),
        child: ElevatedButton(
          onPressed: () async {
            try{
              await AuthService().signOut();
              Navigator.pushNamed(context, 'sign_in');
            }catch(e){
              print('error');
            }
          },
          style: ElevatedButton.styleFrom(
            padding: EdgeInsets.symmetric(horizontal: 30, vertical: 12),
            backgroundColor: Colors.indigo,
          ),
          child: const Text(
            'Sign Out',
            style: TextStyle(
              fontSize: 18,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
