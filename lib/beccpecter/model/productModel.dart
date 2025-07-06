import 'package:flutter/foundation.dart';

class ProductModel {
  String id;
  String name;
  String price;
  String description;

  ProductModel({
    required this.id,
    required this.name,
    required this.price,
    required this.description,
  });
  factory ProductModel.toMap(Map<String,dynamic> map){
    return ProductModel(id: map['id'], name: map['name'], price: map['price'], description: map['description']);
  }
}
