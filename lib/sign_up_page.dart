import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class SignUp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xff090F32),
      child: Column(
        children: <Widget>[
          Expanded(
              child: Center(
            child: Container(
              width: double.infinity,
              child: Center(
                child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Text("Sign up",
                          style: TextStyle(color: Colors.white, fontSize: 50.0)),
                      SizedBox(
                        height: 10.0,
                      ),
                      Text(
                        "Enter your details to  create account",
                        style: TextStyle(fontSize: 17.0, color: Colors.white),
                      )
                    ]),
              ),
            ),
          )),
          Expanded(
              flex:2,
              child: Container(
                  child: ListView(
                 children: [Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: <Widget>[
                        MyTextField("Enter Full Name", 1.0),
                        MyTextField("Enter Email", 1.0),
                        MyTextField("Enter Phone", 1.0),
                        MyTextField("Password", 1.0),
                      ],
                    )],
                  ),
                ),
              ),
          Expanded(
              child: Container(
                  child: Column(
            children: <Widget>[
              Reusablecard(),
              Text("Already have an account? Login",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),
            ],
          )))
        ],
      ),
    );
  }
}

class MyTextField extends StatelessWidget {
  @override
  MyTextField(this.hintMessage, this.op);
  var hintMessage;
  var op;

  Widget build(BuildContext context) {
    return Opacity(
      opacity: op,
      child: Padding(
        padding: EdgeInsets.all(10.0),
        child: Container(
          margin: EdgeInsets.only(right: 30.0, left: 30.0),
          decoration: BoxDecoration(
            boxShadow:[BoxShadow(
              color: Colors.pink,
              blurRadius: 0.0,
              offset: Offset(3,3),
            )],
            color: Colors.white,
            borderRadius: BorderRadius.circular(10.0),
          ),
          child: Padding(
            padding: EdgeInsets.all(10.0),
            child: TextField(
              decoration: InputDecoration(
                fillColor: Colors.white,
                border: InputBorder.none,
                hintText:hintMessage,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class Reusablecard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(10.0),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.pink,
        ),
        margin: EdgeInsets.only(right: 30, left: 30, bottom: 20),
        height: 50.0,
        child: Center(
            child: Text(
          "Register",
          style: TextStyle(
              color: Colors.white, fontSize: 25.0, fontWeight: FontWeight.bold),
        )),
      ),
    );
  }
}
