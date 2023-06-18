import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pay_now/main.dart';
import 'package:pay_now/screens/login_screen.dart';
import 'package:pay_now/widgets/vertical_spacer.dart';


 // FirebaseAuth auth = FirebaseAuth.instance;
class ResetPasswordScreen1 extends StatelessWidget {
   ResetPasswordScreen1({Key? key}) : super(key: key);

 //FirebaseFirestore db = FirebaseFirestore.instance;
 final TextEditingController _seedcontroller = TextEditingController();
 

 /* void _addTask()async {
    FirebaseFirestore.setLoggingEnabled(true);
    await FirebaseFirestore.instance.collection("seedValue").add({
      "seed":_seedcontroller.text
    });
  }*/

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar:AppBar(
        title:Text("Register Seed"),
        titleSpacing: 00.0,
        centerTitle: true,
        toolbarHeight: 60.2,
        toolbarOpacity: 0.8,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              bottomRight: Radius.circular(25),
              bottomLeft: Radius.circular(25)),
        ),
        elevation: 0.00,
        backgroundColor: Colors.blueAccent[400],
      ), 
      body: Column(
        //mainAxisAlignment: MainAxisAlignment.start,
        //crossAxisAlignment: CrossAxisAlignment.start,
        children: [       
          const VerticalSpacer(height: 50),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 15.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              
              children: [
                Text(
                  "Enter your Unique Key Value to Activate Account",
                  style: TextStyle(
                    fontSize: 16.sp,
                    color: const Color(0xFF1A1A1A),
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const VerticalSpacer(height: 100),
                Text(
                  "Seed",
                  style: TextStyle(
                    fontSize: 16.sp,
                    color: const Color(0xFF1A1A1A),
                  ),
                ),
                const VerticalSpacer(height:8),
                TextField(
                  controller: _seedcontroller,
                  keyboardType: TextInputType.number,
                  style: TextStyle(
                    fontSize: 18.sp,
                    color: Theme.of(context).colorScheme.primary,
                  ),
                  cursorColor: Theme.of(context).colorScheme.primary,
                  decoration: InputDecoration(
                    hintText: "Enter your Key",
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
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.w),
                      borderSide: BorderSide(
                        color: Theme.of(context).colorScheme.primary,
                        width: 1.sp,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height:50),
          ElevatedButton(onPressed: (){
            print(_seedcontroller.text);
            //_addTask();
            }, 
            child: Text("register"),)
        ],
      ),
     /* bottomNavigationBar: Container(
        height: 200.h,
        width: 375.w,
        decoration: BoxDecoration(
          color: Colors.white54,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20.w),
            topRight: Radius.circular(20.w),
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.09),
              offset: const Offset(0, -10),
              blurRadius: 10,
            ),
          ],
        ),
        child: Center(
          child: ElevatedButton(
            onPressed: (){
              _addTask();
             /* Navigator.of(context).push(MaterialPageRoute(builder: (context) {
                    return LoginScreen();
                  }));*/
            },
            child: Container(
              height: 49.h,
              width: 250.w,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(60),
                color: Theme.of(context).colorScheme.primary,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Register",
                    style: TextStyle(
                      fontSize: 15.sp,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),*/

    );
  }
}
