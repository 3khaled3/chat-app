import 'package:chatapp/widget/massege.dart';
import 'package:chatapp/widget/textfaildd.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

// s, must_be_immutable
// ignore: camel_case_types
class chatScreen extends StatefulWidget {
  const chatScreen({super.key});
  static String id = "chat";
  @override
  State<chatScreen> createState() => _chatScreenState();
}

// ignore: camel_case_types
class _chatScreenState extends State<chatScreen> {
  Color color = Colors.black;
  ScrollController controllist = ScrollController();

  TextEditingController controll = TextEditingController();
  late String massege;
  bool scrol = true;
  CollectionReference masseges =
      FirebaseFirestore.instance.collection('massege');

  @override
  Widget build(BuildContext context) {
    var email = ModalRoute.of(context)!.settings.arguments;
    return StreamBuilder<QuerySnapshot>(
        stream: masseges.orderBy('created', descending: true).snapshots(),
        builder: (context, snapshot) {
          dynamic data;
          List<Map> massegelist = [];
          //Map<String,dynamic>? massegelist = {};
          if (snapshot.hasData) {
            data = snapshot.data!.docs;
            //  print( snapshot.data!.docs[0]["massege"]);
            for (int i = 0; i < snapshot.data!.docs.length; i++) {
              // ignore: avoid_print
              print(data[i]["massege"]);
              dynamic a = data[i]["massege"];
              dynamic e = data[i]["email"];
              massegelist.add({"massege": a, "email": e});
            }
            // print(data[1]);
            return GestureDetector(
              onTap: () {
                FocusScope.of(context).unfocus();
              },
              child: Scaffold(
                appBar: AppBar(
                  automaticallyImplyLeading: false,
                  backgroundColor: const Color(0xff2B475E),
                  title: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        "assets/images/scholar.png",
                        height: 52,
                      ),
                      const Text("Chat")
                    ],
                  ),
                ),
                body: Column(
                  children: [
                    Expanded(
                        child: ListView.builder(
                      reverse: true,
                      controller: controllist,
                      itemBuilder: ((context, index) {
                        if (scrol) {
                          WidgetsBinding.instance.addPostFrameCallback((_) => {
                                controllist.jumpTo(
                                    controllist.position.minScrollExtent)
                              });
                        }
                        scrol = false;
                        return massegelist[index]["email"] == email
                            ? sendmassenge(
                                sendmassege: massegelist[index]["massege"],
                              )
                            : revmassege(
                                Rmassege: massegelist[index]["massege"],
                              );
                      }),
                      itemCount: snapshot.data!.docs.length,
                    )),
                    GestureDetector(
                      onTap: () {
                        WidgetsBinding.instance.addPostFrameCallback((_) => {
                              controllist
                                  .jumpTo(controllist.position.maxScrollExtent)
                            });
                      },
                      child: Container(
                        color: const Color.fromARGB(255, 231, 231, 231),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 6, horizontal: 12),
                          child: gettext(
                            user: (value) {
                              massege = value;
                            },
                            supmited: (value) {
                              try {
                                controll.clear();

                                
                                masseges.add({
                                  "massege": value,
                                  "created": DateTime.now(),
                                  "email": email
                                });
                                // ignore: empty_catches
                              } catch (e) {}
                            },
                            contrl: controll,
                            width: .5,
                            ispassword: false,
                            label: "",
                            color: color,
                            widgett: IconButton(
                              icon: const Icon(Icons.send),
                              onPressed: () {
                                try {
                                  controll.clear();

                                  // FocusScope.of(context).unfocus();
                                  masseges.add({
                                    "massege": massege,
                                    "created": DateTime.now(),
                                    "email": email
                                  });
                                  // ignore: empty_catches
                                } catch (e) {}
                              },
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          } else {
            return const ModalProgressHUD(inAsyncCall: true, child: Scaffold());
          }
        });
  }

  void clrear() {
    controll.clear();
  }
}
