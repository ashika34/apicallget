import 'dart:developer';

import 'package:apicall/postmodel.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ApiCall extends StatefulWidget {
  const ApiCall({super.key});

  @override
  State<ApiCall> createState() => _ApiCallState();
}

class _ApiCallState extends State<ApiCall> {
  String url = 'https://jsonplaceholder.typicode.com/posts';

  List<Postmodel> postList = [];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getDataList();
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: postList.length,
      itemBuilder: (context, index) => Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          width: double.maxFinite,
          decoration: BoxDecoration(color: Colors.amber),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('User id:${postList[index].userId}',
              maxLines: 1,
              style: TextStyle(fontSize: 16,color: Colors.black),),
              Text('Id:${postList[index].id}',
              maxLines: 1,
              style: TextStyle(fontSize: 16,color: Colors.black),),
              
              
              Text('Title:${postList[index].title}',
              maxLines: 1,
              style: TextStyle(fontSize: 16,color: Colors.black),),
              
              Text('Body:${postList[index].body}',
             style:TextStyle(fontSize: 14,color: Colors.black),)
      
            ],
          ),
        ),
      ),
    );
  }

  void getDataList() async {
    var response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      postList = postmodelFromJson(response.body);
      log("response:${postList.length}");
      setState(() {});
    }
  }
}
