import 'package:bagzz/models/bag.dart';
import 'package:flutter/material.dart';

import 'bag_item/bag_item.dart';

class BagGridView extends StatelessWidget {
  final List<Bag> bags;

  const BagGridView({Key? key, required this.bags}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GridView.builder(
            shrinkWrap: true,
            primary: false,
            itemCount: bags.length,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 24,
              childAspectRatio: .9,
            ),
            itemBuilder: (context, i) {
              return BagItem(bags[i]);
            }),
        Center(
          child: Container(
            margin: EdgeInsets.only(top: 20.0),
            child: Container(
                padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
                decoration: BoxDecoration(
                    border: Border.all(
                  color: Colors.black,
                )),
                child: Text("CHECK ALL LATEST",
                    style: TextStyle(
                      fontFamily: 'WorkSans',
                      fontSize: 16.0,
                      fontWeight: FontWeight.bold,
                    ))),
          ),
        ),
      ],
    );
  }
}

