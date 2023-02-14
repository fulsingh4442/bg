//
//
// // import 'package:flutter/material.dart';
// // import 'dart:convert';
// // import 'package:flutter/cupertino.dart';
// // import 'package:razorpay_flutter/razorpay_flutter.dart';
// // import 'package:fluttertoast/fluttertoast.dart';
// //
// // class Home extends StatefulWidget {
// //   @override
// //   _HomeState createState() => _HomeState();
// // }
// //
// // class _HomeState extends State<Home> {
// //   Razorpay razorpay;
// //   TextEditingController textEditingController = new TextEditingController();
// //   FocusNode textFocusController = FocusNode();
// //   var msg;
// //
// //   @override
// //   void initState() {
// //     super.initState();
// //
// //     razorpay = new Razorpay();
// //
// //     razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, handlerPaymentSuccess);
// //     razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, handlerErrorFailure);
// //     razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET, handlerExternalWallet);
// //   }
// //
// //   @override
// //   void dispose() {
// //     // TODO: implement dispose
// //     super.dispose();
// //     razorpay.clear();
// //   }
// //
// //   @override
// //   Widget build(BuildContext context) {
// //     return GestureDetector(
// //       onTap: () => textFocusController.unfocus(),
// //       child: Scaffold(
// //         appBar: AppBar(
// //           title: const Text("Razor Pay"),
// //         ),
// //         body: Center(
// //           child: Column(
// //             mainAxisAlignment: MainAxisAlignment.center,
// //             children: [
// //               Container(
// //                 width: 200,
// //                 child: TextField(
// //                   focusNode: textFocusController,
// //                   cursorRadius: Radius.zero,
// //                   textAlign: TextAlign.center,
// //                   controller: textEditingController,
// //                   decoration: const InputDecoration(hintText: "Amount",),
// //                   style: const TextStyle(fontSize: 35.0),
// //                 ),
// //               ),
// //               const SizedBox(
// //                 height: 20,
// //               ),
// //               Container(
// //                 height: 50,
// //                 child: TextButton(
// //                   //color: Colors.deepPurple,
// //                   child: Text(
// //                     "Pay",
// //                     style: const TextStyle(color: Colors.black,fontSize: 30),
// //                   ),
// //                   onPressed: () {
// //                     openCheckout();
// //                   },
// //                 ),
// //               )
// //             ],
// //           ),
// //         ),
// //       ),
// //     );
// //   }
// //
// //   void openCheckout() {
// //     var options = {
// //       "key": "Use Your API Key Id here",
// //       "amount": num.parse(textEditingController.text) * 100, // Convert Paisa to Rupees
// //       "name": "Test Payment By Kamlesh",
// //       "description": "This is a Test Payment",
// //       "timeout": "180",
// //       "theme.color": "#03be03",
// //       "currency": "INR",
// //       "prefill": {"contact": "2323232323", "email": "testByKamlesh@razorpay.com"},
// //       "external": {
// //         "wallets": ["paytm"]
// //       }
// //     };
// //
// //     try {
// //       razorpay.open(options);
// //     } catch (e) {
// //       print(e.toString());
// //     }
// //   }
// //
// //   void handlerPaymentSuccess(PaymentSuccessResponse response) {
// //     print("Pament success");
// //     msg = "SUCCESS: " + response.paymentId;
// //     showToast(msg);
// //   }
// //
// //   void handlerErrorFailure(PaymentFailureResponse response) {
// //     msg = "ERROR: " + response.code.toString() + " - " + jsonDecode(response.message)['error']['description'];
// //     showToast(msg);
// //   }
// //
// //   void handlerExternalWallet(ExternalWalletResponse response) {
// //     msg = "EXTERNAL_WALLET: " + response.walletName;
// //     showToast(msg);
// //   }
// //
// //   showToast(msg){
// //     Fluttertoast.showToast(
// //       msg: msg,
// //       toastLength: Toast.LENGTH_LONG,
// //       gravity: ToastGravity.BOTTOM,
// //       timeInSecForIosWeb: 1,
// //       backgroundColor: Colors.grey.withOpacity(0.1),
// //       textColor: Colors.black54,
// //     );
// //   }
// //
// // }
// ///////////////////////////////////////////////////////////
//
//
// import 'dart:convert';
//
// import 'package:flutter/material.dart';
// import 'package:flutter_stripe/flutter_stripe.dart';
// import 'package:http/http.dart' as http;
// class stripe extends StatefulWidget {
//   const stripe({Key key}) : super(key: key);
//
//   @override
//   State<stripe> createState() => _stripeState();
// }
//
// class _stripeState extends State<stripe> {
//
//   static String apiBase = "https://api.stripe.com/v1/payment_intents";
//
//   Map<String, dynamic> paymentIntenData;
//   static String secretkey = "sk_test_51MSEQgSHGIgmdNpy9LgUk74qTrHzrZDkENvaQRvTWkp3lg18QfjjOfizv0eRkjoqrbjIGmAcdBUGx6iINPVWNWcN00UReGg4hK";
//
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(body: Center(child: TextButton(onPressed: ()
//     async{
//       await makePayment();
//
//
//
//     },
//       child: Text("pay", style: TextStyle(color: Colors.black,fontSize: 32),),)),);
//   }
//
//
//
//
//
//   Future<void> makePayment() async {
//     try {
//       //STEP 1: Create Payment Intent
//       paymentIntenData = await createPaymentIntent('10', 'USD');
//
//       //STEP 2: Initialize Payment Sheet
//       await Stripe.instance
//           .initPaymentSheet(
//
//           paymentSheetParameters: SetupPaymentSheetParameters(
//               paymentIntentClientSecret: paymentIntenData[
//               'client_secret'], //Gotten from payment intent
//               style: ThemeMode.light,
//               merchantDisplayName: 'Ikay'))
//           .then((value) {});
//
//       //STEP 3: Display Payment sheet
//       displayPaymentSheet();
//     } catch (err) {
//       throw Exception(err);
//     }
//   }
//
//   displayPaymentSheet() async {
//     try {
//       await Stripe.instance.presentPaymentSheet().then((value) {
//         showDialog(
//             context: context,
//             builder: (_) =>
//                 AlertDialog(
//                   content: Column(
//                     mainAxisSize: MainAxisSize.min,
//                     children: const [
//                       Icon(
//                         Icons.check_circle,
//                         color: Colors.green,
//                         size: 100.0,
//                       ),
//                       SizedBox(height: 10.0),
//                       Text("Payment Successful!"),
//                     ],
//                   ),
//                 ));
//
//         paymentIntenData = null;
//       }).onError((error, stackTrace) {
//         throw Exception(error);
//       });
//     } on StripeException catch (e) {
//       print('Error is:---> $e');
//       AlertDialog(
//         content: Column(
//           mainAxisSize: MainAxisSize.min,
//           children: [
//             Row(
//               children: const [
//                 Icon(
//                   Icons.cancel,
//                   color: Colors.red,
//                 ),
//                 Text("Payment Failed"),
//               ],
//             ),
//           ],
//         ),
//       );
//     } catch (e) {
//       print('$e');
//     }
//   }
//
//   createPaymentIntent(String amount, String currency) async {
//     try {
//       //Request body
//       Map<String, dynamic> body = {
//         'amount': calculateAmount(amount),
//         'currency': currency,
//       };
//
//       //Make post request to Stripe
//       var response = await http.post(
//         Uri.parse('https://api.stripe.com/v1/payment_intents'),
//         headers: {
//           'Authorization': 'Bearer ${secretkey}',
//           'Content-Type': 'application/x-www-form-urlencoded'
//         },
//         body: body,
//       );
//       print("apiBase = "+ apiBase);
//       print("secretkey = "+ secretkey);
//       print("response  = "+response.body);
//       print(body);
//       return json.decode(response.body);
//     } catch (err) {
//       throw Exception(err.toString());
//     }
//   }
//
//   calculateAmount(String amount) {
//     final price = int.parse(amount) * 10;
//     return price.toString();
//   }
// }
// ////////////////////////////////////////////////
//
// // String publickey;
// // String secretkey;
//
// //  String apiBase = "https://api.stripe.com/v1/payment_intents";
// //
// // Map<String, dynamic> paymentIntenData;
// //  String secretkey = "sk_test_51MSEQgSHGIgmdNpy9LgUk74qTrHzrZDkENvaQRvTWkp3lg18QfjjOfizv0eRkjoqrbjIGmAcdBUGx6iINPVWNWcN00UReGg4hK";
//
//
// // class StripeTransactionResponse {
// //   String message;
// //   bool success;
// //   String pid;
// //   StripeTransactionResponse({this.message, this.success, this.pid});
// // }
// //
// // class StripeService {
// //
// //  // static String apiBase = "https://api.stripe.com/v1/payment_intents";
// //
// //   Map<String, dynamic> paymentIntenData;
// //   static String secretkey = "sk_test_51MSEQgSHGIgmdNpy9LgUk74qTrHzrZDkENvaQRvTWkp3lg18QfjjOfizv0eRkjoqrbjIGmAcdBUGx6iINPVWNWcN00UReGg4hK";
// //
// //    static String apiBase = "https://api.stripe.com/v1";
// //    static String paymentApiUrl = '${StripeService.apiBase}/payment_intents';
// //    static Uri paymentApiUri = Uri.parse(paymentApiUrl);
// //   // static String secret = secretkey; //"sk_test_zFsjGhXTwCe7DTsoNRkllzjQ";
// //   // static String publishable_key =
// //   //     publickey; //"pk_test_AtszjddNytDn1mmlT4ZjgXFy";
// //
// //   // static init() async {
// //   //   final SharedPreferences prefs = await SharedPreferences.getInstance();
// //   //   secretkey = prefs.getString('secret_key');
// //   //   publickey = prefs.getString('public_key');
// //   //   print("keys------- ${publickey} ${secretkey}");
// //   //
// //   //   /*StripePayment.setOptions(StripeOptions(
// //   //       publishableKey: '${StripeService.publishable_key}',
// //   //       androidPayMode: 'test',
// //   //       merchantId: 'test'));*/
// //   // }
// //
// //   static Future<Map<String, dynamic>> createPaymentIntent(
// //       String amount, String currency) async {
// //     try {
// //       Map<String, dynamic> body = {
// //         'amount': amount,
// //         'currency': currency,
// //       };
// //
// //      // final SharedPreferences prefs = await SharedPreferences.getInstance();
// //      // secretkey = prefs.getString('secret_key');
// //       Map<String, String>  headers = {
// //         'Authorization': 'Bearer ${secretkey}',
// //         'content-type': 'application/x-www-form-urlencoded'
// //       };
// //       print("payment Header: ${headers}");
// //       var response =
// //       await http.post(paymentApiUri, headers: headers, body: body);
// //       print("response");
// //       print(jsonDecode(response.body));
// //       return jsonDecode(response.body);
// //     } catch (error) {
// //       print('error Happened');
// //       throw error;
// //     }
// //   }
// //
// //   static Future<StripeTransactionResponse> payNowHandler(
// //       {String amount, String currency}) async {
// //
// //     var paymentIntent =
// //     await StripeService.createPaymentIntent(amount, currency);
// //     print("payment: ${paymentIntent}");
// //
// //
// //     try {
// //
// //       await Stripe.instance
// //           .initPaymentSheet(
// //
// //           paymentSheetParameters: SetupPaymentSheetParameters(
// //               paymentIntentClientSecret: paymentIntent[
// //               'client_secret'], //Gotten from payment intent
// //               style: ThemeMode.light,
// //               merchantDisplayName: 'App'))
// //           .then((value) {});
// //
// //       await Stripe.instance.presentPaymentSheet().onError((error, stackTrace){
// //         return StripeService.getErrorAndAnalyze(error);
// //       });
// //       print("payment:success ${paymentIntent}");
// //       return StripeTransactionResponse(
// //           message: 'Transaction successfull',
// //           success: true,
// //           pid: paymentIntent["id"]);
// //       /*await Stripe.instance.presentPaymentSheet().then((value) {
// //
// //         //Clear paymentIntent variable after successful payment
// //         print("payment:success ${paymentIntent}");
// //         return StripeTransactionResponse(
// //             message: 'Transaction successfull',
// //             success: true,
// //             pid: paymentIntent["id"]);
// //
// //       }).onError((error, stackTrace) {
// //         throw Exception(error);
// //       });*/
// //     }
// //     on StripeException catch (e) {
// //       print('Error is:---> $e');
// //     }
// //     catch (e) {
// //       print("payment:error ${e}");
// //       return StripeTransactionResponse(message: "Transcation Failed.", success: false);
// //     }
// //
// //
// //
// //     /*try {
// //       var paymentMethod = await StripePayment.paymentRequestWithCardForm(
// //           CardFormPaymentRequest());
// //       var p =
// //       var paymentIntent =
// //           await StripeService.createPaymentIntent(amount, currency);
// //       var response = await StripePayment.confirmPaymentIntent(PaymentIntent(
// //           clientSecret: paymentIntent['client_secret'],
// //           paymentMethodId: paymentMethod.id));
// //       print(response.paymentIntentId);
// //       print(response.toJson());
// //       if (response.status == 'succeeded') {
// //         // Navigator.pushNamed(context, '/landing');
// //         return StripeTransactionResponse(
// //             message: 'Transaction successfull',
// //             success: true,
// //             pid: response.paymentIntentId);
// //       } else {
// //         return StripeTransactionResponse(
// //             message: 'Transaction failed', success: false);
// //       }
// //     } catch (error) {
// //       return StripeTransactionResponse(
// //           message: 'Transaction failed in the catch block', success: false);
// //     } on PlatformException catch (error) {
// //       return StripeService.getErrorAndAnalyze(error);
// //     }*/
// //     // return StripeTransactionResponse(
// //     //     message: 'Transaction failed', success: false);
// //   }
// //
// //   static getErrorAndAnalyze(err) {
// //     String message = 'Something went wrong';
// //     if (err.code == 'cancelled') {
// //       message = 'Transaction canceled';
// //     }
// //     return StripeTransactionResponse(message: message, success: false);
// //   }
// // }
//
//
//
//
//
//
/////////////////////////////////

// import 'dart:async';
// import 'dart:io';
// import 'package:connectivity_plus/connectivity_plus.dart';
// import 'package:flutter/foundation.dart';
// import 'package:flutter/material.dart';
// class ConnectionCheckerDemo extends StatefulWidget {
//   const ConnectionCheckerDemo({Key key}) : super(key: key);
//   @override
//   State<ConnectionCheckerDemo> createState() => _ConnectionCheckerDemoState();
// }
// class _ConnectionCheckerDemoState extends State<ConnectionCheckerDemo> {
//   Map _source = {ConnectivityResult.none: false};
//   final NetworkConnectivity _networkConnectivity = NetworkConnectivity.instance;
//   String string = '';
//   @override
//   void initState() {
//     super.initState();
//     _networkConnectivity.initialise();
//     _networkConnectivity.myStream.listen((source) {
//       _source = source;
//       print('source $_source');
//       // 1.
//       switch (_source.keys.toList()[0]) {
//         case ConnectivityResult.mobile:
//           string =
//           _source.values.toList()[0] ? 'Mobile: Online' : 'Mobile: Offline';
//           break;
//         case ConnectivityResult.wifi:
//           string =
//           _source.values.toList()[0] ? 'WiFi: Online' : 'WiFi: Offline';
//           break;
//         case ConnectivityResult.none:
//         default:
//           string = 'Offline';
//       }
//       // 2.
//       setState(() {});
//       // 3.
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(
//           content: Text(
//             string,
//             style: TextStyle(fontSize: 30),
//           ),
//         ),
//       );
//     });
//   }
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         centerTitle: true,
//
//         backgroundColor: const Color(0xff6ae792),
//       ),
//       body: Center(
//           child: Text(
//             string,
//             style: TextStyle(fontSize: 54),
//           )),
//     );
//   }
//   @override
//   void dispose() {
//     _networkConnectivity.disposeStream();
//     super.dispose();
//   }
// }
// class NetworkConnectivity {
//   NetworkConnectivity._();
//   static final _instance = NetworkConnectivity._();
//   static NetworkConnectivity get instance => _instance;
//   final _networkConnectivity = Connectivity();
//   final _controller = StreamController.broadcast();
//   Stream get myStream => _controller.stream;
//   void initialise() async {
//     ConnectivityResult result = await _networkConnectivity.checkConnectivity();
//     _checkStatus(result);
//     _networkConnectivity.onConnectivityChanged.listen((result) {
//       print(result);
//       _checkStatus(result);
//     });
//   }
//   void _checkStatus(ConnectivityResult result) async {
//     bool isOnline = false;
//     try {
//       final result = await InternetAddress.lookup('example.com');
//       isOnline = result.isNotEmpty && result[0].rawAddress.isNotEmpty;
//     } on SocketException catch (_) {
//       isOnline = false;
//     }
//     _controller.sink.add({result: isOnline});
//   }
//   void disposeStream() => _controller.close();
// }

/////////////////////////////////
// import 'dart:convert';
// import 'package:bookings/screens/ClubApp.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/services.dart';
// import 'package:fluttertoast/fluttertoast.dart';
// import 'package:http/http.dart';
// import 'package:shared_preferences/shared_preferences.dart';
//
// import '../models/Data.dart';
// class Login1 extends StatefulWidget {
//   Login1({Key key}) : super(key: key);
//   @override
//   State<Login1> createState() =>Login1State();
// }
// class Login1State extends State<Login1> {
//
//   final _formKey = GlobalKey<FormState>();
//   bool _isHidden = true;
//   TextEditingController usernameController = TextEditingController();
//   //TextEditingController passwordController = TextEditingController();
//   void Login(String otp) async {
//     // var  requestBody  = {
//     // 'email':email,
//     //
//     // };
//     Map<String, dynamic> body = <String, dynamic>{
//       'otp': otp,
//
//     };
//     if(_formKey.currentState.validate()){
//       try{
//         //var token;
//         debugPrint('Calling post add ons api https://trucks24.in/trucks24-api/api/user/v.99.50/otp_check');
//         Response response = await post(
//             Uri.parse("https://trucks24.in/trucks24-api/api/user/v.99.50/otp_check"),
//             body: body
//             // body: json.encode(requestBody),
//
//             // body:{
//             //   "email":email,
//             //
//             //
//             // }
//         );
//         if(response.statusCode==200){
//           var responseData = jsonDecode(response.body);
//           var success = responseData["success"];
//           print(response.body);
//           if(success == "1")
//           {
//
//             var data = responseData["data"];
//
//             print(response.body);
//             pageRoute(data.email.toString()
//             );
//
//             print(otp);
//            // print(data.email);
//
//            // pageRoute(data[0].jsonEncode(email));
//
//
//             ScaffoldMessenger.of(context).showSnackBar(SnackBar(
//
//               content: Text("OTP send successfully!"),
//             ));
//
//
//           }
//           else{
//
//
//             ScaffoldMessenger.of(context).showSnackBar(SnackBar(
//               content: Text(""+ responseData["error"]),
//             ));
//           }
//         }else{
//           var responseData = json.decode(response.body);
//           //  var message = responseData["status"];
//           print("email"+otp);
//
//         }
//       }catch(e){
//         print(e.toString());
//         // InternetConnectionChecker().onStatusChange.listen((Status) {
//         //   final Connected = Status == InternetConnectionStatus.connected;
//         //   showSimpleNotification(Text(Connected ? "Connected to  Internet":"No Connected to Internet"));
//         // }
//         // );
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
//     // InternetConnectionChecker().onStatusChange.listen((Status) {
//     //   final Connected = Status == InternetConnectionStatus.connected;
//     //    showSimpleNotification(Text(Connected ? "Connected to  Internet":"No Connected to Internet"));
//     // }
//     // );
//     checkLogin();
//   }
//   void checkLogin() async{
//     SharedPreferences pref = await SharedPreferences.getInstance();
//     //String val = pref.getString("token");
//     String val = pref.getString("email");
//     if(val != null){
//      // Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) => SplashScreen()), (route) => false);
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
//                           buildEmailAndPassword(),
//
//
//                           InkWell(
//                             onTap: () {
//                               Login(usernameController.text.toString());
//                               TextInput.finishAutofillContext();
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
//                                     ClubApp.Login,
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
//   void pageRoute(String email) async {
//     SharedPreferences pref = await SharedPreferences.getInstance();
//     // await pref.setString("token", jsonEncode(token));
//
//     await pref.setString("email",email);
//
//
//    // Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) => SplashScreen()), (route) => false);
//   }
//   Widget buildEmailAndPassword() => AutofillGroup(
//     child: Column(
//       children: [
//         Container(
//           height: 60,
//           width: 300,
//           margin: EdgeInsets.only(top: 0),
//           child: TextFormField(
//             autofillHints: [AutofillHints.email],
//             style: TextStyle(color: Colors.white),
//             cursorColor: Colors.white,
//             decoration: InputDecoration(
//               border: OutlineInputBorder(
//                 borderRadius: BorderRadius.circular(10.0),
//               ),
//               focusedBorder: OutlineInputBorder(
//                 borderSide:
//                 const BorderSide(color: Colors.white, width: 2.0),
//                 borderRadius: BorderRadius.circular(10.0),
//               ),
//
//               suffixIcon: new Icon(
//                 Icons.person_add_rounded,
//                 color: Colors.white,
//               ),
//
//               fillColor: Colors.white,
//               enabledBorder: OutlineInputBorder(
//                 borderRadius: BorderRadius.circular(5),
//                 borderSide: BorderSide(color: Colors.white, width: 2.0),
//               ),
//               labelText: "Username",labelStyle: TextStyle(color: Colors.white),
//               contentPadding: EdgeInsets.only(left: 15),
//               // hintText: 'Username',
//               hintStyle: TextStyle( color: Colors.white),
//             ),
//             validator: (value){
//               if(value.isEmpty){
//                 return "Username No cannot be empty";
//               }
//               return null;
//             },
//             autofocus: false,
//             controller: usernameController,
//           ),
//         ),
//         SizedBox(height: 20),
//         // Container(
//         //   height: 60,
//         //   width: 300,
//         //   child: TextFormField(
//         //     autofillHints: [AutofillHints.password],
//         //     onEditingComplete: () => TextInput.finishAutofillContext(),
//         //
//         //     style: TextStyle(color: Colors.white),
//         //     cursorColor: Colors.white,
//         //     obscureText: _isHidden,
//         //     decoration: InputDecoration(
//         //       border: OutlineInputBorder(
//         //         borderRadius: BorderRadius.circular(10.0),
//         //       ),
//         //       focusedBorder: OutlineInputBorder(
//         //         borderSide:
//         //         const BorderSide(color: Colors.white, width: 2.0),
//         //         borderRadius: BorderRadius.circular(10.0),
//         //       ),
//         //       fillColor: Colors.white,
//         //       enabledBorder: OutlineInputBorder(
//         //         borderRadius: BorderRadius.circular(5),
//         //         borderSide: BorderSide(color: Colors.white, width: 2.0),
//         //       ),
//         //       labelText: "Password",labelStyle: TextStyle(color: Colors.white),
//         //       contentPadding: EdgeInsets.only(left: 15),
//         //       // hintText: ' Password',
//         //       hintStyle: TextStyle( color: Colors.white),
//         //       suffix: Container(
//         //         margin: EdgeInsets.only(right: 10),
//         //         child: InkWell(
//         //           onTap: _togglePasswordView,
//         //           child: Icon(_isHidden?
//         //           Icons.visibility:
//         //           Icons.visibility_off,color: Colors.white,
//         //           ),
//         //         ),
//         //       ),
//         //     ),
//         //     validator: (value){
//         //       if(value.isEmpty){
//         //         return "Password No cannot be empty";
//         //       }
//         //       return null;
//         //     },
//         //     autofocus: false,
//         //     controller: passwordController,
//         //   ),
//         // ),
//       ],
//     ),
//   );
// }

import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:http/http.dart' as http;

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();

}

class _HomeScreenState extends State<HomeScreen> {
  Map<String, dynamic> paymentIntent;
  static String apiBase = "https://api.stripe.com/v1/payment_intents";

  Map<String, dynamic> paymentIntenData;
  static String secretkey = "sk_test_51MSEQgSHGIgmdNpy9LgUk74qTrHzrZDkENvaQRvTWkp3lg18QfjjOfizv0eRkjoqrbjIGmAcdBUGx6iINPVWNWcN00UReGg4hK";


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Stripe Payment'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextButton(
              child: const Text('Buy Now'),
              onPressed: () async {
                await makePayment();
              },
            ),
          ],
        ),
      ),
    );
  }


  Future<void> makePayment() async {
    try {
      //STEP 1: Create Payment Intent
      paymentIntenData = await createPaymentIntent('100', 'USD');
      var gpay = PaymentSheetGooglePay(merchantCountryCode: "GB",
          currencyCode: "GBP",
          testEnv: true);

      //STEP 2: Initialize Payment Sheet
      await Stripe.instance
          .initPaymentSheet(
          paymentSheetParameters: SetupPaymentSheetParameters(
              paymentIntentClientSecret: paymentIntenData[
              'client_secret'], //Gotten from payment intent
              style: ThemeMode.light,
              merchantDisplayName: 'Abhi',
              // applePay: gpay,
              googlePay: gpay
          ))
      // .initPaymentSheet(
      //
      // paymentSheetParameters: SetupPaymentSheetParameters(
      //     paymentIntentClientSecret: paymentIntenData[
      //     'client_secret'],
      //
      //     //Gotten from payment intent
      //     style: ThemeMode.light,
      //     merchantDisplayName: 'Ikay'
      //
      // ))
          .then((value) {});

      //STEP 3: Display Payment sheet
      displayPaymentSheet();
    } catch (err) {
      throw Exception(err);

    }
  }

  displayPaymentSheet() async {
    try {
      await Stripe.instance.presentPaymentSheet().then((value) {
        showDialog(
            context: context,
            builder: (_) =>
                AlertDialog(
                  content: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: const [
                      Icon(
                        Icons.check_circle,
                        color: Colors.green,
                        size: 100.0,
                      ),
                      SizedBox(height: 10.0),
                      Text("Payment Successful!"),
                    ],
                  ),
                ));

        paymentIntenData = null;
      }).onError((error, stackTrace) {
        throw Exception(error);
      });
    } on StripeException catch (e) {
      print('Error is:---> $e');
      AlertDialog(
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              children: const [
                Icon(
                  Icons.cancel,
                  color: Colors.red,
                ),
                Text("Payment Failed"),
              ],
            ),
          ],
        ),
      );
    } catch (e) {
      print('$e');
    }
  }

  createPaymentIntent(String amount, String currency) async {
    try {
      //Request body
      Map<String, dynamic> body = {
        'amount': calculateAmount(amount),
        'currency': currency,
      };

      //Make post request to Stripe
      var response = await http.post(
        Uri.parse('https://api.stripe.com/v1/payment_intents'),
        headers: {
          'Authorization': 'Bearer ${secretkey}',
          'Content-Type': 'application/x-www-form-urlencoded'
        },
        body: body,
      );
      print("apiBase = " + apiBase);
      print("secretkey = " + secretkey);
      print("response  = " + response.body);
      print(body);
      return json.decode(response.body);
    } catch (err) {
      throw Exception(err.toString());
    }
  }

  calculateAmount(String amount) {
    final price = int.parse(amount) * 100;
    return price.toString();
  }
