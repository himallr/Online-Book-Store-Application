import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';
import 'package:book_shopping_app/pages/home_page.dart';
import 'fictionpage.dart';
import 'package:book_shopping_app/pages/Login_page.dart';

class NewPage extends StatelessWidget{
  const NewPage();

  Widget build(BuildContext context){
    return Scaffold(
      body: Column(
        children: [
          Padding(padding: EdgeInsets.only(top: 50)),
          GestureDetector(
            onTap: ()=>Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context){
                  return const LoginPage();
                },
              ),
            ),
            child: Container(
              decoration: BoxDecoration(
                  color: Colors.black87,
                  borderRadius: BorderRadius.circular(20)
              ),
              padding: const EdgeInsets.all(15),
              child: const Text("LOGIN",
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
          ),
          Padding(padding: EdgeInsets.only(top: 20)),
          Container(
            child: Text(
              "Online Book Store",
              style:TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Padding(padding: const EdgeInsets.all(20.0),
            child: Image.asset(
                'lib/images/book.jpg',
              height: 300,
              width: 500,
            ),

          ),
          const Padding(
            padding: const EdgeInsets.all(24.0),
            child: Text(
              "We deliver Books at your doorsteps",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 30,
            ),),
          ),
          const Text(
            "New kinds of Books are available"
          ),
          const Spacer(),
          GestureDetector(
            onTap: ()=>Navigator.pushReplacement(
                context,
                MaterialPageRoute(
            builder: (context){
            return const HomePage();
            },
          ),
            ),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.purpleAccent,
                borderRadius: BorderRadius.circular(20)
              ),
              padding: const EdgeInsets.all(15),
              child: const Text("Get Started",
              style: TextStyle(
                color: Colors.white,
              ),
              ),
            ),
          ),
          const Spacer(),
        ],
      ),
    );
  }

}