import 'package:bagzz/constant/font_names.dart';
import 'package:bagzz/ui/views/home/home_screen.dart';
import 'package:bagzz/ui/widgets/my_bottom_navigation/my_bottom_navigation.dart';
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
        onModelReady: (model) => model.init(),
        builder: (context, model, widget) {
          return Scaffold(
            backgroundColor: Colors.white,
            body: NestedScrollView(
              headerSliverBuilder:
                  (BuildContext context, bool innerBoxIsScrolled) {
                return [
                  SliverAppBar(
                    backgroundColor: Colors.white,
                    elevation: 0,
                    leading: Container(
                        padding: EdgeInsets.all(13),
                        child: SvgPicture.asset(
                          'assets/icons/drawer.svg',
                          height: 14,
                          width: 24,
                        )),
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
                        onTap:model.logout,
                        child: Padding(
                            padding: const EdgeInsets.all(10),
                            child: CircleAvatar(
                              backgroundColor: Colors.grey[900],
                              backgroundImage:
                                  AssetImage('assets/images/avatar.png'),
                              radius: 18,
                            )),
                      )
                    ],

                  ),


                ];
              },
              body: HomeScreen(),
            ),
            bottomNavigationBar: MyBottomNavigation(
                onTabChange: (index) => model.onTabChange(index, context)),
            drawer: Drawer(
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children:  [
                    const Text('This is the Drawer'),
                    ElevatedButton(
                      onPressed: (){},
                      child: const Text('Close Drawer'),
                    ),
                  ],
                ),
              ),
            ),
          );
        });
  }
}
