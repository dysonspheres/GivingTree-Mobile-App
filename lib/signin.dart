import 'package:donationdrive/navigation.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';
import 'package:donationdrive/Auth.dart';


class signin extends StatefulWidget {
  @override
  signinState createState() => signinState();
}

class signinState extends State<signin> {
  FirebaseUser user;

  @override
  Widget build(BuildContext context) {
      return Scaffold(
        appBar: AppBar(
          title: Text('Google Sign In'),
          backgroundColor: Colors.brown[200],
        ),
         body: Column(
            children: [
            Spacer(),
            //Body(),
            SizedBox(height: 10),
            Center(
              child: SignInButton(
                Buttons.Google,
                onPressed: () {
                  signInWithGoogle().then((user)=> {
                    this.user = user,
                    Navigator.push(
                      context,
                    MaterialPageRoute(
                      builder: (context) => NavigationPage(user.displayName)))
                  });
                }
              ),
              ),
            SizedBox(height: 10),
            Spacer(),
        ],
        ),
        backgroundColor: Colors.lightGreen[50],
      );
    }
  }

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  FirebaseUser user;

  void click() {
    signInWithGoogle().then((user) => {
      this.user = user,
      Navigator.push(
          context,
          MaterialPageRoute(
            //       builder: (context) => MyHomePage(user.displayName)))
              builder: (context) => NavigationPage(user.displayName)))
    });
  }
  Widget intro() {
    Text('Points',
        style: TextStyle(
            color: Colors.blueGrey[400],
            fontSize: 20,
            fontStyle: FontStyle.italic,
            fontWeight: FontWeight.bold));
  }

  Widget googleLoginButton() {
    return OutlineButton(
        onPressed: this.click,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(45)),
        splashColor: Colors.grey,
        borderSide: BorderSide(color: Colors.grey),
        child: Padding(
            padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
            child: Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Image(
                      image: AssetImage('assets/google logo.png'), height: 35),
                  Padding(
                      padding: EdgeInsets.only(left: 10),
                      child: Text(
                        'Sign in With Google',
                        style: TextStyle(color: Colors.grey, fontSize: 25),
                      ))
                ])));
  }

  @override
  Widget build(BuildContext context) {
    return Align(alignment: Alignment.center, child: googleLoginButton());
  }
}