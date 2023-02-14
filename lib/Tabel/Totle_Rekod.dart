import 'dart:convert';
import 'package:bookings/Home1.dart';
import 'package:bookings/Login.dart';
import 'package:bookings/screens/ClubApp.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart'as http;
import 'package:intl/intl.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:shared_preferences/shared_preferences.dart';


import '../models/Responses_Totle.dart';
class Totle_Rekod extends StatefulWidget {
  @override
  State<Totle_Rekod> createState() => _Totle_RekodState();
}
class _Totle_RekodState extends State<Totle_Rekod> {
  var checked = 0;
  SharedPreferences Response;
  String token;
  String selectedDate;
  Future _bookingreport;




  void initial() async {
    Response = await SharedPreferences.getInstance();
    token =Response.getString('token').toString();
  }
  Future<ResponsesTotle> bookingreport(String bookingDate,)async {
    Response = await SharedPreferences.getInstance();
    token = Response.getString('token').toString();
    print( 'calling scandata with url ---> https://lizard.reserveyourvenue.com/api/booking/report' +
        bookingDate);
    var requestBody = {
      "booking_date": bookingDate,
    };
    print(requestBody);
    debugPrint('Calling post add ons api ${ ClubApp.booking_report }');
    final   responce = await http.post(
        Uri.parse(ClubApp.booking_report),
        headers: <String, String>{
          //'Content-Type': 'application/json; charset=UTF-8',
          'token':token
        },
        body: requestBody
    );
    var data = jsonDecode(responce.body.toString());
    var status = data["status"];
    var login = data["login"];
    if (responce.statusCode == 200) {
      print(responce.body);
      // print(data);
      print(token);
      if (status == true) {
        return ResponsesTotle.fromJson(data);
      } else {
        if(login == false){
          SharedPreferences prefs = await SharedPreferences.getInstance();
          prefs.clear();
          Navigator.pushReplacement(context,
              MaterialPageRoute(builder: (BuildContext ctx) => Login()));
        }else{
          return ResponsesTotle.fromJson(data);
        }
      }
    } else {
      return ResponsesTotle.fromJson(data);
    }
  }
  ResponsesTotle responsesTotle;


  // Future booking;
  DateTime _selectedDate;
  String _formatted;
  int Percent;
 // bool viaTextField = false;
  TextEditingController _textEditingController1 = TextEditingController();
  getDetails(String currentDate) {
    print("inside get details");
    setState(() {
      _bookingreport =  bookingreport(currentDate).then((value) {
        responsesTotle = value;
      });
    });
  }


  @override
  void initState() {
    super.initState();
    if (_textEditingController1.text.isEmpty) {
      final DateFormat _formatter = DateFormat('yyyy-MM-dd');
      _textEditingController1.text = _formatter.format(DateTime.now());
      _formatted =
          _formatter.format(DateTime.parse(_textEditingController1.text));
      print("formatted ---- $_formatted");
      getDetails(_formatted);
      selectedDate = _formatted;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
     // backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        leading: InkWell(
            onTap: () {
              Navigator.of(context).pushAndRemoveUntil(
                  MaterialPageRoute(builder: (context) => home()),
                      (Route<dynamic> route) => false);
            },
            child: Icon(Icons.arrow_back)),
        title: Center(
          child: Container(
              margin: EdgeInsets.only(right: 50),
              height: 40,
              //width: 40,
              child: Image.asset('assets/images/GM.png',color: Colors.white )),
        ),
      ),
      body: Container(
        child:
        Column(children: [
          Container(
            margin: EdgeInsets.only(left: 10,right: 10,top: 0),
            child:  Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                    //margin: EdgeInsets.only(top: 5),
                    child: Text("Report",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),)
                ),
                Container(
                  width: MediaQuery.of(context).size.width * 0.40,
                  height: MediaQuery.of(context).size.height * 0.06,
                  margin: EdgeInsets.only(top: 10,left: 0),
                  child: TextField(
                    focusNode: AlwaysDisabledFocusNode(),
                    textAlign: TextAlign.center,
                    controller: _textEditingController1,
                    onTap: () {
                      //responseTotle.data. aaData.date;
                      selectedDate = _selectDate(context);
                      bookingreport(selectedDate);
                     },
                    decoration: InputDecoration(
                       contentPadding: const EdgeInsets.only(bottom: 10), isDense: true,
                      fillColor: Colors.white,
                      focusedBorder: OutlineInputBorder(
                        borderSide:
                        const BorderSide(color: Colors.white, width: 0.5),
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide:
                        const BorderSide(color: Colors.white, width: 0.5),
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                    ),
                  ),
                ),
                InkWell(
                      onTap: () {
                        _selectDate(context);
                      },
                  child: Container(
                      margin: EdgeInsets.only(right: 15),
                      height: 30,width: 30,
                      child: Image.asset('assets/images/fgfg.jpg' )),
                ),
              ],
            ),
          ),
          Divider(color: Colors.grey,),

