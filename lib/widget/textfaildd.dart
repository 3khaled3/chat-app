
import 'package:flutter/material.dart';

// ignore: camel_case_types, must_be_immutable
class gettext extends StatelessWidget {
  // ignore: unnecessary_question_mark
  dynamic? width = 2;
  // ignore: avoid_types_as_parameter_names, non_constant_identifier_names
  gettext(
      {super.key,
      required this.label,
      this.widgett,
      this.ispassword,
      this.user,
      this.valedate,
      this.color,
      this.width,
      this.contrl,
      this.supmited,
      this.tap});
  String label;
  dynamic widgett;
  bool? ispassword = false;
  // ignore: unnecessary_question_mark
  dynamic? color = Colors.white;

  TextEditingController? contrl = TextEditingController();
  // ignore: prefer_typing_uninitialized_variables
  var user;
  // ignore: prefer_typing_uninitialized_variables
  var supmited;
  // ignore: prefer_typing_uninitialized_variables
  var tap;

  String? Function(String?)? valedate;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onFieldSubmitted: supmited,
      controller: contrl,
      validator: valedate,
      onChanged: user,
      onTap: tap,
      obscureText: ispassword!,
      decoration: InputDecoration(
        suffixIcon: widgett,
        labelText: label,
        labelStyle: TextStyle(color: color),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: color,
          ),
        ),
        border: const OutlineInputBorder(
          borderSide:
              BorderSide(color: Color.fromARGB(255, 255, 255, 255), width: 2.0),
          // borderRadius: BorderRadius.all(Radius.circular(9.0)),
        ),
      ),
    );
  }
}

// ignore: non_constant_identifier_names
ShowSnackBar(String data,BuildContext context ) {
  
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(
    data,
  ),duration: const Duration(seconds:2)

 ,));
}
