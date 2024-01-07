import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:notesapp/addnote.dart';
import 'package:notesapp/apiservices.dart';
import 'package:notesapp/getxTheme.dart';
import 'package:notesapp/notesController.dart';

class Home extends StatefulWidget {
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  
  @override
  void initState() {
    super.initState();
    notesController.notes.add("Loading");
    //Fetch Notes from Api
    ApiServices.getNotes();
  }
  
  final notesController = Get.put(NotesController());
  final getxThemeController = Get.put(GetXTheme());

  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () async {
              await getxThemeController.changeTheme();
            },
            icon: Obx(
              ()=> Icon(getxThemeController.isLightMode.value
                  ? Icons.light_mode
                  : Icons.dark_mode),
            ),
          )
        ],
        title: const Text("Home"),
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: (){
          Navigator.push(context, MaterialPageRoute(builder: (context)=>AddNote()));
        },
        child: const Icon(Icons.add),
      ),
      body: Obx(
          ()=> notesController.notes.contains("Loading") ? Center(child: CircularProgressIndicator(color: Theme.of(context).primaryColor,),) : notesController.notes.isNotEmpty ? ListView.builder(itemCount: notesController.notes.length,itemBuilder: (context,index){
          final note = notesController.notes[index];
          return Container(
            decoration: BoxDecoration(
              color: Theme.of(context).appBarTheme.backgroundColor,
              borderRadius: BorderRadius.circular(size.width*0.04)
            ),
            padding: EdgeInsets.all(size.width*0.03),
            margin: EdgeInsets.only(top: size.width*0.03,left: size.width*0.03,right: size.width*0.03),
            child: Row(
              children: [
                Container(
                  width: size.width*0.7,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(note["title"],style: TextStyle(color: Colors.white,fontSize: size.width*0.07),maxLines: null,),
                      SizedBox(height: size.height*0.01,),
                      Text(note["description"],style: TextStyle(color: Colors.white,fontSize: size.width*0.04),maxLines: 4,overflow: TextOverflow.ellipsis,),
                    ],
                  ),
                ),
                const Spacer(),
                IconButton(onPressed: (){

                  //Pass the Id
                  notesController.deleteNote(index,note["_id"]);
                }, icon: const Icon(Icons.delete,color: Colors.white,),),
              ],
            ),
          );
        }): Center(child: Text("No Notes Present",style: TextStyle(color: Theme.of(context).primaryColor),),)
      ),
    );
  }
}
