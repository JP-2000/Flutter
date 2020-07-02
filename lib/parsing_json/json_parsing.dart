import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';

class JsonParsingSimple extends StatefulWidget {
  @override
  _JsonParsingSimpleState createState() => _JsonParsingSimpleState();
}

class _JsonParsingSimpleState extends State<JsonParsingSimple> {
  Future data;
  Future getdata(){
    var data;
    Network network = new Network("https://jsonplaceholder.typicode.com/posts");
    data = network.fetchdata();
//    data.then((value) {
//      print(value[0]["id"]);
//    });
    return data;
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    data = getdata();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Parsing json"),
      ),
      body: Center(
        child: Container(
          child: FutureBuilder(
            future: data,
            builder: (context, AsyncSnapshot<dynamic> snapshot) {  //data is stored in snapshot , AsyncSnapshot datatype is dynamic
              if (snapshot.hasData) {                        //
                return createLisView(context, snapshot.data);      //snapshot is object of data
              }                                              // checking if snapshot has data or not because
              else {                                         // sometimes data can be null
                return CircularProgressIndicator();          //
              }                                              //
            },
          ),
        ),
      ),
    );
  }

  Widget createLisView(BuildContext context, List data) {
    return Container(
      alignment: Alignment.center,
      child: ListView.builder(
        itemCount: data.length,
        itemBuilder: (context, index){
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Divider(height: 5.0,),
              ListTile(
                title: Text(data[index]["title"]),
                subtitle: Text(data[index]["body"].toString()),
                leading: Column(
                  children: <Widget>[
                    CircleAvatar(
                      radius: 23,
                      child: Text("${data[index]["id"]}"),
                    )
                  ],
                ),
              )
            ],
          );
        },
      )
    );
  }
}

class Network {
  String url;
  Network(this.url);
  Future fetchdata() async {
    print(url);
    Response response = await get(Uri.encodeFull(url)); // Uri.encodeFull(url) => refactoring or cleaning url
    if (response.statusCode == 200) {
      return json.decode(response.body);  // json.deccode => converting string to json format
    }
    else {
      print(response.statusCode);
    }
  }
}

