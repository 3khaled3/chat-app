import 'package:chatapp/loginscreen.dart';
import 'package:chatapp/widget/chat_padge.dart';
import 'package:chatapp/widget/registerpadge.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'firebase_options.dart';

main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MaterialApp(
    routes: {
      register.id: (context) => const register(),
      login.id: ((context) => const login()),
      chatScreen.id :(context) =>  const chatScreen(),
    },
    debugShowCheckedModeBanner: false,
    home:    const login(),
  ));
}
