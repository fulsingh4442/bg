import 'dart:io';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
class ClubApp {
  //sucasaSelected ? 'assets/images/BG!!.png' : 'assets/images/GM.png',
 // https://bg.teaseme.website/




  //static const String BASE_URL = 'https://bg.reserveyourvenue.com/api/';
  static const String BASE_URL = 'https://bg.teaseme.website/api/';

 // static const String BASE_URL = 'https://lizard.teaseme.co.in/api/';
  static const String users_login = BASE_URL + 'users/login';
  static const String booking = BASE_URL + 'booking';
  static const String booking_checkin = BASE_URL + 'booking/checkin';
  static const String booking_updatetime = BASE_URL + 'booking/updatetime';
  static const String booking_report = BASE_URL + 'booking/report';
  static const String users_venues = BASE_URL + 'users/venues';

  static String BeachBar = 'Beach Bar';
  static String Zoh = 'Zoh';
  static String Login = 'Login';
  static String CheckIn = 'Check In  ';
  static String CheckedIN = 'Checked: IN  ';
  static String TableBooking = 'Table Booking';
  static String Filterby = 'Filter by';
  static String BookingID = 'Booking ID';
  static String Name = 'Name';
  static String btn_go_cart = 'Go To Cart';
  static String btn_proceed = 'Proceed';
  static String Email = 'Email';
  static String SearchKeyword = 'Search Keyword';
  static String Entervalue = 'Enter value';
  static String NoDataFound  = 'No Data Found !';
  static String Booking = 'Booking ID:';
  static String Date = 'Date:';
  static String Guest = '#Guest:';
  static String Time = 'Time';
  static String close = 'Close';
  static String GuestName = 'Guest Name';
  static String TableDepositPaid = 'Table Deposit Paid:';
  static String Table = 'Table:';
  static String Tables = 'Table';
  static String Packages = '# Packages';
  static String Rate = 'Rate';
  static String Total = 'Total';
  static String Check_in_successfully = 'Check in successfully';
  static String Event_Booking = "Event Booking";
  static String Event = "Event:   ";
  static String Events = "Event   ";
  static String Paid_Amount = "Paid Amount:";
  static String No_of_Tickets = 'No of Tickets :  ';
  static String Bookings = "Booking ";
  static String Home = "Home";
  static String Booking_Scanner = "Booking Scanner";
  static String Table_Booking = "Table Booking";
  static String Report  = "Report" ;
  static String Logout = "Logout";
  static String Cancel = "Cancel";
  static String Already_checked_in = "Already Checked in";
  static String Search_via_Booking_ID = "Search via Booking ID";


  static String Booking_Details = "Booking Details";
  static String CheckedIn = "Checked In  ";
  static String no_internet_message =
      'No internet connection. Please reconnect and try again';





  Future<bool> isNetworkAvailable() async {
    try {
      final result = await InternetAddress.lookup('google.com');
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        print('connected');
        return true;
      } else {
        return false;
      }
    } on SocketException catch (e) {
      print('not connected: $e');
      return false;
    }
  }

  Future<void> ackAlert(BuildContext context, String message) {

    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(

          title:
          Text('BG'
            //sucasaSelected ? 'BG' : 'Kenjin',
          ),
          content: Text(message),
          actions: <Widget>[
            TextButton(
              child: const Text('Ok'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }






}
