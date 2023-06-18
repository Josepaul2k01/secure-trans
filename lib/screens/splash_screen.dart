import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pay_now/screens/on_boarding_screen.dart';

import 'login_signup_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}
class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    gotoLoginsignup();
    super.initState();
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
    await Future.delayed(Duration(seconds: 6));
    Navigator.of(context).push(MaterialPageRoute(builder: (context) {
      return OnBoardingScreen();
    }));
  }
}
 