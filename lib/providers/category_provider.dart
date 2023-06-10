import 'dart:convert';

import 'package:assignment_1/model/category.dart';
import 'package:assignment_1/providers/environment.dart';
import 'package:http/http.dart' as http;

class CategoryProvider {
  //fetch categories
  Future<List<CategoryItem>> fetchCategory() async {
    // Obtain shared preferences.
    //final prefs = await SharedPreferences.getInstance();
    // Try reading data from the 'action' key. If it doesn't exist, returns null.
    //final String? auth_token = prefs.getString('auth_token');

    var response = await http.get(
      Uri.parse("${Environment().api}"),
      headers: {
        'Accept': 'application/json',
        // 'Authorization': 'Bearer ${window.localStorage['auth_token']!}'
        //'Authorization': 'Bearer ${auth_token!}'
      },
    );

    if (response.statusCode == 200) {
      // If the server did return a 200 OK response,
      // then parse the JSON.
      print("Success");
      List myList = jsonDecode(response.body);
      // String jsonstring = (response.body);
      // final categoryData = jsonDecode(jsonstring);
      // print(categoryData);
      return myList.map((e) => CategoryItem.fromJson(e)).toList();
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Failed to load Category details!!');
    }
  }
}
