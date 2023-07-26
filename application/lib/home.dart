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
      appBar: AppBar(),
      body: Column(
        children: [
          Text('University Country Database'),
          Text('Search for universities located in your choice of country'), 
          TextField(
            onChanged: (value) => {
              HomePage.countryName = value
            }, 
            decoration: InputDecoration(
              labelText: 'Country Name', 
              hintText: 'Enter Country Name!', 
              border: InputBorder.none,
            ),
          ),
          ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, 'result');
              },
              child: Text('Check Results =>')),
        ],
      ),
    );
  }
}
