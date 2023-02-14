import 'dart:async';
import 'dart:convert';
import 'package:bookings/Login.dart';
import 'package:bookings/models/Chack_in_Response.dart';
import 'package:bookings/screens/ClubApp.dart';
import 'package:flutter/material.dart';
import 'package:group_radio_button/group_radio_button.dart';
import 'package:intl/intl.dart';
import 'package:http/http.dart'as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'Home1.dart';
import 'models/Table_Responses_Model.dart';
import 'models/venues_Responsr.dart';

class Table_Screen extends StatefulWidget {
  @override
  _Table_ScreenState createState() => _Table_ScreenState();
}
class _Table_ScreenState extends State<Table_Screen> {
  GlobalKey<ScaffoldState> _scaffoldKey;
  @override
  void dispose() {
    _scaffoldKey?.currentState?.dispose();
    super.dispose();
  }
  bool _isVisible = false;
  String searchType = '';
  bool isLoading = false;
  Future _getDetails;
  void hideWidget() {
    setState(() {
      _isVisible = !_isVisible;
    });
  }
  var venue_id = 1;
  var venue = 2;
  TableResponsesModel tableResponsesModel;
 // Future booking;
  DateTime _selectedDate;
  String _formatted;
  bool viaTextField = false;
  TextEditingController textEditingController = TextEditingController();
  TextEditingController _textEditingController1 = TextEditingController();
  getDetails(String currentDate) {
    print("inside get details");
    setState(() {
      _getDetails = booking(currentDate,'','').then((value) {
        tableResponsesModel = value;
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
    initial();
    tableResponsesModel;
    _scaffoldKey = GlobalKey();
  }
  VenuesResponsr venuesResponsr;

  SharedPreferences Response;
  String token;
  String selectedDate;
  String currentDate;
  void initial() async {
    Response = await SharedPreferences.getInstance();
      token =Response.getString('token').toString();
  }
  Future<TableResponsesModel> booking(String bookingDate,search_type,keyword)async {
    Response = await SharedPreferences.getInstance();
    token =Response.getString('token').toString();
    print( 'calling scandata with url ---> https://bg.reserveyourvenue.com/api/booking/' +
        bookingDate);
    var requestBody = {
      "booking_date": bookingDate,
      "booking_type":"table",
     'search_type' : search_type,
     'keyword' : keyword,
    };
    var headers = {
      'token': token,
        if(sucasaSelected == true)...{
          "venue_id": '${venue_id}'
         //'venue_id': '${venuesResponsr.data[0].id.toString()}',
        }else...{
          "venue_id": '${venue}'
         // 'venue_id': '${venuesResponsr.data[1].id.toString()}',

        },
    };
    print(requestBody);
    debugPrint('Calling post add ons api ${ ClubApp.booking }');
    print(token);
    print(headers);
    http.Response responce = await http.post(
        Uri.parse(ClubApp.booking),
        headers: headers,
       body: requestBody

    );
    var data = jsonDecode(responce.body.toString());
    var status = data["status"];
    var login = data["login"];
    if (responce.statusCode == 200) {
      print(token);
      print(headers);
      if (status == true) {
        return TableResponsesModel.fromJson(data);
      } else {
        if(login == false){
          SharedPreferences prefs = await SharedPreferences.getInstance();
          prefs.clear();
          Navigator.pushReplacement(context,
              MaterialPageRoute(builder: (BuildContext ctx) => Login()));
        }else{
          return TableResponsesModel.fromJson(data);
        }

      }
    } else {
      return TableResponsesModel.fromJson(data);
    }
  }
  Future<ChackInResponse> _booking1(String bookingId,bookingDate,bookingType)async {
    var requestBody = {
      'booking_id': bookingId,
      'booking_type': bookingType,
      'booking_date': bookingDate,
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
    print(token);
    var data = jsonDecode(responce.body.toString());
    var status = data["status"];
    var login = data["status"];
    if (responce.statusCode == 200) {
      print(responce.body);
      print(token);
      if (status == true) {
        return ChackInResponse.fromJson(data);
      } else {
        if(login == false){
          SharedPreferences prefs = await SharedPreferences.getInstance();
          prefs.clear();
          Navigator.pushReplacement(context,
              MaterialPageRoute(builder: (BuildContext ctx) => Login()));
        }else {
          return ChackInResponse.fromJson(data);
        }
      }
    } else {
      return ChackInResponse.fromJson(data);
    }
  }
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
            margin: EdgeInsets.only(left: 10,right: 10),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                        margin: EdgeInsets.only(right: 15,top: 10),
                        child: Text(ClubApp.TableBooking,style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold),)
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width * 0.48,
                      height: MediaQuery.of(context).size.height * 0.07,
                      margin: EdgeInsets.only(top: 5,left: 0),
                      child: TextField(
                        focusNode: AlwaysDisabledFocusNode(),
                        controller: _textEditingController1,
                        onTap: () {
                          selectedDate = _selectDate(context);
                          getDetails(selectedDate);
                        },
                        decoration: InputDecoration(
                          suffixIcon: InkWell(
                                      onTap: () {
                                        _isVisible = false;
                                        textEditingController.clear();
                                        _selectDate(context);
                                      },
                              child: Icon(Icons.calendar_month_outlined,color: Colors.black,)),
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
                          textEditingController.clear();
                         hideWidget();
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
                        padding: const EdgeInsets.only(left: 5),
                        child: Container(
                            alignment: Alignment.centerLeft,
                            margin: EdgeInsets.only(left: 0),
                            child: Text(ClubApp.Filterby,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15),)),
                      ),
                      Stack(
                        children: [
                          RadioButton(
                            description:
                            ClubApp.BookingID,
                            value: "booking_uid",
                            groupValue: searchType,
                            onChanged: (value) => setState(
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
                          child: Container(
                            width: MediaQuery.of(context).size.width * 0.90,
                            height: MediaQuery.of(context).size.height * 0.07,
                            margin: EdgeInsets.only(top: 0),
                            child: TextField(
                              controller: textEditingController,
                              style: TextStyle(color: Colors.black),
                              decoration: InputDecoration(
                                suffixIcon: Container(
                                  child: InkWell(
                                    onTap: () {
                                      setState(() {
                                        _getDetails = booking(selectedDate, searchType, textEditingController.text).then((value) {
                                          tableResponsesModel = value;
                                        });
                                      });
                                    },
                                    child: new Icon(
                                      Icons.search,size: 40,
                                      color: Colors.black,
                                    ),
                                  ),
                                ),
                                labelText: ClubApp.SearchKeyword,labelStyle: TextStyle(color: Colors.grey,),
                               // errorText: _validate ? 'Value Can\'t Be Empty' : null,
                                contentPadding: EdgeInsets.only(top: 15,left: 15),
                                hintText: ClubApp.Entervalue,suffixStyle: TextStyle(fontWeight: FontWeight.bold,),
                                fillColor: Colors.black,
                                focusedBorder: OutlineInputBorder(
                                  borderSide: const BorderSide(
                                      color: Colors.black, width: 0.5),
                                  borderRadius: BorderRadius.circular(5),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderSide: const BorderSide(
                                      color: Colors.black, width: 0.5),
                                  borderRadius: BorderRadius.circular(0.0),
                                ),
                              ),
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
                       child: SingleChildScrollView(
                         child: FutureBuilder(
                             future: _getDetails,
                    builder: (context, snapshot) {
                          if (snapshot.hasData) {
                            return CircularProgressIndicator();
                          } else {
                            return
                              Container(
                              margin: EdgeInsets.only(top: 0),
                              width: MediaQuery.of(context).size.width * 1.0,
                              height: MediaQuery.of(context).size.height * 0.72,
                              child: tableResponsesModel.data.iTotalRecords == 0
                                  ? Container(
                                  margin: EdgeInsets.only(left: 20),
                                  child: Center(child: Text(ClubApp.NoDataFound)))
                                  : RefreshIndicator(
                                    child: ListView.builder(
                                    shrinkWrap: true,
                                    scrollDirection: Axis.vertical,
                                        itemCount:
                                        tableResponsesModel.data.aaData.length,
                                        itemBuilder: (context, index) {
                                          return GestureDetector(
                                            child:
                                            Column(
                                              children: [
                                                Container(
                                                  child: Card(
                                                    elevation: 5,
                                                    shape: RoundedRectangleBorder(
                                                      borderRadius: BorderRadius.circular(10),
                                                    ),
                                                    child: Column(
                                                      children: [

                                                        Container(
                                                          margin: EdgeInsets.only(left: 10,top: 10,right: 10),
                                                          child: Row(
                                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                            children: [
                                                              Text(
                                                                ClubApp.Booking,
                                                                style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold),
                                                              ),
                                                              Container(
                                                                margin: EdgeInsets.only(right: 10),
                                                                child: Text(
                                                                  "${tableResponsesModel.data.aaData[index].bookingUid}",
                                                                  style: TextStyle(fontSize: 12),
                                                                ),
                                                              ),
                                                              Row(
                                                                children: [
                                                                  Text(
                                                                    ClubApp.Date,
                                                                    style: TextStyle(fontSize: 15,),
                                                                  ),
                                                                  Container(
                                                                    width: MediaQuery.of(context).size.width * 0.30,
                                                                    height: MediaQuery.of(context).size.height * 0.02,
                                                                    child: TextField(
                                                                      focusNode: AlwaysDisabledFocusNode(),
                                                                      controller: _textEditingController1,
                                                                      onTap: () {
                                                                        // _selectDate(context);
                                                                      },
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
                                                                             height: 300,
                                                                             // height: MediaQuery.of(context).size.height*0.3 ,
                                                                              decoration: BoxDecoration(
                                                                                borderRadius: BorderRadius.all(Radius.circular(10)),
                                                                                color: Colors.white,
                                                                              ),
                                                                              child: Column(
                                                                                children: [
                                                                                  Row(
                                                                                     mainAxisAlignment: MainAxisAlignment.spaceAround,
                                                                                    children: [
                                                                                      Container(
                                                                                          width: 60,
                                                                                          margin: EdgeInsets.only(left: 1,top: 10),
                                                                                          child: Text("${tableResponsesModel.data.aaData[index].name}",style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold),)),
                                                                                      Container(
                                                                                          margin: EdgeInsets.only(left: 1,top: 15),

                                                                                          child: Container(
                                                                                            width: MediaQuery.of(context).size.width * 0.30,
                                                                                            height: MediaQuery.of(context).size.height * 0.02,
                                                                                            child: TextField(
                                                                                              focusNode: AlwaysDisabledFocusNode(),
                                                                                              controller: _textEditingController1,
                                                                                              onTap: () {
                                                                                                // _selectDate(context);
                                                                                              },
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
                                                                                      ),

                                                                                    ],),
                                                                                  Row(
                                                                                   // mainAxisAlignment: MainAxisAlignment.spaceAround,
                                                                                    children: [
                                                                                    Container(
                                                                                        margin: EdgeInsets.only(left: 30,top: 15),
                                                                                        child: Text(ClubApp.Guest,style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold),)),
                                                                                    Container(
                                                                                        margin: EdgeInsets.only(left: 90,top: 15),

                                                                                        child: Text(ClubApp.Time,style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold),)),

                                                                                  ],),
                                                                                  Divider(),

                                                                                  Container(


                                                                                    child: Expanded(
                                                                                      child: FutureBuilder(
                                                                                          future: _getDetails,
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
                                                                                  // Divider(),
                                                                                  // Row(
                                                                                  //   mainAxisAlignment: MainAxisAlignment.spaceAround,
                                                                                  //   children: [
                                                                                  //     Text("2"),
                                                                                  //     Text("10:26 Am")
                                                                                  //   ],),
                                                                                  // Divider(),
                                                                                  // Row(
                                                                                  //   mainAxisAlignment: MainAxisAlignment.spaceAround,
                                                                                  //   children: [
                                                                                  //     Text("3"),
                                                                                  //     Text("12:25 PM")
                                                                                  //   ],),
                                                                                  // Divider(),
                                                                                  // Row(
                                                                                  //   mainAxisAlignment: MainAxisAlignment.spaceAround,
                                                                                  //   children: [
                                                                                  //     Text("4"),
                                                                                  //     Text("1:25 PM")
                                                                                  //   ],),

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


                                                                                          margin: EdgeInsets.only(right: 15,top: 5,bottom: 10),
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
                                                          margin: EdgeInsets.only(left: 10,top: 10,right: 10),
                                                          child: Row(
                                                            children: [
                                                              Text(
                                                                ClubApp.GuestName,
                                                                style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold),
                                                              ),
                                                              Container(
                                                                width: 210,
                                                                child: Text(
                                                                  "   ${tableResponsesModel.data.aaData[index].guest}",
                                                                //  "   Ashutosh Singh",
                                                                  style: TextStyle(fontSize: 15),
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                        ),

                                                        Container(
                                                          margin: EdgeInsets.only(left: 10,top: 10,right: 10),
                                                          child: Row(
                                                            children: [
                                                              Text(
                                                                ClubApp.TableDepositPaid,
                                                                style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold),
                                                              ),
                                                              Row(
                                                                children: [
                                                                  Container(
                                                                    margin: EdgeInsets.only(left: 10),
                                                                    child: Text(
                                                                      "${tableResponsesModel.data.aaData[index].paidAmount}",
                                                                      style: TextStyle(fontSize: 15),

                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                        Container(
                                                          margin: EdgeInsets.only(left: 10,top: 10,right: 10),
                                                          child: Row(
                                                            children: [
                                                              Text(
                                                                ClubApp.Table,
                                                                style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold),
                                                              ),
                                                                  Container(
                                                                    width: 250,
                                                                    child: Text(
                                                                      "   ${tableResponsesModel.data.aaData[index].name}",
                                                                      style: TextStyle(fontSize: 15),
                                                                    ),
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
                                                        if(tableResponsesModel.data.aaData[index].addons.isEmpty ||tableResponsesModel.data.aaData[index].addons == null || tableResponsesModel.data.aaData[index].addons == 'null' || tableResponsesModel.data.aaData[index].addons == '')...{

                                                        }else...{
                                                          ListView.builder(
                                                            shrinkWrap: true,
                                                            scrollDirection: Axis.vertical,
                                                            itemCount: tableResponsesModel
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
                                                                              "   ${tableResponsesModel
                                                                                  .data
                                                                                  .aaData[index]
                                                                                  .addons[addon_key].
                                                                              name}"),
                                                                          Text(
                                                                              "   ${tableResponsesModel
                                                                                  .data
                                                                                  .aaData[index]
                                                                                  .addons[addon_key]
                                                                                  .rateQuantity}"
                                                                          ),
                                                                          Text(
                                                                              "    ${tableResponsesModel
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

                                            //                     ListView.builder(
                                            //                               shrinkWrap: true,
                                            //                               scrollDirection: Axis.vertical,
                                            //                             itemCount: tableResponsesModel.data.aaData.length,
                                            //
                                            //                        itemBuilder: (context, index) {
                                            //       return Container(
                                            //      child:
                                            //
                                            //
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
                                            //           Text("   ${tableResponsesModel.data.aaData[index].addons[index].name}"),
                                            //            Text("   ${tableResponsesModel.data.aaData[index].addons[index].rateQuantity}"),
                                            //           Text("    ${tableResponsesModel.data.aaData[index].addons[index].total}"),
                                            //
                                            //         ],),
                                            //     ),
                                            //       ],
                                            //     ),
                                            //
                                            //   );
                                            //
                                            // },
                                            //         ),







                                                        Column(
                                                            children: [
                                                              if(tableResponsesModel.data.aaData
                                                                  [index].checkinStatus ==
                                                                  0)...{
                                                InkWell(
                                                  onTap: () {
                                                    setState((){
                                                      _booking1(
                                                          tableResponsesModel.data.aaData
                                                          [index].bookingUid,
                                                          tableResponsesModel.data.aaData
                                                          [index].date,
                                                          "table");
                                                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                                                        content: Text(ClubApp.Check_in_successfully),
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
                                                                  margin: EdgeInsets.only(right: 10,bottom: 10),
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
                                                                      Container(
                                                                        child: Row(
                                                                          children: [
                                                                            Text(ClubApp.Time,
                                                                              style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold),
                                                                            ),
                                                                            Text("${tableResponsesModel.data.aaData[index].checkinTime}",

                                                                              style: TextStyle(fontSize: 15,),
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
                                        tableResponsesModel;
                                      });

                                    },
                                  );
                                },
                                  ),
                           );
                         }
                   }),
                       ),
                     ),
           // ),
              ],
            ),
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
      final DateFormat formatter = DateFormat('dd-MMM-yyyy');

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

  getEventDetails(String currentDate) {}


}

class AlwaysDisabledFocusNode extends FocusNode {
  @override
  bool get hasFocus => false;
}




