import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter3_test/secondLecture/models/user_model.dart';
import 'package:flutter3_test/secondLecture/screens/user_details.dart';

List<User>? userList;
class UserScreen extends StatefulWidget {
  const UserScreen({super.key});

  @override
  State<UserScreen> createState() => _UserScreenState();
}

class _UserScreenState extends State<UserScreen> {
  @override
  void initState() {
    getUsers();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(


      appBar: AppBar(),
      body: userList!.isEmpty?CircularProgressIndicator():
          ListView.builder(itemCount :userList!.length, itemBuilder: (_,index){

            User user=userList![index];
           return Card(
             child: ListTile(
               onTap: () {
                 Navigator.of(context).push(MaterialPageRoute(builder:(context) =>UserDetails(id: user.id, name: user.username, email: user.email, city: user.city) , ));
               },
               leading: Text(user.id.toString()),
               title: Text(user.username),
              // subtitle: Text(user.email),
             //  subtitle: Text(user.city),

             ),
           ) ;
          }
          )
    );
  }

  getUsers()async{
    Dio dio=Dio();
  Response res=await  dio.get("https://fakestoreapi.com/users");
  List resListOfUser=res.data;
    userList=[];
  for(int i=0;i<resListOfUser.length;i++){
    Map<String,dynamic>userMap=resListOfUser[i];
  User user =  User.toMap(userMap);
  setState(() {
    userList!.add(user);

  });
  }

  }
}
