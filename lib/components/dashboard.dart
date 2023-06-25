import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:pay_now/screens/home.dart';
import 'package:pay_now/screens/sendScreen.dart';
import 'package:pay_now/widgets/horizontal_spacer.dart';
import 'package:pay_now/widgets/vertical_spacer.dart';

class DashBoard extends StatefulWidget {
  const DashBoard({Key? key}) : super(key: key);

  @override
  State<DashBoard> createState() => _DashBoardState();
}

class _DashBoardState extends State<DashBoard> {
  late DatabaseReference _userRef;
  Object userData = {};
  String userName = '';

  @override
  void initState() {
    super.initState();
    checkCurrentUser();
  }

  Future<void> checkCurrentUser() async {
    _userRef = FirebaseDatabase.instance.ref().child('users');
    try {
      User? user = FirebaseAuth.instance.currentUser;
      if (user != null) {
        getUserById(user.uid);
      } else {
        print("error$user");
      }
    } catch (e) {
      print("error$e");
    }
  }

  void getUserById(String userId) {
    _userRef.orderByChild('user_id').equalTo(userId).once().then((event) {
      final DataSnapshot snapshot = event.snapshot;
      if (snapshot.value != null) {
        setState(() {
          userData = snapshot.value!;
          final Map<dynamic, dynamic> userMap =
              userData as Map<dynamic, dynamic>;
          userName = userMap.values.first['name'];
        });
      }
    }).catchError((error) {
      print('Error retrieving user: $error');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: [
        Stack(
          children: [
            Container(
              height: 300.h,
              width: 400.w,
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.primary,
              ),
            ),
            CustomPaint(
              size: Size(400.w, 300.h),
              painter: DrawTriangleShape(),
            ),
            Positioned(
              top: 48.h,
              width: 375.w,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 30.w),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Dashboard",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 30.sp,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    CircleAvatar(
                      backgroundColor: Colors.white,
                      radius: 30.w,
                      child: Center(
                        child:Icon(Icons.person_2_sharp,size: 60,)
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              top: 120.h,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 30.w),
                child: Text(
                  "Hi," + userName.toUpperCase() + "!",
                  style: TextStyle(
                    color: Colors.white.withOpacity(0.8),
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
            Positioned(
              top: 152.h,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 30.w),
                child: Text(
                  "Total Balance",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20.sp,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
            Positioned(
              top: 190.h,
              width: 375.w,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 30.w),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      "\124.57",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 40.sp,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Stack(
                      clipBehavior: Clip.none,
                      children: [
                        SizedBox(
                          width: 24.w,
                          height: 24.h,
                          child: FittedBox(
                            fit: BoxFit.fill,
                            child: SvgPicture.asset(
                              "assets/images/notifications_icon.svg",
                            ),
                          ),
                        ),
                        Positioned(
                          right: 3.07.w,
                          top: -4.h,
                          child: Container(
                            height: 10.h,
                            width: 10.w,
                            decoration: BoxDecoration(
                              color: Theme.of(context).colorScheme.secondary,
                              shape: BoxShape.circle,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
        const VerticalSpacer(height: 50),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) {
                  return EnterRecipientDetailsScreen();
                }));
              },
              child: Container(
                height: 40.h,
                width: 100.w,
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.primary,
                  borderRadius: BorderRadius.circular(10.w),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: 10.w,
                      height: 10.h,
                      child: FittedBox(
                        fit: BoxFit.fill,
                        child: SvgPicture.asset(
                          "assets/images/send_icon.svg",
                        ),
                      ),
                    ),
                    const HorizontalSpacer(width: 4),
                    Text(
                      "Send Money",
                      style: TextStyle(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            ElevatedButton(
              onPressed: () {},
              child: Container(
                height: 40.h,
                width: 100.w,
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.primary,
                  borderRadius: BorderRadius.circular(10.w),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: 10.w,
                      height: 10.h,
                      child: FittedBox(
                        fit: BoxFit.fill,
                        child: SvgPicture.asset(
                          "assets/images/request_icon.svg",
                        ),
                      ),
                    ),
                    const HorizontalSpacer(width: 4),
                    Text(
                      "Req Money",
                      style: TextStyle(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w500,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
        const SizedBox(height: 100),
      ],
    ));
  }
}
