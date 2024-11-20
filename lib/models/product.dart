// models/product.dart

import 'dart:convert';

List<Product> productFromJson(String str) => 
    List<Product>.from(json.decode(str).map((x) => Product.fromJson(x)));

String productToJson(List<Product> data) => 
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Product {
    int id;
    String name;
    int amount;
    String description;
    String imageUrl;
    DateTime date;

    Product({
        required this.id,
        required this.name,
        required this.amount,
        required this.description,
        required this.imageUrl,
        required this.date,
    });

    factory Product.fromJson(Map<String, dynamic> json) => Product(
        id: json["id"],
        name: json["name"],
        amount: json["amount"],
        description: json["description"],
        imageUrl: json["image_url"],
        date: DateTime.parse(json["date"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "amount": amount,
        "description": description,
        "image_url": imageUrl,
        "date": date.toIso8601String(),
    };
}