import 'package:flutter/cupertino.dart';
import 'package:news/models/category_model.dart';

class CategoriesTab extends StatelessWidget {
  CategoriesTab({super.key});
var categories=CategoryModel.getCategories();
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text('Pick your category of interest',style: TextStyle(
          fontSize: 35,fontWeight: FontWeight.w500
        ),),
        SizedBox(
          height: 12,
        ),
        Expanded(
          child: GridView.builder(gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
              itemBuilder:(context, index) {
             return Text(categories[index].name);
              },itemCount: categories.length,),
        )
      ],
    );
  }
}
