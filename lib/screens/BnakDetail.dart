import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'home.dart';

class BankScreen extends StatefulWidget {
  const BankScreen({Key? key}) : super(key: key);

  @override
  _BankScreenState createState() => _BankScreenState();
}

class _BankScreenState extends State<BankScreen> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController accountNumberController = TextEditingController();
  final TextEditingController seedController = TextEditingController();

  late DatabaseReference _userRef;
  User? userData;

  @override
  void initState() {
    super.initState();
    checkCurrentUser();
    _userRef = FirebaseDatabase.instance.ref().child('users');
  }

  Future<void> checkCurrentUser() async {
    try {
      User? user = FirebaseAuth.instance.currentUser;
      if (user != null) {
        print("suc$user");
        setState(() {
          userData = user;
        });
      } else {
        print("error$user");
      }
    } catch (e) {
      print("error$e");
    }
  }

  @override
  void dispose() {
    nameController.dispose();
    accountNumberController.dispose();
    seedController.dispose();
    super.dispose();
  }

  void _showSnackBar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(message),
    ));
  }

  bool _validateFields() {
    if (nameController.text.isEmpty) {
      _showSnackBar('Please enter your name');
      return false;
    }
    if (accountNumberController.text.isEmpty) {
      _showSnackBar('Please enter recipient account number');
      return false;
    }
    if (seedController.text.isEmpty) {
      _showSnackBar('Please enter seed value');
      return false;
    }
    return true;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: 812.h,
        width: 375.w,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/Background.png"),
            fit: BoxFit.cover,
          ),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 30.w),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                "Name",
                style: TextStyle(
                  fontSize: 14.sp,
                ),
              ),
              SizedBox(height: 16.h),
              TextField(
                controller: nameController,
                decoration: InputDecoration(
                  hintText: "Enter your Name",
                  hintStyle: TextStyle(
                    fontSize: 14.sp,
                    color: const Color(0xFF1A1A1A).withOpacity(0.2494),
                  ),
                  filled: true,
                  fillColor: Colors.white,
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.w),
                    borderSide: BorderSide(
                      color: const Color(0xFF1A1A1A).withOpacity(0.1),
                      width: 1.sp,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 16.h),
              Text(
                "Account Number",
                style: TextStyle(
                  fontSize: 14.sp,
                ),
              ),
              SizedBox(height: 16.h),
              TextField(
                controller: accountNumberController,
                decoration: InputDecoration(
                  hintText: "Enter your Account Number",
                  hintStyle: TextStyle(
                    fontSize: 14.sp,
                    color: const Color(0xFF1A1A1A).withOpacity(0.2494),
                  ),
                  filled: true,
                  fillColor: Colors.white,
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.w),
                    borderSide: BorderSide(
                      color: const Color(0xFF1A1A1A).withOpacity(0.1),
                      width: 1.sp,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 16.h),
              Text(
                "Seed",
                style: TextStyle(
                  fontSize: 14.sp,
                ),
              ),
              SizedBox(height: 16.h),
              TextField(
                controller: seedController,
                decoration: InputDecoration(
                  hintText: "Enter your unique seed",
                  hintStyle: TextStyle(
                    fontSize: 14.sp,
                    color: const Color(0xFF1A1A1A).withOpacity(0.2494),
                  ),
                  filled: true,
                  fillColor: Colors.white,
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.w),
                    borderSide: BorderSide(
                      color: const Color(0xFF1A1A1A).withOpacity(0.1),
                      width: 1.sp,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 24.h),
              ElevatedButton(
                onPressed: () {
                  if (_validateFields()) {
                    User? user = FirebaseAuth.instance.currentUser;
                    _userRef.push().set({
                      'user_id': user?.uid,
                      'name': nameController.text,
                      'accountNumber': accountNumberController.text,
                      'user_seed': seedController.text,
                      'bank_seed': seedController.text
                    }).then((_) {
                      Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) {
                          return HomeScreen();
                        }),
                      );
                    }).catchError((error) {
                      print("Error: $error");
                    });
                  }
                },
                child: Text('Register'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
