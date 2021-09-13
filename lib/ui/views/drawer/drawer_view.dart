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
          return Drawer(
            child: Material(
                color: Colors.white70,
                child: ListView(
                  physics: NeverScrollableScrollPhysics(),
                  children: [
                    buildHeader(
                      name: model.isBusy ? 'Loading..' : model.user!.name,
                      email: model.isBusy ? 'Loading..' : model.user!.email,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Divider(
                        color: Colors.grey[900],
                      ),
                    ),
                    Container(
                      padding: padding,
                      child: Column(
                        children: [
                          const SizedBox(height: 20),
                          buildMenuItem(
                              text: 'People',
                              icon: Icons.people,
                              onTap: () => null),
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
                              onTap: () => null),
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
                              onTap: () => model.goToPublishBag()),
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
                              onTap: () => null),
                        ],
                      ),
                    ),
                    const SizedBox(height: 40),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Divider(color: Colors.grey[900]),
                    ),
                    const SizedBox(height: 24),
                    Container(
                      padding: padding,
                      child: Column(
                        children: [
                          buildMenuItem(
                              text: 'Plugins',
                              icon: Icons.account_tree_outlined,
                              onTap: () => null),
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
                              onTap: () => null),
                        ],
                      ),
                    ),
                  ],
                )),
          );
        });
  }

  Widget buildHeader({
    required String? name,
    required String? email,
  }) =>
      Container(
        padding: padding.add(EdgeInsets.only(top: 40, bottom: 8)),
        child: Row(
          children: [
            CircleAvatar(
                radius: 30,
                backgroundImage: AssetImage('assets/images/avatar.png'),
                backgroundColor: Colors.black),
            SizedBox(width: 20),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                FittedBox(
                  child: Text(
                    name!,
                    style: TextStyle(fontSize: 20, color: Colors.black),
                  ),
                ),
                const SizedBox(height: 4),
                FittedBox(
                  child: Text(email!,
                      style: TextStyle(fontSize: 14, color: Colors.black)),
                )
              ],
            ),
          ],
        ),
      );

  Widget buildMenuItem({
    required String text,
    required IconData icon,
    required Function onTap,
  }) {
    final color = Colors.black;
    return ListTile(
      leading: Icon(icon, color: color),
      title: Text(text, style: TextStyle(color: Colors.black)),
      hoverColor: hoverColor,
      onTap: () => onTap(),
    );
  }
}
