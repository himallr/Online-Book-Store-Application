import 'package:flutter/material.dart';

class BookItemTitle extends StatelessWidget {
  final String bookname;
  final String bookprice;
  final String bookpath;
  final color;
  void Function()? onPressed;

  BookItemTitle({
    Key? key,
    required this.bookname,
    required this.bookprice,
    required this.bookpath,
    required this.color,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Container(
        height: 400,
        decoration: BoxDecoration(
          color: color[100],
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Image.asset(
              bookpath,
              height: 150,
            ),
            Text(bookname),
            MaterialButton(
              onPressed: onPressed,
              color: color[800],
              child: Text(
                "Rs." + bookprice,
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
      //),
    );
  }
}
