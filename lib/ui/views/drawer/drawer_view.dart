import 'package:bagzz/ui/views/drawer/drawer_view_model.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class DrawerView extends StatelessWidget {
  final String name;
  final String email;
  final String imageUrl;

  const DrawerView(
      {required this.name,
      required this.email,
      required this.imageUrl,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<DrawerViewModel>.reactive(
        viewModelBuilder: () => DrawerViewModel(),
        builder: (context, model, widget) {
          return Drawer(
            child: Material(
                color: Colors.white70,
                child: ListView(
                  physics: NeverScrollableScrollPhysics(),
                  children: [
                    DrawerHeader(
                      name: name,
                      email: email,
                      imageUrl: imageUrl,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Divider(
                        color: Colors.grey[900],
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      child: Column(
                        children: [
                          const SizedBox(height: 20),
                          DrawerItem(
                              btnText: 'People',
                              btnIcon: Icons.people,
                              onBtnTap: () {}),
                        ],
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      child: Column(
                        children: [
                          const SizedBox(height: 20),
                          DrawerItem(
                              btnText: 'Favourites',
                              btnIcon: Icons.favorite_border,
                              onBtnTap: () {}),
                        ],
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      child: Column(
                        children: [
                          const SizedBox(height: 20),
                          DrawerItem(
                            btnText: 'Publish Bag',
                            btnIcon: Icons.workspaces_outline,
                            onBtnTap: () => model.goToPublishBag(),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      child: Column(
                        children: [
                          const SizedBox(height: 20),
                          DrawerItem(
                              btnText: 'Updates',
                              btnIcon: Icons.update,
                              onBtnTap: () {}),
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
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      child: Column(
                        children: [
                          DrawerItem(
                              btnText: 'Notifications',
                              btnIcon: Icons.notifications_outlined,
                              onBtnTap: () {}),
                        ],
                      ),
                    ),
                    const SizedBox(height: 20),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      child: Column(
                        children: [
                          DrawerItem(
                            btnText: 'Logout',
                            btnIcon: Icons.logout,
                            onBtnTap: model.logout,
                          )
                        ],
                      ),
                    ),
                  ],
                )),
          );
        });
  }
}

///Drawer Header
class DrawerHeader extends StatelessWidget {
  final String name;
  final String email;
  final String imageUrl;

  const DrawerHeader(
      {required this.name,
      required this.email,
      required this.imageUrl,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 40, bottom: 8, left: 20),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(50),
            child: CachedNetworkImage(
              imageUrl: imageUrl,
              placeholder: (context, url) => Text('User photo'),
              height: 60,
              width: 60,
            ),
          ),
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
                style: TextStyle(fontSize: 14, color: Colors.black),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

///Drawer Item
class DrawerItem extends StatelessWidget {
  final String btnText;
  final IconData btnIcon;
  final VoidCallback onBtnTap;

  const DrawerItem(
      {required this.btnText,
      required this.btnIcon,
      required this.onBtnTap,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(btnIcon),
      title: Text(btnText, style: TextStyle(color: Colors.black)),
      hoverColor: null,
      onTap: () => onBtnTap(),
    );
  }
}
