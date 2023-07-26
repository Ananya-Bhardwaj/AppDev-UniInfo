import 'dart:convert';

import 'package:http/http.dart' as http;

void main() {
  getDataFromInternet();
}

getDataFromInternet() async {
  var url = Uri.parse('http://universities.hipolabs.com/search?country=india');
  var res = await http.get(url);
  var resobj = jsonDecode(res.body);
  print(resobj);
}
