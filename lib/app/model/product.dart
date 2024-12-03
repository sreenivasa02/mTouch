class Product {
  final String? price;
  final String? productName;
  final String? offerPrice;
  final String? avlProductQty;
  final String? productDescription;

  Product({
    this.price,
    this.productName,
    this.offerPrice,
    this.avlProductQty,
    this.productDescription,
  });

  factory Product.fromMap(Map<String, dynamic> map) {
    return Product(
      price: map['price'],
      productName: map['productName'],
      offerPrice: map['offerPrice'],
      avlProductQty: map['avlProductQty'],
      productDescription: map['productDescription'],
    );
  }
}
