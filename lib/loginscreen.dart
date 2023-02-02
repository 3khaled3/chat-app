import 'package:chatapp/widget/chat_padge.dart';
import 'package:chatapp/widget/registerpadge.dart';
import 'package:chatapp/widget/textfaildd.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

// ignore: camel_case_types
class login extends StatefulWidget {
  const login({super.key});

  static String id = "login";

  @override
  State<login> createState() => _loginState();
}

bool show1 = true;
String? usernamein;
String? passin;
bool islodingin = false;
final keylogin = GlobalKey<FormState>();

// ignore: camel_case_types
class _loginState extends State<login> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: ModalProgressHUD(
        inAsyncCall: islodingin,
        child: Scaffold(
            body: Container(
          color: const Color(0xff2B475E),
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Form(
              key: keylogin,
              child: ListView(
                keyboardDismissBehavior:
                    ScrollViewKeyboardDismissBehavior.onDrag,
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
                          "Sign In",
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
                      label: "Email",
                      ispassword: false,
                      valedate: (value) {
                        if (value!.isEmpty) {
                          return "Email is requred";
                        }
                        return null;
                      },
                      user: (value) {
                        usernamein = value;
                      }),
                  const SizedBox(
                    height: 20,
                  ),
                  gettext(
                    color: Colors.white,
                    user: (value) {
                      passin = value;
                    },
                    ispassword: show1,
                    valedate: (value) {
                      if (value!.isEmpty) {
                        return "password is requred";
                      }
                      return null;
                    },
                    label: "Password",
                    widgett: IconButton(
                        icon: const Icon(Icons.remove_red_eye,
                            color: Colors.white),
                        onPressed: () {
                          setState(() {
                            show1 ? show1 = false : show1 = true;
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
                        FocusScope.of(context).unfocus();
                        
                        if (keylogin.currentState!.validate()) {
                          islodingin = true;
                          setState(() {});
                          try {
                            // ignore: unused_local_variable
                            UserCredential user =
                                await  FirebaseAuth.instance.signInWithEmailAndPassword(
                                    email: usernamein!, password: passin!);

                            islodingin = false;
                            // ignore: use_build_context_synchronously
                            ShowSnackBar(
                                "success", context); // ignore: avoid_print

                            setState(() {});
                            // ignore: use_build_context_synchronously
                            Navigator.pushNamed(context, chatScreen.id,
                                arguments: usernamein);
                          } catch (e) {
                            islodingin = false;
                            setState(() {});

                            ShowSnackBar(
                                "error", context); // ignore: avoid_print
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
                        "Sign In",
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
                        "dont have an account",
                        style: TextStyle(color: Colors.white),
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.pushNamed(context, register.id);
                        },
                        child: const Text("Sign Up"),
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
      ),
    );
  }
}
