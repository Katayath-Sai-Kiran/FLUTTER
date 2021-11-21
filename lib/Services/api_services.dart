import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:todo_x/constants.dart';

class ApiService extends ChangeNotifier {
  Future<void> greet({required String name}) async {
    try {
      http.Response response = await http.get(
          Uri.parse(kGreetEndpoint + "/sai kiran"),
          headers: {'content-type': 'Application/json'});
      if (response.statusCode == 200) {}
    } catch (error) {
      print(error);
    }
  }

  Future<void> getMembers({required String id}) async {
    try {
      http.Response response = await http.get(
          Uri.parse(kBaseUrl + '/members/78'),
          headers: {'content-type': 'Application/json'});
      if (response.statusCode == 200) {
        print(response.body);
      } else {
        print(response.body);
      }
    } catch (error) {
      print(error);
    }
  }
}
