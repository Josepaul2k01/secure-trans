import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:pay_now/screens/home.dart';
import 'package:pay_now/screens/on_boarding_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  User? userData;

  @override
  void initState() {
    super.initState();
    gotoLoginsignup();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: FittedBox(
          child: Image.asset('assets/images/Logo.jpg'),
          fit: BoxFit.fill,
        ),
      ),
    );
  }

  Future<void> gotoLoginsignup() async {
    User? user = FirebaseAuth.instance.currentUser;
    await Future.delayed(Duration(seconds: 6));
    if (user != null) {
      Navigator.of(context).push(
        MaterialPageRoute(builder: (context) {
          return HomeScreen();
        }),
      );
    } else {
      Navigator.of(context).push(MaterialPageRoute(builder: (context) {
        return OnBoardingScreen();
      }));
    }
  }
}
