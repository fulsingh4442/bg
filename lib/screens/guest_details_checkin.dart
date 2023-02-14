// import 'package:bookings/api_confi/api_client.dart';
// import 'package:bookings/models/details_response_model.dart';
// import 'package:bookings/models/single_item_response_model.dart';
// import 'package:bookings/screens/scan_qr.dart';
// import 'package:flutter/material.dart';
//
// class GuestDetailsCheckIn extends StatefulWidget {
//   String bookingUid;
//   String totalRecords;
//   String guestname;
//   List<AaDatumSM> dataListSM;
//   AaDatum aaData;
//   bool fromDetails;
//   GuestDetailsCheckIn(
//     this.bookingUid,
//     this.totalRecords,
//     this.fromDetails, {
//     this.dataListSM,
//     this.aaData,
//     this.guestname,
//   });
//
//   @override
//   _GuestDetailsCheckInState createState() => _GuestDetailsCheckInState();
// }
//
// class _GuestDetailsCheckInState extends State<GuestDetailsCheckIn> {
//   // int index = 0;
//
//   // @override
//   // void initState() {
//   //   // TODO: implement initState
//   //   super.initState();
//   //   for (var each in widget.dataListSM) {
//   //     print("-------index------  $index");
//   //     if (widget.bookingUid == each.bookingUid) {
//   //       break;
//   //     }
//   //     index += 1;
//   //   }
//   // }
//
//   @override
//   Widget build(BuildContext context) {
//     return WillPopScope(
//       onWillPop: () async => false,
//       child: Scaffold(
//         appBar: AppBar(
//           backgroundColor: Colors.black,
//           leading: InkWell(
//               onTap: () {
//                 Navigator.pop(context);
//               },
//               child: Icon(Icons.arrow_back)),
//           title: Center(
//             child: Container(
//                 height: 60,width: 60,
//
//                 child: Image.asset('assets/images/appicon.png',color: Colors.white )),
//           ),
//         ),
//
//         body: SafeArea(
//           child: Column(
//             children: [
//               // Container(
//               //   color: Colors.blue,
//               //
//               //   child: Row(
//               //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               //     children: [
//               //       InkWell(
//               //         onTap: () {
//               //           Navigator.pop(context);
//               //           // Navigator.of(context).pushAndRemoveUntil(
//               //           //     MaterialPageRoute(
//               //           //         builder: (context) => ScanQrScreen()),
//               //           //     (Route<dynamic> route) => false);
//               //         },
//               //         child: Container(
//               //             padding: EdgeInsets.fromLTRB(20, 15, 0, 20),
//               //             child: Icon(Icons.arrow_back_ios)),
//               //       ),
//               //
//               //       Container(
//               //         child: Text(
//               //           widget.dataListSM != null
//               //               ? widget.dataListSM[0].firstName +
//               //               widget.dataListSM[0].lastName
//               //               : widget.guestname,
//               //           style: TextStyle(
//               //             fontSize: 16,
//               //             fontWeight: FontWeight.bold,
//               //           ),
//               //         ),
//               //       ),
//               //
//               //       Container(
//               //         margin: EdgeInsets.only(right: 20, bottom: 10),
//               //         height: MediaQuery.of(context).size.height * 0.07,
//               //         width: MediaQuery.of(context).size.width * 0.17,
//               //         decoration: BoxDecoration(
//               //           image: DecorationImage(
//               //             fit: BoxFit.fill,
//               //             image: AssetImage('assets/images/appicon.png'),
//               //           ),
//               //         ),
//               //       ),
//               //     ],
//               //   ),
//               // ),
//               // Container(
//               //   child: Text(
//               //     widget.dataListSM != null
//               //         ? widget.dataListSM[0].firstName +
//               //             widget.dataListSM[0].lastName
//               //         : widget.guestname,
//               //     style: TextStyle(
//               //       fontSize: 16,
//               //       fontWeight: FontWeight.bold,
//               //     ),
//               //   ),
//               // ),
//               Container(
//                 margin: EdgeInsets.fromLTRB(5, 5, 5, 5),
//                 child: Card(
//                   elevation: 5,
//                   shape: RoundedRectangleBorder(
//                     borderRadius: BorderRadius.circular(10),
//                   ),
//                   child: Column(
//                     children: [
//                   Center(
//                     child: Container(
//                             child: Text(
//                               widget.dataListSM != null
//                                   ? widget.dataListSM[0].firstName +
//                                   widget.dataListSM[0].lastName
//                                   : widget.guestname,
//                               style: TextStyle(
//                                 fontSize: 16,
//                                 fontWeight: FontWeight.bold,
//                               ),
//                             ),
//                           ),
//                   ),
//                       Container(
//                         margin: EdgeInsets.only(left: 10,top: 10,right: 10),
//                         child: Row(
//                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                           children: [
//                             Text(
//                               "Booking ID:",
//                               style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold),
//                             ),
//                             Container(
//                               child: Text(
//                                 " ${widget.bookingUid}",
//                                 style: TextStyle(fontSize: 15),
//                               ),
//                             ),
//                           ],
//                         ),
//                       ),
//
//                       Container(
//                         margin: EdgeInsets.only(left: 10,top: 10,right: 10),
//                         child: Row(
//                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                           children: [
//                             Text(
//
//                                    "Number of Tickets: ",
//                               style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold),
//                             ),
//                             Container(
//                               child: Text(
//                                 widget.dataListSM != null
//                                     ? " ${widget.dataListSM[0].quantity??""}"
//                                     : widget.aaData != null
//                                         ? " ${widget.aaData.quantity}"
//                                         : " ",
//                                 style: TextStyle(fontSize: 15),
//                               ),
//                             ),
//                           ],
//                         ),
//                       ),
//
//                       Container(
//                         margin: EdgeInsets.only(left: 10,top: 10,right: 10),
//                         child: Row(
//                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                           children: [
//                             Text(
//
//                                    "Event Name: ",
//                               style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold),
//                             ),
//                             Container(
//                               child: Text(
//                                 widget.dataListSM != null
//                                     ? widget.dataListSM[0].events.isEmpty
//                                         ? " "
//                                         : " ${widget.dataListSM[0].events[0].name}"
//                                     : widget.aaData != null
//                                         ? " ${widget.aaData.firstName ?? ""} ${widget.aaData.lastName ?? ""}"
//                                         : " ",
//                                 style: TextStyle(fontSize: 15),
//                               ),
//                             ),
//                           ],
//                         ),
//                       ),
//
//                       Container(
//                         margin: EdgeInsets.only(left: 10,top: 10,right: 10),
//                         child: Row(
//                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                           children: [
//                             Text(
//
//                                   "Date: ",
//                               style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold),
//                             ),
//
//                             Container(
//                               child: Text(
//                                 widget.dataListSM != null
//                                     ? " ${widget.dataListSM[0].date.toString().replaceAll("00:00:00.000", "")??""}"
//                                     : widget.aaData != null
//                                         ? " ${widget.aaData.date.toString().replaceAll("00:00:00.000", "")}"
//                                         : " ",
//                                 style: TextStyle(fontSize: 15),
//                               ),
//                             ),
//                           ],
//                         ),
//                       ),
//
//                       Container(
//                         margin: EdgeInsets.only(left: 10,top: 10,right: 10),
//                         child: Row(
//                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                           children: [
//                             Text(
//
//                                    "Amount Paid: ",
//                               style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold),
//                             ),
//                             Container(
//                               child: Text(
//                                 widget.dataListSM != null
//                                     ? "${widget.dataListSM[0].total??""} GBP"
//                                     : widget.aaData != null
//                                         ? " ${widget.aaData.total} GBP"
//                                         : " ",
//                                 style: TextStyle(fontSize: 15),
//                               ),
//                             ),
//                           ],
//                         ),
//                       ),
//
//                       Container(
//                         margin: EdgeInsets.only(left: 10,top: 10,right: 10,bottom: 10),
//                         child: Row(
//                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                           children: [
//                             Container(
//                               child: Text(
//                                 "Status: New",
//                                 style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold),
//                               ),
//                             ),
//                           ],
//                         ),
//                       ),
//                       Container(
//                         margin: EdgeInsets.only(bottom: 8),
//                         child: InkWell(
//                           onTap: () {
//                             checkIn(widget.bookingUid, DateTime.now().toString(), "1",
//                                 widget.fromDetails, context);
//                           },
//                           child: Container(
//                             decoration: BoxDecoration(
//                               borderRadius: BorderRadius.all(Radius.circular(8)),
//                               gradient: LinearGradient(colors: [
//                                 Colors.black,
//                                 Colors.black,
//                                 Colors.black
//                               ], begin: Alignment.topCenter, end: Alignment.bottomCenter),
//                             ),
//                             padding: EdgeInsets.fromLTRB(125, 5, 125, 5),
//                             child: Text(
//                               "Check In",
//                               style: TextStyle(
//                                 fontSize: 20,
//                                 color: Colors.white,fontWeight: FontWeight.bold
//                               ),
//                             ),
//                           ),
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
