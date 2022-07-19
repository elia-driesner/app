import 'package:flutter/material.dart';

class signInPage extends StatefulWidget {
  const signInPage({Key? key}) : super(key: key);

  @override
  State<signInPage> createState() => _signInPageState();
}

class _signInPageState extends State<signInPage> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  void sign_up({required String email, required String password}) {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(children: [
        Container(
          margin: const EdgeInsets.fromLTRB(5, 160, 5, 0),
          child: Container(
              color: const Color(0xFFFAFAFA),
              child: Column(children: [
                Align(
                  alignment: Alignment.topCenter,
                  child: Container(
                    margin: const EdgeInsets.fromLTRB(0, 15, 0, 5),
                    child: const Text('Log in',
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
                    margin: const EdgeInsets.fromLTRB(17, 35, 17, 0),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        minimumSize: const Size(500, 50),
                        primary: const Color(0xFFFBB827),
                        shadowColor: Colors.transparent,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                      ),
                      child: const Text('Log in'),
                      onPressed: () => {debugPrint(emailController.text)},
                    ),
                  )
                ]))
              ])),
        )
      ]),
    );
  }
}
