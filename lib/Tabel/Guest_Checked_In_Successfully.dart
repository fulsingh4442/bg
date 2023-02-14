import 'dart:async';
import 'package:bookings/screens/scan_qr.dart';
import 'package:flutter/material.dart';
class Guest_Checked_In_Successfully extends StatefulWidget {
  @override
  _Guest_Checked_In_SuccessfullyState createState() => _Guest_Checked_In_SuccessfullyState();
}
class _Guest_Checked_In_SuccessfullyState extends State<Guest_Checked_In_Successfully> {
  @override
  void initState() {
    super.initState();
    Timer(
        Duration(seconds: 2),
            () =>
            Navigator.of(context).pushReplacement(MaterialPageRoute(
                builder: (BuildContext context) => ScanQrScreen()))
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
     // backgroundColor: Colors.black,
      body: Container(
        child: Center(
          child: Center(
            child: Column(
              children: [
                Container(
                    margin: EdgeInsets.only(top: 250),
                    height: 150,
                    width: 150,
                    child:
                    Image.asset('assets/images/check.gif')
                ),
                SizedBox(height: 20,),
                Container(
                    margin: EdgeInsets.only(top: 10),
                    child: Text("Checked In",),),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