// Future<void> makePayment() async {
//   try {
//     //STEP 1: Create Payment Intent
//     paymentIntent = await createPaymentIntent('100', 'USD');
//
//     //STEP 2: Initialize Payment Sheet
//     await Stripe.instance
//         .initPaymentSheet(
//
//         paymentSheetParameters: SetupPaymentSheetParameters(
//             paymentIntentClientSecret: paymentIntent[
//             'client_secret'], //Gotten from payment intent
//             style: ThemeMode.light,
//             merchantDisplayName: 'Ikay'))
//         .then((value) {});
//
//     //STEP 3: Display Payment sheet
//     displayPaymentSheet();
//   } catch (err) {
//     throw Exception(err);
//   }
// }
// createPaymentIntent(String amount, String currency) async {
//   try {
//     //Request body
//     Map<String, dynamic> body = {
//       'amount': amount,
//       'currency': currency,
//     };
//
//     //Make post request to Stripe
//     var response = await http.post(
//       Uri.parse('https://api.stripe.com/v1/payment_intents'),
//       headers: {
//         'Authorization': 'Bearer  sk_test_51MSEQgSHGIgmdNpy9LgUk74qTrHzrZDkENvaQRvTWkp3lg18QfjjOfizv0eRkjoqrbjIGmAcdBUGx6iINPVWNWcN00UReGg4hK',
//         'Content-Type': 'application/x-www-form-urlencoded'
//       },
//       body: body,
//     );
//     return json.decode(response.body);
//   } catch (err) {
//     throw Exception(err.toString());
//   }
// }
// displayPaymentSheet() async {
//   try {
//     await Stripe.instance.presentPaymentSheet().then((value) {
//       showDialog(
//           context: context,
//           builder: (_) => AlertDialog(
//             content: Column(
//               mainAxisSize: MainAxisSize.min,
//               children: const [
//                 Icon(
//                   Icons.check_circle,
//                   color: Colors.green,
//                   size: 100.0,
//                 ),
//                 SizedBox(height: 10.0),
//                 Text("Payment Successful!"),
//               ],
//             ),
//           ));
//
//       paymentIntent = null;
//     }).onError((error, stackTrace) {
//       throw Exception(error);
//     });
//   } on StripeException catch (e) {
//     print('Error is:---> $e');
//     AlertDialog(
//       content: Column(
//         mainAxisSize: MainAxisSize.min,
//         children: [
//           Row(
//             children: const [
//               Icon(
//                 Icons.cancel,
//                 color: Colors.red,
//               ),
//               Text("Payment Failed"),
//             ],
//           ),
//         ],
//       ),
//     );
//   } catch (e) {
//     print('$e');
//   }
// }

