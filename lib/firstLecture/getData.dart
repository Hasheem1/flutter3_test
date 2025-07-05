import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
class getData extends StatefulWidget {
  const getData({super.key});

  @override
  State<getData> createState() => _getDataState();
}

class _getDataState extends State<getData> {
  String Data='';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SizedBox(width: double.infinity,
          child: SingleChildScrollView(
            child: Column(mainAxisAlignment: MainAxisAlignment.center,

              children: [

                Text(Data),
                ElevatedButton(onPressed: getData, child: Text("Get data"))
              ],
            ),
          ),
        ),
      ),


    );
  }
  getData()async{

    Dio dio =Dio();

    Response  res =await dio.get("https://api.escuelajs.co/api/v1/products");



// هون رح يطبع كلشي متعلق ب ال  api داخل التيرمنال
    //print(res.data.toString());



    // هون رح يطبع كلشي داخل التلفون على شكل text
// setState(() {
//
// });
//     setState(() {
// Data=res.data.toString();
//
//     } );


    //  هون اذا بدي احدد انا لشو بدي اعمل get

    List <dynamic> tomap=res.data;

    Data=res.data.toString();

    setState(() {
      Data=tomap[0]['title'].toString();//باستخدام list
    } );





  }
}
