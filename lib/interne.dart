import 'package:flutter/material.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:overlay_support/overlay_support.dart';
class Internet{
  bool Connected= false;


  ChackInteenetCom() async{
    Connected =  await InternetConnectionChecker().hasConnection;
    final mag = Connected ? "Connected to  Internet":"No Connected to Internet";
    // showSimpleNotification(
    //      Text('$mag'),
    //     margin: EdgeInsets.all(38),
    //     decoration: BoxDecoration(
    //       borderRadius: BorderRadius.circular(18),
    //       gradient: LinearGradient(
    //           colors: [Colors.green, Colors.blue],
    //           begin: Alignment.topLeft,
    //           end: Alignment.bottomRight),
    //     ),
    //     elevation: 0);

    showSimpleNotification(
      Text("$mag"),
      background: Colors.red,
    );


  }


}