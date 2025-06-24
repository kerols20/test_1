class Product {
  final int id;
  final String title;
  final String image;
  final String price;
  final String rarting;

  Product({required this.id,required this.price ,required this.title, required this.image, required this.rarting});

  factory Product.fromJson(Map<String, dynamic> json) => Product(
    id: json['id'],
    rarting: json['rating']['rate'].toString(),
    title: json['title'],
    image: json['image'],
    price: json['price'].toString(),
  );
}
