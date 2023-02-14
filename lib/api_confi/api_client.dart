import 'dart:async';
import 'dart:convert';

import 'package:bookings/Home1.dart';
import 'package:bookings/screens/ClubApp.dart';
import 'package:bookings/screens/scan_qr.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:lottie/lottie.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../models/Event_Table_Response.dart';
// https://lizard.reserveyourvenue.com/     live url
Widget showLoader(con) {
  showDialog(
    context: con,
    barrierDismissible: false,
    builder: (BuildContext context) {
      return Center(
          child: Container(
              height: MediaQuery.of(context).size.height / 5,
              width: MediaQuery.of(context).size.width / 5,
              child: Lottie.asset("assets/image/loader.json")));
    },
  );
}

SharedPreferences Response;
String token;
@override
void initState() {
  // TODO: implement initState
  initState();
  initial();
}
void initial() async {
  final response = await SharedPreferences.getInstance();
  token = response.getString('token').toString();
}
var venue_id = 1;
var venue = 2;
Future<EventTableResponse> scanData(String bookingId) async {
  EventTableResponse eventTableResponse;
  print(
      'calling scandata with url ---> https://bg.reserveyourvenue.com/api/booking/' +
          bookingId);



  var requestBody = {
    "booking_id": bookingId
  };
  final tokenResponse = await SharedPreferences.getInstance();
  token = tokenResponse.getString('token').toString();
  debugPrint('Calling post add ons api ${ ClubApp.booking}');

  final response = await http.post(Uri.parse(
      ClubApp.booking),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
      'token':token,

    },
      // headers: headers,
      body: requestBody
  );
  //print(headers);
  var jsonData = json.decode(response.body);

  print("json response --> $jsonData");
  if (response.statusCode == 200) {
    final EventTableResponse eventTableResponse =
        eventTableResponseFromJson(response.body);
    return eventTableResponse;
  } else if (response.statusCode == 401) {
    return eventTableResponse;
  } else {
    return eventTableResponse;
  }
}
void checkIn(String bookingUid, String arrivedAt, String checkInStatus,
    bool route, BuildContext context) async {
  var requestBody = {
    "booking_uid": bookingUid,
    "arrived_at": arrivedAt,
    "checkin_status": checkInStatus
  };
  debugPrint('Calling post add ons api ${ ClubApp.booking_updatetime}');
  final response = await http.post(
      Uri.parse(ClubApp.booking_updatetime),
      body: requestBody);
  print(
      "calling check in api  https://bg.reserveyourvenue.com/api/booking/updatetime");
  print("route ------- $route");

  print(response.statusCode);
  // print(response.body.status);
  var jsonData = json.decode(response.body);
  print(jsonData);
  print(jsonData['status']);

  if (response.statusCode == 200 && jsonData['status'] == true) {
    ShowToast(context);
    // Fluttertoast.showToast(
    //     msg: "Checked In Successfully",
    //     toastLength: Toast.LENGTH_SHORT,
    //     timeInSecForIosWeb: 2,
    //     backgroundColor: Colors.black, //ColorRes.primaryColor,
    //     textColor: Colors.white,
    //     fontSize: 20.0,
    //     gravity: ToastGravity.BOTTOM);
    if (route == false) {
      print(route);
      Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(builder: (context) => ScanQrScreen()),
          (Route<dynamic> route) => false);
    } else {
      print(route);

      Navigator.pop(context, route);
    }
  } else if (response.statusCode == 200 && jsonData['status'] == false) {
    Fluttertoast.showToast(
        msg: "Something Went Wrong",
        toastLength: Toast.LENGTH_SHORT,
        timeInSecForIosWeb: 2,
        backgroundColor: Colors.black, //ColorRes.primaryColor,
        textColor: Colors.white,
        fontSize: 20.0,
        gravity: ToastGravity.BOTTOM);
  } else {
    Fluttertoast.showToast(
        msg: "Something Went Wrong",
        toastLength: Toast.LENGTH_SHORT,
        timeInSecForIosWeb: 2,
        backgroundColor: Colors.black, //ColorRes.primaryColor,
        textColor: Colors.white,
        fontSize: 20.0,
        gravity: ToastGravity.BOTTOM);
  }
  print("this is response body  " + response.body);
}

void ShowToast(BuildContext context) {
  FToast fToast = FToast();
  fToast.init(context);
  return fToast.showToast(
    child: Container(
      padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 12.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25.0),
        color: Colors.green,
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(
            width: 12.0,
          ),
          Text("Checked in"),
          SizedBox(width: 2),
          Icon(Icons.check),
        ],
      ),
    ),
  );

}












