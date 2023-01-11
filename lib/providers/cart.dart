import 'package:flutter/foundation.dart';

class CartItem {
  final String id;
  final String title;
  final int quantity;
  final dynamic price;
  final String image;

  CartItem(
      {required this.id,
      required this.price,
      required this.quantity,
      required this.title,
      required this.image});
}

class Cart with ChangeNotifier {
  Map<dynamic, CartItem> _items = {};

  Map<dynamic, CartItem> get items {
    return {..._items};
  }

  int get itemCount {
    int count = 0;
    _items.forEach((productId, value) => count += value.quantity);
    return count;
  }

  double get totalAmount {
    var total = 0.0;
    _items.forEach((key, cartItem) {
      total += cartItem.price * cartItem.quantity;
    });
    return total;
  }

  void addItem(dynamic productId, dynamic price, String title, String image) {
    if (_items.containsKey(productId)) {
      //change quantity
      _items.update(
          productId,
          (existingCartItem) => CartItem(
              id: existingCartItem.id,
              title: existingCartItem.title,
              price: existingCartItem.price,
              quantity: existingCartItem.quantity + 1,
              image: existingCartItem.image));
    } else {
      _items.putIfAbsent(
        productId,
        () => CartItem(
          id: DateTime.now().toString(),
          title: title,
          price: price,
          quantity: 1,
          image: image,
        ),
      );
    }
    notifyListeners();
  }

  void removeItem(dynamic prouductId) {
    /*items.forEach(
      (key, value) {
        if (_items.containsKey(prouductId) && items[key].quantity > 1) {
          _items.update(
            prouductId,
            (i) => CartItem(
                id: i.id,
                price: i.price,
                quantity: i.quantity - 1,
                title: i.title),
          );
        } else {
          _items.remove(prouductId);
        }
        notifyListeners();
      },
    );*/
    _items.remove(prouductId); // remove the card
    notifyListeners();
  }

  addOrRemoveQuantity(dynamic productId, bool operators, int quantity) {
    //remove only one
    if (quantity == 1 && operators == false) {
      _items.remove(productId);
    } else if (quantity >= 1 && _items.containsKey(productId)) {
      _items.update(
        productId,
        (existingCartItem) => CartItem(
            id: existingCartItem.id,
            title: existingCartItem.title,
            price: existingCartItem.price,
            image: existingCartItem.image,
            quantity: operators
                ? existingCartItem.quantity + 1
                : existingCartItem.quantity - 1),
      );
    } else {
      _items.remove(productId);
    }
    notifyListeners();
  }

  void clear() {
    _items = {};
    notifyListeners();
  }

  void removeSingleItem(dynamic productId) {
    if (!_items.containsKey(productId)) {
      return;
    }
    if (_items[productId]!.quantity > 1) {
      _items.update(
        productId,
        (existingCartItem) => CartItem(
          id: existingCartItem.id,
          price: existingCartItem.price,
          quantity: existingCartItem.quantity - 1,
          title: existingCartItem.title,
          image: existingCartItem.image,
        ),
      );
    } else {
      _items.remove(productId);
    }
    notifyListeners();
  }
}
