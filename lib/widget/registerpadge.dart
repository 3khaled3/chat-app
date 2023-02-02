import 'package:chatapp/widget/textfaildd.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:chatapp/widget/chat_padge.dart';

import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

// ignore: camel_case_types
class register extends StatefulWidget {
  const register({super.key});
  static String id = "register";

  @override
  State<register> createState() => _registerState();
}

// ignore: non_constant_identifier_names, prefer_typing_uninitialized_variables
var Upassword;
// ignore: non_constant_identifier_names, prefer_typing_uninitialized_variables
var Uname;
bool show2 = true;
bool isloding = false;
// ignore: prefer_typing_uninitialized_variables
final kform = GlobalKey<FormState>();

// ignore: camel_case_types
class _registerState extends State<register> {
  @override
  Widget build(BuildContext context) {
    return ModalProgressHUD(
      inAsyncCall: isloding,
      child: Scaffold(
          body: Container(
        color: const Color(0xff2B475E),
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Form(
            key: kform,
            child: ListView(
              children: [
                const SizedBox(
                  height: 70,
                ),
                Image.asset(
                  "assets/images/scholar.png",
                  height: 100,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Text(
                      "Scholar Chat",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 40,
                          //fontFamily: "Pacifico",
                          color: (Colors.white)),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 70,
                ),
                SizedBox(
                  width: double.infinity,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text(
                        "Sign Up",
                        style: TextStyle(fontSize: 40, color: (Colors.white)),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 13,
                ),

                gettext(
                  color: Colors.white,
                  valedate: (value) {
                    if (value!.isEmpty) {
                      return "Email is requred";
                    }
                    return null;
                  },
                  label: "Email",
                  ispassword: false,
                  user: (value) {
                    Uname = value;
                  },
                ),
                const SizedBox(
                  height: 20,
                ),
                gettext(
                  color: Colors.white,
                  valedate: (value) {
                    if (value!.isEmpty) {
                      return "Password is requred";
                    }
                    return null;
                  },
                  user: (value) {
                    Upassword = value;
                  },
                  ispassword: show2,
                  label: "Password",
                  widgett: IconButton(
                      icon:
                          const Icon(Icons.remove_red_eye, color: Colors.white),
                      onPressed: () {
                        setState(() {
                          show2 ? show2 = false : show2 = true;
                        });
                      }),
                ),
                const SizedBox(
                  height: 17,
                ),
                // TextFormField(
                //   decoration: InputDecoration(
                //       labelText: "password", border: OutlineInputBorder(),suffixIcon: Icon(Icons.remove_red_eye)),
                // ),
                Padding(
                  padding: const EdgeInsets.only(left: 2.0, right: 2.0),
                  child: ElevatedButton(
                    onPressed: () async {
                      
                      if (kform.currentState!.validate()) {
                        isloding = true;
                          FocusScope.of(context).unfocus();
                        setState(() {});
                        try {
                          // ignore: unused_local_variable
                          UserCredential user =
                              await FirebaseAuth.instance.createUserWithEmailAndPassword(
                                  email: Uname!, password: Upassword!);
                          // ignore: use_build_context_synchronously
                          ShowSnackBar("Success", context);
                          isloding = false;
                          setState(() {});
                          // ignore: use_build_context_synchronously
                          Navigator.pushNamed(context, chatScreen.id,
                              arguments: Uname);
                        } catch (e) {
                          isloding = false;
                          setState(() {});
                          ShowSnackBar("Error", context);
                          // ignore: avoid_print
                          print(e);
                        }
                        // ignore: use_build_context_synchronously

                      }
                      // ignore: use_build_context_synchronously
                    },
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(
                        Colors.white,
                      ),
                      minimumSize: MaterialStateProperty.all(
                          const Size(double.infinity, 40)),
                    ),
                    child: const Text(
                      "Sign Up",
                      style: TextStyle(
                        color: Color(0xff2B475E),
                      ),
                    ),
                  ),
                ),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Text(
                      "Already have an account",
                      style: TextStyle(color: Colors.white),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: const Text("Sign In"),
                    )
                  ],
                ),

                const SizedBox(
                  height: 140,
                ),
              ],
            ),
          ),
        ),
      )),
    );
  }
}
