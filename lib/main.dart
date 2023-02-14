import 'package:bookings/Login.dart';
import 'package:bookings/screens/homeScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:overlay_support/overlay_support.dart';
import 'package:flutter/material.dart';
import 'package:flutter_offline/flutter_offline.dart';



import 'Tabel/QR.dart';

void main() async {


  WidgetsFlutterBinding.ensureInitialized();

  Stripe.publishableKey =  "pk_test_51MSEQgSHGIgmdNpyDPAutrPSgY6yybE3wzOQFuflAsk5Er6A1NBO7kF04LoKSlCHEbubrCQTmeSv0vl2CRKtUB45006zwO4kSD";

  runApp(MyApp());
}


// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return  MaterialApp(
//       child: Scaffold(
//         // appBar: new AppBar(
//         //   title: new Text("Offline Demo"),
//         // ),
//         body: OfflineBuilder(
//           connectivityBuilder: (
//               BuildContext context,
//               ConnectivityResult connectivity,
//               Widget child,
//               ) {
//             final bool connected = connectivity != ConnectivityResult.none;
//             return new Stack(
//               fit: StackFit.expand,
//               children: [
//                 Positioned(
//                   height: 24.0,
//                   left: 0.0,
//                   right: 0.0,
//                   child: Container(
//                     color: connected ? Color(0xFF00EE44) : Color(0xFFEE4400),
//                     child: Center(
//                       child: Text("${connected ? 'ONLINE' : 'OFFLINE'}"),
//                     ),
//                   ),
//                 ),
//                 Center(
//                   child: new Text(
//                     'Yay!',
//                   ),
//                 ),
//               ],
//             );
//           },
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: <Widget>[
//               new Text(
//                 'There are no bottons to push :)',
//               ),
//               new Text(
//                 'Just turn off your internet.',
//               ),
//             ],
//           ),
//         ),
//       ),
//        home: Login(),
//     );
//   }
// }
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {


    return OverlaySupport.global(
      child: MaterialApp(



        debugShowCheckedModeBanner: false,
        builder: (context, child) {
          return MediaQuery(
              data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
              child: child);
        },
        theme: ThemeData(
         // visualDensity: VisualDensity.adaptivePlatformDensity,
         // brightness: Brightness.dark,
          primarySwatch: Colors.blue,
        ),
       // home: Login(),
        home: HomeScreen(),

      ),
    );
  }
}
