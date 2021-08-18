import 'package:bagzz/components/svg_icon.dart';
import 'package:bagzz/constant/constant.dart';
import 'package:bagzz/models/bags_gridview_item.dart';
import 'package:bagzz/screens/home_screen.dart';
import 'package:dot_navigation_bar/dot_navigation_bar.dart';
import 'package:flutter/material.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  TextEditingController editingController = TextEditingController();
  var inputText = "";

  var items = <String>[];

  final bags = [
    "Artsy black sling bag",
    "Berkely sling bag",
    "Sling bag blue color",
  ];

  @override
  void initState() {
    items.addAll(bags);
    super.initState();
  }

  void filterSearchResults(String query) {
    List<String> dummySearchList = <String>[];
    dummySearchList.addAll(bags);
    if (query.isNotEmpty) {
      List<String> dummyListData = <String>[];
      dummySearchList.forEach((item) {
        if (item.contains(query)) {
          dummyListData.add(item);
        }
      });
      setState(() {
        items.clear();
        items.addAll(dummyListData);
      });
      return;
    } else {
      setState(() {
        items.clear();
        items.addAll(bags);
      });
    }
  }

  int numCartItems = 0;
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    num devicePixel = MediaQuery.of(context).devicePixelRatio;

    return Scaffold(
      backgroundColor: colorWhite,
      body: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return [
            SliverAppBar(
              backgroundColor: colorWhite,
              elevation: 0,
              leading: Container(
                  margin: EdgeInsets.symmetric(
                      horizontal: 24 / devicePixel, vertical: 14 / devicePixel),
                  child: svgIcon('assets/icons/drawer.svg')),
              title: const Text(
                'bagzz',
                style: TextStyle(
                    color: colorBlack,
                    fontFamily: playFair,
                    fontSize: 26,
                    fontWeight: FontWeight.bold),
              ),
              actions: [
                Padding(
                    padding: const EdgeInsets.all(10),
                    child: CircleAvatar(
                      backgroundColor: Colors.grey[900],
                      backgroundImage: AssetImage('assets/images/avatar.jpg'),
                      radius: 18,
                    ))
              ],
            )
          ];
        },
        body: HomeScreen(),
      ),
      bottomNavigationBar: bottomNavigation(),
    );
  }

//bottom navigation widget
  Widget bottomNavigation() {
    return Stack(
      children: [
        DotNavigationBar(
          borderRadius: 40,
          currentIndex: -1,
          onTap: (int index) {
            onTabChange(index);
          },
          items: [
            DotNavigationBarItem(
              icon: svgIcon('assets/icons/home.svg'),
            ),
            DotNavigationBarItem(
              icon: svgIcon('assets/icons/search.svg'),
            ),
            DotNavigationBarItem(
              icon: svgIcon(
                'assets/icons/favorite_filled.svg',
              ),
            ),
            DotNavigationBarItem(
              icon: svgIcon('assets/icons/cart.svg'),
            ),
          ],
          boxShadow: [
            BoxShadow(
              color: colorBlack.withOpacity(0.1),
              blurRadius: 5,
            )
          ],
          itemPadding: EdgeInsets.symmetric(
            vertical: 18,
            horizontal: 29,
          ),
          // paddingR: const EdgeInsets.all(14),
          marginR: const EdgeInsets.all(8),
        ),
        numShopBagItem(bags_gridview_item.length),
      ],
    );
  }

//widget overlay to show number of items in the cart as a notification alert
  Widget numShopBagItem(int numCartItems) {
    Color color = Colors.black;
    return Positioned(
      top: 28,
      right: 33,
      child: Container(
        decoration: BoxDecoration(
            color: color = numCartItems > 0 ? color : Colors.transparent,
            border: Border.all(
                color: color =
                    numCartItems > 0 ? Colors.white : Colors.transparent),
            borderRadius: BorderRadius.circular(40)),
        height: 20,
        width: 20,
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(1.0),
            child: Text(
              '$numCartItems',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 14,
                  fontWeight: FontWeight.bold),
            ),
          ),
        ),
      ),
    );
  }

  final List<Widget> children = [
    HomeScreen(),
    HomeScreen(),
    HomeScreen(),
  ];

  void onTabChange(int index) {
    setState(() {
      currentIndex = index;
      if (index == 1) {
        showSearchSheet();
      }
    });
  }

  showSearchSheet() {
    return showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        builder: (context) {
          return Scaffold(
            body: Container(
              child: Column(
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.only(top: 59),
                    child: Column(
                      children: [
                        GestureDetector(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: Container(
                            padding: EdgeInsets.all(16),
                            child: Align(
                              alignment: Alignment.centerRight,
                              child: Icon(Icons.close),
                            ),
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.all(16),
                          child: TextField(
                            controller: editingController,
                            onChanged: (value) {
                              filterSearchResults(value);
                            },
                            style: TextStyle(
                              fontFamily: workSans,
                              fontSize: 20,
                            ),
                            decoration: InputDecoration(
                                hintText: "Type here to search",
                                suffixIcon: editingController.text.length == 0
                                    ? null
                                    : IconButton(
                                        icon: Icon(
                                          Icons.clear,
                                          color: Colors.grey,
                                        ),
                                        onPressed: () {
                                          setState(() {
                                            editingController.clear();
                                            inputText = "";
                                          });
                                        }),
                                focusedBorder: UnderlineInputBorder(
                                    borderSide:
                                        BorderSide(color: Colors.black))),
                            autofocus: true,
                            textAlign: TextAlign.left,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: ListView.builder(
                      shrinkWrap: true,
                      itemCount: items.length,
                      itemBuilder: (context, index) {
                        return ListTile(
                          title: Text('${items[index]}'),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          );
        });
  }
}




// class DataSearch extends SearchDelegate<String> {
//   final bags = [
//     "Artsy black sling bag",
//     "Berkely sling bag",
//     "Sling bag blue color",
//   ];

//   final recentBags = [
//     "Artsy black sling bag",
//     "Berkely sling bag",
//   ];

//   @override
//   List<Widget> buildActions(BuildContext context) {
//     return [
//       IconButton(
//         icon: Icon(Icons.clear),
//         onPressed: () {
//           query = "";
//         },
//       )
//     ];
//   }

//   @override
//   Widget buildLeading(BuildContext context) {
//     return IconButton(
//         icon: AnimatedIcon(
//           icon: AnimatedIcons.menu_arrow,
//           progress: transitionAnimation,
//         ),
//         onPressed: () {
//           close(context, query);
//         });
//   }

//   @override
//   Widget buildResults(BuildContext context) {
//     return Center(
//       child: Container(
//         height: 100.0,
//         width: 100.0,
//         child: Card(
//           color: Colors.red,
//           child: Center(
//             child: Text(query),
//           ),
//         ),
//       ),
//     );
//   }

//   @override
//   Widget buildSuggestions(BuildContext context) {
//     final suggestionList = query.isEmpty
//         ? recentBags
//         : bags.where((p) => p.startsWith(query)).toList();

//     return ListView.builder(
//       itemBuilder: (context, index) => ListTile(
//           onTap: () {
//             showResults(context);
//           },
//           title: RichText(
//             text: TextSpan(
//                 text: suggestionList[index].substring(0, query.length),
//                 style:
//                     TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
//                 children: [
//                   TextSpan(
//                       text: suggestionList[index].substring(query.length),
//                       style: TextStyle(color: Colors.grey))
//                 ]),
//           )),
//       itemCount: suggestionList.length,
//     );
//   }
// }
