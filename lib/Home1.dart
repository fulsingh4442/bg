import 'dart:convert';
import 'dart:core';

import 'package:bookings/Event_Screen.dart';
import 'package:bookings/Login.dart';
import 'package:bookings/Tabel/Totle_Rekod.dart';
import 'package:bookings/Tabel/package.dart';
import 'package:bookings/Table_Screen.dart';
import 'package:bookings/models/venues_Responsr.dart';
import 'package:bookings/screens/ClubApp.dart';
import 'package:bookings/screens/scan_qr.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:overlay_support/overlay_support.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart'as http;

var sucasaSelected = true;
class home extends StatefulWidget {
  const home({Key key}) : super(key: key);
  @override
  _homeState createState() => _homeState();
}
class _homeState extends State<home> {
  SharedPreferences pref;
   String _username;
   String _email;
  String token;
  @override
 initState() {
    // TODO: implement initState
    super.initState();
    InternetConnectionChecker().onStatusChange.listen((Status) {
      final Connected = Status == InternetConnectionStatus.connected;
      showSimpleNotification(Text(Connected ? "Connected to  Internet":"No Connected to Internet"));
    }
    );
    initial();
  }
   initial() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    setState(() {
      _username = (pref.getString('username'));
      pref.setString('username', _username);
      print(_username);
      _email = (pref.getString('email'));
      pref.setString('email', _email);
      print(_email);
      token = pref.getString('token').toString();
      pref.setString('token', token);
      print(token);
    });
  }
  //VenuesResponsr venuesResponsr;

  Future<VenuesResponsr> Venues()async{

    var headers = {

     'token': token,
    };
   // print(token);
    debugPrint('Calling post add ons api ${ClubApp.users_venues}');
    final responce = await http.get(Uri.parse(ClubApp.users_venues),
        headers: headers
    );
    var data = jsonDecode(responce.body.toString());
    var  status =data['status'];
    if(responce.statusCode == 200){
      if(status ==true){
        print(headers);
        print(responce.body);

        return VenuesResponsr.fromJson(data);
      }else{
        // if(login == false){
        //   SharedPreferences prefs = await SharedPreferences.getInstance();
        //   prefs.clear();
        //   Navigator.pushReplacement(context,
        //       MaterialPageRoute(builder: (BuildContext ctx) => Login()));
        // }else{
          return VenuesResponsr.fromJson(data);
       // }
      }
    }else{

      return VenuesResponsr.fromJson(data);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
     // backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Center(
        child: Container(
          margin: EdgeInsets.only(right: 55),

        height: 40,
            //width: 40,
        child: Image.asset('assets/images/GM.png',color: Colors.white )),
    ),
    ),
      body: SafeArea(
        child: Container(
          width: MediaQuery.of(context).size.width * 1.0,
           //height: MediaQuery.of(context).size.height * 1.0,

          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                child: SingleChildScrollView(

                  child: Column(
                    children: [
                      Container(
                        margin: EdgeInsets.only(top: 5,),
                        width: MediaQuery.of(context).size.width * 1.0,
                       // height: MediaQuery.of(context).size.height * 1.0,
                        child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            margin: EdgeInsets.only(left: 20),
                            width: MediaQuery.of(context).size.width * 0.4,
                            child: InkWell(
                              onTap: () {

                                Navigator.of(context).push(MaterialPageRoute(builder: (context) => Table_Screen()),);
                              },
                              child: Card(
                                elevation: 5,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Center(
                                  child: Column(
                                    children: [
                                      Container(
                                          margin: EdgeInsets.only(top: 10),
                                          height: 60,width: 60,
                                          child: Image.asset('assets/images/t.jpg', )),
                                      SizedBox(height: 0,),
                                      Container(
                                        margin: EdgeInsets.only(bottom: 30),
                                        child: Center(
                                          child: Column(
                                            children: [
                                              Text(ClubApp.Tables,
                                                style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold),
                                              ),
                                              Text(ClubApp.Bookings,
                                                style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(right: 20),
                            width: MediaQuery.of(context).size.width * 0.4,
                            child:  InkWell(
                              onTap: () {
                                Navigator.of(context).push(MaterialPageRoute(builder: (context) => Event_Screen()),);
                              },
                              child: Card(
                                elevation: 5,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Center(
                                  child: Column(
                                    children: [
                                      Container(
                                          margin: EdgeInsets.only(top: 10),
                                          height: 60,width: 60,
                                          child: Image.asset('assets/images/eeeee.jpg', )),
                                      SizedBox(height: 0,),
                                      Container(
                                        margin: EdgeInsets.only(bottom: 30),
                                        child: Center(
                                          child: Column(
                                            children: [
                                              Text(ClubApp.Events,
                                                  style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold),
                                                ),
                                              Text(ClubApp.Bookings,
                                                style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                      ],),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 10,left: 50,right: 50),
                       // width: MediaQuery.of(context).size.width * 1.0,
                        alignment: Alignment.center,
                       // height: 335,
                         height: MediaQuery.of(context).size.height * 0.5,

                        child:
                            Container(
                              height: 335,
                              child:  InkWell(
                                onTap: () {
                                  Navigator.of(context).push(MaterialPageRoute(builder: (context) => ScanQrScreen()),);
                                },
                                child: Card(
                                  elevation: 5,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: Center(
                                    child: Column(
                                      children: [
                                        Container(
                                          alignment: Alignment.center,

                                            margin: EdgeInsets.only(top: 20),
                                          //  height: 180,width: 200,
                                            child: Image.asset('assets/images/q.png',fit: BoxFit.fill, )),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                      ),


                    ],
                  ),

                ),
              ),
              // Container(
              //   alignment: Alignment.bottomCenter,
              //   margin: EdgeInsets.only(top: 60),
              //
              //   height: 54,
              //   color: Colors.black,
              //   width: double.infinity,
              //   child: Center(
              //     child: Row(
              //       children: [
              //         // Container(
              //         //   width: 60,
              //         //     child: Image.asset('assets/images/eeeee.jpg')),
              //         Container(
              //
              //           margin: EdgeInsets.only(left: 10,top: 5,bottom: 5),
              //           alignment: Alignment.center,
              //             child: InkWell(onTap: (){
              //
              //               showDialog(
              //                 context: context,
              //                 builder: (_) =>
              //                     Dialog(
              //                       insetPadding: EdgeInsets.symmetric(horizontal: 2.0, vertical: 2.0),
              //                       backgroundColor: Colors.transparent,
              //                       child: Container(
              //                         margin: EdgeInsets.only(top: 424),
              //                         width: double.infinity,
              //                         height: MediaQuery.of(context).size.height*0.2 ,
              //                         decoration: BoxDecoration(
              //                           color: Colors.white,
              //                         ),
              //                         child: Column(
              //                           children: [
              //
              //                             Column(
              //                               mainAxisAlignment: MainAxisAlignment.spaceAround,
              //                               children: [
              //                                 InkWell( onTap: () {
              //                                                setState(() {
              //                                             sucasaSelected = true;
              //                                               // BASE_URL = "https://kenjin.bookbeach.club/api/";
              //                                              });
              //                                           },
              //                                   child: Row(
              //                                     children: [
              //                                       Container(
              //                                         alignment: Alignment.topLeft,
              //                                         height: 50,
              //                                         width: 80,
              //                                         margin: EdgeInsets.only(left: 50,right: 10),
              //                                         child: CircleAvatar(
              //                                             backgroundColor: Colors.white,
              //                                             radius: 48, // Image radius
              //                                             backgroundImage:  AssetImage('assets/images/BG!!.png', )
              //
              //                                         ),
              //                                       ),
              //                                       Container(
              //                                         // margin: EdgeInsets.only(right: 100,),
              //                                        // height: 40,
              //                                         width: 100,
              //                                         decoration: BoxDecoration(
              //                                           borderRadius: BorderRadius.all(Radius.circular(5)),
              //
              //                                           gradient: LinearGradient(colors: [
              //                                             Colors.white,
              //                                             Colors.white,
              //                                             Colors.white
              //                                           ], begin: Alignment.topCenter, end: Alignment.bottomCenter),
              //                                         ),
              //                                         child: TextButton(
              //                                           onPressed: () async {
              //                                             // SharedPreferences prefs = await SharedPreferences.getInstance();
              //                                             // prefs.clear();
              //                                             // Navigator.pushReplacement(context,
              //                                             // MaterialPageRoute(builder: (BuildContext ctx) => Login()));
              //                                           },
              //                                           child: Text("Beach Bar",style: TextStyle(fontSize: 15,color: Colors.black),
              //                                           ),
              //
              //                                         ),
              //                                       ),
              //                                     ],
              //                                   ),
              //                                 ),
              //                                 //SizedBox(height: 5,),
              //                                 Divider(color: Colors.grey,),
              //
              //                                 InkWell(
              //                                   onTap: () {
              //                                     setState(() {
              //                                       sucasaSelected = false;
              //                                       // BASE_URL = "https://kenjin.bookbeach.club/api/";
              //                                     });
              //                                   },
              //
              //                                   child: Row(
              //                                     children: [
              //                                       Container(
              //                                         alignment: Alignment.topLeft,
              //                                         height: 50,
              //                                         width: 80,
              //                                         margin: EdgeInsets.only(left: 50,),
              //                                         child: CircleAvatar(
              //                                             backgroundColor: Colors.white,
              //                                             radius: 48, // Image radius
              //                                             backgroundImage:  AssetImage('assets/images/GM.png', )
              //
              //                                         ),
              //                                       ),
              //                                       Container(
              //                                         //height: 40,
              //                                         width: 100,
              //                                         decoration: BoxDecoration(
              //                                           borderRadius: BorderRadius.all(Radius.circular(5)),
              //                                           gradient: LinearGradient(colors: [
              //                                             Colors.white,
              //                                             Colors.white,
              //                                             Colors.white
              //                                           ], begin: Alignment.topCenter, end: Alignment.bottomCenter),
              //                                         ),
              //                                         child: TextButton(
              //                                           onPressed: () {
              //                                             // Navigator.of(ctx).pop();
              //                                           },
              //                                           child: Text("Zoh",style: TextStyle(fontSize: 15,color: Colors.black)),
              //                                         ),
              //                                       ),
              //                                     ],
              //                                   ),
              //                                 ),
              //
              //
              //
              //                                           GestureDetector(
              //                                               onTap: (){
              //                                                 Navigator.pop(context);
              //
              //                                               },
              //                                               child: Container(
              //                                                 margin: EdgeInsets.only(right: 15),
              //                                                 alignment: Alignment.topRight,
              //                                                   child: Text("close",style: TextStyle(fontSize: 20,color: Colors.cyan),))),
              //
              //
              //                               ],
              //                             ),
              //                           ],
              //
              //
              //                         ),
              //
              //                       ),
              //                     ),
              //               );
              //
              //
              //
              //
              //             },
              //
              //
              //                 child: Row(
              //                   children: [
              //                     Container(
              //                       alignment: Alignment.topLeft,
              //                       height: 50,
              //                       width: 60,
              //                       margin: EdgeInsets.only(right: 10,),
              //                       child: CircleAvatar(
              //                           backgroundColor: Colors.white,
              //                           radius: 48, // Image radius
              //                           backgroundImage:  AssetImage(sucasaSelected ? 'assets/images/BG!!.png' : 'assets/images/GM.png',
              //                            // 'assets/images/BG!!.png',
              //                           )
              //
              //                       ),
              //                     ),
              //                     Text(sucasaSelected ? 'Beach Bar' : 'Zoh',
              //                       //"Beach Bar"
              //                       style: TextStyle(color: Colors.white,fontSize: 20,),
              //                     ),
              //                   ],
              //                 )
              //             )
              //         ),
              //         Icon(Icons.expand_less_outlined,color: Colors.white,size: 35,)
              //
              //       ],
              //     ),
              //   ),)


            ],
          ),


        ),

      ),
      bottomNavigationBar:
      BottomNavigationBar(
        showSelectedLabels: true,
        showUnselectedLabels: true,
         backgroundColor: Colors.black,
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.black,
        selectedLabelStyle: TextStyle(fontWeight: FontWeight.w600),
        unselectedLabelStyle: TextStyle(fontWeight: FontWeight.w600),
        type: BottomNavigationBarType.fixed,
        items:  [
          BottomNavigationBarItem(
            icon: InkWell(onTap:(){},
                child:
                FutureBuilder<VenuesResponsr>(
                    future: Venues(),
                    builder: (context, snapshot) {

                      if (snapshot.hasData) {
                        return
                          Container(
                            // alignment: Alignment.bottomCenter,
                            //margin: EdgeInsets.only(top: 60),

                            height: 54,
                            color: Colors.black,
                            width: double.infinity,
                            child: Center(
                              child: Row(
                                children: [
                                  // Container(
                                  //   width: 60,
                                  //     child: Image.asset('assets/images/eeeee.jpg')),
                                  Container(

                                      margin: EdgeInsets.only(left: 10,top: 5,bottom: 5),
                                      alignment: Alignment.center,
                                      child: InkWell(onTap: (){

                                        showDialog(
                                          context: context,
                                          builder: (_) =>

                                                        Container(
                                                          child: Dialog(
                                                            insetPadding: EdgeInsets.symmetric(horizontal: 2.0, vertical: 2.0),
                                                            backgroundColor: Colors.transparent,
                                                            child: Container(
                                                              margin: EdgeInsets.only(top: MediaQuery.of(context).size.height*0.6),
                                                              width: double.infinity,
                                                              height: MediaQuery.of(context).size.height*0.2 ,
                                                              decoration: BoxDecoration(
                                                                color: Colors.white,
                                                              ),
                                                              child: Column(
                                                                children: [

                                                                  Column(
                                                                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                                                                    children: [
                                                                      InkWell( onTap: () {
                                                                        setState(() {
                                                                          sucasaSelected = true;
                                                                          // BASE_URL = "https://kenjin.bookbeach.club/api/";
                                                                        });
                                                                        Navigator.pop(context);
                                                                      },
                                                                        child: Row(
                                                                          children: [
                                                                            Container(
                                                                              alignment: Alignment.topLeft,
                                                                              height: 50,
                                                                              width: 80,
                                                                              margin: EdgeInsets.only(left: 50,right: 10),
                                                                              child: CircleAvatar(
                                                                                  backgroundColor: Colors.white,
                                                                                  radius: 48, // Image radius
                                                                                  backgroundImage:  NetworkImage("${snapshot.data.data[0].logo.toString()}" )

                                                                              ),
                                                                            ),
                                                                            Container(
                                                                              // margin: EdgeInsets.only(right: 100,),
                                                                              // height: 40,
                                                                              width: 100,
                                                                              decoration: BoxDecoration(
                                                                                borderRadius: BorderRadius.all(Radius.circular(5)),

                                                                                gradient: LinearGradient(colors: [
                                                                                  Colors.white,
                                                                                  Colors.white,
                                                                                  Colors.white
                                                                                ], begin: Alignment.topCenter, end: Alignment.bottomCenter),
                                                                              ),

                                                                                child: Text(snapshot.data.data[0].name
                                                                                    .toString(),style: TextStyle(fontSize: 15,color: Colors.black),
                                                                                ),


                                                                            ),
                                                                          ],
                                                                        ),
                                                                      ),
                                                                      //SizedBox(height: 5,),
                                                                      Divider(color: Colors.grey,),


                                                                      InkWell(
                                                                        onTap: () {
                                                                          setState((){
                                                                            sucasaSelected = false;
                                                                            // BASE_URL = "https://kenjin.bookbeach.club/api/";
                                                                          });

                                                                          Navigator.pop(context);

                                                                        },

                                                                        child: Row(
                                                                          children: [
                                                                            Container(
                                                                              alignment: Alignment.topLeft,
                                                                              height: 50,
                                                                              width: 80,
                                                                              margin: EdgeInsets.only(left: 50,),
                                                                              child: CircleAvatar(
                                                                                  backgroundColor: Colors.white,
                                                                                  radius: 48, // Image radius
                                                                                  backgroundImage:  NetworkImage("${snapshot.data.data[1].logo.toString()}" )

                                                                              ),
                                                                            ),
                                                                            Container(
                                                                              //height: 40,
                                                                              width: 100,
                                                                              decoration: BoxDecoration(
                                                                                borderRadius: BorderRadius.all(Radius.circular(5)),
                                                                                gradient: LinearGradient(colors: [
                                                                                  Colors.white,
                                                                                  Colors.white,
                                                                                  Colors.white
                                                                                ], begin: Alignment.topCenter, end: Alignment.bottomCenter),
                                                                              ),
                                                                              // child: TextButton(
                                                                              //   onPressed: () {
                                                                              //     // Navigator.of(ctx).pop();
                                                                              //   },
                                                                                child: Text(snapshot.data.data[1].name
                                                                                    .toString(),style: TextStyle(fontSize: 15,color: Colors.black)),
                                                                              //),
                                                                            ),
                                                                          ],
                                                                        ),
                                                                      ),


                                                                    ],
                                                                  ),
                                                                ],


                                                              ),

                                                            ),
                                                          ),
                                                        ),
                                        );

                                      },
                                          child:
                                          Row(
                                            children: [
                                              Container(
                                                alignment: Alignment.topLeft,
                                                height: 50,
                                                width: 60,
                                                // margin: EdgeInsets.only(right: 10,),
                                                child: CircleAvatar(
                                                    backgroundColor: Colors.white,
                                                    radius: 48, // Image radius
                                                    backgroundImage:  NetworkImage(sucasaSelected ? "${snapshot.data.data[0].logo.toString()}" : "${snapshot.data.data[1].logo.toString()}",
                                                      // 'assets/images/BG!!.png',
                                                    )

                                                ),
                                              ),
                                              Text(sucasaSelected ? snapshot.data.data[0].name
                                                  .toString() : snapshot.data.data[1].name
                                                  .toString(),
                                                //"Beach Bar"
                                                style: TextStyle(color: Colors.white,fontSize: 15,),
                                              ),
                                            ],
                                          )
                                      )
                                  ),
                                  Icon(Icons.expand_less_outlined,color: Colors.white,size: 35,)

                                ],
                              ),
                            ),);
                      }
                      // else {
                      //   print(token);
                      //   return ;
                      // }
                    }
                ),

            ),
            label: "",
          ),
          BottomNavigationBarItem(
            icon: InkWell(
              // onTap: (){
              //   _isVisible = true;
              // },
                child: Icon(Icons.battery_1_bar_rounded,color: Colors.black,size: 0,)),
            label: "",
          ),
        ],
      ),
      drawer: Container(
        width: MediaQuery.of(context).size.width * 0.6,
        child: Drawer(
          child: ListView(
            children: [

              Container(
                color: Colors.black,
                height: 130,
                child: Column(children: [
                  FutureBuilder<VenuesResponsr>(
                      future: Venues(),
                      builder: (context, snapshot) {

                        if (snapshot.hasData) {
                          return
                          Container(
                            alignment: Alignment.topLeft,
                            height: 60,
                            width: 60,
                            margin: EdgeInsets.only(right: 130,top: 10),
                            child: CircleAvatar(
                                backgroundColor: Colors.white,
                                radius: 48, // Image radius
                                backgroundImage:  NetworkImage(sucasaSelected ? "${snapshot.data.data[0].logo.toString()}" : "${snapshot.data.data[1].logo.toString()}",

                                )


                            ),
                          );




                        }
                        // else {
                        //   print(token);
                        //   return ;
                        // }
                      }
                  ),
                  // Container(
                  //   alignment: Alignment.topLeft,
                  //   height: 60,
                  //   width: 60,
                  //   margin: EdgeInsets.only(right: 130,top: 10),
                  //   child: CircleAvatar(
                  //       backgroundColor: Colors.white,
                  //       radius: 48, // Image radius
                  //       backgroundImage:  NetworkImage(sucasaSelected ? "${snapshot.data.data[0].logo.toString()}" : "${snapshot.data.data[1].logo.toString()}",
                  //
                  //       )
                  //
                  //
                  //   ),
                  // ),
                Container(

                  alignment: Alignment.bottomLeft,
                    margin: EdgeInsets.only(top: 10,left: 10),
                    child: Text('$_username',style: TextStyle(fontSize: 18,color: Colors.white),)),
                SizedBox(height: 3,),
              ],),),
              Divider(),
              Column(
                children: [
                  Container(
                    height: 35,
                    child: ListTile(
                    //   leading: Icon(
                    //   Icons.home,
                    // ),
                      title:  Text(ClubApp.Home),
                      onTap: () {
                        Navigator.pop(context);
                      },
                    ),
                  ),
                  Divider(),
              Container(
                height: 35,
                child: ListTile(
                //   leading: Icon(
                //   Icons.home,
                // ),
                  title:  Text(ClubApp.Booking_Scanner),
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(builder: (context) => ScanQrScreen()),);
                  },
                ),
              ),
                  Divider(),
              Container(
                height: 35,
                child: ListTile(
                  //   leading: Icon(
                  //   Icons.home,
                  // ),
                  title:  Text(ClubApp.Table_Booking),
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(builder: (context) => Table_Screen()),);
                  },
                ),
              ),
                  Divider(),
              Container(
                height: 35,
                child: ListTile(
                  //   leading: Icon(
                  //   Icons.home,
                  // ),
                  title:  Text(ClubApp.Event_Booking),
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(builder: (context) => Event_Screen()),);
                  },
                ),
              ),
                  //  Divider(),
                  // Container(
                  //   height: 35,
                  //   child: ListTile(
                  //     //   leading: Icon(
                  //     //   Icons.home,
                  //     // ),
                  //     title:  Text(ClubApp.Report),
                  //     onTap: () {
                  //       Navigator.pushReplacement(context,
                  //           MaterialPageRoute(builder: (BuildContext ctx) => Totle_Rekod()));
                  //     },
                  //   ),
                  // ),
                  Divider(),

                  Container
                    (
                    padding: EdgeInsets.only(right: 130 ),
                    child: TextButton(onPressed: ()
                    {
                      showDialog(
                        context: context,
                        builder: (ctx) => Container(
                          margin: EdgeInsets.only(top: 500),
                         // alignment: Alignment.bottomCenter,
                          child: AlertDialog(
                            title: Column(
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                                  children: [
                                    Container(
                                      //margin: EdgeInsets.only(left: 10,top: 10),
                                      height: 40,
                                      width: 100,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.all(Radius.circular(5)),
                                        gradient: LinearGradient(colors: [
                                          Colors.black,
                                          Colors.black,
                                          Colors.black
                                        ], begin: Alignment.topCenter, end: Alignment.bottomCenter),
                                      ),
                                      child: TextButton(
                                        onPressed: () async {
                                          SharedPreferences prefs = await SharedPreferences.getInstance();
                                          prefs.clear();
                                          Navigator.pushReplacement(context,
                                              MaterialPageRoute(builder: (BuildContext ctx) => Login()));
                                        },
                                          child: Text(ClubApp.Logout,style: TextStyle(fontSize: 12,color: Colors.white),
                                          ),

                                      ),
                                    ),
                                    Container(
                                      height: 40,
                                        width: 100,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.all(Radius.circular(5)),
                                        gradient: LinearGradient(colors: [
                                          Colors.black,
                                          Colors.black,
                                          Colors.black
                                        ], begin: Alignment.topCenter, end: Alignment.bottomCenter),
                                      ),
                                      child: TextButton(
                                        onPressed: () {
                                          Navigator.of(ctx).pop();
                                        },
                                        child: Text(ClubApp.Cancel,style: TextStyle(fontSize: 12,color: Colors.white)),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                      child: Container(
                        margin: EdgeInsets.only(right: 35),
                        child: Text(ClubApp.Logout,style: TextStyle(fontSize: 15,color: Colors.black87),
                        ),
                      ),
                    ),
                  ),
                  Divider(),
                  ]
              ),
            ],
          ),
        ),
      ),

    );

  }
}

