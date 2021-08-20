import 'package:bagzz/models/bag.dart';
import 'package:bagzz/ui/views/bag_item_details/bag_item_details_view_model.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class BagItemDetailsPage extends StatelessWidget {
  final Bag bag;

  const BagItemDetailsPage({Key? key, required this.bag}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<BagItemDetailsViewModel>.reactive(
      viewModelBuilder: () => BagItemDetailsViewModel(bag),
      builder: (context, model, child) {
        return Scaffold(
          body: Center(
            child: Column(
              children: [
                Text(
                  model.bag.name,
                ),
                SizedBox(
                  height: 8,
                ),
                Text(
                  model.bag.category,
                ),
                SizedBox(
                  height: 8,
                ),
                Text(
                  model.bag.price.toString(),
                ),
                Image(image: AssetImage(model.bag.image)),
              ],
            ),
          ),
        );
      },
    );
  }
}
