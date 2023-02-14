import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
class password extends StatefulWidget {
  const password({Key key, TextEditingController controller}) : super(key: key);

  @override
  State<password> createState() => _passwordState();
}

class _passwordState extends State<password> {
  TextEditingController passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  bool _isHidden = true;
  @override
  Widget build(BuildContext context) => Container(
    height: 60,
    width: 300,
    child: TextFormField(
     // controller: widget.controller,

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
  );
  void _togglePasswordView() {
    setState(() {
      _isHidden = !_isHidden;
    });
  }


}
