import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:simppm_unh/provider/authProvider.dart';
import 'package:simppm_unh/util/widget.dart';

import 'bottomBar.dart';

class LoginView extends StatefulWidget {
  @override
  _LoginViewState createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  String email, password;
  final formKey = new GlobalKey<FormState>();

  bool _secureText = true;

  @override
  // ignore: missing_return
  Widget build(BuildContext context) {
    double widthScreen = MediaQuery.of(context).size.width;
    double heightScreen = MediaQuery.of(context).size.height;
    AuthProvider auth = Provider.of<AuthProvider>(context);
    var label = Text("Sign In",
        style: TextStyle(
            fontSize: 25, fontWeight: FontWeight.w500, color: Colors.black87));
    var forgotText = Padding(
      padding: const EdgeInsets.only(top: 20),
      child: Text("Lupa Password?",
          style: TextStyle(color: Colors.black87, fontSize: 15)),
    );
    final emailField = Container(
        margin: EdgeInsets.only(top: 15),
        width: widthScreen * 0.7,
        height: 50,
        child: TextFormField(
            onSaved: (value) => email = value,
            validator: (value) => value.isEmpty ? "Please enter email" : null,
            decoration: InputDecoration(
              hintText: "Email",
              hintStyle: TextStyle(),
              filled: true,
              fillColor: Colors.grey[200],
              prefixIcon: Icon(
                Icons.email,
                color: Colors.indigo,
              ),
              contentPadding: EdgeInsets.all(10),
              focusColor: Colors.indigo,
              focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.indigo[300])),
            )));

    final passwordField = Container(
        margin: EdgeInsets.only(top: 15),
        width: widthScreen * 0.7,
        height: 50,
        child: TextFormField(
            onSaved: (value) => password = value,
            validator: (value) =>
                value.isEmpty ? "Please enter password" : null,
            obscureText: _secureText,
            decoration: InputDecoration(
              suffixIcon: IconButton(
                  icon: Icon(
                      _secureText ? Icons.visibility_off : Icons.visibility),
                  onPressed: () {}),
              hintText: "Password",
              hintStyle: TextStyle(),
              filled: true,
              fillColor: Colors.grey[200],
              prefixIcon: Icon(
                Icons.vpn_key,
                color: Colors.indigo,
              ),
              contentPadding: EdgeInsets.all(10),
              focusColor: Colors.indigo,
              focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.indigo[300])),
            )));
    // ignore: unused_local_variable
    final button = Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        InkWell(
          onTap: () {},
          child: Container(
              margin: EdgeInsets.only(top: 20),
              width: widthScreen * 0.3,
              height: 40,
              child: Center(
                child: Text(
                  "Sign In",
                  style: TextStyle(color: Colors.white),
                ),
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                color: Colors.indigo,
              )),
        ),
        InkWell(
          onTap: () {},
          child: Container(
              margin: EdgeInsets.only(top: 20),
              width: widthScreen * 0.3,
              height: 40,
              child: Center(
                child: Text(
                  "Guest",
                  style: TextStyle(color: Colors.white),
                ),
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                color: Colors.grey,
              )),
        ),
      ],
    );
    var doLogin = () {
      final form = formKey.currentState;

      if (form.validate()) {
        form.save();

        // final Future<Map<String, dynamic>> succesfullMessage =
        //     auth.login(email, password);

        auth.login(email, password);
        // Navigator.pushReplacementNamed(context, '/bottomBar');
        // succesfullMessage.then((response) {
        //   if (response['status']) {
        //     // UserModel user = response['user'];
        //     // Provider.of<UserProvider>(context, listen: false).setUser(user);
        //     // print(user);
        //     // Navigator.pushReplacementNamed(context, '/bottomBar');
        //   } else {
        //     Flushbar(
        //       title: "Failed Login",
        //       message: response['message']['message'].toString(),
        //       duration: Duration(seconds: 3),
        //     ).show(context);
        //   }
        // });
      } else {
        print('form is invalid');
      }
    };
    switch (auth.loggedInStatus) {
      case Status.NotLoggedIn:
        return Scaffold(
          body: Stack(children: [
            Container(
              padding: EdgeInsets.only(top: 50),
              width: widthScreen,
              height: heightScreen,
              color: Colors.indigo,
              child: Align(
                alignment: Alignment.topCenter,
                child: Column(
                  children: [
                    Text("SIMPPM STMIK NH",
                        style: TextStyle(color: Colors.white)),
                  ],
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                width: widthScreen,
                height: heightScreen * 0.7,
                padding: EdgeInsets.all(15),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(30),
                        topRight: Radius.circular(30)),
                    color: Colors.white),
                child: SingleChildScrollView(
                  child: Form(
                    key: formKey,
                    child: Column(
                      children: [
                        label,
                        emailField,
                        passwordField,
                        SizedBox(
                          height: 20,
                        ),
                        longButtons("Sign In", doLogin, widthScreen * 0.6),
                        forgotText
                      ],
                    ),
                  ),
                ),
              ),
            )
          ]),
        );
        break;
      case Status.LoggedIn:
        return BottomAppBarUi();
    }
  }
}
