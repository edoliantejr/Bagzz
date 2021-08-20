import 'package:bagzz/models/bags_gridview_item.dart';
import 'package:bagzz/ui/views/home/home_screen_view_model.dart';
import 'package:bagzz/ui/widgets/bag_grid_view.dart';
import 'package:bagzz/ui/widgets/category_grid_view.dart';
import 'package:bagzz/ui/widgets/image_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
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
      builder: (context, model, child) {
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
                    ImageSlider(model.bagsList),
                    BagGridView(bags: bags_gridview_item),
                    CategoryGridView(
                      categories: model.categlist,
                    )
                  ],
                ),
              );
      },
    );
  }
}
