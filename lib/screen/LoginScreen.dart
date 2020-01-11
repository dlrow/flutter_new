import 'package:flutter/material.dart';
import 'package:flutter_app/util/Constants.dart';

class LoginScreen extends StatelessWidget with Constants {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //appBar: AppBar(title: Text(TASK_SCREEN_APP_BAR_TITLE),),
      body: Stack(
        children: <Widget>[background, content],
      ),
    );
  }

  get background => Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage('Assets/image1.png'),
                fit: BoxFit.fitWidth,
                alignment: Alignment.topCenter)),
      );

  get content => Container(
        //width: MediaQuery.of(context).size.width,
        margin: EdgeInsets.only(top: 270),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Colors.white,
        ),
        child: Padding(
          padding: EdgeInsets.all(23),
          child: ListView(
            children: <Widget>[
              phoneNumField,
              pinField,
              signInButton,
              forgotPasswordButton,
            ],
          ),
        ),
      );

  get phoneNumField => Padding(
    padding: EdgeInsets.fromLTRB(0, 20, 0, 20),
    child: Container(
      color: Color(0xfff5f5f5),
      child: TextFormField(
        keyboardType: TextInputType.number,
        style: TextStyle(
            color: Colors.black, fontFamily: 'SFUIDisplay'),
        decoration: InputDecoration(
            border: OutlineInputBorder(),
            labelText: 'Phone',
            prefixIcon: Icon(Icons.person_outline),
            labelStyle: TextStyle(fontSize: 15)),
      ),
    ),
  );

  get pinField =>Container(
    color: Color(0xfff5f5f5),
    child: TextFormField(
      obscureText: true,
      keyboardType: TextInputType.number,
      style:
      TextStyle(color: Colors.black, fontFamily: 'SFUIDisplay'),
      decoration: InputDecoration(
          border: OutlineInputBorder(),
          labelText: 'pin',
          prefixIcon: Icon(Icons.lock_outline),
          labelStyle: TextStyle(fontSize: 15)),
    ),
  );

  get signInButton => Padding(
    padding: EdgeInsets.only(top: 20),
    child: MaterialButton(
      onPressed: () {}, //since this is only a UI app
      child: Text(
        'SIGN IN',
        style: TextStyle(
          fontSize: 15,
          fontFamily: 'SFUIDisplay',
          fontWeight: FontWeight.bold,
        ),
      ),
      color: Color(0xffff2d55),
      elevation: 0,
      minWidth: 400,
      height: 50,
      textColor: Colors.white,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10)),
    ),
  );

  get forgotPasswordButton => Padding(
    padding: EdgeInsets.only(top: 20),
    child: Center(
      child: Text(
        'Fogot your password?',
        style: TextStyle(
            fontFamily: 'SFUIDisplay',
            fontSize: 15,
            fontWeight: FontWeight.bold),
      ),
    ),
  );

  /*get registerUserButton => Padding(
                  padding: EdgeInsets.only(top: 30),
                  child: Center(
                    child: RichText(
                      text: TextSpan(
                          children: [
                            TextSpan(
                                text: "Don't have an account?",
                                style: TextStyle(
                                  fontFamily: 'SFUIDisplay',
                                  color: Colors.black,
                                  fontSize: 15,
                                )
                            ),
                            TextSpan(
                                text: "sign up",
                                style: TextStyle(
                                  fontFamily: 'SFUIDisplay',
                                  color: Color(0xffff2d55),
                                  fontSize: 15,
                                )
                            )
                          ]
                      ),
                    ),
                  ),
                )*/
}
