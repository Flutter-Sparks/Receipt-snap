import 'package:invoice_generator/models/product.dart';

class CartItem {
  final Product product;
  final int qty;
  CartItem({
    required this.product,
    required this.qty,
  });
}
