import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_projects/model/post.dart';
import 'package:http/http.dart';


class JsonParsingMaps extends StatefulWidget {
  @override
  _JsonParsingMapsState createState() => _JsonParsingMapsState();
}

class _JsonParsingMapsState extends State<JsonParsingMaps> {
  Future<PostList> data;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Network network = new Network("https://jsonplaceholder.typicode.com/posts");
    data = network.loadPosts();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("PODO"),
      ),
      body: Center(
        child: Container(
          child: FutureBuilder(
            future: data,
            builder: (context,AsyncSnapshot<PostList> snapshot){ //snapshot is object of data
              List<Post> allPosts;
              if (snapshot.hasData) {
                allPosts = snapshot.data.posts; //data is object // assigning list
                return createListView(allPosts, context);
              }
              else {
                return CircularProgressIndicator();
              }
            },
          ),
        ),
      )
    );
  }

  Widget createListView(List<Post> data, BuildContext context){
    return Container(
      child: ListView.builder(
        itemCount: data.length,
        itemBuilder: (context, int index) {
          return Column(
            children: <Widget>[
              Divider(height: 5.0,),
              Card(
                elevation: 5.0,
                child: ListTile(
                  leading: CircleAvatar(
                    child: Text("${data[index].id}"),
                  ),
                  title: Text("${data[index].title}"),
                  subtitle: Text("${data[index].body}"),
                ),
              )
            ],
          );
        },
      ),
    );
  }
}


class Network {
  String url;
  Network(this.url);
  Future<PostList> loadPosts() async {
    final Response response = await get(Uri.encodeFull(url));
    if (response.statusCode == 200){
      print(response.body);
      return PostList.fromJson(json.decode(response.body)); // we get json object
    }
    else{
      throw Exception("Failure Boi");
    }
  }
//  Future fetchdata() async {
//    print(url);
//    Response response = await get(Uri.encodeFull(url)); // Uri.encodeFull(url) => refactoring or cleaning url
//    if (response.statusCode == 200) {
//      return json.decode(response.body);  // json.deccode => converting string to json format
//    }
//    else {
//      print(response.statusCode);
//    }
//  }
}

