import 'package:flutter/material.dart';

class FictionItem extends StatelessWidget {

  final String bookname;
  final String bookprice;
  final String bookpath;
  final color;

  const FictionItem({
    Key? key,
    required this.bookname,
    required this.bookprice,
    required this.bookpath,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Container(
        decoration: BoxDecoration(
          color: color[100],
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Image.asset(
              bookpath,
              height: 150,),
            Text(bookname),
            MaterialButton(
              onPressed: (){},
              color: color[500],
              child: Text(
                'Rs.' + bookprice,
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
