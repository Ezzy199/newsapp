import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../models/category_model.dart';

class CategoryItem extends StatelessWidget {
  CategoryModel categoryModel;
  bool isOdd;
  CategoryItem({required this.isOdd,required this.categoryModel, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: categoryModel.color,
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(25),
            topLeft: Radius.circular(25),
            bottomLeft: !isOdd? Radius.circular(25):Radius.zero,
            bottomRight: isOdd? Radius.circular(25):Radius.zero
          )),
      child: Column(
        children: [
          Expanded(child: Image.asset(categoryModel.image)),
          Text(
            categoryModel.name,
            style: TextStyle(fontSize: 22, color: Colors.white),
          ),
        ],
      ),
    );
  }
}
