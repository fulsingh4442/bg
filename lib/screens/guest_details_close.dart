// import 'package:bookings/models/Table_Response_model.dart';
// import 'package:bookings/models/details_response_model.dart';
// import 'package:bookings/models/single_item_response_model.dart';
// import 'package:bookings/screens/scan_qr.dart';
// import 'package:flutter/material.dart';
//
// class GuestDetailsClose extends StatefulWidget {
//   String bookingUid;
//   String total;
//   String guestname;
//   AaDatum aaData;
//   List<AaDatumSM> aaDataListSM;
//
//   GuestDetailsClose(
//     this.bookingUid,
//     this.total, {
//     this.aaDataListSM,
//     this.aaData,
//     this.guestname, ListSM,  AaDatumSM,
//   });
//
//   @override
//   _GuestDetailsCloseState createState() => _GuestDetailsCloseState();
// }
//
// class _GuestDetailsCloseState extends State<GuestDetailsClose> {
//   // int _index = 0;
//
//   // @override
//   // void initState() {
//   //   // TODO: implement initState
//   //   super.initState();
//   //   for (var each in widget.aaDataList) {
//   //     print("-------_index------  $_index");
//   //     if (widget.bookingUid == each.bookingUid) {
//   //       break;
//   //     }
//   //     _index += 1;
//   //   }
//   // }
//
//   @override
//   void initState() {
//     // TODO: implement initState
//     super.initState();
//
//     // widget.aaDataListSM != null
//     //     ? print("Checked In Time aadata: ${widget.aaDataListSM[0].arrivedAt}")
//     //     : widget.eventData.length > 0
//     //         ? print(
//     //             "Checked In Time eventdata: ${widget.eventData[0].arrivedAt}")
//     //         : print("Checked In Time: ");
//   }
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
//
//
//
//         body: SafeArea(
//           child: Column(
//             children: [
//
//
//               Container(
//                 margin: EdgeInsets.fromLTRB(5, 5, 5, 5),
//                 child: Card(
//                   elevation: 5,
//                   shape: RoundedRectangleBorder(
//                     borderRadius: BorderRadius.circular(10),
//                   ),
//                   child: Column(
//                     children: [
//                       Center(
//                         child: Container(
//                           child: Text(
//                             widget.aaDataListSM != null
//                                 ? (widget.aaDataListSM[0].firstName ?? "") +
//                                     (widget.aaDataListSM[0].lastName ?? "")
//                                 : widget.guestname,
//                             style: TextStyle(
//                               fontSize: 16,
//                               fontWeight: FontWeight.bold,
//                             ),
//                           ),
//                         ),
//                       ),
//                       Container(
//                         margin: EdgeInsets.only(left: 10,top: 10,right: 10),
//                         child: Row(
//                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//
//                           children: [
//
//                             Text(
//                               "Booking ID: ",
//                               style: TextStyle(fontSize: 15),
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
//
//                             Text(
//
//                                   "Number of Tickets: ",
//                               style: TextStyle(fontSize: 15),
//                             ),
//                             Container(
//                               child: Text(
//                                 widget.aaDataListSM != null
//                                     ? " ${widget.aaDataListSM[0].quantity??""}"
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
//
//                             Text(
//
//                                    "Event Name: ",
//                               style: TextStyle(fontSize: 15),
//                             ),
//                             Container(
//                               child: Text(
//                                 widget.aaDataListSM != null
//                                     ? widget.aaDataListSM[0].events.isEmpty
//                                         ? " "
//                                         : "Event Name: ${widget.aaDataListSM[0].events[0].name}"
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
//
//                             Text(
//
//                                    "Date: ",
//                               style: TextStyle(fontSize: 15),
//                             ),
//                             Container(
//                               child: Text(
//                                 widget.aaDataListSM != null
//                                     ? " ${widget.aaDataListSM[0].date.toString().replaceAll("00:00:00.000", "")??""}"
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
//                               style: TextStyle(fontSize: 15),
//                             ),
//                             Container(
//                               child: Text(
//                                 widget.aaDataListSM != null
//                                     ? "${widget.aaDataListSM[0].total??""} GBP"
//                                     : widget.aaData != null
//                                         ? " ${widget.aaData.total} GBP"
//                                         : "",
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
//                           children: [
//                             Container(
//
//                               child: Text(
//                                 "Status: Already Checked In",
//                                 style: TextStyle(fontSize: 15),
//                               ),
//                             ),
//
//
//                           ],
//                         ),
//                       ),
//                       SizedBox(
//                         height: 10,
//                       ),
//                       // Row(
//                       //   children: [
//                       //     Container(
//                       //       child: Text(
//                       //         widget.aaDataListSM != null
//                       //             ? "Checked In Time: ${widget.aaDataListSM[0].arrivedAt??""}"
//                       //             : widget.aaData != null
//                       //                 ? "Checked In Time: ${widget.aaData.arrivedAt}"
//                       //                 : "Checked In Time: ",
//                       //         style: TextStyle(fontSize: 15),
//                       //       ),
//                       //     ),
//                       //   ],
//                       // ),
//                     ],
//                   ),
//                 ),
//               ),
//               InkWell(
//                 onTap: () {
//                   Navigator.of(context).pushAndRemoveUntil(
//                       MaterialPageRoute(builder: (context) => ScanQrScreen()),
//                       (Route<dynamic> route) => false);
//                 },
//                 child: Container(
//                   decoration: BoxDecoration(
//                     color: Colors.amber,
//                     borderRadius: BorderRadius.all(Radius.circular(8)),
//                     gradient: LinearGradient(colors: [
//                       Colors.black,
//                       Colors.black,
//                       Colors.black
//                     ], begin: Alignment.topCenter, end: Alignment.bottomCenter),
//                   ),
//                   padding: EdgeInsets.fromLTRB(145, 8, 145, 8),
//                   child: Text(
//                     "Close",
//                     style: TextStyle(
//                       fontSize: 20,
//                       color: Colors.white,
//                     ),
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
