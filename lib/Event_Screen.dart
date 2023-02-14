
import 'dart:convert';
import 'package:bookings/Login.dart';
import 'package:bookings/models/Event_Response_model.dart';
import 'package:bookings/models/Guest_Checj_Response.dart';
import 'package:bookings/screens/ClubApp.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:group_radio_button/group_radio_button.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'models/Event_Responses_Model.dart';
class Event_Screen extends StatefulWidget {
  const Event_Screen({Key key}) : super(key: key);

  @override
  _Event_ScreenState createState() => _Event_ScreenState();
}
class _Event_ScreenState extends State<Event_Screen> {

  GlobalKey<ScaffoldState> _scaffoldKey;
  @override
  void dispose() {
    _scaffoldKey?.currentState?.dispose();
    super.dispose();
  }
  bool viaTextField = false;
  TextEditingController textEditingController1 = TextEditingController();
  _printLatestValue() {
    print("text field: ${textEditingController1.text}");
  }
  Future<List> fetchSimpleData() async {
    await Future.delayed(Duration(milliseconds: 2000));
    List eventResponseModel = <dynamic>[];
    return eventResponseModel;
  }
  String searchType = '';
  bool _isVisible = false;
  bool isLoading = false;
  Future _getDetails;
  void hideWidget() {
    setState(() {
      _isVisible = !_isVisible;
    });
  }
  EventResponsesModel eventResponsesModel;
  GuestChecjResponse guestChecjResponse;
  DateTime _selectedDate;
  String _formatted;
  TextEditingController _textEditingController = TextEditingController();
  getDetails(String currentDate) {
    setState(() {
      _getDetails = booking(currentDate,'','').then((value) {
        eventResponsesModel = value;
      });
    });
  }
  checkInBooking(String bookingId,bookingDate,ticketId,bookingType){
    setState(() {
      _booking(bookingId,bookingDate,ticketId,bookingType).then((value) {
        print(value.status);
        if(value.status == true){
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text(ClubApp.Check_in_successfully),
          ));
          print('Ashu2');
          getDetails(bookingDate);
        }else{
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text(value.message.toString()),
          ));
        }
      });
    });
  }
  @override
  void initState() {
    super.initState();
    if (_textEditingController.text.isEmpty) {
      final DateFormat _formatter = DateFormat('yyyy-MM-dd');
      _textEditingController.text = _formatter.format(DateTime.now());
      _formatted =
          _formatter.format(DateTime.parse(_textEditingController.text));
      print("formatted$_formatted");
      getDetails(_formatted);
      selectedDate = _formatted;
    }
    initial();
    eventResponsesModel;

    _scaffoldKey = GlobalKey();
   // textEditingController.addListener(_printLatestValue);
  }
  SharedPreferences Response;
  String token;
  String selectedDate;


  void initial() async {
    Response = await SharedPreferences.getInstance();
    token = Response.getString('token').toString();
  }

  Future<EventResponsesModel> booking(String booking_date,search_type,keyword)async {
    print('Process STart...');

    Response = await SharedPreferences.getInstance();
    token = Response.getString('token').toString();
    var requestBody = {
      "booking_date": booking_date,
      'booking_type': "event",
      'search_type': search_type,
      'keyword' : keyword,
    };
  //https://app-api.teaseme.co.in
    debugPrint('Calling post add ons api ${ ClubApp.booking}');
    http.Response responce = await http.post(
      Uri.parse(ClubApp.booking),
      headers: <String, String>{
        //'Content-Type': 'application/json; charset=UTF-8',
        'token':token
      },
        body: requestBody
    );
    var data = jsonDecode(responce.body.toString());
    print('Test by Developer');
    var status = data["status"];
    var login = data["login"];
    if (responce.statusCode == 200) {
      print(data);
      if (status == true) {
        return EventResponsesModel.fromJson(data);
      } else {
        if(login == false){
          SharedPreferences prefs = await SharedPreferences.getInstance();
          prefs.clear();
          Navigator.pushReplacement(context,
              MaterialPageRoute(builder: (BuildContext ctx) => Login()));
        }else{
          return EventResponsesModel.fromJson(data);
        }
      }
    } else {
      return EventResponsesModel.fromJson(data);
    }
  }
  Future<GuestChecjResponse> _booking(String booking_id,booking_date,event_ticket_id,booking_type)async {
    var requestBody = {
      'booking_id': booking_id,
      'booking_type': booking_type,
      'booking_date': booking_date,
      "event_ticket_id":event_ticket_id
    };
    Response = await SharedPreferences.getInstance();
    token = Response.getString('token').toString();
    debugPrint('Calling post add ons api ${ ClubApp.booking_checkin}');
    http.Response responce = await http.post(
      Uri.parse(ClubApp.booking_checkin),
      headers: <String, String>{
        //'Content-Type': 'application/json; charset=UTF-8',
        'token':token
      },
        body: requestBody
    );
   // print(requestBody);
    print(guestChecjResponse);
    var data = jsonDecode(responce.body.toString());
    var status = data["status"];
    var login = data["login"];
    if (responce.statusCode == 200) {
      if (status == true) {
        return GuestChecjResponse.fromJson(data);
      } else {
        if(login == false){
          SharedPreferences prefs = await SharedPreferences.getInstance();
          prefs.clear();
          Navigator.pushReplacement(context,
              MaterialPageRoute(builder: (BuildContext ctx) => Login()));
        }else{
          return GuestChecjResponse.fromJson(data);
        }
      }
    } else {
      return GuestChecjResponse.fromJson(data);
    }
  }

  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        backgroundColor: Colors.black,
        leading: InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: Icon(Icons.arrow_back)),
        title: Center(
          child: Container(
              margin: EdgeInsets.only(right: 55),
              height: 45,
              //width: 45,

              child: Image.asset('assets/images/GM.png',color: Colors.white, )),
        ),
      ),
      backgroundColor: Colors.white,
      body: SafeArea(
          child: Container(
            margin: EdgeInsets.only(left: 0,right: 0),
            child: Column(

              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                        margin: EdgeInsets.only(right: 15,top: 10),
                        child: Text(ClubApp.Event_Booking,style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold),)
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width * 0.45,
                      height: MediaQuery.of(context).size.height * 0.07,
                      margin: EdgeInsets.only(top: 5,left: 0),
                      child: TextField(
                        focusNode: AlwaysDisabledFocusNode(),
                        controller: _textEditingController,
                        onTap: () {
                          getDetails( eventResponsesModel.data.aaData[0].date);
                        },
                        decoration: InputDecoration(
                          suffixIcon: InkWell(
                                     onTap: () {
                                       setState(() {
                                          _isVisible = false;
                                          textEditingController1.clear();
                                       });
                                       _selectDate(context);
                                     },
                              child: Icon(Icons.calendar_month_outlined,color: Colors.black,size: 30,)),

                          fillColor: Colors.white,
                          focusedBorder: OutlineInputBorder(
                            borderSide:
                            const BorderSide(color: Colors.black, width: 0.5),
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide:
                            const BorderSide(color: Colors.black, width: 0.5),
                            borderRadius: BorderRadius.circular(10.0),

                          ),
                        ),
                      ),
                    ),
                         InkWell(
                           onTap: () {
                             setState(() {
                               textEditingController1.clear();
                               hideWidget();
                              // _isVisible = true;
                             });
                           },
                            child: Container(
                          margin: EdgeInsets.only(left: 20,top: 5,),
                          height: 30,width: 30,
                          child: Image.asset('assets/images/img_15.png', )),
                    ),
                  ],
                ),
                Divider(color: Colors.grey,),
                Visibility(
                  visible: _isVisible,
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 15),
                        child: Container(
                            alignment: Alignment.centerLeft,
                            margin: EdgeInsets.only(left: 0),
                            child: Text(ClubApp.Filterby,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15),)),
                      ),
                      Stack(
                        children: [
                          RadioButton(
                            description: ClubApp.BookingID,
                            value: "booking_uid",
                            groupValue: searchType,
                            onChanged: (value) =>
                                     setState(
                                  () => searchType = value.toString(),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(left: 150),
                            child: RadioButton(

                              description: ClubApp.Name,
                              value: "guest_name",
                              groupValue: searchType,
                              onChanged: (value) => setState(
                                    () => searchType = value.toString(),
                              ),
                            ),
                          ),

                          Container(
                            margin: EdgeInsets.only(left: 260),
                            child: RadioButton(
                              description: ClubApp.Email,
                              value: "email",
                              groupValue: searchType,
                              onChanged: (value) => setState(
                                    () => searchType = value.toString(),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 8,right: 8),
                        child: Form(
                          key: _formKey,
                          child: Container(
                            width: MediaQuery.of(context).size.width * 0.90,
                            height: MediaQuery.of(context).size.height * 0.07,
                            margin: EdgeInsets.only(top: 0),
                            child: TextFormField(
                              controller: textEditingController1,
                              style: TextStyle(color: Colors.black),
                              decoration: InputDecoration(
                                suffixIcon: Container(
                                  child: InkWell(
                                    onTap: () {
                                      setState(() {
                                        _getDetails = booking(selectedDate, searchType, textEditingController1.text).then((value) {
                                          eventResponsesModel = value;
                                        });
                                       //hideWidget();
                                      });
                                    },
                                    child: new Icon(
                                      Icons.search,size: 40,
                                      color: Colors.black,
                                    ),
                                  ),
                                ),

                                labelText: ClubApp.SearchKeyword,labelStyle: TextStyle(color: Colors.grey,),
                                contentPadding: EdgeInsets.only(top: 15,left: 15),
                                hintText: ClubApp.Entervalue,suffixStyle: TextStyle(fontWeight: FontWeight.bold,),

                                fillColor: Colors.black,
                                focusedBorder: OutlineInputBorder(
                                  borderSide: const BorderSide(
                                      color: Colors.black, width: 0.5),
                                  borderRadius: BorderRadius.circular(0.0),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderSide: const BorderSide(
                                      color: Colors.black, width: 0.5),
                                  borderRadius: BorderRadius.circular(5),
                                ),
                              ),
                              validator: (value){
                                if(value.isEmpty){
                                  return "cannot be empty";
                                }
                                return null;
                              },
                              autofocus: false,
                            ),
                          ),
                        ),
                      ),
                      Divider(color: Colors.grey,),
                    ],
                  ),
                ),
                SizedBox(height: 0,),
                Expanded(
                child: FutureBuilder(
                    future: _getDetails,
                    builder: (context, snapshot) {
                      print('test123');
                      if (snapshot.hasData) {
                        return Center(child: CircularProgressIndicator());
                      } else {
                        return Container(
                            margin: EdgeInsets.only(top: 0),
                      width: MediaQuery.of(context).size.width * 1.0,
                      height: MediaQuery.of(context).size.height * 0.72,
                      child: eventResponsesModel.data.iTotalRecords == 0
                      ? Container(
                      margin: EdgeInsets.only(left: 20),
                      child: Center(child: Text(ClubApp.NoDataFound,style: TextStyle(color: Colors.black),)))
                         : RefreshIndicator(
                           child: ListView.builder(
                            shrinkWrap: true,
                            scrollDirection: Axis.vertical,
                                  itemCount: eventResponsesModel.data.aaData.length,
                                   itemBuilder: (context, index){
                                return GestureDetector(child:
                                  Column(
                                    children: [
                                      Container(
                                        margin: EdgeInsets.fromLTRB(5, 5, 5, 5),
                                        child: Card(
                                          elevation: 5,
                                          shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(
                                                10),
                                          ),
                                          child: Column(
                                            children: [
                                              Container(
                                                margin: EdgeInsets.only(
                                                    left: 10, top: 10, right: 0),
                                                child: Row(
                                                  mainAxisAlignment: MainAxisAlignment
                                                      .spaceBetween,
                                                  children: [
                                                    Text(
                                                      ClubApp.BookingID,
                                                      style: TextStyle(
                                                          fontSize: 15,
                                                          fontWeight: FontWeight
                                                              .bold),
                                                    ),
                                                    Container(
                                                      margin: EdgeInsets.only(
                                                          right: 10),
                                                      child: Text(  "${eventResponsesModel.data.aaData[index].bookingUid}",
                                                        // "E1245",
                                                        style: TextStyle(
                                                            fontSize: 15),
                                                      ),
                                                    ),
                                                    Row(
                                                      children: [
                                                        Container(
                                                          child: Text(
                                                            ClubApp.Date,
                                                            // " ${widget.bookingUid}",
                                                            style: TextStyle(
                                                                fontSize: 15,
                                                                fontWeight: FontWeight
                                                                    .bold),
                                                          ),
                                                        ),
                                                        Container(
                                                          width: MediaQuery.of(context).size.width * 0.33,
                                                          height: MediaQuery.of(context).size.height * 0.02,
                                                          child: TextField(
                                                            focusNode: AlwaysDisabledFocusNode(),
                                                            controller: _textEditingController,
                                                            onTap: () {},
                                                            decoration: InputDecoration(
                                                              focusedBorder: OutlineInputBorder(
                                                                borderSide:
                                                                const BorderSide(color: Colors.white, width: 0.0),
                                                                borderRadius: BorderRadius.circular(0.0),
                                                              ),
                                                              enabledBorder: OutlineInputBorder(
                                                                borderSide:
                                                                const BorderSide(color: Colors.white, width: 0),
                                                                borderRadius: BorderRadius.circular(0.0),
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ],
                                                ),
                                              ),

                                              Container(
                                                margin: EdgeInsets.only(
                                                    left: 10, top: 10, right: 10),
                                                child: Row(
                                                  children: [
                                                    Text(
                                                      ClubApp.GuestName,
                                                      style: TextStyle(
                                                          fontSize: 15,
                                                          fontWeight: FontWeight
                                                              .bold),
                                                    ),
                                                    Container(
                                                      width: 230,
                                                      child: Text( "${eventResponsesModel.data.aaData[index].guest}",
                                                        style: TextStyle(
                                                            fontSize: 15),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),

                                              Container(
                                                margin: EdgeInsets.only(
                                                    left: 10, top: 10, right: 10,),
                                                child: Row(
                                                  children: [
                                                    Container(
                                                      //margin: EdgeInsets.only(bottom: 18),


                                                      child: Text(ClubApp.Event,
                                                        style: TextStyle(
                                                            fontSize: 15,
                                                            fontWeight: FontWeight
                                                                .bold),
                                                      ),
                                                    ),
                                                    Container(
                                                      width: 265,
                                                      child: Text( "${eventResponsesModel.data.aaData[index].name}",
                                                        style: TextStyle(
                                                            fontSize: 15),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              Container(
                                                margin: EdgeInsets.only(
                                                    left: 10, top: 10, right: 10),
                                                child: Row(
                                                  children: [
                                                    Text(
                                                      ClubApp.Paid_Amount,
                                                      style: TextStyle(
                                                          fontSize: 15,
                                                          fontWeight: FontWeight
                                                              .bold),
                                                    ),
                                                    Row(
                                                      children: [
                                                        Container(
                                                          child: Text( "${eventResponsesModel.data.aaData[index].paidAmount}",
                                                            style: TextStyle(
                                                                fontSize: 15),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ],
                                                ),
                                              ),

                                              Container(
                                                margin: EdgeInsets.only(
                                                    left: 10, top: 10, right: 10),
                                                child: Row(
                                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                  children: [
                                                    Row(
                                                      children: [
                                                        Text(
                                                          ClubApp.No_of_Tickets,
                                                          style: TextStyle(
                                                              fontSize: 15,
                                                              fontWeight: FontWeight
                                                                  .bold),
                                                        ),
                                                        Text(  "${eventResponsesModel.data.aaData[index].quantity}",
                                                          style: TextStyle(
                                                              fontSize: 15,
                                                              ),
                                                        ),
                                                      ],
                                                    ),

                                                    Row(
                                                      children: [
                                                        Container(
                                                          child: Row(
                                                            children: [
                                                              Container(
                                                              margin: EdgeInsets.only(right: 5),

                                                                child: Text(
                                                                  ClubApp.CheckedIN,
                                                                  style: TextStyle(
                                                                      fontSize: 15,fontWeight: FontWeight.bold),
                                                                ),
                                                              ),
                                                              Text( "${eventResponsesModel.data.aaData[index].checkinGuest}",
                                                                style: TextStyle(
                                                                    fontSize: 15),
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ],
                                                ),
                                              ),
                                             if(eventResponsesModel.data.aaData[index].addons.isEmpty ||eventResponsesModel.data.aaData[index].addons == null || eventResponsesModel.data.aaData[index].addons == 'null' || eventResponsesModel.data.aaData[index].addons == '')...{

                                              }else...{
                                               ListView.builder(
                                                 shrinkWrap: true,
                                                 scrollDirection: Axis.vertical,
                                                 itemCount: eventResponsesModel
                                                     .data.aaData[index].addons.length,

                                                 itemBuilder: (context, addon_key) {
                                                   return Container(
                                                     child:


                                                     Column(
                                                       children: [

                                                         Container(
                                                           margin: EdgeInsets
                                                               .only(top: 10,
                                                               left: 10,
                                                               right: 10),
                                                           child: Row(
                                                             mainAxisAlignment: MainAxisAlignment
                                                                 .spaceBetween,

                                                             children: [
                                                               Text(
                                                                 ClubApp.Packages,
                                                                 style: TextStyle(
                                                                     fontWeight: FontWeight
                                                                         .bold),),
                                                               Text(ClubApp.Rate,
                                                                 style: TextStyle(
                                                                     fontWeight: FontWeight
                                                                         .bold),),
                                                               Text(ClubApp.Total,
                                                                 style: TextStyle(
                                                                     fontWeight: FontWeight
                                                                         .bold),),

                                                             ],),
                                                         ),

                                                         Container(
                                                           margin: EdgeInsets
                                                               .only(top: 10,
                                                               left: 10,
                                                               right: 10),
                                                           child: Row(
                                                             mainAxisAlignment: MainAxisAlignment
                                                                 .spaceBetween,

                                                             children: [
                                                               Text(
                                                                   "   ${eventResponsesModel
                                                                       .data
                                                                       .aaData[index]
                                                                       .addons[addon_key].
                                                                       name}"),
                                                               Text(
                                                                   "   ${eventResponsesModel
                                                                       .data
                                                                       .aaData[index]
                                                                       .addons[addon_key]
                                                                       .rateQuantity}"
                                                                       ),
                                                               Text(
                                                                   "    ${eventResponsesModel
                                                                       .data
                                                                       .aaData[index]
                                                                       .addons[addon_key]
                                                                       .total}"
                                                                       ),

                                                             ],),
                                                         ),
                                                       ],
                                                     ),

                                                   );
                                                 },
                                               ),

                                             },
                                             // else...{
                                             //   ListView.builder(
                                             //     shrinkWrap: true,
                                             //     scrollDirection: Axis.vertical,
                                             //     itemCount: eventResponsesModel
                                             //         .data.aaData.length,
                                             //
                                             //     itemBuilder: (context, index) {
                                             //       return Container(
                                             //         child:
                                             //
                                             //
                                             //         Column(
                                             //           children: [
                                             //
                                             //             Container(
                                             //               margin: EdgeInsets
                                             //                   .only(top: 10,
                                             //                   left: 10,
                                             //                   right: 10),
                                             //               child: Row(
                                             //                 mainAxisAlignment: MainAxisAlignment
                                             //                     .spaceBetween,
                                             //
                                             //                 children: [
                                             //                   Text(
                                             //                     "# Packages",
                                             //                     style: TextStyle(
                                             //                         fontWeight: FontWeight
                                             //                             .bold),),
                                             //                   Text("Rate",
                                             //                     style: TextStyle(
                                             //                         fontWeight: FontWeight
                                             //                             .bold),),
                                             //                   Text("Total",
                                             //                     style: TextStyle(
                                             //                         fontWeight: FontWeight
                                             //                             .bold),),
                                             //
                                             //                 ],),
                                             //             ),
                                             //
                                             //             Container(
                                             //               margin: EdgeInsets
                                             //                   .only(top: 10,
                                             //                   left: 10,
                                             //                   right: 10),
                                             //               child: Row(
                                             //                 mainAxisAlignment: MainAxisAlignment
                                             //                     .spaceBetween,
                                             //
                                             //                 children: [
                                             //                   Text(
                                             //                       "   ${eventResponsesModel
                                             //                           .data
                                             //                           .aaData[index]
                                             //                           .addons[index]
                                             //                           .name}"),
                                             //                   Text(
                                             //                       "   ${eventResponsesModel
                                             //                           .data
                                             //                           .aaData[index]
                                             //                           .addons[index]
                                             //                           .rateQuantity}"),
                                             //                   Text(
                                             //                       "    ${eventResponsesModel
                                             //                           .data
                                             //                           .aaData[index]
                                             //                           .addons[index]
                                             //                           .total}"),
                                             //
                                             //                 ],),
                                             //             ),
                                             //           ],
                                             //         ),
                                             //
                                             //       );
                                             //     },
                                             //   ),
                                             // },

                                             // },
                                              // ListView.builder(
                                              //   shrinkWrap: true,
                                              //   scrollDirection: Axis.vertical,
                                              //   itemCount: eventResponseModel.data.aaData.length,
                                              //
                                              //   itemBuilder: (context, index) {
                                              //     return Container(
                                              //       child:
                                              //
                                              //
                                              //       Column(
                                              //         children: [
                                              //
                                              //           Container(
                                              //             margin: EdgeInsets.only(top: 10,left: 10,right: 10),
                                              //             child: Row(
                                              //               mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                              //
                                              //               children: [
                                              //                 Text("# Packages",style: TextStyle(fontWeight: FontWeight.bold),),
                                              //                 Text("Rate",style: TextStyle(fontWeight: FontWeight.bold),),
                                              //                 Text("Total",style: TextStyle(fontWeight: FontWeight.bold),),
                                              //
                                              //               ],),
                                              //           ),
                                              //
                                              //           Container(
                                              //             margin: EdgeInsets.only(top: 10,left: 10,right: 10),
                                              //             child: Row(
                                              //               mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                              //
                                              //               children: [
                                              //                 Text("   ${eventResponseModel.data.aaData[index].addons[index].name}"),
                                              //                 Text("   ${eventResponseModel.data.aaData[index].addons[index].rateQuantity}"),
                                              //                 Text("    ${eventResponseModel.data.aaData[index].addons[index].total}"),
                                              //
                                              //               ],),
                                              //           ),
                                              //         ],
                                              //       ),
                                              //
                                              //     );
                                              //
                                              //   },
                                              // ),

                                          //     Column(
                                          //       children: [
                                          //
                                          //         Container(
                                          //           margin: EdgeInsets.only(top: 10,left: 10,right: 10),
                                          //           child: Row(
                                          //             mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          //
                                          //             children: [
                                          //               Text("# Packages",style: TextStyle(fontWeight: FontWeight.bold),),
                                          //               Text("Rate",style: TextStyle(fontWeight: FontWeight.bold),),
                                          //               Text("Total",style: TextStyle(fontWeight: FontWeight.bold),),
                                          //
                                          //             ],),
                                          //         ),
                                          //
                                          //     Container(
                                          //       margin: EdgeInsets.only(top: 10,left: 10,right: 10),
                                          //       child: Row(
                                          //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          //
                                          //         children: [
                                          //           Text("+ Gecko "),
                                          //           Text("             £100 * 1"),
                                          //           Text("£100"),
                                          //
                                          //         ],),
                                          //     ),
                                          //   ],
                                          // ),

                                              Column(
                                                  children: [
                                                    if(eventResponsesModel.data.aaData
                                                    [index].checkinStatus ==
                                                        0)...{
                                                      InkWell(
                                                        onTap: () {

                                                          checkInBooking(
                                                              eventResponsesModel.data.aaData
                                                              [index].bookingUid,
                                                              eventResponsesModel.data.aaData
                                                              [index].date,
                                                              eventResponsesModel.data.aaData
                                                              [index].eventTicketId,
                                                              "event");
                                                        },
                                                        child: Row(
                                                          mainAxisAlignment: MainAxisAlignment.center,
                                                          children: [
                                                            Container(
                                                              margin: EdgeInsets.only(bottom: 10,top: 10),
                                                              decoration: BoxDecoration(
                                                                borderRadius: BorderRadius.all(Radius.circular(5)),
                                                                gradient: LinearGradient(colors: [
                                                                  Colors.black,
                                                                  Colors.black,
                                                                  Colors.black
                                                                ], begin: Alignment.topCenter, end: Alignment.bottomCenter),
                                                              ),
                                                              padding: EdgeInsets.fromLTRB(135, 10, 135, 10,),
                                                              child: Text(
                                                                ClubApp.CheckIn,
                                                                style: TextStyle(
                                                                  //fontSize: 20,
                                                                    color: Colors.white,fontWeight: FontWeight.bold
                                                                ),
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    }else...{
                                                      Container(
                                                        margin: EdgeInsets.only(right: 10,bottom: 10),
                                                        child: Row(
                                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                          children: [
                                                            Container(
                                                              margin: EdgeInsets.only(right: 20,),
                                                              child: Row(
                                                                children: [
                                                                  Container(
                                                                      margin: EdgeInsets.only(left: 10,top: 5),
                                                                      height: 25,width: 20,

                                                                      child: Image.asset('assets/images/img_6.png', )),
                                                                  Text(ClubApp.CheckedIN,style: TextStyle(fontWeight: FontWeight.bold),),
                                                                ],
                                                              ),
                                                            ),
                                                            Container(
                                                              child: Row(
                                                                children: [
                                                                  Text(
                                                                ClubApp.Time,
                                                                    style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold),
                                                                  ),

                                                                  Container(
                                                                    child: Text(
                                                                     "${eventResponsesModel.data.aaData[index].checkinTime}",
                                                                      style: TextStyle(fontSize: 15,),
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    }
                                                  ]),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),

                                  );
                              },
                               physics: const AlwaysScrollableScrollPhysics(),
                            ),
                        onRefresh: () {
                          return Future.delayed(
                            Duration(seconds: 1),
                                () {
                              setState(() {
                                eventResponsesModel;
                              });
                            },
                          );
                        },
                         ),
                          );
                      }
                    }
                ),
              ),
              ],
            ),
          ),
      ),
    );
  }
  _selectDate(BuildContext context) async {
    DateTime newSelectedDate = await showDatePicker(
        context: context,
        initialDate: _selectedDate != null ?_selectedDate : DateTime.now(),
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
      DateFormat formatter = DateFormat('dd-MMM-yyyy');
      //final formatter = formatDate(DateTime.now(), [dd, '/', mm, '/', yyyy, ' ', HH, ':' nn]);
     // final DateFormat formatter = DateFormat('dd-MM-yyyy');

      final String formatted = formatter.format(_selectedDate);
      _textEditingController
        ..text = formatted
        ..selection = TextSelection.fromPosition(TextPosition(
            offset: _textEditingController.text.length,
            affinity: TextAffinity.upstream));
      print(formatted);
      getDetails(formatted);
      selectedDate = formatted;
    }
  }
  getEventDetails(String currentDate1) {}
}
class AlwaysDisabledFocusNode extends FocusNode {
  @override
  bool get hasFocus => false;
}







