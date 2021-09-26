import 'package:bagzz/constant/font_names.dart';
import 'package:bagzz/ui/views/drawer/drawer_view.dart';
import 'package:bagzz/ui/views/home/home_screen.dart';
import 'package:bagzz/ui/widgets/my_bottom_navigation/my_bottom_navigation.dart';
import 'package:flutter/material.dart' hide Drawer;
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:stacked/stacked.dart';

import 'main_screen_view_model.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<MainScreenViewModel>.reactive(
        viewModelBuilder: () => MainScreenViewModel(),
        onModelReady: (model) => model.getUserDetails(),
        builder: (context, model, widget) {
          return Scaffold(
            drawer: DrawerView(
              name: model.name,
              email: model.email,
              imageUrl: model.imageUrl,
            ),
            body: NestedScrollView(
              headerSliverBuilder:
                  (BuildContext context, bool innerBoxIsScrolled) {
                return [
                  SliverAppBar(
                    iconTheme: IconThemeData(color: Colors.black),
                    backgroundColor: Colors.grey[50],
                    elevation: 0,
                    leadingWidth: 65,
                    leading: InkWell(
                      onTap: Scaffold.of(context).openDrawer,
                      child: Container(
                          padding: EdgeInsets.all(15),
                          child: SvgPicture.asset(
                            'assets/icons/drawer.svg',
                          )),
                    ),
                    title: const Text(
                      'bagzz',
                      style: TextStyle(
                          color: Colors.black,
                          fontFamily: FontNames.playFair,
                          fontSize: 26,
                          fontWeight: FontWeight.bold),
                    ),
                    actions: [
                      InkWell(
                        onTap: () {},
                        child: Padding(
                          padding: const EdgeInsets.all(10),
                          child: CircleAvatar(
                            backgroundColor: Colors.grey[900],
                            backgroundImage:
                                AssetImage('assets/images/avatar.png'),
                            radius: 18,
                          ),
                        ),
                      )
                    ],
                  )
                ];
              },
              body: HomeScreen(),
            ),
            bottomNavigationBar: MyBottomNavigation(
              onTabChange: (index) => model.onTabChange(index, context),
            ),
          );
        });
  }
}
