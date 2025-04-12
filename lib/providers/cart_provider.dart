import 'package:flutter/foundation.dart';

class CartItem {
  final String id;
  final String title;
  final String color;
  final String price;
  final String imageUrl;
  int quantity;

  CartItem({
    required this.id,
    required this.title,
    required this.color,
    required this.price,
    required this.imageUrl,
    this.quantity = 1,
  });

  double get priceAsNumber => double.parse(price.replaceAll('¥', ''));
}

class CartProvider with ChangeNotifier {
  final Map<String, CartItem> _items = {
    '1': CartItem(
      id: '1',
      title: 'Bridesmaid Dress',
      color: 'Blue',
      price: '¥869.00',
      quantity: 1,
      imageUrl:
          'https://images.unsplash.com/photo-1515372039744-b8f02a3ae446?w=500&q=80',
    ),
    '2': CartItem(
      id: '2',
      title: 'Playsuit in Blush',
      color: 'Pink',
      price: '¥638.00',
      quantity: 2,
      imageUrl:
          'https://images.unsplash.com/photo-1539008835657-9e8e9680c956?w=500&q=80',
    ),
    '3': CartItem(
      id: '3',
      title: 'Leave with me dress',
      color: 'White',
      price: '¥499.00',
      quantity: 1,
      imageUrl:
          'https://images.unsplash.com/photo-1572804013309-59a88b7e92f1?w=500&q=80',
    ),
    '4': CartItem(
      id: '4',
      title: 'Belong Shorts',
      color: 'White',
      price: '¥489.00',
      quantity: 1,
      imageUrl:
          'https://images.unsplash.com/photo-1566174053879-31528523f8ae?w=500&q=80',
    ),
  };

  Map<String, CartItem> get items => {..._items};

  double get totalAmount {
    double total = 0;
    _items.forEach((key, item) {
      total += item.priceAsNumber * item.quantity;
    });
    return total;
  }

  void incrementQuantity(String itemId) {
    if (_items.containsKey(itemId)) {
      _items[itemId]!.quantity++;
      notifyListeners();
    }
  }

  void decrementQuantity(String itemId) {
    if (_items.containsKey(itemId)) {
      if (_items[itemId]!.quantity > 1) {
        _items[itemId]!.quantity--;
      } else {
        _items.remove(itemId);
      }
      notifyListeners();
    }
  }
}
