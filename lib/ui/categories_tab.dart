import 'package:flutter/cupertino.dart';
import 'package:news/models/category_model.dart';
import 'package:news/ui/category_item.dart';

class CategoriesTab extends StatelessWidget {
  Function onClick;
  CategoriesTab({required this.onClick, super.key});
  var categories = CategoryModel.getCategories();
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(18.0),
      child: Column(
        children: [
          Text(
            'Pick your category of interest',
            style: TextStyle(fontSize: 35, fontWeight: FontWeight.w500),
          ),
          SizedBox(
            height: 12,
          ),
          Expanded  (
            child: GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, mainAxisSpacing: 12, crossAxisSpacing: 12),
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    onClick(categories[index]);
                  },
                    child: CategoryItem(
                      categoryModel: categories[index],isOdd: index.isOdd,
                    ));
              },
              itemCount: categories.length,
            ),
          )
        ],
      ),
    );
  }
}
