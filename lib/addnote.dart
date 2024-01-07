import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:notesapp/notesController.dart';

class AddNote extends StatelessWidget
{
  final notesController = Get.put(NotesController());
  final titleController = TextEditingController();
  final descriptionController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: const Text("Add Note"),
      ),

      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: size.width*0.05),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: size.height*0.05,),
              Text("Title :",style: TextStyle(fontSize: size.width*0.05,color: Theme.of(context).primaryColor),),
              SizedBox(height: size.height*0.02,),
              TextField(
                controller: titleController,
                style: TextStyle(color: Theme.of(context).primaryColor),
                maxLines: null,
                decoration: InputDecoration(
                  hintText: "Enter Title",
                  hintStyle: TextStyle(color: Theme.of(context).primaryColor),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Theme.of(context).primaryColor),
                    borderRadius: BorderRadius.circular(size.width*0.075),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Theme.of(context).primaryColor),
                    borderRadius: BorderRadius.circular(size.width*0.075),
                  ),
                ),
              ),
              SizedBox(height: size.height*0.05,),
              Text("Description",style: TextStyle(fontSize: size.width*0.05,color: Theme.of(context).primaryColor),),
              SizedBox(height: size.height*0.02,),
              TextField(
                controller: descriptionController,
                style: TextStyle(color: Theme.of(context).primaryColor),
                maxLines: null,
                decoration: InputDecoration(
                  hintText: "Enter Description",
                  hintStyle: TextStyle(color: Theme.of(context).primaryColor),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Theme.of(context).primaryColor),
                    borderRadius: BorderRadius.circular(size.width*0.075),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Theme.of(context).primaryColor),
                    borderRadius: BorderRadius.circular(size.width*0.075),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),

      floatingActionButton: SizedBox(
        width: size.width*0.9,
        height: size.height*0.07,
        child: ElevatedButton(
          onPressed: ()async{
            if(titleController.text.isNotEmpty && descriptionController.text.isNotEmpty) {
              notesController.addNote(titleController.text, descriptionController.text,context);
            }
          },
          child: Text("Add Note"),
        ),
      ),

      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }

}