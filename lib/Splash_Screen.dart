
import 'dart:async';
import 'package:bookings/Home1.dart';
import 'package:flutter/material.dart';
class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}
class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(
        Duration(seconds: 4),
            () =>
                Navigator.of(context).pushReplacement(MaterialPageRoute(
            builder: (BuildContext context) => home()))
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Container(
        child: Center(
          child: Center(
            child: Column(
              children: [
                Container(
                  margin: EdgeInsets.only(top: 280),
                  height: 150,
                    width: 200,
                    child: Image.asset('assets/images/BG!.png',color: Colors.white,)),
                SizedBox(height: 20,),
                Container(
                  margin: EdgeInsets.only(top: 50),
                  child: CircularProgressIndicator(
                    backgroundColor: Colors.red,
                    valueColor: AlwaysStoppedAnimation<Color>(
                      Colors.white, //<-- SEE HERE
                    ),
                  ),
                ),
                Container(
                    margin: EdgeInsets.only(top: 10),
                    child: Text("Loading...",style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white),))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
