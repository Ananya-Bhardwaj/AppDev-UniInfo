import 'dart:io';
import 'package:application/home.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:fluttertoast/fluttertoast.dart';

class ResultPage extends StatefulWidget {
  const ResultPage({super.key});

  @override
  State<ResultPage> createState() => _ResultPageState();
}

class _ResultPageState extends State<ResultPage> {
  var listc = 0;
  var resobj = [];

  @override
  void initState() {
    //to run the function getData on opening this page
    print('result page open');
    getDataFromInternet();
    // TODO: implement initState
    super.initState();
  }

  getDataFromInternet() async {
    var url = Uri.parse(
        'http://universities.hipolabs.com/search?country=${HomePage.countryName}');
    var res = await http.get(url);
    //resobj is a list of map<string, dynamic>
    resobj = jsonDecode(res.body);
    // print(resobj[0]["web_pages"][0]);
    setState(() {
      listc = resobj.length;
    });
    if (listc == 0) {
      //no items
    }
  }

  // Future<void> _lURL (index) async{
  //   var url = Uri.parse(resobj[index]['web_pages'][0]);
  //     if (!await launchUrl(url)) {
  //   throw Exception('Could not launch $url');
  // }

  // }

  // openLink(int index) async {
  //   var url = resobj[index]['web_pages'][0];
  //   if (await canLaunch(url)) {
  //       await launch(url);
  // } else {
  //  throw 'Could not launch $url';
  // }
  // }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text('Results'),
      ),
      body: ListView.builder(
          itemCount: listc,
          itemBuilder: (BuildContext context, int index) {
            return Container(
              child: Container(
                padding: EdgeInsets.fromLTRB(10, 5, 10, 0),
                child: Card(
                    color: Colors.white,
                    child: Container(
                      child: Column(
                      children: [
                        Text(
                          resobj[index]['name'],
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Column(
                              children: [
                                Text(resobj[index]['state-province'] != null
                            ? resobj[index]['state-province']
                            : ''),
                        Text(resobj[index]['country']),
                              ],
                            ),
                            Expanded(child: Container()),
                            IconButton(
                            onPressed: () async {
                              Uri url = Uri.parse(resobj[index]['web_pages'] != null
                            ? resobj[index]['web_pages'][0]
                            : '');
                              if (!await launchUrl(url)) {
                                print("link cannot be opened");
                              } else {
                                print('launch link');
                                await launchUrl(url);
                              }
                            },
                            icon: Icon(Icons.arrow_outward_outlined)),
                      ],
                    ),
                      ],
                        )
                        ,
                      padding: EdgeInsets.all(5),
                    )
                    
              ),
              )
            ); 
          }),
    );
  }
}
