import 'package:bagzz/ui/views/choose_category/choose_category_view_model.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:sticky_headers/sticky_headers.dart';

class ChooseCategory extends StatelessWidget {
  const ChooseCategory({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<ChooseCategoryViewModel>.reactive(
      viewModelBuilder: () => ChooseCategoryViewModel(),
      onModelReady: (model) => model.init(),
      builder: (context, model, child) {
        return Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.grey[50],
            elevation: 0,
            leading: IconButton(
              onPressed: () => model.navigatorService.pop(),
              icon: Icon(
                Icons.arrow_back,
                color: Colors.black,
              ),
            ),
            leadingWidth: 30,
            title: Text(
              'Choose Category',
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.normal,
              ),
            ),
            actions: [
              Align(
                alignment: Alignment.centerLeft,
                child: IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.search_rounded),
                  color: Colors.deepOrange,
                ),
              )
            ],
          ),
          body: model.isBusy
              ? Center(
                  child: Container(
                    height: 50,
                    width: 50,
                    child: CircularProgressIndicator(),
                  ),
                )
              : SingleChildScrollView(
                  physics: ClampingScrollPhysics(),
                  child: Container(
                    height: MediaQuery.of(context).size.height,
                    width: MediaQuery.of(context).size.width,
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          width: double.infinity,
                          padding: EdgeInsets.all(8),
                          color: Colors.grey[200],
                          child: Text('All Categories'),
                        ),
                        StickyHeader(
                          overlapHeaders: false,
                          header: PleasChooseHeader(),
                          content: ListView.builder(
                            shrinkWrap: true,
                            primary: false,
                            itemCount: model.categories.length,
                            itemBuilder: (context, index) {
                              return CategoryListItem(
                                categoryTitle:
                                    model.categories[index].categoryTitle,
                                setProductCategory: model.setCategory,
                              );
                            },
                          ),
                        )
                      ],
                    ),
                  ),
                ),
        );
      },
    );
  }
}

///Please Choose Header
class PleasChooseHeader extends StatelessWidget {
  const PleasChooseHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey[50],
      width: MediaQuery.of(context).size.width,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Expanded(
            flex: 4,
            child: Container(
              padding: EdgeInsets.symmetric(vertical: 13, horizontal: 8),
              constraints: BoxConstraints(maxWidth: 200),
              decoration: BoxDecoration(
                border: Border(
                  bottom: BorderSide(color: Colors.redAccent, width: 2),
                ),
              ),
              child: Text(
                'Please Choose',
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 16,
                ),
              ),
            ),
          ),
          Expanded(
            flex: 7,
            child: Container(
              height: 0.5,
              width: double.infinity,
              color: Colors.grey[350],
            ),
          ),
        ],
      ),
    );
  }
}

///Category list item
class CategoryListItem extends StatelessWidget {
  final categoryTitle;
  final Function(String value) setProductCategory;

  const CategoryListItem(
      {required this.categoryTitle, required this.setProductCategory, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => setProductCategory(categoryTitle),
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 13, horizontal: 8),
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(color: Colors.grey[350]!, width: 0.3),
          ),
        ),
        child: Text(
          '$categoryTitle',
          style: TextStyle(fontWeight: FontWeight.normal, fontSize: 16),
        ),
      ),
    );
  }
}
