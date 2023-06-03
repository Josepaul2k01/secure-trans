import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pay_now/screens/profile_screen.dart';
import 'package:pay_now/widgets/primary_button.dart';
import 'package:pay_now/widgets/vertical_spacer.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({Key? key}) : super(key: key);

  final _usernameController = TextEditingController();

  final _passwordController = TextEditingController();

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
              const VerticalSpacer(height: 90/*80*/),
              Text(
                "Login and Start Transfering",
                style: TextStyle(
                  fontSize: 32.sp,
                  fontWeight: FontWeight.w700,
                ),
              ),
              const VerticalSpacer(height: 62),
              Row(
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
              const VerticalSpacer(height: 20/*93*/),
              Text(
                "Email",
                style: TextStyle(
                  fontSize: 14.sp,
                ),
              ),
              const VerticalSpacer(height: 2/*8*/),
              TextFormField(
                controller: _usernameController,
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
              const VerticalSpacer(height: 15/*24*/),
              Text(
                "Password",
                style: TextStyle(
                  fontSize: 14.sp,
                ),
              ),
              const VerticalSpacer(height: 2/*8*/),
              TextFormField(
                controller: _passwordController,
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
              const VerticalSpacer(height: 2/*8*/),
              SizedBox(
                width: 375.w,
                child: Text(
                  "Forgot password?",
                  style: TextStyle(
                    fontSize: 14.sp,
                    color: Theme.of(context).colorScheme.primary,
                  ),
                  textAlign: TextAlign.end,
                ),
              ),
              const VerticalSpacer(height: 2/*92*/),
              ElevatedButton(child:
              const Text( "Login"),
              onPressed: () {
                checkLogin(context);
                },),
              const VerticalSpacer(height: 2),
              SizedBox(
                width: 375.w,
                child: Text(
                  "Create new account",
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

    checkLogin(BuildContext ctx) {
    final _username = _usernameController.text;
    final _password = _passwordController.text;
    if (_username == _password) {
      //final _sharedprefes = await SharedPreferences.getInstance();
      //await _sharedprefes.setBool(Save_key,true);
      Navigator.of(ctx).pushReplacement(MaterialPageRoute(builder: (ctx1)=>ProfileScreen()));
    } else {
      final _errorMessage = 'Username password doesnot match';
        ScaffoldMessenger.of(ctx).showSnackBar(SnackBar(
          behavior: SnackBarBehavior.floating,
          backgroundColor: Colors.red,
          margin: EdgeInsets.all(20),
          duration: Duration(seconds: 2),
          content: Text(
            _errorMessage,
          )));



    }}
}
