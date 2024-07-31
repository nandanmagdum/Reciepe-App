import 'dart:convert';

import 'package:http/http.dart' as http;

class ApiService {
  static const String base_url = "https://www.themealdb.com/api/json/v1/1/";

  // list of category, area, ingredient
  static const String listOfCategory = "${base_url}categories.php";
  static const String listOfArea = "${base_url}list.php?a=list";
  static const String listOfIngrident = "${base_url}list.php?i=list";

  // list of category, area, ingredient
  static const String listByCategory = "${base_url}filter.php?c="; // variable
  static const String listByArea = "${base_url}filter.php?a="; // variable
  static const String listByIngrident = "${base_url}filter.php?i="; // variable

  // complete meal details from id
  static const String getById = "${base_url}lookup.php?i="; // id required

  // get random meal
  static const String getRandomMeal = "${base_url}random.php";

  // search meal by name
  static const String searchByName =
      "${base_url}search.php?s="; // name required

  static Future<List<dynamic>> getCategoryList() async{
    final URI = Uri.parse(listOfCategory);
    final response = await http.get(URI);
    final data = jsonDecode(response.body);
    if(response.statusCode == 200){
      return data['categories'];
    }
    else {
      throw Exception(response.body);
    }
  }

  static Future<List<dynamic>> filterByCategories({required String category}) async{
    final URI = Uri.parse(listByCategory+category);
    final response = await http.get(URI);
    final data = jsonDecode(response.body);
    if(response.statusCode == 200){
      return data['meals'];
    }
    else {
      throw Exception(response.body);
    }
  }
  static Future<List<dynamic>> getMealById({required String id}) async{
    final URI = Uri.parse(getById+id);
    final response = await http.get(URI);
    final data = jsonDecode(response.body);
    if(response.statusCode == 200){
      return data['meals'];
    }
    else {
      throw Exception(data);
    }
  }

  static Future<List<dynamic>> getListOfCountries() async{
    final URI = Uri.parse(listOfArea);
    final response = await http.get(URI);
    final data = jsonDecode(response.body);
    if(response.statusCode == 200){
      return data['meals'];
    }
    else {
      throw Exception(data);
    }
  }

  static Future<List<dynamic>> getMealsByCountry({required String country}) async{
    final URI = Uri.parse(listByArea+country);
    final response = await http.get(URI);
    final data = jsonDecode(response.body);
    if(response.statusCode == 200){
      return data['meals'];
    }
    else {
      throw Exception(data);
    }
  }

  static Future<List<dynamic>> getListOfIngridents() async{
    final URI = Uri.parse(listOfIngrident);
    final response = await http.get(URI);
    final data = jsonDecode(response.body);
    if(response.statusCode == 200){
      return data['meals'];
    }
    else {
      throw Exception(data);
    }
  }

  static Future<List<dynamic>> getMealsByIngridents({required String ingrident}) async{
    final URI = Uri.parse(listByIngrident+ingrident);
    final response = await http.get(URI);
    final data = jsonDecode(response.body);
    if(response.statusCode == 200){
      return data['meals'];
    }
    else {
      throw Exception(data);
    }
  }
}