// Future<void> makePayment() async {
//   try {
//     paymentIntent = await createPaymentIntent('101', 'GBP');
//
//     var gpay = PaymentSheetGooglePay(merchantCountryCode: "GB",
//         currencyCode: "GBP",
//         testEnv: true);
//
//     //STEP 2: Initialize Payment Sheet
//     await Stripe.instance
//         .initPaymentSheet(
//         paymentSheetParameters: SetupPaymentSheetParameters(
//             paymentIntentClientSecret: paymentIntent[
//             'client_secret'], //Gotten from payment intent
//             style: ThemeMode.light,
//             merchantDisplayName: 'Abhi',
//             googlePay: gpay))
//         .then((value) {});
//
//     //STEP 3: Display Payment sheet
//     displayPaymentSheet();
//   } catch (err) {
//     print(err);
//   }
// }
//
// displayPaymentSheet() async {
//   try {
//     await Stripe.instance.presentPaymentSheet().then((value) {
//       print("Payment Successfully");
//     });
//   } catch (e) {
//     print('$e');
//   }
// }
//
// createPaymentIntent(String amount, String currency) async {
//   try {
//     Map<String, dynamic> body = {
//       'amount': amount,
//       'currency': currency,
//     };
//
//     var response = await http.post(
//       Uri.parse('https://api.stripe.com/v1/payment_intents'),
//       headers: {
//         'Authorization': 'Bearer sk_test_51MSEQgSHGIgmdNpy9LgUk74qTrHzrZDkENvaQRvTWkp3lg18QfjjOfizv0eRkjoqrbjIGmAcdBUGx6iINPVWNWcN00UReGg4hK',
//         'Content-Type': 'application/x-www-form-urlencoded'
//       },
//       body: body,
//     );
//     return json.decode(response.body);
//   } catch (err) {
//     throw Exception(err.toString());
//   }
}