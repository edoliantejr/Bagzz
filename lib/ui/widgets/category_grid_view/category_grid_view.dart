import 'package:bagzz/constant/font_names.dart';
import 'package:bagzz/models/category.dart';
import 'package:bagzz/ui/widgets/category_grid_view/category_grid_view_view_model.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class CategoryGridView extends StatelessWidget {
  final List<Category> categories;

  const CategoryGridView({Key? key, required this.categories})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<CategoryGridViewModel>.reactive(
        viewModelBuilder: () => CategoryGridViewModel(categories: categories),
        builder: (context, model, child) {
          return Column(
            children: [
              title(),
              gridViewCategory(model.categories),
              browseAllCategory(),
            ],
          );
        });
  }

  Widget title() {
    return Container(
        padding: EdgeInsets.only(left: 11.0, top: 40.0),
        alignment: Alignment.centerLeft,
        margin: EdgeInsets.only(top: 10.0),
        child: Text("Shop By Categories",
            style: TextStyle(
              fontFamily: FontNames.playFair,
              fontSize: 24.0,
              fontWeight: FontWeight.bold,
            )));
  }

  Widget gridViewCategory(List<Category> categories) {
    return GridView.builder(
        padding:
            const EdgeInsets.only(left: 12, right: 12, top: 15, bottom: 11),
        shrinkWrap: true,
        primary: false,
        itemCount: categories.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 24,
          crossAxisSpacing: 16,
          childAspectRatio: .76,
        ),
        itemBuilder: (context, index) {
          return CategoryItem(categories[index]);
        });
  }

  Widget browseAllCategory() {
    return Center(
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 22),
        child: Container(
            padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
            decoration: BoxDecoration(
                border: Border.all(
              color: Colors.black,
            )),
            child: Text("BROWSE ALL CATEGORIES",
                style: TextStyle(
                  fontFamily: 'WorkSans',
                  fontSize: 16.0,
                  fontWeight: FontWeight.w600,
                ))),
      ),
    );
  }
}

class CategoryItem extends StatelessWidget {
  final Category category;

  const CategoryItem(this.category, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
            width: double.infinity,
            child: Image(
              image: AssetImage(category.coverImage),
              fit: BoxFit.cover,
            )),
        Positioned(
            bottom: 0,
            right: 0,
            child: Container(
              padding: EdgeInsets.all(8.0),
              color: Colors.black,
              child: Text(
                category.categoryTitle,
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontFamily: FontNames.playFair,
                  fontSize: 16.0,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ))
      ],
    );
  }
}
