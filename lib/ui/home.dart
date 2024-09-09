import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:news/generated/l10n.dart';
import 'package:news/models/category_model.dart';
import 'package:news/ui/search_tab.dart';

import 'categories_tab.dart';
import 'drawer_widget.dart';
import 'news_ui.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = 'home';
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white,
          image: DecorationImage(
            image: AssetImage('assets/images/pattern.png'),
          )),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        drawer:DrawerWidget(onClic: onDrawerClicked,),
        appBar: AppBar(
          actions: [IconButton(onPressed: () {
            showSearch(context: context, delegate:SearchTab());
          },
              icon: Icon(Icons.search))],
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(25),
            bottomRight: Radius.circular(25),
          )),
          iconTheme: IconThemeData(color: Colors.white, size: 30),
          backgroundColor: Colors.green,
          title: Text(
            S.of(context).title,
            style: TextStyle(
                fontSize: 30, fontWeight: FontWeight.w400, color: Colors.white),
          ),
          centerTitle: true,
        ),
        body: categoryModel == null
            ? CategoriesTab(
                onClick: onCategorySelected,
              )
            : NewsUi(
                id: categoryModel!.id,
              ),
      ),
    );
  }


  CategoryModel? categoryModel;

  onDrawerClicked(id){
    if(id==DrawerWidget.CATEGORY_ID){
      categoryModel = null;
      Navigator.pop(context);
    }else if(id==DrawerWidget.SETTINGS_ID){

    }
    setState(() {

    });
  }

  onCategorySelected(cat) {
    categoryModel = cat;
    setState(() {});
  }
}
