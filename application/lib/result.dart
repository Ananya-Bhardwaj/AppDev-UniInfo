import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class ResultPage extends StatefulWidget {
  const ResultPage({super.key});

  @override
  State<ResultPage> createState() => _ResultPageState();
}

getDataFromInternet() async {
  var url = Uri.parse('http://universities.hipolabs.com/search?country=india');
  var res = await http.get(url);
  var resobj = jsonDecode(res.body);
  //resobj is a list of map<string, dynamic>
  return resobj;
}

class _ResultPageState extends State<ResultPage> {
  var resobj = getDataFromInternet();
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: ListView.builder(
        itemBuilder: (context, index) {
          return Container(
            child: Column(
              children: [
                Text('${resobj[index]["name"]}'),
                Text('${resobj[index]["web_pages"][0]}'),
                Text('${resobj[index]["state-province"]}'),
                Text('${resobj[index]["country"]}'),
              ],
            ),
            decoration:
                BoxDecoration(color: Colors.red[50], border: Border.all()),
          );
        },
      ),
    );
  }
}
