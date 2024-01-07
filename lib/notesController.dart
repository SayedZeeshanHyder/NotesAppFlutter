import 'package:get/get.dart';
import 'package:notesapp/apiservices.dart';
import 'package:flutter/material.dart';

class NotesController extends GetxController
{
  RxList notes = [].obs;

  addNote(title,description,context)
  async{
    notes.add({
      "title":title,
      "description":description,
      "time":DateTime.now(),
    });

    Navigator.pop(context);

    //Insert Note in DB
    await ApiServices.insert(title, description);
  }

  deleteNote(index,id)
  async{
    notes.removeAt(index);

    //Delete Note from DB
    await ApiServices.delete(id);
  }
}