import 'package:firebase_crud_app/app_widgets.dart';
import 'package:firebase_crud_app/fireabase_auth_helper.dart';
import 'package:flutter/material.dart';

class DemoScreen extends StatefulWidget {
  const DemoScreen({super.key});

  @override
  State<DemoScreen> createState() => _DemoScreenState();
}

class _DemoScreenState extends State<DemoScreen> {
  TextEditingController emailCont = new TextEditingController();
  TextEditingController pwdCont = new TextEditingController();
  FireabaseAuthHelper auth_model = FireabaseAuthHelper();

  bool showLoader = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Auth Demo"),
        ),
        body: Stack(
          children: [
            LoginForm(),
            showLoader == true
                ? Center(
                    child: CircularProgressIndicator(),
                  )
                : Text('')
          ],
        ));
  }

  LoginForm() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      child: Column(
        children: [
          TextField(
            controller: emailCont,
            decoration: fieldInputDecoration('Email'),
          ),
          SizedBox(
            height: 20,
          ),
          TextField(
              controller: pwdCont,
              decoration: fieldInputDecoration('Password')),
          SizedBox(
            height: 20,
          ),
          ElevatedButton(
              style: roundedButtonStyle(),
              onPressed: () async {
                toggleLoader();
                var message =
                    await auth_model.signIn(emailCont.text, pwdCont.text);
                showMessage(context, message);
                toggleLoader();
              },
              child: Text("Login")),
          SizedBox(
            height: 20,
          ),
          ElevatedButton(
              style: roundedButtonStyle(),
              onPressed: () async {
                toggleLoader();
                var message = await auth_model.createAccount(
                    emailCont.text, pwdCont.text);

                showMessage(context, message);
                toggleLoader();
              },
              child: Text("Create Account")),
          SizedBox(
            height: 20,
          ),
          ElevatedButton(
              style: roundedButtonStyle(btnColor: Colors.yellow),
              onPressed: () async {
                toggleLoader();
                await auth_model.signInWithGoogle();
                toggleLoader();
              },
              child: Text("Login With Gmail")),
          SizedBox(
            height: 20,
          ),
          ElevatedButton(
              style: roundedButtonStyle(btnColor: Colors.blue),
              onPressed: () async {
                toggleLoader();
                await auth_model.signInWithFacebook();
                toggleLoader();
              },
              child: Text("Login With Facebook")),
        ],
      ),
    );
  }

  toggleLoader() {
    showLoader = !showLoader;
    setState(() {});
  }
}
