import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class AddProduct extends StatefulWidget {
  const AddProduct({super.key});

  @override
  State<AddProduct> createState() => _AddProductState();
}

class _AddProductState extends State<AddProduct> {
  bool isPost = false;
  TextEditingController name = TextEditingController();
  TextEditingController price = TextEditingController();
  TextEditingController description = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body:isPost?LinearProgressIndicator(): Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            TextFormField(
              controller: name,
              decoration: InputDecoration(hintText: "name"),
            ),
            TextFormField(
              controller: price,
              decoration: InputDecoration(hintText: "price"),
            ),
            TextFormField(
              controller: description,
              decoration: InputDecoration(hintText: "description"),
            ),
            TextButton(
              onPressed: () {
                addProduct();
                Navigator.of(context).pop;
              },
              child: Text(
                "add post",
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              style: ButtonStyle(
                backgroundColor: WidgetStatePropertyAll(Colors.blue),
              ),
            ),
          ],
        ),
      ),
    );
  }

  addProduct() async {
    Dio dio = Dio();
    Map<String, dynamic> data = {
      "name": name.text,
      "price": price.text,
      "description": description.text,
    };
    setState(() {
      isPost=true;

    });
    Response res = await dio.post(
      'https://ca17c61277a82222862e.free.beeceptor.com/api/products',

      data: data,
    );
    setState(() {
      isPost=false;

    });

  }
}
