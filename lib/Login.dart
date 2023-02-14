import 'dart:convert';
import 'dart:io';
import 'package:bookings/Splash_Screen.dart';
import 'package:bookings/Tabel/email.dart';
import 'package:bookings/Tabel/password.dart';
import 'package:bookings/screens/ClubApp.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:overlay_support/overlay_support.dart';
import 'package:shared_preferences/shared_preferences.dart';
class Login extends StatefulWidget {
  Login({Key key}) : super(key: key);
  @override
  State<Login> createState() =>LoginState();
}
class LoginState extends State<Login> {

  final _formKey = GlobalKey<FormState>();
  bool _isHidden = true;
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  void Login(String username,password) async {
    // var  requestBody  = {
    //   'username':username,
    //   'password':password,
    // };

    if(_formKey.currentState.validate()){
      try{
        //var token;
        debugPrint('Calling post add ons api ${ ClubApp.users_login}');
        Response response = await post(
            Uri.parse(ClubApp.users_login),
         // body: json.encode(requestBody),

            body:{
              'username':username,
              'password':password,
            }
        );
        if(response.statusCode==200){
          var responseData = json.decode(response.body);
          var status= responseData["status"];
          print(response.body);
          if(status == true)
          {
            var data = responseData["data"];
            pageRoute(data['username'],data['email'],data['token'],data['name']);
            print(response.body);
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              content: Text("Login Succesfully"),
            ));

          }
          else{


            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              content: Text(""+ responseData["error"]),
            ));
          }
        }else{
          var responseData = json.decode(response.body);
        //  var message = responseData["status"];
          print("username"+username);
          print("password"+password);
        }
      }catch(e){
        print(e.toString());
        InternetConnectionChecker().onStatusChange.listen((Status) {
          final Connected = Status == InternetConnectionStatus.connected;
          showSimpleNotification(Text(Connected ? "Connected to  Internet":"No Connected to Internet"));
        }
        );
        // Fluttertoast.showToast(
        //     msg: ""+e.toString(),
        //    // toastLength: Toast.LENGTH_SHORT,
        //     gravity: ToastGravity.CENTER,
        //     timeInSecForIosWeb: 1,
        //     backgroundColor: Colors.red,
        //     textColor: Colors.white,
        //     fontSize: 16.0
        // );
      }
    }
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // InternetConnectionChecker().onStatusChange.listen((Status) {
    //   final Connected = Status == InternetConnectionStatus.connected;
    //    showSimpleNotification(Text(Connected ? "Connected to  Internet":"No Connected to Internet"));
    // }
    // );
    checkLogin();
  }
  void checkLogin() async{
    SharedPreferences pref = await SharedPreferences.getInstance();
    //String val = pref.getString("token");
    String val = pref.getString("email");
    if(val != null){
      Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) => SplashScreen()), (route) => false);
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        child:   Container(
        //  color:Colors.black ,
          width: MediaQuery.of(context).size.width * 1.0,
          height: MediaQuery.of(context).size.height * 1.0,
          child: SingleChildScrollView(

            child: Column(
              children: [
               Center(
                    child: Container(
                      child: Form(
                        key: _formKey,
                        child: Column(
                          children: [
                            Container(
                              margin: EdgeInsets.only(top: 100),
                                height: 150,width: 200,
                                child: Image.asset('assets/images/BG!.png',color: Colors.white, )),
                            SizedBox(height: 50,),
                            Text("Login ",style: TextStyle(fontSize: 20,color: Colors.white),),
                            SizedBox(height: 20,),
                            buildEmailAndPassword(),


                            InkWell(
                              onTap: () async {
                                final bool isInternetAvailable =
                                    await isNetworkAvailable();
                                if (isInternetAvailable) {
                                  Login(usernameController.text.toString(), passwordController.text.toString());
                                  TextInput.finishAutofillContext();

                                }else{
                                  ackAlert(context,
                                      ClubApp.no_internet_message);

                                }


                              },
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Container(
                                    margin: EdgeInsets.only(bottom: 10),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.all(Radius.circular(5)),
                                      gradient: LinearGradient(colors: [
                                        Colors.white,
                                        Colors.white,
                                        Colors.white
                                      ], begin: Alignment.topCenter, end: Alignment.bottomCenter),
                                    ),
                                    padding: EdgeInsets.fromLTRB(135, 10, 135, 10,),
                                    child: Text(
                                      ClubApp.Login,
                                      style: TextStyle(
                                        //fontSize: 20,
                                          color: Colors.black,fontWeight: FontWeight.bold
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                ),
                // ),
              ],
            ),
          ),
        ),
      ),
    );
  }
  void _togglePasswordView() {
    setState(() {
      _isHidden = !_isHidden;
    });
  }
  void pageRoute(String username, email,token,name) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
   // await pref.setString("id", id);
    await pref.setString("username", username);
    await pref.setString("name", name);
    await pref.setString("email", email);
    await pref.setString("token", token);
    Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) => SplashScreen()), (route) => false);
  }
  Widget buildEmailAndPassword() => AutofillGroup(
    child: Column(
      children: [
        Container(
          height: 60,
          width: 300,
          margin: EdgeInsets.only(top: 0),
          child: TextFormField(
            autofillHints: [AutofillHints.email],
            style: TextStyle(color: Colors.white),
            cursorColor: Colors.white,
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide:
                const BorderSide(color: Colors.white, width: 2.0),
                borderRadius: BorderRadius.circular(10.0),
              ),

              suffixIcon: new Icon(
                Icons.person_add_rounded,
                color: Colors.white,
              ),

              fillColor: Colors.white,
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(5),
                borderSide: BorderSide(color: Colors.white, width: 2.0),
              ),
              labelText: "Username",labelStyle: TextStyle(color: Colors.white),
              contentPadding: EdgeInsets.only(left: 15),
              // hintText: 'Username',
              hintStyle: TextStyle( color: Colors.white),
            ),
            validator: (value){
              if(value.isEmpty){
                return "Username No cannot be empty";
              }
              return null;
            },
            autofocus: false,
            controller: usernameController,
          ),
        ),
        SizedBox(height: 20),
        Container(
          height: 60,
          width: 300,
          child: TextFormField(
            autofillHints: [AutofillHints.password],
            onEditingComplete: () => TextInput.finishAutofillContext(),

            style: TextStyle(color: Colors.white),
            cursorColor: Colors.white,
            obscureText: _isHidden,
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide:
                const BorderSide(color: Colors.white, width: 2.0),
                borderRadius: BorderRadius.circular(10.0),
              ),
              fillColor: Colors.white,
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(5),
                borderSide: BorderSide(color: Colors.white, width: 2.0),
              ),
              labelText: "Password",labelStyle: TextStyle(color: Colors.white),
              contentPadding: EdgeInsets.only(left: 15),
              // hintText: ' Password',
              hintStyle: TextStyle( color: Colors.white),
              suffix: Container(
                margin: EdgeInsets.only(right: 10),
                child: InkWell(
                  onTap: _togglePasswordView,
                  child: Icon(_isHidden?
                  Icons.visibility:
                  Icons.visibility_off,color: Colors.white,
                  ),
                ),
              ),
            ),
            validator: (value){
              if(value.isEmpty){
                return "Password No cannot be empty";
              }
              return null;
            },
            autofocus: false,
            controller: passwordController,
          ),
        ),
      ],
    ),
  );

  Future<bool> isNetworkAvailable() async {
    try {
      final result = await InternetAddress.lookup('google.com');
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        print('connected');
        return true;
      } else {
        return false;
      }
    } on SocketException catch (e) {
      print('not connected: $e');
      return false;
    }
  }

  Future<void> ackAlert(BuildContext context, String message) {

    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(

          title:
          Text('BG'
            //sucasaSelected ? 'BG' : 'Kenjin',
          ),
          content: Text(message),
          actions: <Widget>[
            TextButton(
              child: const Text('Ok'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}


