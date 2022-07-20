import 'package:flutter/material.dart';
import 'firebaseAuth.dart';
import 'SignUpPage.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({Key? key}) : super(key: key);

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  String? signInStatusMessage;

  void sign_up({required String email, required String password}) async {
    if (email.contains('@') != true) {
      signInStatusMessage = 'Invalid email address';
    } else if (password.length <= 5) {
      signInStatusMessage = 'Password is too short';
    } else {
      final user = Auth(email: email, password: password);
      var signUpStatus = user.signIn();
      setState(() {
        signInStatusMessage = '';
      });
      signInStatusMessage = await signUpStatus;
      while (signInStatusMessage == '') {
        await Future.delayed(Duration(seconds: 1));
        signInStatusMessage = await signUpStatus;
      }
      setState(() {
        signInStatusMessage;
      });
      if (signInStatusMessage == 'User created') {
        await Future.delayed(Duration(seconds: 2));
        user.signIn();
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(children: [
        Container(
          margin: const EdgeInsets.fromLTRB(5, 205, 5, 0),
          child: Container(
              color: const Color(0xFFFAFAFA),
              child: Column(children: [
                Align(
                  alignment: Alignment.topCenter,
                  child: Container(
                    margin: const EdgeInsets.fromLTRB(0, 15, 0, 5),
                    child: const Text('Sign in',
                        style: TextStyle(
                            fontSize: 32,
                            color: Color(0xFF1F2226),
                            fontWeight: FontWeight.bold)),
                  ),
                ),
                Align(
                    child: Column(children: [
                  Card(
                    shadowColor: Colors.transparent,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    color: const Color(0xFFFFFFFF),
                    margin: const EdgeInsets.fromLTRB(17, 30, 17, 0),
                    child: Container(
                      margin: const EdgeInsets.fromLTRB(15, 7, 5, 0),
                      child: TextField(
                        controller: emailController,
                        obscureText: false,
                        decoration: const InputDecoration(
                          labelText: 'Email Adress',
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                  ),
                  Card(
                    shadowColor: Colors.transparent,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    color: const Color(0xFFFFFFFF),
                    margin: const EdgeInsets.fromLTRB(17, 30, 17, 0),
                    child: Container(
                      margin: const EdgeInsets.fromLTRB(15, 7, 5, 0),
                      child: TextField(
                          controller: passwordController,
                          obscureText: true,
                          decoration: const InputDecoration(
                            labelText: 'Password',
                            border: InputBorder.none,
                          )),
                    ),
                  ),
                  Container(
                      margin: const EdgeInsets.fromLTRB(0, 10, 0, 10),
                      child: signInStatusMessage != null &&
                              signInStatusMessage != 'User created'
                          ? Text(signInStatusMessage.toString(),
                              style: TextStyle(
                                  color: Color.fromARGB(255, 240, 78, 67)))
                          : signInStatusMessage == 'User created'
                              ? Text('$signInStatusMessage! Signing in',
                                  style: const TextStyle(
                                      color:
                                          Color.fromARGB(255, 100, 195, 103)))
                              : Container()),
                  Container(
                    margin: const EdgeInsets.fromLTRB(17, 0, 17, 0),
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          minimumSize: const Size(500, 50),
                          primary: const Color(0xFFFBB827),
                          shadowColor: Colors.transparent,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                        ),
                        child: const Text('Sign in'),
                        onPressed: () => sign_up(
                            email: emailController.text,
                            password: passwordController.text)),
                  ),
                  signInStatusMessage == 'User created'
                      ? Container(
                          child: CircularProgressIndicator(),
                          margin: const EdgeInsets.fromLTRB(0, 35, 0, 0),
                        )
                      : Container(),
                  signInStatusMessage != 'User created'
                      ? Container(
                          child: FlatButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              child:
                                  const Text('Dont have an account? Sign up.')),
                          margin: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                        )
                      : Container()
                ]))
              ])),
        )
      ]),
    );
  }
}
