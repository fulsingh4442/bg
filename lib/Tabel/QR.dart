// // import 'dart:async';
// //
// // import 'package:flutter/material.dart';
// // import 'dart:convert';
// // import 'package:http/http.dart' as http;
// // class HomePage extends StatefulWidget {
// //   @override
// //   _HomePageState createState() => new _HomePageState();
// // }
// //
// // class _HomePageState extends State<HomePage> {
// //   TextEditingController controller = new TextEditingController();
// //
// //   // Get json result and convert it to model. Then add
// //   Future<Null> getUserDetails() async {
// //     final response = await http.get(url);
// //     final responseJson = json.decode(response.body);
// //
// //     setState(() {
// //       for (Map user in responseJson) {
// //         _userDetails.add(UserDetails.fromJson(user));
// //       }
// //     });
// //   }
// //
// //   @override
// //   void initState() {
// //     super.initState();
// //
// //     getUserDetails();
// //   }
// //
// //   @override
// //   Widget build(BuildContext context) {
// //     return new Scaffold(
// //       appBar: new AppBar(
// //         title: new Text('Home'),
// //         elevation: 0.0,
// //       ),
// //       body: new Column(
// //         children: <Widget>[
// //           new Container(
// //             color: Theme.of(context).primaryColor,
// //             child: new Padding(
// //               padding: const EdgeInsets.all(8.0),
// //               child: new Card(
// //                 child: new ListTile(
// //                   leading: new Icon(Icons.search),
// //                   title: new TextField(
// //                     controller: controller,
// //                     decoration: new InputDecoration(
// //                         hintText: 'Search', border: InputBorder.none),
// //                     onChanged: onSearchTextChanged,
// //                   ),
// //                   trailing: new IconButton(icon: new Icon(Icons.cancel), onPressed: () {
// //                     controller.clear();
// //                     onSearchTextChanged('');
// //                   },),
// //                 ),
// //               ),
// //             ),
// //           ),
// //           new Expanded(
// //             child: _searchResult.length != 0 || controller.text.isNotEmpty
// //                 ? new ListView.builder(
// //               itemCount: _searchResult.length,
// //               itemBuilder: (context, i) {
// //                 return new Card(
// //                   child: new ListTile(
// //                     leading: new CircleAvatar(backgroundImage: new NetworkImage(_searchResult[i].profileUrl,),),
// //                     title: new Text(_searchResult[i].firstName + ' ' + _searchResult[i].lastName),
// //                   ),
// //                   margin: const EdgeInsets.all(0.0),
// //                 );
// //               },
// //             )
// //                 : new ListView.builder(
// //               itemCount: _userDetails.length,
// //               itemBuilder: (context, index) {
// //                 return new Card(
// //                   child: new ListTile(
// //                     leading: new CircleAvatar(backgroundImage: new NetworkImage(_userDetails[index].profileUrl,),),
// //                     title: new Text(_userDetails[index].firstName + ' ' + _userDetails[index].lastName),
// //                   ),
// //                   margin: const EdgeInsets.all(0.0),
// //                 );
// //               },
// //             ),
// //           ),
// //         ],
// //       ),
// //     );
// //   }
// //
// //   onSearchTextChanged(String text) async {
// //     _searchResult.clear();
// //     if (text.isEmpty) {
// //       setState(() {});
// //       return;
// //     }
// //
// //     _userDetails.forEach((userDetail) {
// //       if (userDetail.firstName.contains(text) || userDetail.lastName.contains(text))
// //         _searchResult.add(userDetail);
// //     });
// //
// //     setState(() {});
// //   }
// // }
// //
// // List<UserDetails> _searchResult = [];
// //
// // List<UserDetails> _userDetails = [];
// //
// // final String url = 'https://jsonplaceholder.typicode.com/users';
// // class UserDetails {
// //   final int id;
// //   final String firstName, lastName, profileUrl;
// //
// //   UserDetails({this.id, this.firstName, this.lastName, this.profileUrl = 'https://i.amz.mshcdn.com/3NbrfEiECotKyhcUhgPJHbrL7zM=/950x534/filters:quality(90)/2014%2F06%2F02%2Fc0%2Fzuckheadsho.a33d0.jpg'});
// //
// //   factory UserDetails.fromJson(Map<String, dynamic> json) {
// //     return new UserDetails(
// //       id: json['id'],
// //       firstName: json['name'],
// //       lastName: json['username'],
// //     );
// //   }
// // }
//
// import 'dart:convert';
// import 'package:bookings/Splash_Screen.dart';
// import 'package:bookings/screens/ClubApp.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:fluttertoast/fluttertoast.dart';
// import 'package:http/http.dart';
// import 'package:shared_preferences/shared_preferences.dart';
//
// import 'Event.dart';
// class Logi extends StatefulWidget {
//   Logi({Key key}) : super(key: key);
//   @override
//   State<Logi> createState() =>LogiState();
// }
// class LogiState extends State<Logi> {
//   final _formKey = GlobalKey<FormState>();
//   bool _isHidden = true;
//   TextEditingController phone_numberController = TextEditingController();
//   void userlogin(String phone_number) async {
//     // var  requestBody  = {
//     //   'username':username,
//     //   'password':password,
//     // };
//     if(_formKey.currentState.validate()){
//       try{
//         //var token;
//         debugPrint('Calling post add ons api https://kbdevs.com/firstdose/apiv1/user/login');
//         Response response = await post(
//             Uri.parse("https://kbdevs.com/firstdose/apiv1/user/login"),
//             // body: json.encode(requestBody),
//
//             body:{
//               'phone_number':phone_number,
//
//             }
//         );
//         if(response.statusCode==200){
//           var responseData = json.decode(response.body);
//           var status= responseData["status"];
//           print(response.body);
//           if(status == 1)
//           {
//             var data = responseData["data"];
//             pageRoute(data['phone_number'].toString());
//             print(response.body);
//             ScaffoldMessenger.of(context).showSnackBar(SnackBar(
//               content: Text("OTP Send Succesfully"),
//             ));
//           }
//           else{
//             ScaffoldMessenger.of(context).showSnackBar(SnackBar(
//               content: Text(""+ responseData["error"]),
//             ));
//           }
//         }else{
//           var responseData = json.decode(response.body);
//           //  var message = responseData["status"];
//           print("phone_number"+phone_number);
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
//   @override
//   void initState() {
//     // TODO: implement initState
//     super.initState();
//     checkLogin();
//   }
//   void checkLogin() async{
//     SharedPreferences pref = await SharedPreferences.getInstance();
//     //String val = pref.getString("token");
//     String val = pref.getString("phone_number");
//     if(val != null){
//       Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) => opt()), (route) => false);
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
//                           Text("Login ",style: TextStyle(fontSize: 20,color: Colors.white),),
//                           SizedBox(height: 20,),
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
//                                 labelText: "phone_number",labelStyle: TextStyle(color: Colors.white),
//                                 contentPadding: EdgeInsets.only(left: 15),
//                                 // hintText: 'Username',
//                                 hintStyle: TextStyle( color: Colors.white),
//                               ),
//                               validator: (value){
//                                 if(value.isEmpty){
//                                   return "phone_number No cannot be empty";
//                                 }
//                                 return null;
//                               },
//                               autofocus: false,
//                               controller: phone_numberController,
//                             ),
//                           ),
//
//                           SizedBox(height: 40,),
//                           InkWell(
//                             onTap: () {
//                               userlogin(phone_numberController.text.toString(),);
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
//                                     "Send OTP",
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
//   void pageRoute(String phone_number) async {
//     SharedPreferences pref = await SharedPreferences.getInstance();
//     // await pref.setString("id", id);
//     await pref.setString("phone_number", phone_number);
//
//     Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) => opt()), (route) => false);
//   }
// }
//
//
