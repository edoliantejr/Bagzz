import 'package:bagzz/constant/font_names.dart';
import 'package:bagzz/ui/views/home/home_screen.dart';
import 'package:bagzz/ui/views/main/main_screen_viewmodel.dart';
import 'package:bagzz/ui/widgets/my_bottom_navigation/my_bottom_navigation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:stacked/stacked.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<MainScreenViewModel>.reactive(
        viewModelBuilder: () => MainScreenViewModel(),
        onModelReady: (model) => model.init(),
        builder: (builder, model, child) {
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
                          padding: EdgeInsets.symmetric(horizontal: 13),
                          width: 24,
                          height: 14,
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
                              backgroundColor: Colors.black,
                              backgroundImage:
                                  AssetImage('assets/images/avatar.png'),
                              radius: 18,
                            ))
                      ],
                    )
                  ];
                },
                body: HomeScreen(),
              ),
              bottomNavigationBar: MyBottomNavigation(
                  onTabChange: (index) => model.onTabChange(index, context)));
        });
  }

}
