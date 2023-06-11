import 'dart:io';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:multi_vendor_demo_admin/views/screens/main_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: kIsWeb || Platform.isAndroid? FirebaseOptions(apiKey: "AIzaSyAukbtxcHrDtfv0cVoX1YwgAOsir8yLBjw", 
    appId: "1:123153770352:web:0a688ce31b1a24bc5b51b5", 
    messagingSenderId: "123153770352", 
    projectId: "multi-store-demo-ec6fb", 
    storageBucket: "multi-store-demo-ec6fb.appspot.com"): null
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: MainScreen(),
       builder: EasyLoading.init(),
    );
  }
}
