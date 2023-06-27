import 'package:flutter/material.dart';

class CartModel extends ChangeNotifier{
  final List fic_Items=[
    ["The Great Gatsby", "999", "lib/images/fiction/thegreatgatsby.jpeg", Colors.green],
    ["A Death in Tokyo", "559", "lib/images/fiction/deathintokyo.jpg", Colors.yellow],
    ["The Girl in Room 105", "1999", "lib/images/fiction/thegirl105.jpg", Colors.yellow],
    ["Looking For Alaska", "1999", "lib/images/fiction/lookingforalaska.jpg", Colors.green],
    ["The Course of True Love","699","lib/images/fiction/thecourse.jpeg",Colors.green],
    ["Beloved","799","lib/images/fiction/beloved.jpeg",Colors.yellow],
  ];

  final List com_Items=[
    ["The Naruto ,Vol 1", "299", "lib/images/comics/naruto.jpg", Colors.green],
    ["The Spiderman", "559", "lib/images/comics/spiderman.jpg", Colors.yellow],
    ["Sunshine", "999", "lib/images/comics/sunshine.jpg", Colors.yellow],
    ["The Wolverine", "799", "lib/images/comics/wolverine.jpg", Colors.green],
  ];

  final List fan_Items=[
    ["The Dracula", "299", "lib/images/fantasy/dracula.jpg", Colors.green],
    ["The Last Dog", "559", "lib/images/fantasy/thelastdog.jpg", Colors.yellow],
    ["The Magic Factory", "999", "lib/images/fantasy/themagic.jpg", Colors.yellow],
    //["The Wolverine", "799", "lib/images/fantasy/wolverine.jpg", Colors.green],
  ];

  List _cartItems=[];
  get cartItems => _cartItems;

  get shopItems => fic_Items;

  get comicItems => com_Items;

  get fanItems => fan_Items;

  // Comics
  void addItemToCartCom(int index) {
    _cartItems.add(com_Items[index]);
    notifyListeners();
  }
  // remove item from cart
  // void removeItemFromCartCom(int index) {
  //   _cartItems.removeAt(index);
  //   notifyListeners();
  // }

  // Fiction
  void addItemToCart(int index) {
    _cartItems.add(fic_Items[index]);
    notifyListeners();
  }
  // remove item from cart
  void removeItemFromCart(int index) {
    _cartItems.removeAt(index);
    notifyListeners();
  }



  //Fantasy
  void addItemToCartFan(int index) {
    _cartItems.add(fan_Items[index]);
    notifyListeners();
  }
  // remove item from cart
  // void removeItemFromCartFan(int index) {
  //   _cartItems.removeAt(index);
  //   notifyListeners();
  // }

  String calculateTotal() {
    double totalPrice = 0;
    for (int i = 0; i < cartItems.length; i++) {
      totalPrice += double.parse(cartItems[i][1]);
    }
    return totalPrice.toStringAsFixed(2);
  }

}