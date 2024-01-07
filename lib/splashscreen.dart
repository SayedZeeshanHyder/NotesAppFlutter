import 'package:flutter/material.dart';
import 'package:notesapp/home.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'namepage.dart';


class SplashScreen extends StatelessWidget{
  @override
  Widget build(BuildContext context)
  {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: FutureBuilder(
        future: splash(context),
        builder:(context,snapshots){
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.note, size: size.width * 0.25,color: Theme.of(context).primaryColor,),
                SizedBox(height: size.height * 0.02,),
                Text("The Notes App",style: TextStyle(color: Theme.of(context).primaryColor,fontSize: size.width*0.08,),),
              ],
            ),
          );
        }
      ),
    );
  }

  splash(context)
  async{
    final prefs = await SharedPreferences.getInstance();
    await Future.delayed(const Duration(seconds: 3));
    if(prefs.getBool("user") ?? false)
      {
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>Home()));
      }
    else{
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>NamePage()));
    }
  }
}