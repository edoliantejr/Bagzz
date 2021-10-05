import 'package:bagzz/constant/font_names.dart';
import 'package:bagzz/ui/views/search/search_viewmodel.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:stacked/stacked.dart';

  class SearchBottomSheet extends StatelessWidget {
  const SearchBottomSheet({Key? key}) : super(key: key);

  static Future<dynamic> open(BuildContext context, List bagz) {
    return showModalBottomSheet(
        backgroundColor: Colors.white,
        context: context,
        isScrollControlled: true,
        builder: (context) {
          return SearchBottomSheet();
        });
  }
  

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<SearchBottomSheetViewModel>.reactive(
        viewModelBuilder: () => SearchBottomSheetViewModel(),
        builder: (context, model, child) {
          return Container(
            height: MediaQuery.of(context).size.height -
                (MediaQuery.of(context).padding.top + 88),
            padding: EdgeInsets.only(top: 16),
            child: Container(
              child: Column(
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.only(top: 10),
                    child: Column(
                      children: [
                        GestureDetector(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: Container(
                            padding: EdgeInsets.all(16),
                            child: Align(
                              alignment: Alignment.centerRight,
                              child: Icon(Icons.close),
                            ),
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.all(16),
                          child: TextField(
                            controller: model.editingController,
                            onChanged: (value) {
                              model.searchBag(model.editingController.text);
                            },
                            style: TextStyle(
                              fontFamily: FontNames.workSans,
                              fontSize: 20,
                            ),
                            decoration: InputDecoration(
                                hintText: "Type here to search",
                                suffixIcon:
                                model.editingController.text.length ==
                                    0
                                    ? null
                                    : IconButton(
                                  icon: Icon(
                                    Icons.clear,
                                    color: Colors.grey,
                                  ),
                                  onPressed: () => model
                                      .editingController
                                      .clear(),
                                ),
                                focusedBorder: UnderlineInputBorder(
                                    borderSide:
                                    BorderSide(color: Colors.black))),
                            autofocus: true,
                            textAlign: TextAlign.left,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: ListView.builder(
                      shrinkWrap: true,
                      itemCount: model.bagsList.length,
                      itemBuilder: (context, index) {
                        return InkWell(
                          key: ObjectKey(model.bagsList[index]),
                          onTap: ()=>model.onBagSearchPressed(model.bagsList[index]),
                          child: ListTile(
                           title: Text('${model.bagsList[index].name}'),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          );
        });
  }
}


