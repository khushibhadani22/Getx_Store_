// import 'package:get/get.dart';
//
// class Product {
//   final String? title;
//   final String? description;
//   final String? thumbnail;
//   final int? price;
//   final double? rating;
//   RxInt quantity = 1.obs;
//
//   Product({
//     required this.title,
//     required this.description,
//     required this.thumbnail,
//     required this.price,
//     required this.rating,
//   });
//   factory Product.fromMap({required Map data}) {
//     return Product(
//         title: data['title'],
//         description: data['description'],
//         thumbnail: data['thumbnail'],
//         price: data['price'],
//         rating: data['rating']);
//   }
// }

import 'package:get/get.dart';

class Product {
  String? title;
  String? description;
  String? thumbnail;
  int? price;
  // double? rating;
  RxInt quantity = 1.obs;

  Product({required Map data}) {
    this.title = data['title'];
    this.description = data['description'];
    this.thumbnail = data['thumbnail'];
    this.price = data['price'];
    // this.rating = data['rating'];
  }
}
