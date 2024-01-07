import 'package:flutter/material.dart';
import 'package:notesapp/home.dart';
import 'package:shared_preferences/shared_preferences.dart';

class NamePage extends StatelessWidget
{

  final usernameController = TextEditingController();
  @override
  Widget build(BuildContext context) {

    Size size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        title: const Text("Choose Your Username"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Username :",style: TextStyle(fontSize: size.width*0.05,color: Theme.of(context).primaryColor),),
            SizedBox(height: size.height*0.02,),
            SizedBox(
              width: size.width*0.9,
              child: TextField(
                controller: usernameController,
                style: TextStyle(color: Theme.of(context).primaryColor),
                maxLines: 1,
                decoration: InputDecoration(
                  hintText: "Enter Username",
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
            ),
          ],
        ),
      ),

      floatingActionButton: SizedBox(
        width: size.width*0.9,
        height: size.height*0.07,
        child: ElevatedButton(
          onPressed: ()async{
            if(usernameController.text.isNotEmpty) {
              final prefs = await SharedPreferences.getInstance();
              prefs.setBool("user", true).then((value){
                prefs.setString("Username", usernameController.text).then((value){
                  Navigator.pushReplacement(context,MaterialPageRoute(builder: (context)=>Home()));
                });
              });
            }
          },
          child: const Text("Set Username"),
        ),
      ),

      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }

}