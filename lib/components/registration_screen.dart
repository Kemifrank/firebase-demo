// ignore_for_file: prefer_const_constructors
import 'dart:convert';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_demo/components/login_screen.dart';
import 'package:flutter/material.dart';

import 'login_screen.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  Future creatAccount() async {
    final UserCredential userCredential;
    try {
      userCredential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(
              email: _emailController.text.trim(),
              password: _passwordController.text.trim());

      await userCredential.user!.sendEmailVerification();

      if (userCredential != null) {
        // ignore: use_build_context_synchronously
        showDialog(
            context: context,
            builder: (context) => AlertDialog(
                  title: Text('Account Created'),
                  content: Text('Your Account has been created successfully'),
                  actions: [
                    TextButton(
                        onPressed: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context) => LoginPage()));
                        },
                        style: TextButton.styleFrom(
                          backgroundColor: Color.fromARGB(255, 99, 3, 62),
                        ),
                        child: Text(
                          'OK',
                          style: TextStyle(color: Colors.white),
                        ))
                  ],
                ));
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        showDialog(
            context: context,
            builder: (context) => const AlertDialog(
                  title: Text('Password is Weak'),
                ));
      } else if (e.code == 'email-already-in-use') {
        showDialog(
            context: context,
            builder: (context) => const AlertDialog(
                  title: Text('Email Already in Use'),
                ));
      }
    }
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
                const SizedBox(
                  height: 20,
                ),
                const Text(
                  'Sip&Savor!!',
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.black),
                ),
                const SizedBox(
                  height: 20,
                ),
                Text(
                  ' Sign up  and savor every sip!"',
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey[700]),
                ),
                const SizedBox(height: 30),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25),
                  child: TextField(
                    controller: _emailController,
                    autocorrect: false,
                    enableSuggestions: false,
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
                    controller: _passwordController,
                    obscureText: true,
                    enableSuggestions: false,
                    autocorrect: false,
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
                      creatAccount();
                    },
                    child: Container(
                      padding: EdgeInsets.all(20),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          color: Color.fromARGB(255, 99, 3, 62)),
                      child: const Center(
                        child: Text(
                          'Create Account',
                          style: TextStyle(fontSize: 18, color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                const Text('Already have an Account?'),
                GestureDetector(
                  onTap: () {
                    // Navigator.push(context, MaterialPageRoute());
                  },
                  child: const Text('Sign in',
                      style: TextStyle(
                          color: Color.fromARGB(255, 99, 3, 62),
                          decoration: TextDecoration.underline)),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
