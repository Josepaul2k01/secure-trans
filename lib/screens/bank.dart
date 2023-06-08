import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pay_now/screens/login_screen.dart';
import 'package:pay_now/screens/seed.dart';
import 'package:pay_now/widgets/primary_button.dart';
import 'package:pay_now/widgets/vertical_spacer.dart';
import 'package:firebase_auth/firebase_auth.dart';

class BankScreen extends StatelessWidget {
  BankScreen({Key? key}) : super(key: key);

  final _list = ['Federal', 'Canara', 'South Indian'];

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
          padding: EdgeInsets.symmetric(
            horizontal: 30.w,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const VerticalSpacer(height: 150),
              Text(
                "Bank",
                style: TextStyle(
                  fontSize: 14.sp,
                ),
              ),
              const VerticalSpacer(height: 10),


              DropdownButtonFormField(
              hint: Text('Select Your Bank'),
              onChanged: (value) {
                print(value);
              },
              items: _list.map((e) {
                return DropdownMenuItem(
                  value: e,
                  child: Text(e),
                );
              }).toList()),
              const VerticalSpacer(height: 20),
              Text(
                "Account Number",
                style: TextStyle(
                  fontSize: 14.sp,
                ),
              ),
              VerticalSpacer(height: 10),
              TextField(
                decoration: InputDecoration(
                  hintText: "Enter your Account Number",
                  hintStyle: TextStyle(
                    fontSize: 14.sp,
                    color: const Color(0xFF1A1A1A).withOpacity(0.2494),
                  ),
                  filled: true,
                  fillColor: Colors.white,
                  suffixIcon: Icon(
                    Icons.remove_red_eye_outlined,
                    size: 24.sp,
                    color: Colors.black.withOpacity(0.1953),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.w),
                    borderSide: BorderSide(
                      color: const Color(0xFF1A1A1A).withOpacity(0.1),
                      width: 1.sp,
                    ),
                  ),
                ),
              ),
              const VerticalSpacer(height: 20),
              Text(
                "IFSC",
                style: TextStyle(
                  fontSize: 14.sp,
                ),
              ),
              const VerticalSpacer(height: 10),
              TextField(
                decoration: InputDecoration(
                  hintText: "Enter your IFSC Code",
                  hintStyle: TextStyle(
                    fontSize: 14.sp,
                    color: const Color(0xFF1A1A1A).withOpacity(0.2494),
                  ),
                  filled: true,
                  fillColor: Colors.white,
                  suffixIcon: Icon(
                    Icons.remove_red_eye_outlined,
                    size: 24.sp,
                    color: Colors.black.withOpacity(0.1953),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.w),
                    borderSide: BorderSide(
                      color: const Color(0xFF1A1A1A).withOpacity(0.1),
                      width: 1.sp,
                    ),
                  ),
                ),
              ),
              const VerticalSpacer(height: 45),
              Center(
                child: ElevatedButton(child:Text("Create account"),
                onPressed: (){
                  Navigator.of(context).push(MaterialPageRoute(builder: (context) {
                    return ResetPasswordScreen1();
                  }));
                },),
              ),
              const VerticalSpacer(height: 10),
              SizedBox(
                width: 375.w,
                child: Text(
                  "Already have account?",
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.primary,
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w500,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
    



    