import 'package:bookings/Login.dart';
import 'package:bookings/api_confi/api_client.dart';
import 'package:bookings/demoScreen.dart';
import 'package:bookings/screens/ClubApp.dart';
import 'package:flutter/material.dart';
import 'dart:developer';
import 'dart:io';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../Home1.dart';
import '../models/Event_Table_Response.dart';
class ScanQrScreen extends StatefulWidget {
  @override
  _ScanQrScreenState createState() => _ScanQrScreenState();
}
class _ScanQrScreenState extends State<ScanQrScreen> {


  Barcode result;
  QRViewController controller;
  final GlobalKey qrKey = GlobalKey(debugLabel:'QR');
  EventTableResponse eventTableResponse;
  bool scanned = false;
  bool isLoading = false;
  bool firstDetection = true;
  bool viaTextField = false;
  int status = 1;
  TextEditingController textEditingController = TextEditingController();

  @override
  void initState() {
    super.initState();
    //getDetails();
  }
  scan(String result) async {
    setState(() {
      isLoading = true;
      print("isLoading $isLoading");
    });
    if (scanned == true || viaTextField == true) {
      print("---------calling scan data ----------");
      await scanData(result).then((value) {
        eventTableResponse = value;
      });
      setState(() {
        isLoading = false;
        print("isLoading  -----  $isLoading");
      });
      //if(eventTableResponse == false)

      if(eventTableResponse.login == false){
        SharedPreferences prefs = await SharedPreferences.getInstance();
        prefs.clear();
        Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (BuildContext ctx) => Login()));
      }
      if (eventTableResponse.data.iTotalRecords == 0) {
        print("invalid ----- ");
        Fluttertoast.showToast(
            msg: ClubApp.NoDataFound,
            toastLength: Toast.LENGTH_SHORT,
            timeInSecForIosWeb: 2,
            backgroundColor: Colors.black, //ColorRes.primaryColor,
            textColor: Colors.white,
            fontSize: 20.0,
            gravity: ToastGravity.BOTTOM);
        // Navigator.of(context).pushAndRemoveUntil(
        //     MaterialPageRoute(builder: (context) => ScanQrScreen()),
        //     (Route<dynamic> route) => false);
        setState(() {
          textEditingController.text = "";
        });
      } else {
        if(eventTableResponse.data.aaData[0].checkinStatus == 1){
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text(ClubApp.Already_checked_in,style: TextStyle(color: Colors.white),),

          ));
        }else{
          print("here in if");
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => Event_Screen1(
                    result,
                    eventTableResponse.data.iTotalRecords.toString(),
                    false,
                    dataListSM: eventTableResponse.data.aaData,
                  )));
        }
       // print("here in if");
       //  Navigator.push(
       //      context,
       //      MaterialPageRoute(
       //          builder: (context) => Event_Screen1(
       //            result,
       //            eventTableResponse.data.iTotalRecords.toString(),
       //            false,
       //            dataListSM: eventTableResponse.data.aaData,
       //          )));
      }


    }
  }
  @override
  void reassemble() {
    super.reassemble();
    if (Platform.isAndroid) {
      controller.pauseCamera();
    }
    controller.resumeCamera();
  }
  @override
  Widget build(BuildContext context) {
    if(controller != null && mounted) {
      controller.pauseCamera();
      controller.resumeCamera();
    }
    return Scaffold(
      appBar: AppBar(
        leading: InkWell(
            onTap: () {
              Navigator.of(context).pushAndRemoveUntil(
                  MaterialPageRoute(builder: (context) => home()),
                      (Route<dynamic> route) => false);
             // Navigator.pop(context);
            },
            child: Icon(Icons.arrow_back)),
        backgroundColor: Colors.black,
        title: Center(
          child: Container(
            margin: EdgeInsets.only(right: 55),

              height: 40,
              //width: 40,
              child: Image.asset('assets/images/GM.png',color: Colors.white )),
        ),
      // title: Text("Lizard_Lounge",style: TextStyle(fontWeight: FontWeight.bold),),
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.fromLTRB(0, 0, 0, 10),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height * 0.66,
                  // color:Colors.amber,
                  child: isLoading
                      ? Center(child: CircularProgressIndicator())
                      : _buildQrView(context),
                ),
                SizedBox(height: 20,),
                Row(
                    children: <Widget>[
                      Expanded(
                          child: Container(margin: EdgeInsets.only(left: 40),
                              child: Divider(color: Colors.black,))
                      ),
                      Text("OR"),
                      Expanded(
                          child: Container(margin: EdgeInsets.only(right: 40),
                              child: Divider(color: Colors.black,))
                      ),
                    ]
                ),
                SizedBox(height: 20,),
                // Expanded(flex: 4, child: _buildQrView(context)),
                Container(
                  width: MediaQuery.of(context).size.width * 0.95,
                  height: MediaQuery.of(context).size.height * 0.08,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width * 0.80,
                        height: MediaQuery.of(context).size.height * 0.07,
                      //  margin: EdgeInsets.only(top: 9),
                        child: TextField(
                          controller: textEditingController,
                          style: TextStyle(color: Colors.black),
                          decoration: InputDecoration(
                            suffixIcon: Container(
                              child: InkWell(
                                onTap: () {
                                  print("hiiii");

                                      setState(() {

                                        print("inside ontap");
                                        viaTextField = true;
                                        print(textEditingController.text);
                                        scan(textEditingController.text);
                                        textEditingController.clear();
                                      });
                                },
                                child: new Icon(
                                  Icons.search,size: 40,
                                  color: Colors.black,
                                ),
                              ),
                            ),
                            labelText: ClubApp.Search_via_Booking_ID,labelStyle: TextStyle(color: Colors.grey,),
                            contentPadding: EdgeInsets.only(top: 15,left: 15),
                            hintText: " Booking ID.....",suffixStyle: TextStyle(fontWeight: FontWeight.bold,),
                            fillColor: Colors.black,
                            focusedBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                  color: Colors.black, width: 0.5),
                              borderRadius: BorderRadius.circular(0.0),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                  color: Colors.black, width: 0.5),
                              borderRadius: BorderRadius.circular(0.0),
                            ),
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




    );

  }

  Widget _buildQrView(BuildContext context) {

    // For this example we check how width or tall the device is and change the scanArea and overlay accordingly.
    var scanArea = (MediaQuery.of(context).size.width < 400 ||
            MediaQuery.of(context).size.height < 400)
        ? 180.0
        : 320.0;
    // To ensure the Scanner view is properly sizes after rotation
    // we need to listen for Flutter SizeChanged notification and update controller
    return Padding(
      padding: EdgeInsets.fromLTRB(40, 10, 40, 10),
      child: QRView(
        key: qrKey,
        onQRViewCreated: _onQRViewCreated,
        overlay: QrScannerOverlayShape(
            borderColor: Colors.red,
            borderRadius: 5,
            borderLength: 30,
            borderWidth: 5,

            cutOutSize: scanArea),
        onPermissionSet: (ctrl, p) => _onPermissionSet(context, ctrl, p),
      ),
    );
  }

  void _onQRViewCreated(QRViewController controller) {
    setState(() {
      this.controller = controller;
      firstDetection = true;
    });
    controller.scannedDataStream.listen((scanData) async {
      print("scanData  -----  $scanData");
      if (firstDetection) {
        print("firstDetection  -----  $firstDetection");
        setState(() {
          firstDetection = false;
          print("-----------scan data------------${scanData.code}");
          result = scanData;
          print("-----------result------------${result.code}");
          scanned = true;
          print(scanned);
          print("firstDetection  -----  $firstDetection");
          scan(result.code);
        });
      }
    });
  }

  void _onPermissionSet(BuildContext context,QRViewController ctrl, bool p) {
    log('${DateTime.now().toIso8601String()}_onPermissionSet $p');
    if (!p) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('no Permission')),
      );
    }
  }

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }

 }







