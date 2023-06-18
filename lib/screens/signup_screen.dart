

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:pay_now/widgets/vertical_spacer.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'bank.dart';
import 'package:get/get.dart';

class SignupScreen extends StatelessWidget {
  SignupScreen({Key? key}) : super(key: key);

  //FirebaseAuth auth = FirebaseAuth.instance;
  //FirebaseFirestore db = FirebaseFirestore.instance;

  //final TextEditingController _emailcontroller = TextEditingController();
  //final TextEditingController _passwordcontroller = TextEditingController();
  
//void _addTask(){
    //FirebaseFirestore.instance.collection("userdetails").add({
     // "username":_emailcontroller.text
   // });
  //}

 /* signUp()async{
    await auth.createUserWithEmailAndPassword(email:_emailcontroller.text, password:_passwordcontroller.text);
    //Get.to(()=BankScreen());

  }*/


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
              const VerticalSpacer(height: 50),
              Expanded(
                flex:1,
                child: Text(
                  "Signup and Start Transfering",
                  style: TextStyle(
                    fontSize: 32.sp,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
              const VerticalSpacer(height: 30),
              Expanded(
                flex:1,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      width: 150.w,
                      height: 50.h,
                      decoration: BoxDecoration(
                        color: const Color(0xFFF3F4F5),
                        borderRadius: BorderRadius.circular(10.w),
                      ),
                      child: Center(
                        child: Text(
                          "Google",
                          style: TextStyle(
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ),
                    Container(
                      width: 150.w,
                      height: 50.h,
                      decoration: BoxDecoration(
                        color: const Color(0xFFF3F4F5),
                        borderRadius: BorderRadius.circular(10.w),
                      ),
                      child: Center(
                        child: Text(
                          "Facebook",
                          style: TextStyle(
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
              const VerticalSpacer(height: 20),
              Text(
                "Email",
                style: TextStyle(
                  fontSize: 14.sp,
                ),
              ),
              const VerticalSpacer(height: 8),
              Expanded(
                flex:1,
                child: TextField(
                  //controller: _emailcontroller,
                  decoration: InputDecoration(
                    hintText: "Enter your email",
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
              ),
              const VerticalSpacer(height: 5),
              Text(
                "Password",
                style: TextStyle(
                  fontSize: 14.sp,
                ),
              ),
              const VerticalSpacer(height: 8),
              Expanded(
                flex:1,
                child: TextField(
                  //controller: _passwordcontroller,
                  decoration: InputDecoration(
                    hintText: "Enter your password",
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
              ),
              const VerticalSpacer(height: 20),
              Text(
                "Renter password",
                style: TextStyle(
                  fontSize: 14.sp,
                ),
              ),
              const VerticalSpacer(height: 8),
              Expanded(
                flex:1,
                child: TextField(
                  decoration: InputDecoration(
                    hintText: "Enter your password again",
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
              ),
              const VerticalSpacer(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  ElevatedButton(
                  child:const Text("Next"),
                  onPressed: (){
                    //signUp();
                    //_addTask();
                    //print(_emailcontroller.text);
                   Navigator.of(context).push(MaterialPageRoute(builder: (context) {
                    return BankScreen();
                  }));
                },)] ,
              ),
              const VerticalSpacer(height: 10),
              Expanded(
                flex:1,
                child: SizedBox(
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
              ),
            ],
          ),
        ),
      ),
    );
  }
}
    



    