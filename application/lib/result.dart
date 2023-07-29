import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class ResultPage extends StatefulWidget {
  const ResultPage({super.key});

  @override
  State<ResultPage> createState() => _ResultPageState();
}

class _ResultPageState extends State<ResultPage> {
  var listc = 0;
  var resobj = [];

  getDataFromInternet() async {
    var url = Uri.parse('http://universities.hipolabs.com/search?country=india');
    var res = await http.get(url);
    //resobj is a list of map<string, dynamic>
    var resobj = jsonDecode(res.body);
    // print(resobj[0]["web_pages"][0]);
    setState(() {
      listc = resobj.length;
    });
    print(listc);
  }

  @override
  void initState() {
    //to run the function getData on opening this page
    getDataFromInternet(); 
    // TODO: implement initState
    super.initState();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: ListView.builder(
          itemCount: listc,
          itemBuilder: (context, index) {
            return Container(
              child: Container(
                child: Card(
                    child: Column(
                  children: [
                    Text(resobj[index]['name']),
                  ],
                )),
              ),
            );
          }),
    );
  }
}
