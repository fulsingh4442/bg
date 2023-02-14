import 'dart:convert';
import 'package:bookings/Login.dart';
import 'package:bookings/models/Chack_in_Response.dart';
import 'package:bookings/screens/ClubApp.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'Tabel/Guest_Checked_In_Successfully.dart';
import 'models/Event_Table_Response.dart';
import 'models/Guest_Checj_Response.dart';
class Event_Screen1 extends StatefulWidget {
  String bookingUid;
  String totalRecords;
  String guest;
  String type;
  String checkin_status;
  String name;
  String paidAmount;
  String checkinStatus;
  String checkinTime;
  String quantity;
  String checkin_guest;
  String eventTicketId;
  List<AaData> dataListSM;
  AaData aaData;
  bool fromDetails;
  Event_Screen1(
      this.bookingUid,
      this.totalRecords,
      this.fromDetails, {
        this.dataListSM,
        this.aaData,
        this.guest,
        this.checkin_status,
        this.name,
        this.paidAmount,
        this.checkinStatus,
        this.checkinTime,
        this.quantity,
        this.checkin_guest,
        this.eventTicketId,
      });
  @override
  _Event_Screen1State createState() => _Event_Screen1State();
}
class _Event_Screen1State extends State<Event_Screen1> {
  SharedPreferences Response;
  String token;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    initial();
  }
  void initial() async {
    Response = await SharedPreferences.getInstance();
    setState(() {
      token =Response.getString('token').toString();
    });
  }
  GuestChecjResponse guestChecjResponse;
  ChackInResponse chackInResponse;
  checkInBooking(String bookingId,bookingDate,ticketId,bookingType){
    setState(() {
      _booking(bookingId,bookingDate,ticketId,bookingType).then((value) {
        if(value.status == true){
          Navigator.of(context).pushAndRemoveUntil(
              MaterialPageRoute(builder: (context) => Guest_Checked_In_Successfully()),
                  (Route<dynamic> route) => false);
        }else{
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text(value.message.toString()),
          ));
        }
      });
    });
  }
  checkInBooking1(String booking_id,booking_date,unit_id,booking_type,category_id){
    setState(() {
      _booking1( booking_id,booking_date,unit_id,booking_type,category_id).then((value) {
        if(value.status == true){
          Navigator.of(context).pushAndRemoveUntil(
              MaterialPageRoute(builder: (context) => Guest_Checked_In_Successfully()),
                  (Route<dynamic> route) => false);
        }else{
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text(value.message.toString()),
          ));
        }
      });
    });
  }
  Future<ChackInResponse> _booking1(String booking_id,booking_date,unit_id,booking_type,category_id)async {
    var requestBody = {
      'booking_id': booking_id,
      'booking_type': booking_type,
      'unit_id': unit_id,
      'category_id': category_id,
      'booking_date': booking_date
    };
    debugPrint('Calling post add ons api ${ ClubApp.booking_checkin}');
    http.Response responce = await http.post(
      Uri.parse(ClubApp.booking_checkin),
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
      if (status == true) {
        return ChackInResponse.fromJson(data);
      } else {
        if(login == false){
          SharedPreferences prefs = await SharedPreferences.getInstance();
          prefs.clear();
          Navigator.pushReplacement(context,
              MaterialPageRoute(builder: (BuildContext ctx) => Login()));
        }else{
          return ChackInResponse.fromJson(data);
        }
      }
    } else {
      return ChackInResponse.fromJson(data);
    }
  }
  Future<GuestChecjResponse> _booking(String booking_id,booking_date,event_ticket_id,booking_type)async {
    var requestBody = {
      'booking_id': booking_id,
      'booking_type': booking_type,
      'booking_date': booking_date,
      "event_ticket_id":event_ticket_id
    };
    debugPrint('Calling post add ons api ${ ClubApp.booking_checkin}');
    http.Response responce = await http.post(
        Uri.parse(ClubApp.booking_checkin),
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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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

              height: 45,//width: 45,
              child: Image.asset('assets/images/GM.png',color: Colors.white, )),
        ),
      ),
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Container(
          margin: EdgeInsets.only(left: 0,right: 0),
          child: Column(
            children: [
              Container(
                alignment: Alignment.topLeft,
                  margin: EdgeInsets.only(top: 13,left: 15,bottom: 10),
                  child: Text(ClubApp.Booking_Details,style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold),)
              ),
              Divider(color: Colors.grey,),
              Expanded(
              child: FutureBuilder<EventTableResponse>(
                 // future: scanData().
                  builder: (context, snapshot) {
                    print(snapshot.hasData);
                    if (snapshot.hasData) {
                      return Center(child: CircularProgressIndicator());
                    } else {
                      return
                        ListView.builder(
                          itemCount: widget.dataListSM.length,
                          itemBuilder: (context, index) {
                            if( widget.dataListSM[index].type == 'table'){
                              return
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
                                                  left: 10, top: 10, right: 10),
                                              child: Row(
                                                mainAxisAlignment: MainAxisAlignment
                                                    .spaceBetween,
                                                children: [
                                                  Row(
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
                                                        right: 0),
                                                    child: Text("${widget.dataListSM[index].bookingUid}",
                                                      style: TextStyle(
                                                          fontSize: 15),
                                                    ),
                                                  ),
                                                  ],
                                                    ),
                                                  Row(
                                                    children: [
                                                      Container(
                                                        child: Text(
                                                          ClubApp.Date,
                                                          style: TextStyle(
                                                              fontSize: 15,
                                                              fontWeight: FontWeight
                                                                  .bold),
                                                        ),
                                                      ),
                                                      Container(
                                                        margin: EdgeInsets.only(right: 10),

                                                        child: Text(  widget.dataListSM != null
                                                            ? " ${widget.dataListSM[index].date.toString().replaceAll("00:00:00.000", "")??""}"
                                                            : widget.aaData != null
                                                            ? " ${widget.aaData.date.toString().replaceAll("00:00:00.000", "")}"
                                                            : " ",
                                                          style: TextStyle(
                                                              fontSize: 15,
                                                              ),
                                                        ),
                                                      ),
                                                      InkWell(onTap: (){
                                                        showDialog(
                                                          context: context,
                                                          builder: (_) =>
                                                              Dialog(
                                                                insetPadding: EdgeInsets.symmetric(horizontal: 2.0, vertical: 2.0),
                                                                backgroundColor: Colors.transparent,
                                                                child: Container(


                                                                  //margin: EdgeInsets.only(top: 24),
                                                                  width: 100,
                                                                  height: 250,
                                                                  // height: MediaQuery.of(context).size.height*0.3 ,
                                                                  decoration: BoxDecoration(
                                                                    borderRadius: BorderRadius.all(Radius.circular(10)),
                                                                    color: Colors.white,
                                                                  ),
                                                                  child: Column(
                                                                    children: [
                                                                      Row(
                                                                        // mainAxisAlignment: MainAxisAlignment.spaceAround,
                                                                        children: [
                                                                          Container(
                                                                              margin: EdgeInsets.only(left: 40,top: 10),
                                                                              child: Text(  widget.dataListSM != null
                                                                                  ? "${widget.dataListSM[index].name??""}"
                                                                                  : widget.aaData != null
                                                                                  ? " ${widget.aaData.name}"
                                                                                  : " ",
                                                                                style: TextStyle(
                                                                                    fontSize: 15),
                                                                              ),
                                                                             // Text("${tableResponsesModel.data.aaData[index].name}",style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold),
                                                                            //  )
                                                                          ),
                                                                          Container(
                                                                            margin: EdgeInsets.only(left: 50,top: 15),

                                                                            child:
                                                                            Container(
                                                                              margin: EdgeInsets.only(right: 10,left: 25),

                                                                              child: Text(  widget.dataListSM != null
                                                                                  ? " ${widget.dataListSM[index].date.toString().replaceAll("00:00:00.000", "")??""}"
                                                                                  : widget.aaData != null
                                                                                  ? " ${widget.aaData.date.toString().replaceAll("00:00:00.000", "")}"
                                                                                  : " ",
                                                                                style: TextStyle(
                                                                                  fontSize: 15,
                                                                                ),
                                                                              ),
                                                                            ),
                                                                          ),

                                                                        ],),
                                                                      Row(
                                                                        // mainAxisAlignment: MainAxisAlignment.spaceAround,
                                                                        children: [
                                                                          Container(
                                                                              margin: EdgeInsets.only(left: 30,top: 15),
                                                                              child: Text(ClubApp.Guest,style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold),)),
                                                                          Container(
                                                                              margin: EdgeInsets.only(left: 90,top: 15,),

                                                                              child: Text(ClubApp.Time,style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold),)),

                                                                        ],),
                                                                      Divider(),
                                                                      Container(
                                                                        child:Expanded(
                                                                          child: FutureBuilder(
                                                                              //future: _getDetails,
                                                                              builder: (context, snapshot) {
                                                                                print('test123');
                                                                                if (snapshot.hasData) {
                                                                                  return Center(child: CircularProgressIndicator());
                                                                                } else {
                                                                                  return ListView.builder(
                                                                                    shrinkWrap: true,
                                                                                    scrollDirection: Axis.vertical,
                                                                                    itemCount:  10,
                                                                                    //eventResponsesModel.data.aaData.length,
                                                                                    itemBuilder: (context, index){
                                                                                      return GestureDetector(child:
                                                                                      Column(
                                                                                        children: [

                                                                                          Row(
                                                                                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                                                                                            children: [
                                                                                              Text("${index + 1}"),
                                                                                              Text("10:26 Am")
                                                                                            ],),
                                                                                          Divider(),

                                                                                        ],
                                                                                      ),

                                                                                      );
                                                                                    },
                                                                                    physics: const AlwaysScrollableScrollPhysics(),
                                                                                  );

                                                                                }
                                                                              }
                                                                          ),
                                                                        ),
                                                                      ),

                                                                      GestureDetector(
                                                                          onTap: (){
                                                                            Navigator.pop(context);

                                                                          },
                                                                          child: Container(
                                                                              height: 35,
                                                                              width: 80,

                                                                              decoration: BoxDecoration(
                                                                                borderRadius: BorderRadius.all(Radius.circular(5)),
                                                                                gradient: LinearGradient(colors: [
                                                                                  Colors.black,
                                                                                  Colors.black,
                                                                                  Colors.black
                                                                                ], begin: Alignment.topCenter, end: Alignment.bottomCenter),
                                                                              ),


                                                                              margin: EdgeInsets.only(right: 15,top: 5),
                                                                              alignment: Alignment.center,
                                                                              child: Text(ClubApp.close,style: TextStyle(fontSize: 20,color: Colors.white),))),


                                                                    ],


                                                                  ),

                                                                ),
                                                              ),
                                                        );
                                                      },
                                                          child: Icon(Icons.history)),
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
                                                  Text(ClubApp.Guest,

                                                    style: TextStyle(
                                                        fontSize: 15,
                                                        fontWeight: FontWeight
                                                            .bold),
                                                  ),
                                                  Container(
                                                    width: 270,
                                                    child: Text( widget.dataListSM != null
                                                        ? "${widget.dataListSM[index].guest??""}"
                                                        : widget.aaData != null
                                                        ? " ${widget.aaData.guest}"
                                                        : " ",
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
                                                   ClubApp.Table,
                                                    style: TextStyle(
                                                        fontSize: 15,
                                                        fontWeight: FontWeight
                                                            .bold),
                                                  ),
                                                  Container(
                                                    width: 270,
                                                    child: Text(  widget.dataListSM != null
                                                        ? "${widget.dataListSM[index].name??""}"
                                                        : widget.aaData != null
                                                        ? " ${widget.aaData.name}"
                                                        : " ",
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
                                                //  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                children: [
                                                  Text(ClubApp.TableDepositPaid,

                                                    style: TextStyle(
                                                        fontSize: 15,
                                                        fontWeight: FontWeight
                                                            .bold),
                                                  ),
                                                  Row(
                                                    children: [
                                                      Container(
                                                        child: Text(  widget.dataListSM != null
                                                            ? "${widget.dataListSM[index].paidAmount??""}"
                                                            : widget.aaData != null
                                                            ? " ${widget.aaData.paidAmount}"
                                                            : " ",
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
                                                        ClubApp.Guest,
                                                        style: TextStyle(
                                                            fontSize: 15,
                                                            fontWeight: FontWeight
                                                                .bold),
                                                      ),
                                                      Text(  " 5",
                                                        //  "${eventResponsesModel.data.aaData[index].quantity}",
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
                                                            Text( "3 ",
                                                              // "${eventResponsesModel.data.aaData[index].checkinGuest}",
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
                                            if(widget.dataListSM[index].addons.isEmpty ||widget.dataListSM[index].addons == null || widget.dataListSM[index].addons == 'null' || widget.dataListSM[index].addons == '')...{

                                            }else...{
                                              ListView.builder(
                                                shrinkWrap: true,
                                                scrollDirection: Axis.vertical,
                                                itemCount: widget.dataListSM
                                                    [index].addons.length,

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
                                                              Text(ClubApp.Packages,

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
                                                                  "   ${widget.dataListSM[index]
                                                                      .addons[addon_key].
                                                                  name}"),
                                                              Text(
                                                                  "   ${widget.dataListSM[index]
                                                                      .addons[addon_key]
                                                                      .rateQuantity}"
                                                              ),
                                                              Text(
                                                                  "    ${widget.dataListSM[index]
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



                                            Column(
                                                children: [
                                                  if(widget.dataListSM[index]
                                                      .checkinStatus ==
                                                      0)...{
                                                    InkWell(
                                                      onTap: () {
                                                        setState((){
                                                          _booking1(
                                                              widget.dataListSM
                                                          [index].bookingUid,
                                                              widget.dataListSM
                                                              [index].date,
                                                              widget.dataListSM
                                                              [index].unitId,
                                                              widget.dataListSM[index].categoryId,
                                                              "table");
                                                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                                                            content: Text(ClubApp.Check_in_successfully,),
                                                          ));
                                                        });
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
                                                              ClubApp.CheckedIn,
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
                                                      margin: EdgeInsets.only(right: 10,bottom: 10,top: 5),
                                                      child: Row(
                                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                        children: [
                                                          Container(
                                                            margin: EdgeInsets.only(right: 20,),
                                                            child: Row(
                                                              children: [
                                                                Container(
                                                                    margin: EdgeInsets.only(left: 10),
                                                                    height: 25,width: 20,
                                                                    child: Image.asset('assets/images/img_6.png', )),
                                                                Text(ClubApp.CheckIn,style: TextStyle(fontWeight: FontWeight.bold),),
                                                              ],
                                                            ),
                                                          ),
                                                          Row(
                                                            children: [
                                                              Container(
                                                                child: Text(ClubApp.Time,
                                                                  style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold),
                                                                ),
                                                              ),
                                                              Container(
                                                                child: Text( widget.dataListSM != null
                                                                    ? "${widget.dataListSM[0].checkinTime??""}"
                                                                    : widget.aaData != null
                                                                    ? " ${widget.aaData.checkinTime}"
                                                                    : " ",
                                                                  style: TextStyle(fontSize: 15,),
                                                                ),
                                                              ),
                                                            ],
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
                                );
                            }else{
                              return
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
                                                  left: 10, top: 10, right: 10),
                                              child: Row(
                                                mainAxisAlignment: MainAxisAlignment
                                                    .spaceBetween,
                                                children: [
                                                  Row(
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
                                                        right: 0),
                                                    child: Text("${widget.dataListSM[index].bookingUid}",
                                                      style: TextStyle(
                                                          fontSize: 15),
                                                    ),
                                                  ),
                                                    ],
                                                  ),
                                                  Row(
                                                    children: [
                                                      Container(
                                                        child: Text(ClubApp.Date,

                                                          // " ${widget.bookingUid}",
                                                          style: TextStyle(
                                                              fontSize: 15,
                                                              fontWeight: FontWeight
                                                                  .bold),
                                                        ),
                                                      ),
                                                      Text(  widget.dataListSM != null
                                                          ? " ${widget.dataListSM[index].date.toString().replaceAll("00:00:00.000", "")??""}"
                                                          : widget.aaData != null
                                                          ? " ${widget.aaData.date.toString().replaceAll("00:00:00.000", "")}"
                                                          : " ",
                                                        style: TextStyle(
                                                            fontSize: 15,
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
                                                  Text(ClubApp.Guest,

                                                    style: TextStyle(
                                                        fontSize: 15,
                                                        fontWeight: FontWeight
                                                            .bold),
                                                  ),
                                                  Container(
                                                  width: 270,
                                                    child: Text( widget.dataListSM != null
                                                        ? "${widget.dataListSM[index].guest??""}"
                                                        : widget.aaData != null
                                                        ? " ${widget.aaData.guest}"
                                                        : " ",
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
                                                  Container(
                                                    child: Text(
                                                      ClubApp.Event,
                                                      style: TextStyle(
                                                          fontSize: 15,
                                                          fontWeight: FontWeight
                                                              .bold),
                                                    ),
                                                  ),
                                                  Container(
                                                    width: 270,
                                                    child: Text(  widget.dataListSM != null
                                                        ? "${widget.dataListSM[index].name??""}"
                                                        : widget.aaData != null
                                                        ? " ${widget.aaData.name}"
                                                        : " ",
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
                                                  Text( ClubApp.Paid_Amount,
                                                    style: TextStyle(
                                                        fontSize: 15,
                                                        fontWeight: FontWeight
                                                            .bold),
                                                  ),
                                                  Row(
                                                    children: [
                                                      Container(
                                                        child: Text(  widget.dataListSM != null
                                                            ? "${widget.dataListSM[index].paidAmount??""}"
                                                            : widget.aaData != null
                                                            ? " ${widget.aaData.paidAmount}"
                                                            : " ",
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
                                                      Text(
                                                        widget.dataListSM != null
                                                          ? "${widget.dataListSM[index].quantity??""}"
                                                          : widget.aaData != null
                                                          ? " ${widget.aaData.quantity}"
                                                          : " ",
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
                                                            Text(
                                                              ClubApp.CheckedIn,
                                                              style: TextStyle(
                                                                  fontSize: 15,fontWeight: FontWeight.bold),
                                                            ),
                                                            Text(
                                                              widget.dataListSM != null
                                                                  ? "${widget.dataListSM[index].checkinGuest??""}"
                                                                  : widget.aaData != null
                                                                  ? " ${widget.aaData.checkinGuest}"
                                                                  : " ",
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
                                            if(widget.dataListSM[index].addons.isEmpty ||widget.dataListSM[index].addons == null || widget.dataListSM[index].addons == 'null' || widget.dataListSM[index].addons == '')...{

                                            }else...{
                                              ListView.builder(
                                                shrinkWrap: true,
                                                scrollDirection: Axis.vertical,
                                                itemCount: widget.dataListSM
                                                [index].addons.length,

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
                                                                  "   ${widget.dataListSM[index]
                                                                      .addons[addon_key].
                                                                  name}"),
                                                              Text(
                                                                  "   ${widget.dataListSM[index]
                                                                      .addons[addon_key]
                                                                      .rateQuantity}"
                                                              ),
                                                              Text(
                                                                  "    ${widget.dataListSM[index]
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

                                            Column(
                                                children: [
                                                  if(widget.dataListSM[index]
                                                      .checkinStatus ==
                                                      0)...{
                                                    InkWell(
                                                      onTap: () {
                                                          checkInBooking(
                                                              widget.dataListSM
                                                              [index].bookingUid,
                                                              widget.dataListSM
                                                              [index].date,
                                                              widget.dataListSM
                                                              [index].event_ticket_id,
                                                              "event"
                                                          );
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
                                                      margin: EdgeInsets.only(right: 10,bottom: 10,top: 5),
                                                      child: Row(
                                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                        children: [
                                                          Container(
                                                            margin: EdgeInsets.only(right: 20,),
                                                            child: Row(
                                                              children: [
                                                                Container(
                                                                    margin: EdgeInsets.only(left: 10),
                                                                    height: 25,width: 20,
                                                                    child: Image.asset('assets/images/img_6.png', )),
                                                                Text(ClubApp.CheckedIn,style: TextStyle(fontWeight: FontWeight.bold),),
                                                              ],
                                                            ),
                                                          ),
                                                          Row(
                                                            children: [
                                                              Container(
                                                                child: Text(ClubApp.Time,
                                                                  style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold),
                                                                ),
                                                              ),
                                                              Container(
                                                                child: Text( widget.dataListSM != null
                                                                    ? "${widget.dataListSM[index].checkinTime??""}"
                                                                    : widget.aaData != null
                                                                    ? " ${widget.aaData.checkinTime}"
                                                                    : " ",
                                                                  // snapshot.data.data.aaData[index].checkinTime.toString(),
                                                                  style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold),
                                                                ),
                                                              ),
                                                            ],
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
                                );
                            }
                           }
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
}


