import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pay_now/screens/home.dart';
import 'package:pay_now/screens/signup_screen.dart';
import 'LoginScreen.dart';
import 'bankserver.dart';

class Login_Signup extends StatefulWidget {
  Login_Signup({Key? key}) : super(key: key);

  @override
  State<Login_Signup> createState() => _Login_SignupState();
}

class _Login_SignupState extends State<Login_Signup> {
  User? userData;
  @override
  void initState() {
    super.initState();
    checkCurrentUser();
  }

  Future<void> checkCurrentUser() async {
    try {
      User? user = FirebaseAuth.instance.currentUser;
      if (user != null) {
        setState(() {
          userData = user;
        });
        Navigator.of(context).push(
          MaterialPageRoute(builder: (context) {
            return HomeScreen();
          }),
        );
      } else {
        print("error$user");
      }
    } catch (e) {
      print("error$e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            width: 375.w,
            height: 812.h,
            color: Colors.teal[100],
          ),
          Positioned(
            top: -120.h,
            left: -155.w,
            child: Container(
              width: 734.w,
              height: 734.h,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: Color(0xFFF3F4F5),
              ),
            ),
          ),
          Positioned(
            top: -137.h,
            left: -180.w,
            child: Container(
              width: 734.w,
              height: 734.h,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.white,
              ),
            ),
          ),
          Positioned(
            top: 212.h,
            left: 60.w,
            child: SizedBox(
              width: 250.w,
              height: 250.h,
              child: FittedBox(
                fit: BoxFit.fill,
                child: Image.asset('assets/images/HLogo.png'),
              ),
            ),
          ),
          Positioned(
            top: 464.h,
            width: 375.w,
            child: RichText(
              textAlign: TextAlign.center,
              text: TextSpan(
                style: TextStyle(
                  fontSize: 17.sp,
                  color: Colors.black,
                  fontWeight: FontWeight.w300,
                ),
                children: const [
                  TextSpan(text: "The Best Way to"),
                  TextSpan(
                      text: ' Transfer Money ',
                      style: TextStyle(fontWeight: FontWeight.w600)),
                  TextSpan(text: "Safely"),
                ],
              ),
            ),
          ),
          Positioned(
            top: 686.h,
            width: 375.w,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 30.w),
              child: ElevatedButton(
                onPressed: () {
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: (context) {
                    return SignupScreen();
                  }));
                },
                child: const Text('Create account'),
              ),
            ),
          ),
          Positioned(
            top: 759.h,
            width: 375.w,
            child: TextButton(
              onPressed: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) {
                  return LoginScreen();
                }));
              },
              child: Text(
                "Already have an account?",
                style: TextStyle(
                  color: Theme.of(context).colorScheme.primary,
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w500,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ),
          Positioned(
            top: 16.h,
            right: 16.w,
            child: ElevatedButton(
              onPressed: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) {
                  return BankServerScreen();
                }));
                // Add your desired functionality here
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.teal[100],
                shape: CircleBorder(),
              ),
              child: Icon(
                Icons.house,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
