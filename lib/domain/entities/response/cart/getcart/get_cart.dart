import 'get_product.dart';

class GetCart {
  final String? id;
  final String? cartOwner;
  final List<GetProduct>? products;
  final int? v;
  final int? totalCartPrice;

  GetCart ({
    this.id,
    this.cartOwner,
    this.products,
    this.v,
    this.totalCartPrice,
  });

}