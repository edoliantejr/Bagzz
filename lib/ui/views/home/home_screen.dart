import 'package:bagzz/ui/views/home/home_screen_view_model.dart';
import 'package:bagzz/ui/widgets/bag_banner_slider/bag_banner_slider.dart';
import 'package:bagzz/ui/widgets/bag_grid_view/bag_grid_view.dart';
import 'package:bagzz/ui/widgets/category_grid_view/category_grid_view.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<HomeScreenViewModel>.reactive(
        onModelReady: (model) => model.init(),
        viewModelBuilder: () => HomeScreenViewModel(),
        builder: (builder, model, child) {
          return model.isBusy
              ? Scaffold(
                  body: Container(
                    child: Center(
                      child: CircularProgressIndicator(),
                    ),
                  ),
                )
              : SingleChildScrollView(
                  physics: BouncingScrollPhysics(),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      BagBannerSlider(bags: model.bagBannerList),
                      BagGridView(bags: model.bagsList),
                      CategoryGridView(
                        categories: model.categoryList,
                      )
                    ],
                  ),
                );
        });
  }
}