          FutureBuilder(
              future: _bookingreport,
              builder: (context, snapshot) {
                  return
                         ListView.builder(
                        shrinkWrap: true,
                        scrollDirection: Axis.vertical,
                        itemCount: 1,
                        itemBuilder: (context, index) {
                          return GestureDetector(
                            child:
                            Container(
                              margin: EdgeInsets.only(left: 13, right: 20),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment
                                    .spaceBetween,
                                children: [
                                  Column(
                                    children: [
                                      Text("Total Sold", style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 15,
                                          fontWeight: FontWeight.bold),),
                                      //Text("100",style: TextStyle(color: Colors.black,fontSize: 15,),),
                                      Text("${responsesTotle.data.aaData.total
                                          .sold}", style: TextStyle(
                                        color: Colors.black, fontSize: 15,),),
                                    ],
                                  ),
                                  Column(
                                    children: [
                                      Text("Total Check-ins", style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 15,
                                          fontWeight: FontWeight.bold),),
                                      Text("${responsesTotle.data.aaData.total
                                          .checkedin}", style: TextStyle(
                                        color: Colors.black, fontSize: 15,),)
                                      //Text("0",style: TextStyle(color: Colors.black,fontSize: 15,)),
                                    ],
                                  ),
                                ],
                              ),

                            ),



                            //Divider(color: Colors.grey,),

                          );

                        }




                  );

              }),
          // Container(
          //   margin: EdgeInsets.only(left: 13,right: 20),
          //   child: Row(
          //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //     children: [
          //       Column(
          //         children: [
          //           Text("Total Sold",style: TextStyle(color: Colors.black,fontSize: 15,fontWeight: FontWeight.bold),),
          //           //Text("100",style: TextStyle(color: Colors.black,fontSize: 15,),),
          //           Text("$sold",style: TextStyle(color: Colors.black,fontSize: 15,),),
          //         ],
          //       ),
          //       Column(
          //         children: [
          //           Text("Total Check-ins",style: TextStyle(color: Colors.black,fontSize: 15,fontWeight: FontWeight.bold),),
          //          // Text("${responsesTotle.data.aaData.total.checkedin}",style: TextStyle(color: Colors.black,fontSize: 15,),)
          //            Text("0",style: TextStyle(color: Colors.black,fontSize: 15,)),
          //         ],
          //       ),
          //     ],
          //   ),
          //
          // ),
          //

          Divider(color: Colors.grey,),

           FutureBuilder(
                  future: _bookingreport,
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      return Container(
                        alignment: Alignment.center,
                        height: 50,
                          width: 50,
                          child: CircularProgressIndicator());
                    } else {
                      return Container(
                        margin: EdgeInsets.only(top: 0),
                        width: MediaQuery.of(context).size.width * 1.0,
                        height: MediaQuery.of(context).size.height * 0.67,
                        child: responsesTotle.data.iTotalRecords == 1
                            ? Container(
                            margin: EdgeInsets.only(left: 20),
                            child: Center(child: Text("Bookings are not found!")))
                            : ListView.builder(
                            shrinkWrap: true,
                            scrollDirection: Axis.vertical,
                            itemCount: responsesTotle.data.aaData.events.length,
                            itemBuilder: (context, index) {

                              final solds = responsesTotle.data.aaData.total.sold;
                              final checkedins = responsesTotle.data.aaData.total.checkedin;



                              /*Table*/
                              final t_booked = int.parse(responsesTotle.data.aaData.table.booked);
                              final t_total = int.parse(responsesTotle.data.aaData.table.total);
                              var t_percent = (t_booked * 100 / t_total).toInt();
                              var t_percet_rat = (t_booked / t_total);
                              /*event*/
                              // var e_checkedId = '${responseTotle.data.aaData.events[index].checkedId}';
                              // var e_bookedTicket = '${responseTotle.data.aaData.events[index].bookedTicket}';
                              // var e_percent = (e_bookedTicket / e_checkedId * 100).toInt();
                              // var e_percet_rat = (e_checkedId / e_bookedTicket);
                            //  var checkedId = 0;
                              // if (e_checkedId.isNaN == null ) {
                              //   (checkedId = 0);
                              //   // something like this
                              // }

                             // var checkedId = 0;
                             //  if(e_checkedId == 0 || e_checkedId == 'null' || e_checkedId == '' ){
                             //    checkedId = 0;
                             //  }
                             //  if(isEmpty(e_checkedId) || e_checkedId == 'null' || e_checkedId == ''){
                             //    e_checkedId = 0;
                             //  }
                              var e_checkedId = (responsesTotle.data.aaData.events[index].checkedId);
                             var e_bookedTicket =  (responsesTotle.data.aaData.events[index].bookedTicket);
                             var e_percent = (e_checkedId * 100 / e_bookedTicket).floorToDouble();
                             var e_percet_rat = (e_checkedId / e_bookedTicket);

                              return GestureDetector(
                                child:
                                   Container(
                                    child: Column(
                                      children: [
                                    if(responsesTotle.data.aaData.table.booked == 00)...{
                                     // Container(height: 0,)
                                      }else...{
                                      Container(
                                        // margin: EdgeInsets.only(left: 10,right: 10),
                                        height: 30,
                                        width: double.infinity,
                                        color: Colors.grey,
                                        child:
                                        Column(
                                          children: [
                                            Container(
                                              child: Container(
                                                  alignment: Alignment.topLeft,
                                                  padding: EdgeInsets.only(
                                                      top: 5, left: 10),
                                                  child: Text("Booking Table",
                                                    style: TextStyle(
                                                        fontSize: 15,
                                                        fontWeight: FontWeight
                                                            .bold),)),),
                                          ],
                                        ),),
                                      Container(
                                        margin: EdgeInsets.only(
                                            top: 15, left: 15),
                                        child: Row(
                                          children: [
                                            CircularPercentIndicator(
                                                radius: 30.0,
                                                lineWidth: 5.0,
                                                percent: t_percet_rat,
                                                center: new Text("$t_percent%",
                                                  style: TextStyle(color: Colors
                                                      .black),),
                                                progressColor: Colors.black
                                            ),
                                            Column(
                                              children: [
                                                Container(
                                                    margin: EdgeInsets.only(
                                                        left: 30),
                                                    child: Text("Booking Table",
                                                      style: TextStyle(
                                                          color: Colors.black,
                                                          fontSize: 15,
                                                          fontWeight: FontWeight
                                                              .bold),)),
                                                Row(
                                                  children: [
                                                    Container(
                                                        margin: EdgeInsets.only(
                                                            left: 20),
                                                        child: Text(
                                                          "${responsesTotle.data
                                                              .aaData.table
                                                              .booked}/",
                                                          style: TextStyle(
                                                            color: Colors.black,
                                                            fontSize: 15,),)),
                                                    Text("${responsesTotle.data
                                                        .aaData.table.total}",
                                                      style: TextStyle(
                                                        color: Colors.black,
                                                        fontSize: 15,),)
                                                  ],
                                                )
                                              ],
                                            )
                                          ],
                                        ),
                                      ),
                                      Container(
                                        margin: EdgeInsets.only(
                                            top: 10, left: 20),
                                        child: Column(
                                          children: [
                                            Container(
                                                margin: EdgeInsets.only(
                                                  top: 10,),
                                                alignment: Alignment.topLeft,
                                                child: Text("Total Check-ins",
                                                  style: TextStyle(color: Colors
                                                      .black,
                                                      fontSize: 15,
                                                      fontWeight: FontWeight
                                                          .bold),)),
                                            Container(
                                                alignment: Alignment.topLeft,
                                                margin: EdgeInsets.only(
                                                    top: 10, left: 30),

                                                child: Text("${responsesTotle
                                                    .data.aaData.table
                                                    .checkedId}",
                                                  style: TextStyle(color: Colors
                                                      .black,
                                                      fontSize: 20,
                                                      fontWeight: FontWeight
                                                          .bold),)),
                                          ],
                                        ),
                                      ),
                                    },
                                        // Divider(color: Colors.grey,),

                                        // SizedBox(height: 10,),
                                        // Container(
                                        //   // margin: EdgeInsets.only(left: 10,right: 10),
                                        //   height: 30,
                                        //   width: double.infinity,
                                        //   color: Colors.grey,
                                        //   child:
                                        //   Column(
                                        //     children: [
                                        //       Container(
                                        //         child: Container(
                                        //             alignment: Alignment.topLeft,
                                        //             padding: EdgeInsets.only(top: 5,left: 10),
                                        //             child: Text("Booking Event",style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold),)),),
                                        //       // Divider(color: Colors.grey,),
                                        //     ],
                                        //   ),),
                                        // SizedBox(height: 10,),
                                        // Container(
                                        //   width: 350,
                                        //     alignment: Alignment.topLeft,
                                        //     margin: EdgeInsets.only(left: 15),
                                        //     child: Text("${responsesTotle.data.aaData.events[index].event}",
                                        //       style: TextStyle(color: Colors.black,fontSize: 15,fontWeight: FontWeight.bold),)),
                                        //
                                        // Container(
                                        //   margin: EdgeInsets.only(top: 15,left: 15),
                                        //   child: Row(
                                        //     children: [
                                        //       CircularPercentIndicator(
                                        //         radius: 30.0,
                                        //         lineWidth: 5.0,
                                        //         percent: e_percet_rat,
                                        //         animation: true,
                                        //         backgroundColor: Colors.grey,
                                        //        //progressColor: Colors.grey,
                                        //         center:
                                        //         Container(
                                        //           margin: EdgeInsets.only(top: 23),
                                        //           child: Column(
                                        //             children: [
                                        //
                                        //         //   if(e_percent == null || e_percent == 'null' || e_percent == '' )...{
                                        //         //      //  perent = 0,
                                        //         //     Text("$percent%",style: TextStyle(color: Colors.black),),
                                        //         // }else...{
                                        //         //     Text("$e_percent%",style: TextStyle(color: .Colorsblack),),
                                        //         //
                                        //         //   }
                                        //               if(e_checkedId == 0)...{
                                        //                 Text('$checked %',style: TextStyle(color: Colors.black))
                                        //               }else...{
                                        //                  Text("$e_percent%",style: TextStyle(color: Colors.black),),
                                        //               }
                                        //             ],
                                        //           ),
                                        //         ),
                                        //         progressColor: Colors.black,
                                        //
                                        //       ),
                                        //       Column(
                                        //         children: [
                                        //           Container(
                                        //               margin: EdgeInsets.only(left: 30),
                                        //               child: Text("Booking Event",style: TextStyle(color: Colors.black,fontSize: 15,fontWeight: FontWeight.bold),)),
                                        //           Row(
                                        //             children: [
                                        //               Container(
                                        //                   margin: EdgeInsets.only(left: 20),
                                        //                   child: Text("${responsesTotle.data.aaData.events[index].checkedId}/",style: TextStyle(color: Colors.black,fontSize: 15,),)),
                                        //               Text("${responsesTotle.data.aaData.events[index].bookedTicket}",style: TextStyle(color: Colors.black,fontSize: 15,),)
                                        //             ],
                                        //           )
                                        //         ],
                                        //       )
                                        //     ],
                                        //   ),
                                        // ),
                                        // Container(
                                        //   margin: EdgeInsets.only(top: 10,left: 20),
                                        //   child: Column(
                                        //     children: [
                                        //       Container(
                                        //           margin: EdgeInsets.only(top: 10,),
                                        //           alignment: Alignment.topLeft,
                                        //           child: Text("Total Check-ins",style: TextStyle(color: Colors.black,fontSize: 15,fontWeight: FontWeight.bold),)),
                                        //       Container(
                                        //           alignment: Alignment.topLeft,
                                        //           margin: EdgeInsets.only(top: 10,left: 30),
                                        //           child: Text("${responsesTotle.data.aaData.events[index].checkedId}",style: TextStyle(color: Colors.black,fontSize: 20,fontWeight: FontWeight.bold),)),
                                        //     ],
                                        //   ),
                                        // ),
                                      //  Divider(color: Colors.grey,),
                                      ],
                                    ),
                                  ),
                              );
                            }),
                      );
                    }
                  }),
        ],
        ),
      ),
    );
  }
  _selectDate(BuildContext context) async {
    DateTime newSelectedDate = await showDatePicker(
        context: context,
        initialDate: _selectedDate != null ? _selectedDate : DateTime.now(),
        firstDate: DateTime(2000),
        lastDate: DateTime(2040),
        builder: (BuildContext context, Widget child) {
          return Theme(
            data: ThemeData.dark().copyWith(
              colorScheme: ColorScheme.dark(
                primary: Colors.blue.shade900,
                onPrimary: Colors.white,
                surface: Colors.blue.shade900,
                onSurface: Colors.white,
              ),
              dialogBackgroundColor: Colors.blue[500],
            ),
            child: child,
          );
        });
    if (newSelectedDate != null) {
      _selectedDate = newSelectedDate;
      final DateFormat formatter = DateFormat('yyyy-MM-dd');
      final String formatted = formatter.format(_selectedDate);
      _textEditingController1
        ..text = formatted
        ..selection = TextSelection.fromPosition(TextPosition(
            offset: _textEditingController1.text.length,
            affinity: TextAffinity.upstream));
      print(formatted);
      getDetails(formatted);
    }
  }
  //getEventDetails(String currentDate) {}
}
class AlwaysDisabledFocusNode extends FocusNode {
  @override
  bool get hasFocus => false;
}


