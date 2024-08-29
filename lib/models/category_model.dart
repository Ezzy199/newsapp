import 'package:flutter/animation.dart';

class CategoryModel {
  String id;
  String name;
  String image;
  Color color;

  CategoryModel(
      {required this.id,
      required this.name,
      required this.image,
      required this.color});

 static List<CategoryModel> getCategories() {
    return [
      CategoryModel(
        id: 'business',
        name: 'Business',
        image: 'assets/images/bussines.png',
        color: Color(0xffCF7E48),
      ),
      CategoryModel(
          id: 'entertainment',
          name: 'Entertainment',
          image: 'assets/images/environment.png',
          color: Color(0xff4882CF)),
      CategoryModel(
          id: 'general',
          name: 'General',
          image: 'assets/images/Politics.png',
          color: Color(0xff003e90)),
      CategoryModel(
          id: 'health',
          name: 'Health',
          image: 'assets/images/health.png',
          color: Color(0xffed1e79)),
      CategoryModel(
          id: 'science',
          name: 'Science',
          image: 'assets/images/science.png',
          color: Color(0xffF2D352)),
      CategoryModel(
          id: 'sports',
          name: 'Sports',
          image: 'assets/images/sports.png',
          color: Color(0XFFc91c22)),
      CategoryModel(
          id: 'technology',
          name: 'Technology',
          image: 'assets/images/environment.png',
          color: Color(0xff4882CF)),
    ];
  }
}
