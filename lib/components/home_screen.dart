import 'package:flutter/material.dart';



class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(0, 0, 0, 0),
        title: const Text('Home Page',
        style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Color.fromARGB(255, 99, 3, 62),
              
              ),
        ),
        elevation: 0,
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const[
          Padding(
            padding: EdgeInsets.all(25),
            child: Center(
              child: Text('Welcome to Our App',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              
              ),),
            ),
          )
        ],
      ),
    );
  }
}