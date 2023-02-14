import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
class Email extends StatefulWidget {
  const Email({Key key, TextEditingController controller}) : super(key: key);

  @override
  State<Email> createState() => _EmailState();
}

class _EmailState extends State<Email> {
  TextEditingController usernameController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) =>  Container(
    height: 60,
    width: 300,
    margin: EdgeInsets.only(top: 0),
    child: TextFormField(
      controller: usernameController,
      autofillHints: [AutofillHints.email],

      onEditingComplete: () => TextInput.finishAutofillContext(),
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
      //controller: usernameController,
    ),
  );



}
