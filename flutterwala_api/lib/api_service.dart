import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiService {

Future<List<Map<String, dynamic>>> fetchItems() async {
    final response = await http.get(Uri.parse('http://flutterwala.mooo.com/api/employees'),
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer flutterwalatoken'
      },
    );

    // print(response.body);
    if (response.statusCode == 200) {
      final List<dynamic> jsonData = jsonDecode(response.body);
      return jsonData.cast<Map<String, dynamic>>();
    } else {
      throw Exception('Failed to load user data');
    }
  }

  Future<bool> addItem(Map<String, dynamic> data) async {
    final response = await http.post(Uri.parse('http://flutterwala.mooo.com/api/employees'),
      body: jsonEncode(data),
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer flutterwalatoken'
      }
    );
    
    print(response.body);
    if (response.statusCode == 201) {
      return true;
    } else {
      throw Exception('Failed to Post data'); 
    }
  }

  Future<bool> updateItem(Map<String, dynamic> data, String id) async {
    final response = await http.put(Uri.parse('http://flutterwala.mooo.com/api/employees/$id'),
      body: jsonEncode(data),
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer flutterwalatoken'
      }
    );

    if (response.statusCode == 200) {
      return true;
    } else {
      throw Exception('Failed to update data');
    }
  }

  Future<bool> deleteItem(String id) async {
    final response = await http.delete(Uri.parse('http://flutterwala.mooo.com/api/employees/$id'),
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer flutterwalatoken'
      }
    );

    if (response.statusCode == 204) {
      return true;
    } else {
      throw Exception('Failed to Delete data');
    }
  }
}
