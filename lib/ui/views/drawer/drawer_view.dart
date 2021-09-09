import 'package:bagzz/ui/views/drawer/drawer_view_model.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';


class DrawerView extends StatelessWidget {

  const DrawerView({Key? key}) : super(key: key);
  get padding => EdgeInsets.symmetric(horizontal: 20);
  get hoverColor => null;

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<DrawerViewModel>.reactive(
        viewModelBuilder: () => DrawerViewModel(),
        onModelReady: (model) => model.init(),
        builder: (context, model, widget) {
          return  Drawer(
            child: Material(
                    color: Colors.white70,
                    child: ListView(
                      children: <Widget>[
                        buildHeader(
                          name: model.name,
                          email: model.email,
                        ),
                        Container(
                          padding: padding,
                          child: Column(
                            children: [
                              const SizedBox(height: 20),
                              buildMenuItem(
                                text: 'People',
                                icon: Icons.people,
                              ),
                            ],
                          ),
                        ),
                        Container(
                          padding: padding,
                          child: Column(
                            children: [
                              const SizedBox(height: 20),
                              buildMenuItem(
                                text: 'Favourites',
                                icon: Icons.favorite_border,
                              ),
                            ],
                          ),
                        ),
                        Container(
                          padding: padding,
                          child: Column(
                            children: [
                              const SizedBox(height: 20),
                              buildMenuItem(
                                text: 'Publish Bag',
                                icon: Icons.workspaces_outline,
                              ),
                            ],
                          ),
                        ),
                        Container(
                          padding: padding,
                          child: Column(
                            children: [
                              const SizedBox(height: 20),
                              buildMenuItem(
                                text: 'Updates',
                                icon: Icons.update,
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 40),
                        Divider(color: Colors.black),
                        const SizedBox(height: 24),
                        Container(
                          padding: padding,
                          child: Column(
                            children: [
                              buildMenuItem(
                                text: 'Plugins',
                                icon: Icons.account_tree_outlined,
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 20),
                        Container(
                          padding: padding,
                          child: Column(
                            children: [
                              buildMenuItem(
                                text: 'Notifications',
                                icon: Icons.notifications_outlined,
                              ),
                            ],
                          ),
                        ),
                      ],
                    )
                ),
          );

        });
  }
  Widget buildHeader({
    required String name,
    required String email,
  }) =>
      Container(
        padding: padding.add(EdgeInsets.symmetric(vertical: 40)),
        child: Row(
          children: [
            CircleAvatar(radius: 30, backgroundImage: AssetImage('assets/images/avatar.png'),
                backgroundColor: Colors.black),
            SizedBox(width: 20),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: TextStyle(fontSize: 20, color: Colors.black),
                ),
                const SizedBox(height: 4),
                Text(
                    email,
                    style: TextStyle(fontSize: 14, color: Colors.black)
                )
              ],
            ),
            Spacer(),
            CircleAvatar(
              radius: 24,
              backgroundColor: Colors.black,
              child: Icon(Icons.add_comment_outlined, color: Colors.white),
            )
          ],
        ),
      );

  Widget buildMenuItem({
    required String text,
    required IconData icon,
  }){
    final color = Colors.black;
    return ListTile(
      leading: Icon(icon, color: color),
      title: Text(text, style: TextStyle(color: Colors.black)),
      hoverColor: hoverColor,
      onTap: (){},
    );
  }
}
