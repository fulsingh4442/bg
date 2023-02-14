import 'package:flutter/material.dart';
class Package extends StatefulWidget {
  const Package({Key key}) : super(key: key);

  @override
  State<Package> createState() => _PackageState();
}

class _PackageState extends State<Package> {
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
                margin: EdgeInsets.only(right: 50),
               // height: 45,width: 45,
                child: Text("Package")),
          ),
        ),
      body: Container(
        width: MediaQuery.of(context).size.width * 1.0,
        height: MediaQuery.of(context).size.height * 1.0,
        margin: EdgeInsets.all(15),

        child: Column(children: [
          Container(
            alignment: Alignment.bottomLeft,
              child: Text(" Hi Danny Crown,",style: TextStyle(fontWeight: FontWeight.bold),)),
          Container(
            margin: EdgeInsets.only(top: 10),
              alignment: Alignment.bottomLeft,
              child: Text("it's Confirmed!v you are ready to go! ,")),
          Container(
              margin: EdgeInsets.only(top: 10),
              alignment: Alignment.bottomLeft,
              child: Text("Find here all the details of your reservation and payment.")),
          Container(
              margin: EdgeInsets.only(top: 10),
              alignment: Alignment.bottomLeft,
              child: Row(
                children: [
                  Text("your Booking iD is :"),
                  Text("LIZ13670.",style: TextStyle(fontWeight: FontWeight.bold),),
                ],
              )),
          Container(
            margin: EdgeInsets.only(top: 15),
            child: Column(children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
              Text("#  product Name ",style: TextStyle(fontWeight: FontWeight.bold),),
              Text("Deposit",style: TextStyle(fontWeight: FontWeight.bold),),
              Text("Date.",style: TextStyle(fontWeight: FontWeight.bold),),

            ],),
            Divider(color: Colors.grey,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
              Text("1. Booth#3 - Table for "),
              Text("£0",style: TextStyle(fontWeight: FontWeight.bold),),
              Text("12 Nov, 2022."),

            ],),
            Container(
                margin: EdgeInsets.only(top: 10),
              alignment: Alignment.bottomLeft,

                child: Text("Package",style: TextStyle(fontWeight: FontWeight.bold),)),

            Container(
              margin: EdgeInsets.only(top: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,

                children: [
                Text("# Package Name",style: TextStyle(fontWeight: FontWeight.bold),),
                Text("Rate",style: TextStyle(fontWeight: FontWeight.bold),),
                Text("Total.",style: TextStyle(fontWeight: FontWeight.bold),),

              ],),
            ),
            Container(
              margin: EdgeInsets.only(top: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,

                children: [
                Text("1. Gecko "),
                Text("             £100 * 1"),
                Text("£100."),

              ],),
            ),
            Divider(color: Colors.grey,),
          ],),),
          Container(child: Column(children: [
            Container(
                margin: EdgeInsets.only(top: 10),
                alignment: Alignment.bottomLeft,
                child: Text("if you need to get in touch, you can email or phone us directiy.")),
            Container(
              height: 100,
                margin: EdgeInsets.only(top: 10),
                alignment: Alignment.bottomRight,
                child: Image.asset('assets/images/q.png')),
            Container(
                margin: EdgeInsets.only(top: 10),
                alignment: Alignment.bottomLeft,
                child: Text("See you soon,")),
            Container(
                margin: EdgeInsets.only(top: 10),
                alignment: Alignment.bottomLeft,
                child: Text("Manager, Lizard Lounge,")),


          ],),)



      ],),),
    );
  }
}

