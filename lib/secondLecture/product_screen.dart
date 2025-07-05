import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class ProductScreen extends StatefulWidget {
  const ProductScreen({super.key});

  @override
  State<ProductScreen> createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  List<dynamic>? products;

  @override
  void initState() {
    super.initState();
    getData();
  }

  Future<void> getData() async {
    try {
      Dio dio = Dio();
      Response res = await dio.get("https://fakestoreapi.com/products");
      setState(() {
        products = res.data;
      });
    } catch (e) {
      print("Failed to fetch products: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Fake Store")),
      body: products == null
          ? const Center(child: CircularProgressIndicator())
          : ListView.builder(
        itemCount: products!.length,
        itemBuilder: (context, index) {
          Map<String, dynamic> product = products![index];
          return ListTile(
            leading: Image.network(
              product['image'],
              height: 50,
              width: 50,
              fit: BoxFit.cover,
            ),
            title: Text(
              product['title'],
              overflow: TextOverflow.ellipsis,
              maxLines: 1,
            ),
            subtitle: Text("\$${product['price']}"),
          );
        },
      ),
    );
  }
}
