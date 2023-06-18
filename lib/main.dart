import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pay_now/screens/contacts_screen.dart';

import 'package:pay_now/screens/profile_screen.dart';
import 'package:pay_now/screens/splash_screen.dart';
import 'package:pay_now/screens/transactions_screen.dart';
import 'package:pay_now/widgets/vertical_spacer.dart';
import 'package:firebase_core/firebase_core.dart';
void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Builder(builder:(ctx){
      ScreenUtil.init(ctx,designSize: Size(375, 812));
      return MaterialApp(
        
        //useInheritedMediaQuery: true,
        debugShowCheckedModeBanner: false,
        title: 'Secure Trans',
        theme: ThemeData(
          brightness: Brightness.light,
          colorScheme: ColorScheme.fromSwatch().copyWith(
        
            primary: const Color(0xFF1A87DD),
            secondary: const Color(0xFFF8BB18),
            onSecondaryContainer: const Color(0xFF1A1A1A),
            onSurface: const Color(0xFF1A1A1A),
          ),
          textTheme: const TextTheme().copyWith(
              bodyMedium: const TextStyle(
            color: Color(0xFF1A1A1A),
          )),
          fontFamily: 'SF-Pro-Rounded',
        ),
        home:SplashScreen(),
      );
    }
    );
  }
}

