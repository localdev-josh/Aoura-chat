import 'package:aoura_chat/resources/firebase_repository.dart';
import 'package:aoura_chat/pages/intro/intro_page.dart';
import 'package:aoura_chat/widgets/styleguide/responsive_ui/size_config.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
//    Firestore.instance.collection("users").document().setData({
//      "name": "localdev"
//    });
    FirebaseRepository _repository = FirebaseRepository();

    return LayoutBuilder(builder: (context, constraints) {
      return OrientationBuilder(builder: (context, orientation) {
        SizeConfig().init(constraints, orientation);
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Aoura Chat',
          theme: ThemeData(
            primarySwatch: Colors.blue,
            visualDensity: VisualDensity.adaptivePlatformDensity,
          ),
          home: IntroPage(title: 'Intro Page')
        );
      });
    });
  }
}