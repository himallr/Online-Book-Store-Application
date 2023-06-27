import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';
import 'package:book_shopping_app/components/book_item_title.dart';
import 'package:provider/provider.dart';
import '../model/cart_model.dart';
import '../pages/cart_page.dart';

class ComicPage extends StatelessWidget {
  const ComicPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
      body: SafeArea(

        child: Column(
          children: [
            //const SizedBox(height: 40),
            // Container(
            //   child: ElevatedButton(
            //     onPressed: () {
            //       Navigator.pop(context);
            //     },
            //     child: const Text('Go back!'),
            //   ),
            // ),
            const SizedBox(height: 48),
            const Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: Text(
                  "Welcome!"
              ),
            ),

            const SizedBox(height: 4),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: Text(
                "Look at the Comic Books",
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

            const SizedBox(height: 4),

            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.0),
              child: Text("Different Types of Books are presented here!",
                style: TextStyle(
                  fontSize: 16,
                ),

              ),
            ),

            Expanded(
              child: Consumer<CartModel>(
                builder: (context,value,child){
                  return GridView.builder(
                    itemCount: value.com_Items.length,
                    gridDelegate:
                    const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio : 0.7,
                    ),
                    itemBuilder: (context,index){
                      return BookItemTitle(
                        bookname: value.com_Items[index][0],
                        bookprice: value.com_Items[index][1],
                        bookpath: value.com_Items[index][2],
                        color: value.com_Items[index][3],
                        onPressed: (){
                          Provider.of<CartModel>(context,listen: false).addItemToCartCom(index);
                        },
                      );
                    },
                  );
                },
              ),
            ),

          ],
        ),
      ),
    );
  }
}
