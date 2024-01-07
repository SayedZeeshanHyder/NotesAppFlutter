import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:notesapp/notesController.dart';
import 'package:shared_preferences/shared_preferences.dart';
class ApiServices
{

  static final notesController = Get.put(NotesController());
  static const apiLink = "Api Link Here";

  static insert(title,description)async{

    final prefs = await SharedPreferences.getInstance();

    final body = jsonEncode({
      "title":title,
      "description":description,
      "time":DateTime.now().toString(),
      "User": prefs.getString("Username"),
    });

    await http.post(Uri.parse("$apiLink/insert"),body: body,headers: {
      "Content-type":"application/json"
    });

    getNotes();
  }

  static delete(id)async{

    await http.post(Uri.parse("$apiLink/delete/$id"),headers: {
      "Content-type":"application/json"
    });
    getNotes();
  }

  static getNotes()
  async{
    notesController.notes.clear();
    notesController.notes.add("Loading");
    final prefs = await SharedPreferences.getInstance();
      final username = prefs.getString("Username");
      final response = await http.get(
          Uri.parse("$apiLink/allnotes/$username"), headers: {
        "Content-type": "application/json"
      });
      final notes = jsonDecode(response.body);
      notesController.notes.value = notes;
  }
}