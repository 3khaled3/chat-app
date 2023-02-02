import 'package:flutter/material.dart';

double redius = 32;

// ignore: camel_case_types, must_be_immutable
class revmassege extends StatelessWidget {
  // ignore: non_constant_identifier_names
  revmassege({super.key, required this.Rmassege});
// ignore: non_constant_identifier_names
  String? Rmassege;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Align(
        alignment: Alignment.centerLeft,
        child: Container(
          //  alignment: Alignment.centerLeft,

          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
                bottomRight: Radius.circular(redius),
                topLeft: Radius.circular(redius),
                topRight: Radius.circular(redius)),
            color: const Color.fromARGB(255, 105, 131, 153),
          ),
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Text(
              Rmassege!,
              style: const TextStyle(
                fontSize: 16,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

// ignore: camel_case_types, must_be_immutable
class sendmassenge extends StatelessWidget {
  sendmassenge({super.key, required this.sendmassege});
  String sendmassege;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Align(
        alignment: Alignment.centerRight,
        child: Container(
          //  alignment: Alignment.centerLeft,

          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(redius),
                topLeft: Radius.circular(redius),
                topRight: Radius.circular(redius)),
            color: const Color.fromARGB(255, 118, 160, 195),
          ),
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Text(
              sendmassege,
              style: const TextStyle(fontSize: 16),
            ),
          ),
        ),
      ),
    );
  }
}
