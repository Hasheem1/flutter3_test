import 'package:flutter/material.dart';
class UserDetails extends StatefulWidget {
  String name;
  int id;
  String email;
String city;

   UserDetails({required this.id,required this.name,required this.email,required this.city});

  @override
  State<UserDetails> createState() => _UserDetailsState();
}

class _UserDetailsState extends State<UserDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SizedBox(height: 330,
        child: Card(color: Colors.pinkAccent[100],
          margin: EdgeInsets.all(20),

          child: ListTile(contentPadding: EdgeInsets.all(40),

            title: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Id: ${widget.id.toString()}"),
                Text("Name: ${widget.name}"),
                Text("City: ${widget.city}"),


              ],

            ),
         subtitle: Column(

           children: [
             SizedBox(height: 30,),
             Text("Email:${widget.email}"),
           ],
         ),

          ),


        ),
      ),
    );
  }
}
