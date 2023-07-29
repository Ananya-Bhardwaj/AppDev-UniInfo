import 'dart:convert';

import 'package:http/http.dart' as http;

void main() {
  getDataFromInternet();
}

getDataFromInternet() async {
  var url = Uri.parse('http://universities.hipolabs.com/search?country=india');
  var res = await http.get(url);
  var resobj = jsonDecode(res.body);
  //resobj is a list of map<string, dynamic>
  //so basically we have to use list access commands to see the number of responses returned
  print(resobj[0]['name'].runtimeType);
}
