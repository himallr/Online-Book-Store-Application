import 'package:book_shopping_app/provider/auth_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';
import 'package:book_shopping_app/pages/comicpage.dart';
import 'package:book_shopping_app/pages/fantasypage.dart';
import 'package:book_shopping_app/pages/fictionpage.dart';
import 'package:provider/provider.dart';

import 'cart_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final authProvider = Provider.of<AuthProvider>(context);

    return Scaffold(
    appBar: AppBar(actions: [IconButton(onPressed: () => authProvider.signOut(), icon: Icon(Icons.logout))],),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.push(context,
          MaterialPageRoute(builder: (context)
          {
            return CartPage();
          },
          ),
        ),
        backgroundColor: Colors.black,
        child: Icon(Icons.shopping_bag_rounded),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(padding: EdgeInsets.only(top: 50)),
              const Padding(
              padding: EdgeInsets.symmetric(horizontal: 48.0, vertical: 10.0),
              child: Text(
                "Welcome",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(height: 4),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: Text(
                "Here are different types of Books available in our Site!",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(height: 4),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.0),
              child: Divider(
                thickness: 4,
              ),
            ),
            const SizedBox(height: 20),
            const SizedBox(height: 4),
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Image.asset(
                    'lib/images/fiction.jpg',
                    height: 150,
                  ),
                  Text("Fiction"),
                  ElevatedButton(
                    child: const Text('Browse'),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const FictionPage()),
                      );
                    },
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Image.asset(
                    'lib/images/comic.jpg',
                    height: 150,
                  ),
                  Text("Comics"),
                  ElevatedButton(
                    child: const Text('Browse'),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const ComicPage()),
                      );
                    },
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Image.asset(
                    'lib/images/fantasy.jpg',
                    height: 150,
                  ),
                  Text("Fantasy"),
                  ElevatedButton(
                    child: const Text('Browse'),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const FantasyPage()),
                      );
                    },
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
           // ),
          ],
        ),
      ),
    );
  }
}
