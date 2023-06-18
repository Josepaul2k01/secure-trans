import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:pay_now/screens/info_screen.dart';
import 'package:pay_now/screens/profile_screen.dart';
import 'package:pay_now/screens/settings_screen.dart';

import '../widgets/horizontal_spacer.dart';
import '../widgets/vertical_spacer.dart';
import 'cards_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}


class _HomeScreenState extends State<HomeScreen> {
  
  int _currentIndex = 0;
  
  final List<Widget> _pages = [
    HomeScreen1(),
    CardsPage(),
    ProfileScreen(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:
      _pages[_currentIndex],
       bottomNavigationBar: BottomNavigationBar(
         currentIndex: _currentIndex,
      onTap: (int index) {
        setState(() {
          _currentIndex = index;
        });
      },
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.credit_card),
          label: 'Cards',
        ),
        /*BottomNavigationBarItem(
          icon: Icon(Icons.settings),
          label: 'Settings',
        ),*/
        BottomNavigationBarItem(
          icon: Icon(Icons.info),
          label: 'MyAccount',
        ),
      ],
      ),
    );
  }
}

class DrawTriangleShape extends CustomPainter {
  Paint painter = Paint()
    ..color = const Color(0xFF3491DB)
    ..style = PaintingStyle.fill;

  @override
  void paint(Canvas canvas, Size size) {
    var path = Path();

    path.moveTo(size.width, 0);
    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);
    path.close();

    canvas.drawPath(path, painter);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}

class InfoPage extends StatelessWidget {
  const InfoPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ProfileScreen();
  }
}

class CardsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CardsScreen();
  }
}

/*class SettingsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SettingsScreen();
  }
}*/
class HomeScreen1 extends StatefulWidget {
  const HomeScreen1({Key? key}) : super(key: key);

  @override
  State<HomeScreen1> createState() => _HomeScreen1State();
}

class _HomeScreen1State extends State<HomeScreen1> {
  
  String seed = "123456789"; // Initial seed value
  String pin = ""; // Current pin value

  void generatePin() {
    setState(() {
      pin = calculateNextPin(seed);
      print(pin);
      seed = pin; // Set the generated pin as the new seed
    });
  }

  String calculateNextPin(String seed) {
    // Apply customized cellular automaton rules here
    // Modify this logic to match your desired rules
    // This is a more complex example using a XOR-based rule

    List<int> automatonRule = [0, 1, 0, 1, 1, 0, 1, 0]; // Cellular automaton rule

    String nextPin = "";
    for (int i = 0; i < seed.length; i++) {
      int left = int.parse(seed[(i + seed.length - 1) % seed.length]);
      int center = int.parse(seed[i]);
      int right = int.parse(seed[(i + 1) % seed.length]);

      int ruleIndex = (left << 2) + (center << 1) + right; // Convert neighboring digits to a rule index
      ruleIndex %= automatonRule.length; // Ensure the rule index is within the valid range

      int newDigit = automatonRule[ruleIndex]; // Apply the cellular automaton rule

      nextPin += newDigit.toString();
    }
    return nextPin;
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:
      Column(
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
                        radius: 30.w,
                        backgroundImage: const AssetImage(
                            "assets/images/Profile Picture.png"),
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
                    "Hi, JOSE!",
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
                        "\$124.57",
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
                              child: SvgPicture.asset(
                                "assets/images/notifications_icon.svg",
                              ),
                              fit: BoxFit.fill,
                            ),
                          ),
                          Positioned(
                            right: 3.07.w,
                            top: -4.h,
                            child: Container(
                              height: 10.h,
                              width: 10.w,
                              decoration: BoxDecoration(
                                color:
                                    Theme.of(context).colorScheme.secondary,
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
          VerticalSpacer(height: 50),
          Row(
            //crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
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
                          child: SvgPicture.asset(
                            "assets/images/send_icon.svg",
                          ),
                          fit: BoxFit.fill,
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
                          child: SvgPicture.asset(
                            "assets/images/request_icon.svg",
                          ),
                          fit: BoxFit.fill,
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
          SizedBox(height :100),
          ElevatedButton(onPressed: (){
            generatePin();

          }, child:Container(
                 height:50,
                  width:150,                  
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(4),
                    color: Colors.lightBlue[100],
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.stop_circle,color: Colors.black,),
                      const HorizontalSpacer(width: 4),
                      Text(
                        "Generate Pin",
                        style: TextStyle(
                          fontSize: 20.sp,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                ))
        ],
      )

    );
  }

/*void generatePin() {
  String seedValue = '123456789'; // Replace with the seed value obtained from the bank
  String customerPin = generateCustomerPin(seedValue);
  seedValue=customerPin;
  print('Customer-side Generated PIN: $customerPin');
  
}
String generateCustomerPin(String seedValue) {
  int gridWidth = seedValue.length;
  int iterations = 1;
  int ruleNumber = 30;

  List<int> currentState = seedValue
      .split('')
      .map((char) => int.parse(char))
      .toList();

  for (int i = 0; i < iterations; i++) {
    List<int> nextState = List.generate(gridWidth, (_) => 0);

    for (int j = 0; j < gridWidth; j++) {
      int left = currentState[(j - 1 + gridWidth) % gridWidth];
      int center = currentState[j];
      int right = currentState[(j + 1) % gridWidth];

      nextState[j] = applyCellularAutomataRule(left, center, right, ruleNumber);
    }

    currentState = nextState;
  }

  String pin = currentState.join('');

  return pin;
}
int applyCellularAutomataRule(int left, int center, int right, int rule) {
  List<bool> ruleSet = [];
  for (int i = 0; i < 8; i++) {
    ruleSet.add(((rule >> i) & 1) == 1);
  }

  return ruleSet[getIndex(left, center, right)] ? 1 : 0;
}

int getIndex(int left, int center, int right) {
  int index = ((left << 2) + (center << 1) + right) % 8;
  return index >= 0 ? index : index + 8;
}
*/

}
// Function to generate the PIN using cellular automata at the customer side










