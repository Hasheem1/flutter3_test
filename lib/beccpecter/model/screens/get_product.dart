import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../productModel.dart';
import 'add_product.dart';
class GetProduct extends StatefulWidget {
  const GetProduct({super.key});

  @override
  State<GetProduct> createState() => _GetProductState();
}
List <ProductModel>? products;
class _GetProductState extends State<GetProduct> {
  @override
  @override
  void initState() {
    super.initState();
    getData();
  }
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body:products==null?Center(child: CircularProgressIndicator()):
      ListView.builder(
        itemCount: products!.length,
          itemBuilder: (_,index){
        ProductModel product=products![index];
        return Card(
          child: Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(product.id),

              Text(product.price),
              Text(product.name),
              Text(product.description),



            ],
          ),
        );
      }
      ),
floatingActionButton: Container(decoration: BoxDecoration(color:Colors.blue,border: Border.all()),
    child: InkWell(onTap: (){Navigator.of(context).push(MaterialPageRoute(builder:(context) => AddProduct(),));

    },
        child: Icon(CupertinoIcons.plus,color: Colors.white,size: 50,))),
    );
  }
  getData()async{
    Dio dio=Dio();
    Response res = await dio.get('https://ca17c61277a82222862e.free.beeceptor.com/api/products/');
    products=[];
    List productTest=res.data;
    for(int i=0;i<productTest.length;i++){
      Map<String,dynamic> productItem=productTest[i];
    ProductModel productModel =  ProductModel.toMap(productItem);
    setState(() {
      products!.add(productModel);

    });

    }
  }
}

