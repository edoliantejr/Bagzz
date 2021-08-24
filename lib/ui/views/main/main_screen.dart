import 'package:bagzz/constant/font_names.dart';
import 'package:bagzz/ui/views/home/home_screen.dart';
import 'package:bagzz/ui/views/main/main_screen_view_model.dart';
import 'package:bagzz/ui/widgets/my_bottom_navigation/my_bottom_navigation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:stacked/stacked.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    num devicePixel = MediaQuery.of(context).devicePixelRatio;

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
                        margin: EdgeInsets.symmetric(
                            horizontal: 24 / devicePixel,
                            vertical: 14 / devicePixel),
                        child: SvgPicture.asset('assets/icons/drawer.svg')),
                    title: const Text(
                      'bagzz',
                      style: TextStyle(
                          color: Colors.black,
                          fontFamily: FontNames.playFair,
                          fontSize: 26,
                          fontWeight: FontWeight.bold),
                    ),
                    actions: [
                      Padding(
                          padding: const EdgeInsets.all(10),
                          child: CircleAvatar(
                            backgroundColor: Colors.grey[900],
                            backgroundImage:
                                AssetImage('assets/images/avatar.jpg'),
                            radius: 18,
                          ))
                    ],
                  )
                ];
              },
              body: HomeScreen(),
            ),
            bottomNavigationBar: MyBottomNavigation(
                onTabChange: (index) => model.onTabChange(index, context)),
          );
        });
  }
}
