import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:technews/components/searchbar.dart';
import 'package:technews/utils/Key.dart';

Future<List> fetchnews(String category) async {
  final response = await http.get(
    Uri.parse("https://newsapi.org/v2/top-headlines?country=in&category"+ category +"=technology&pageSize=100&apiKey="
     + Key.key + 
     '&q' + 
     SearchBar.searchcontroller.text)
  );

  Map result = jsonDecode(response.body);

  return (result['articles']);
}