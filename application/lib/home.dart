import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});
  static var countryName; 
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text('UnivInfo'),
        leading: Icon(Icons.school),
      ),
      body: Container(
          height: 400,
          width: 400,
          margin: EdgeInsets.symmetric(horizontal: 5),
        padding: EdgeInsets.fromLTRB(10, 0, 10, 5),
        alignment: AlignmentDirectional.topCenter,
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text('Search for universities located in any country',
          style: TextStyle(
            fontSize: 20, 
            fontWeight: FontWeight.bold, 

          ),
          textAlign: TextAlign.center,
          ),
          SizedBox(height: 50,),
          TextField(
            onChanged: (value) => {
              HomePage.countryName = value.trim()
            }, 
            decoration: InputDecoration(
              labelText: 'Country Name', 
              hintText: 'Enter Country Name!', 
              border: InputBorder.none,
              contentPadding: EdgeInsets.all(5),
              filled: true, 
              fillColor: Colors.blue[50],
            ),
          ),
          SizedBox(height: 50,),
          ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, 'result');
              },
              child: Text('Check Results =>')),
        ],
      ),
      )
    );
  }
}
