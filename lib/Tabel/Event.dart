//
// import 'dart:convert';
// import 'package:bookings/Splash_Screen.dart';
// import 'package:bookings/screens/ClubApp.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:fluttertoast/fluttertoast.dart';
// import 'package:http/http.dart';
// import 'package:shared_preferences/shared_preferences.dart';
// class opt extends StatefulWidget {
//   opt({Key key}) : super(key: key);
//   @override
//   State<opt> createState() =>optState();
// }
// class optState extends State<opt> {
//  SharedPreferences pref1;
//  int _phone_number;
//   //int phone_number = 6367478675;
//  //var _phone_number = 6367478675;
//
//
//   @override
//   initState() {
//     // TODO: implement initState
//     super.initState();
//     initial();
//     checkLogin();
//   }
//   initial() async {
//     SharedPreferences pref1 = await SharedPreferences.getInstance();
//     setState(() {
//       _phone_number = (pref1.getInt('phone_number'));
//       pref1.setInt('username', _phone_number);
//       print(_phone_number);
//
//     });
//   }
//   final _formKey = GlobalKey<FormState>();
//   bool _isHidden = true;
//   TextEditingController otpController = TextEditingController();
//  TextEditingController _phone_numberController = TextEditingController();
//   void verifyOTP(String otp,_phone_number) async {
//     var  requestBody  = {
//       'otp':otp,
//       'phone_number':_phone_number,
//
//     };
//     if(_formKey.currentState.validate()){
//       try{
//         //var token;
//         debugPrint('Calling post add ons api https://kbdevs.com/firstdose/apiv1/user/verifyOTP');
//         print(_phone_number);
//
//         print("otp1  " +  otp);
//         Response response = await post(
//             Uri.parse("https://kbdevs.com/firstdose/apiv1/user/verifyOTP"),
//             // body: json.encode(requestBody),
//
//             body:{
//               'otp':otp,
//               'phone_number': _phone_number,
//
//             }
//         );
//         print( _phone_number);
//         print("otp1  " +  otp);
//         if(response.statusCode==200){
//           var responseData = json.decode(response.body);
//           var status= responseData["status"];
//           print(response.body);
//           if(status == 1)
//           {
//             print( _phone_number);
//             print("otp  " +  otp);
//             var data = responseData["data"];
//             pageRoute(data['otp'].toString(),data['bearer_token'].toString());
//             print(response.body);
//             ScaffoldMessenger.of(context).showSnackBar(SnackBar(
//               content: Text("Verify otp Succesfully"),
//             ));
//           }
//           else{
//             print( _phone_number);
//             print("else  " +  otp);
//             ScaffoldMessenger.of(context).showSnackBar(SnackBar(
//               content: Text(""+ responseData["error"]),
//             ));
//           }
//         }else{
//           var responseData = json.decode(response.body);
//           //  var message = responseData["status"];
//           print("phone_number"+_phone_number);
//           print("otp"+otp);
//
//         }
//       }catch(e){
//         print(e.toString());
//         Fluttertoast.showToast(
//             msg: ""+e.toString(),
//             toastLength: Toast.LENGTH_SHORT,
//             gravity: ToastGravity.CENTER,
//             timeInSecForIosWeb: 1,
//             backgroundColor: Colors.red,
//             textColor: Colors.white,
//             fontSize: 16.0
//         );
//       }
//     }
//   }
//
//   void checkLogin() async{
//     SharedPreferences pref = await SharedPreferences.getInstance();
//     //String val = pref.getString("token");
//
//     String val = pref.getString("otp");
//     if(val != null){
//       // Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) => SplashScreen()), (route) => false);
//     }
//   }
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.black,
//       body: SingleChildScrollView(
//         child:   Container(
//           //  color:Colors.black ,
//           width: MediaQuery.of(context).size.width * 1.0,
//           height: MediaQuery.of(context).size.height * 1.0,
//           child: SingleChildScrollView(
//
//             child: Column(
//               children: [
//                 Center(
//                   child: Container(
//                     child: Form(
//                       key: _formKey,
//                       child: Column(
//                         children: [
//                           Container(
//                               margin: EdgeInsets.only(top: 100),
//                               height: 150,width: 200,
//                               child: Image.asset('assets/images/BG!.png',color: Colors.white, )),
//                           SizedBox(height: 50,),
//                           Text("OTP $_phone_number ",style: TextStyle(fontSize: 20,color: Colors.white),),
//                           SizedBox(height: 20,),
//
//                           Container(
//                             height: 60,
//                             width: 300,
//                             margin: EdgeInsets.only(top: 0),
//                             child: TextFormField(
//                               style: TextStyle(color: Colors.white),
//                               cursorColor: Colors.white,
//                               decoration: InputDecoration(
//                                 border: OutlineInputBorder(
//                                   borderRadius: BorderRadius.circular(10.0),
//                                 ),
//                                 focusedBorder: OutlineInputBorder(
//                                   borderSide:
//                                   const BorderSide(color: Colors.white, width: 2.0),
//                                   borderRadius: BorderRadius.circular(10.0),
//                                 ),
//
//                                 suffixIcon: new Icon(
//                                   Icons.person_add_rounded,
//                                   color: Colors.white,
//                                 ),
//
//                                 fillColor: Colors.white,
//                                 enabledBorder: OutlineInputBorder(
//                                   borderRadius: BorderRadius.circular(5),
//                                   borderSide: BorderSide(color: Colors.white, width: 2.0),
//                                 ),
//                                 labelText: "OTP",labelStyle: TextStyle(color: Colors.white),
//                                 contentPadding: EdgeInsets.only(left: 15),
//                                 // hintText: 'Username',
//                                 hintStyle: TextStyle( color: Colors.white),
//                               ),
//                               validator: (value){
//                                 if(value.isEmpty){
//                                   return "OTP No cannot be empty";
//                                 }
//                                 return null;
//                               },
//                               autofocus: false,
//                               controller: otpController,
//                             ),
//                           ),
//                           SizedBox(height: 20,),
//                           // Container(
//                           //   height: 60,
//                           //   width: 300,
//                           //   margin: EdgeInsets.only(top: 0),
//                           //   child: TextFormField(
//                           //     style: TextStyle(color: Colors.white),
//                           //     cursorColor: Colors.white,
//                           //     decoration: InputDecoration(
//                           //       border: OutlineInputBorder(
//                           //         borderRadius: BorderRadius.circular(10.0),
//                           //       ),
//                           //       focusedBorder: OutlineInputBorder(
//                           //         borderSide:
//                           //         const BorderSide(color: Colors.white, width: 2.0),
//                           //         borderRadius: BorderRadius.circular(10.0),
//                           //       ),
//                           //
//                           //       suffixIcon: new Icon(
//                           //         Icons.person_add_rounded,
//                           //         color: Colors.white,
//                           //       ),
//                           //
//                           //       fillColor: Colors.white,
//                           //       enabledBorder: OutlineInputBorder(
//                           //         borderRadius: BorderRadius.circular(5),
//                           //         borderSide: BorderSide(color: Colors.white, width: 2.0),
//                           //       ),
//                           //       labelText: "phone_number",labelStyle: TextStyle(color: Colors.white),
//                           //       contentPadding: EdgeInsets.only(left: 15),
//                           //       // hintText: 'Username',
//                           //       hintStyle: TextStyle( color: Colors.white),
//                           //     ),
//                           //     validator: (value){
//                           //       if(value.isEmpty){
//                           //         return "phone_number No cannot be empty";
//                           //       }
//                           //       return null;
//                           //     },
//                           //     autofocus: false,
//                           //     controller: _phone_numberController,
//                           //   ),
//                           // ),
//
//                           SizedBox(height: 40,),
//                           InkWell(
//                             onTap: () {
//                               verifyOTP(otpController.text.toString(),_phone_number.toString());
//
//                             },
//                             child: Row(
//                               mainAxisAlignment: MainAxisAlignment.center,
//                               children: [
//                                 Container(
//                                   margin: EdgeInsets.only(bottom: 10),
//                                   decoration: BoxDecoration(
//                                     borderRadius: BorderRadius.all(Radius.circular(5)),
//                                     gradient: LinearGradient(colors: [
//                                       Colors.white,
//                                       Colors.white,
//                                       Colors.white
//                                     ], begin: Alignment.topCenter, end: Alignment.bottomCenter),
//                                   ),
//                                   padding: EdgeInsets.fromLTRB(135, 10, 135, 10,),
//                                   child: Text(
//                                     "Verify OTP",
//                                     style: TextStyle(
//                                       //fontSize: 20,
//                                         color: Colors.black,fontWeight: FontWeight.bold
//                                     ),
//                                   ),
//                                 ),
//                               ],
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                   ),
//                 ),
//                 // ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
//   void _togglePasswordView() {
//     setState(() {
//       _isHidden = !_isHidden;
//     });
//   }
//   void pageRoute(String otp,bearer_token) async {
//     SharedPreferences pref = await SharedPreferences.getInstance();
//      await pref.setString("bearer_token", bearer_token);
//     await pref.setString("otp", otp);
//
//     //Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) => SplashScreen()), (route) => false);
//   }
// }
//
//
//
