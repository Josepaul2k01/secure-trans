import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pay_now/widgets/vertical_spacer.dart';
import 'BnakDetail.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({Key? key}) : super(key: key);

  @override
  _SignupScreenState createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  FirebaseAuth auth = FirebaseAuth.instance;
  FirebaseFirestore db = FirebaseFirestore.instance;

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _retypePasswordController =
      TextEditingController();

  bool _isPasswordVisible = false;
  bool _isRetypePasswordVisible = false;
  bool _isPasswordMismatch = false;

  signUp() async {
    if (_passwordController.text == _retypePasswordController.text) {
      await auth.createUserWithEmailAndPassword(
          email: _emailController.text, password: _passwordController.text);
    } else {
      setState(() {
        _isPasswordMismatch = true;
      });
    }
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
          padding: EdgeInsets.symmetric(
            horizontal: 30.w,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const VerticalSpacer(height: 50),
              Expanded(
                flex: 1,
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
                flex: 1,
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
                          "Microsoft",
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
                flex: 1,
                child: TextField(
                  controller: _emailController,
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
                flex: 1,
                child: PasswordTextField(
                  controller: _passwordController,
                  isPasswordVisible: _isPasswordVisible,
                  togglePasswordVisibility: () {
                    setState(() {
                      _isPasswordVisible = !_isPasswordVisible;
                    });
                  },
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
                flex: 1,
                child: RetypePasswordTextField(
                  controller: _retypePasswordController,
                  isPasswordVisible: _isRetypePasswordVisible,
                  togglePasswordVisibility: () {
                    setState(() {
                      _isRetypePasswordVisible = !_isRetypePasswordVisible;
                    });
                  },
                ),
              ),
              if (_isPasswordMismatch)
                Padding(
                  padding: EdgeInsets.only(top: 8.w),
                  child: Text(
                    "Passwords do not match",
                    style: TextStyle(
                      fontSize: 12.sp,
                      color: Colors.red,
                    ),
                  ),
                ),
              const VerticalSpacer(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  ElevatedButton(
                    child: const Text("Next"),
                    onPressed: () {
                      if (_passwordController.text ==
                          _retypePasswordController.text) {
                        try {
                          signUp();
                          Navigator.of(context)
                              .push(MaterialPageRoute(builder: (context) {
                            return BankScreen();
                          }));
                        } catch (e) {
                          showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return AlertDialog(
                                title: Text('Error'),
                                content: Text(
                                    'Failed to create an account. Please try again.'),
                                actions: <Widget>[
                                  TextButton(
                                    child: Text('OK'),
                                    onPressed: () {
                                      Navigator.of(context).pop();
                                    },
                                  ),
                                ],
                              );
                            },
                          );
                        }
                      } else {
                        setState(() {
                          _isPasswordMismatch = true;
                        });
                      }
                    },
                  )
                ],
              ),
              const VerticalSpacer(height: 10),
              Expanded(
                flex: 1,
                child: SizedBox(
                  width: 375.w,
                  child: TextButton(
                    onPressed: () {
                      Navigator.of(context)
                          .push(MaterialPageRoute(builder: (context) {
                        return BankScreen();
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
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class PasswordTextField extends StatefulWidget {
  final TextEditingController controller;
  final bool isPasswordVisible;
  final VoidCallback togglePasswordVisibility;

  const PasswordTextField({
    required this.controller,
    required this.isPasswordVisible,
    required this.togglePasswordVisibility,
  });

  @override
  _PasswordTextFieldState createState() => _PasswordTextFieldState();
}

class _PasswordTextFieldState extends State<PasswordTextField> {
  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: widget.controller,
      obscureText: !widget.isPasswordVisible,
      decoration: InputDecoration(
        hintText: "Enter your password",
        hintStyle: TextStyle(
          fontSize: 14.sp,
          color: const Color(0xFF1A1A1A).withOpacity(0.2494),
        ),
        filled: true,
        fillColor: Colors.white,
        suffixIcon: IconButton(
          icon: Icon(
            widget.isPasswordVisible ? Icons.visibility_off : Icons.visibility,
            size: 24.sp,
            color: Colors.black.withOpacity(0.1953),
          ),
          onPressed: widget.togglePasswordVisibility,
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.w),
          borderSide: BorderSide(
            color: const Color(0xFF1A1A1A).withOpacity(0.1),
            width: 1.sp,
          ),
        ),
      ),
    );
  }
}

class RetypePasswordTextField extends StatefulWidget {
  final TextEditingController controller;
  final bool isPasswordVisible;
  final VoidCallback togglePasswordVisibility;

  const RetypePasswordTextField({
    required this.controller,
    required this.isPasswordVisible,
    required this.togglePasswordVisibility,
  });

  @override
  _RetypePasswordTextFieldState createState() =>
      _RetypePasswordTextFieldState();
}

class _RetypePasswordTextFieldState extends State<RetypePasswordTextField> {
  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: widget.controller,
      obscureText: !widget.isPasswordVisible,
      decoration: InputDecoration(
        hintText: "Enter your password again",
        hintStyle: TextStyle(
          fontSize: 14.sp,
          color: const Color(0xFF1A1A1A).withOpacity(0.2494),
        ),
        filled: true,
        fillColor: Colors.white,
        suffixIcon: IconButton(
          icon: Icon(
            widget.isPasswordVisible ? Icons.visibility_off : Icons.visibility,
            size: 24.sp,
            color: Colors.black.withOpacity(0.1953),
          ),
          onPressed: widget.togglePasswordVisibility,
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.w),
          borderSide: BorderSide(
            color: const Color(0xFF1A1A1A).withOpacity(0.1),
            width: 1.sp,
          ),
        ),
      ),
    );
  }
}
