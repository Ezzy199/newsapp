import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'categories_tab.dart';
import 'news_ui.dart';

class HomeScreen extends StatelessWidget {
  static const String routeName='home';
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        image: DecorationImage(image: AssetImage('assets/images/pattern.png'),)
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        drawer: Drawer(),
        appBar: AppBar(

          actions: [
            IconButton(onPressed: (){}, icon: Icon(Icons.search))
          ],
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(25),
              bottomRight: Radius.circular(25),
            )
          ),
          iconTheme: IconThemeData(
            color: Colors.white,
              size: 30
          ),
          backgroundColor: Colors.green ,
          title: Text('News App',style: TextStyle(
            fontSize: 30,fontWeight:FontWeight.w400,color:Colors.white
          ),),
          centerTitle: true,

        ),
        body:CategoriesTab(),

      ),
    );
  }
}
