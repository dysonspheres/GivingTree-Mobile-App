import 'package:flutter/material.dart';
import 'package:donationdrive/navigation.dart';
import 'package:donationdrive/signin.dart';
import 'package:donationdrive/aboutUs.dart';
import 'package:donationdrive/list_viewer.dart';
import 'package:donationdrive/announcements.dart';
import 'package:donationdrive/RequestPickUp.dart';

void main() async {

  //WidgetsFlutterBinding.ensureInitialized();
  //await Firebase.initializeApp();

  runApp(MaterialApp(
      initialRoute: '/signin',
      routes: {
        //'/navigation': (context) => NavigationPage(),
        '/signin': (context) => signin(),
        '/aboutus' : (context) => aboutUs(),
        '/pick-up' : (context) => LinkGGForm(),
        '/driver' : (context) => list_viewer(),
        '/announcements' : (context) => announcements(),
      }
  ));
}