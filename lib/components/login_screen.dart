// import 'dart:math';
// ignore_for_file: use_build_context_synchronously, unnecessary_null_comparison

import 'package:firebase_demo/components/home_screen.dart';
import 'package:flutter/material.dart';
import "package:firebase_auth/firebase_auth.dart";

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  Future login() async {
    try {
      UserCredential userCredential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(
              email: emailController.text, password: passwordController.text);

      // DocumentSnapshot<Object?> userSnapshot =
      //     await usersCollection.doc(userCredential.user?.uid).get();
      // user = UserModel(
      //   id: userSnapshot.get('id'),
      //   email: userSnapshot.get('email'),
      // );

      if (userCredential != null) {
        showDialog(
            context: context,
            builder: (context) => AlertDialog(
                  title: const Text('Status'),
                  content: const Text('Logged in Successful'),
                  actions: [
                    TextButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const HomePage()));
                      },
                      child: const Text('Proceed'),
                    )
                  ],
                ));
      }
    } on FirebaseException catch (e) {
      if (e.code == 'invalid-email') {
        showDialog(
            context: context,
            builder: (context) => const AlertDialog(
                  title: Text('Email is Invalid'),
                ));
      } else if (e.code == 'user-not-found') {
        showDialog(
            context: context,
            builder: (context) => const AlertDialog(
                  title: Text('User not Found'),
                ));
      } else if (e.code == 'wrong-password') {
        showDialog(
            context: context,
            builder: (context) => const AlertDialog(
                  title: Text('Your Password is Wrong'),
                ));
      }
    }
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Image.asset('lib/images/loginn.png', width: 200, height: 200),
                const SizedBox(
                  height: 20,
                ),
                const Text(
                  'WelCome Back!!!',
                  style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      color: Colors.black),
                ),
                const SizedBox(
                  height: 20,
                ),
                Text(
                  ' Login to Take one Sip at a Time',
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey[700]),
                ),
                const SizedBox(height: 30),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25),
                  child: TextField(
                    controller: emailController,
                    autocorrect: false,
                    enableSuggestions: false,
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: const BorderSide(
                              color: Color.fromARGB(255, 99, 3, 62))),
                      filled: true,
                      fillColor: Colors.grey[200],
                      hintText: 'Email',
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: const BorderSide(
                          color: Color.fromARGB(255, 99, 3, 62),
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25),
                  child: TextField(
                    controller: passwordController,
                    obscureText: true,
                    decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                            borderSide: const BorderSide(
                                color: Color.fromARGB(255, 99, 3, 62))),
                        filled: true,
                        fillColor: Colors.grey[200],
                        hintText: 'Password',
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                            borderSide: const BorderSide(
                              color: Color.fromARGB(255, 99, 3, 62),
                            ))),
                  ),
                ),
                const SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const HomePage()));
                    },
                    child: Container(
                      padding: EdgeInsets.all(20),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          color: Color.fromARGB(255, 99, 3, 62)),
                      child: const Center(
                        child: Text(
                          'Login',
                          style: TextStyle(fontSize: 18, color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
