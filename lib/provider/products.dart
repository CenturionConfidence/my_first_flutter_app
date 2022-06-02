import 'package:flutter/cupertino.dart';

class Product with ChangeNotifier {
  final String id;
  final String title;
  final String description;
  final double price;
  final String imageUrl;
  bool isFavorite;

  Product({
    required this.id,
    required this.title,
    required this.description,
    required this.price,
    required this.imageUrl,
    this.isFavorite = false,
  });

  void toggleFavoriteStatus() {
    isFavorite = !isFavorite;
    notifyListeners();
  }
}

class ProductList with ChangeNotifier {
  final List<Product> _items = [
    Product(
      id: 'c1',
      title: 'Red Shirt',
      price: 29.99,
      description: 'Product of the new shop',
      imageUrl:
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQK-g4jeOEmt0BailpIBN2__XjCpr27wxk4IQ&usqp=CAU',
    ),
    Product(
      id: 'c2',
      title: 'Bags',
      price: 29.99,
      description: 'Product of the new shop',
      imageUrl:
          'https://media.glamour.com/photos/612d33b2e274243a3defbc8b/master/w_3200,h_1800,c_limit/best%20tiny%20bags.jpg',
    ),
    Product(
      id: 'c3',
      title: 'Shoes',
      price: 29.99,
      description: 'Product of the new shop',
      imageUrl:
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT3tGGCeGXCGfviK-komRyAoSjk8D41TrTEvQ&usqp=CAU',
    ),
    Product(
      id: 'c4',
      title: 'Shirts',
      price: 29.99,
      description: 'Product of the new shop',
      imageUrl:
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTGPuNj7H6O0cFbRtGM_yY0xpZ2fPLfmyXr7g&usqp=CAU',
    )
  ];

  List<Product> get items {
    if (_showFavorites) {
      return _items.where((prodItem) => prodItem.isFavorite).toList();
    }
    return [..._items];
  }

  Product findById(String id) {
    return _items.firstWhere((prod) => prod.id == id);
  }

  var _showFavorites = false;

  void showFavoritesOnly() {
    _showFavorites = true;
    notifyListeners();
  }

  void showAll() {
    _showFavorites = false;
    notifyListeners();
  }

  void addProduct(Product product) {
    final newProduct = Product(
      id: DateTime.now().toString(),
      title: product.title,
      description: product.description,
      price: product.price,
      imageUrl: product.imageUrl,
    );
    _items.add(newProduct);
  }
  void updateProduct(String id, Product newProduct) {
    final productIndex = _items.indexWhere((prod) => prod.id == id);
    if (productIndex >= 0) {
      _items[productIndex] = newProduct;
    }
  }
  void deleteProduct(String id) {
    _items.removeWhere((prod) => prod.id == id);
  }
}
