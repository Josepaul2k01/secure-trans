import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:pay_now/screens/home.dart';

import '../widgets/primary_button.dart';
import '../widgets/vertical_spacer.dart';

class EnterRecipientDetailsScreen extends StatefulWidget {
  @override
  State<EnterRecipientDetailsScreen> createState() =>
      _EnterRecipientDetailsScreenState();
}

class _EnterRecipientDetailsScreenState
    extends State<EnterRecipientDetailsScreen> {
  void _showBottomSheet(BuildContext context) {
    showModalBottomSheet<void>(
      context: context,
      builder: (BuildContext context) {
        return Container(
          height: 200,
          color: Colors.white,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Generate PIN',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 16.0),
              ElevatedButton(
                onPressed: () {
                  fetchData();
                  _showConfimrationDialog(context);
                  // Handle PIN generation logic here
                },
                child: Text('Generate PIN'),
              ),
            ],
          ),
        );
      },
    );
  }

  String seed = " ";
  String pin = "";

  void fetchData() async {
    FirebaseFirestore firestore = FirebaseFirestore.instance;
    QuerySnapshot querySnapshot =
        await firestore.collection("seedNumber").get();

    if (querySnapshot.docs.isNotEmpty) {
      setState(() {
        seed = querySnapshot.docs.first.get('seed');
        //print(seed);
        pin = calculateNextPin(seed);
        print(pin);
        seed = pin;
        //generatePin(seed);
      });
    }
  }

  //String pin = ""; // Current pin value

  void generatePin(seed) {
    setState(() {
      String pin = calculateNextPin(seed);
      print(pin);
      seed = pin; // Set the generated pin as the new seed
    });
  }

  String calculateNextPin(String seed) {
    // Apply customized cellular automaton rules here
    // Modify this logic to match your desired rules
    // This example generates a PIN of 6 digits containing digits from 0 to 9

    List<int> automatonRule = [
      7,
      2,
      4,
      8,
      1,
      5,
      9,
      3,
      6,
      0
    ]; // Cellular automaton rule (mapping of 0-9 digits)

    String pin = seed;
    for (int i = 0; i < 6; i++) {
      int left = int.parse(pin[(i + pin.length - 1) % pin.length]);
      int center = int.parse(pin[i]);
      int right = int.parse(pin[(i + 1) % pin.length]);

      int ruleIndex = (left << 2) +
          (center << 1) +
          right; // Convert neighboring digits to a rule index
      ruleIndex %= automatonRule
          .length; // Ensure the rule index is within the valid range

      int newDigit =
          automatonRule[ruleIndex]; // Apply the cellular automaton rule

      pin += newDigit.toString();
    }
    return pin
        .substring(pin.length - 6); // Extract the last 6 digits as the PIN
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Enter Recipient Details'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Recipient Account Number:'),
            TextField(
              decoration: InputDecoration(
                hintText: 'Enter account number',
              ),
            ),
            SizedBox(height: 16.0),
            Text('Amount to Send:'),
            TextField(
              decoration: InputDecoration(
                hintText: 'Enter amount',
              ),
            ),
            SizedBox(height: 16.0),
            Text('Bank Details:'),
            TextField(
              decoration: InputDecoration(
                hintText: 'Enter bank details',
              ),
            ),
            SizedBox(height: 32.0),
            ElevatedButton(
              onPressed: () {
                _showBottomSheet(context);
              },
              child: Text('Send'),
            ),
          ],
        ),
      ),
    );
  }

  _showConfimrationDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => Dialog(
        insetPadding: EdgeInsets.zero,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.w),
        ),
        child: SizedBox(
          height: 430.h,
          width: 327.w,
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 10.w,
            ),
            child: Column(
              children: [
                const VerticalSpacer(height: 40),
                SizedBox(
                  width: 240.w,
                  height: 180.h,
                  child: FittedBox(
                    child:
                        SvgPicture.asset('assets/images/sent_illustration.svg'),
                    fit: BoxFit.fill,
                  ),
                ),
                const VerticalSpacer(height: 35),
                Text(
                  "The amount has been sent successfully!",
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 20.sp,
                  ),
                  textAlign: TextAlign.center,
                ),
                const VerticalSpacer(height: 40),
                ElevatedButton(child:Text("Ok, Thanks"),onPressed :(){
                  Navigator.of(context).push(MaterialPageRoute(builder: (context) {
                    return HomeScreen();
                  }));
                })
              ],
            ),
          ),
        ),
      ),
    );
  }





}