import 'dart:async';

import 'package:aoura_chat/widgets/styleguide/container_styles.dart';
import 'package:aoura_chat/widgets/styleguide/responsive_ui/size_config.dart';
import 'package:aoura_chat/widgets/styleguide/text_styles.dart';
import 'package:aoura_chat/widgets/styleguide/nav_items.dart';
import 'package:aoura_chat/widgets/styleguide/page_transitions.dart';
import 'package:feather_icons_flutter/feather_icons_flutter.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:foldable_sidebar/foldable_sidebar.dart';

class MyDrawer extends StatefulWidget {

  @override
  _MyDrawerState createState() => _MyDrawerState();
}

class _MyDrawerState extends State<MyDrawer> {
  int selectedTabIndex = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
        color: Colors.white,
        width: MediaQuery.of(context).size.width / 1.4,
        child: SafeArea(
          child: Theme(
            data: ThemeData(brightness: Brightness.dark),
            child: Stack(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.max,
                  children: [
//                Container(
//                  margin: EdgeInsets.only(left: SizeConfig.widthMultiply(17)),
//                  child: Image.asset(
//                    'assets/images/logo/logo_aoura.png',
//                    width: 120,
//                  ),
//                ),
                    Container(
                      margin:
                      const EdgeInsets.only(left: 19.0, top: 10.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Stack(
                            children: <Widget>[
                              Container(
                                height: 100.0,
                                decoration: BoxDecoration(),
                                child: Row(
                                  children: <Widget>[
                                    Container(
                                      height: 40,
                                      width: 40,
                                      decoration: BoxDecoration(
                                          image: DecorationImage(
                                              image: AssetImage(
                                                  "assets/images/user.jpeg"),
                                              fit: BoxFit.contain),
                                          borderRadius:
                                          BorderRadius.circular(
                                              10.0)),
                                    )
                                  ],
                                ),
                              ),
                            ],
                          ),
                          Text(
                            "Ajiboye Joshua",
                            style: TextStyle(
                                fontFamily: "poppins",
                                color: Colors.black,
                                fontSize:
                                2.27 * SizeConfig.textMultiplier,
                                fontWeight: FontWeight.normal),
                          )
                        ],
                      ),
                    ),
                    SizedBox(height: 70,),
                    NavTabItems(
                      isSelected: selectedTabIndex == 0,
                      onTabTap: () {
                        onTabTap(0);
                      },
                      iconName: FeatherIcons.user,
                      text: "Edit profile",
                    ),
                    NavTabItems(
                      isSelected: selectedTabIndex == 1,
                      onTabTap: () {
                        onTabTap(1);
                      },
                      iconName: FeatherIcons.messageSquare,
                      text: "Messages",
                    ),
                    NavTabItems(
                      isSelected: selectedTabIndex == 2,
                      onTabTap: () {
                        onTabTap(2);
                      },
                      iconName: FeatherIcons.barChart2,
                      text: "Projects",
                    ),
                    SizedBox(
                      height: 1.3 * SizeConfig.heightMultiplier,
                    ),
                    Container(
                      width: 20,
                      height: 10,
                      margin: const EdgeInsets.only(
                          left: 22, top: 20, bottom: 16),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: <Widget>[
                          Expanded(
                              flex: 3,
                              child: Divider(
                                color: Colors.white,
                              )),
                          Expanded(
                            flex: 4,
                            child: Divider(),
                          )
                        ],
                      ),
                    ),
//                    Text("Recent projects"),
                    Spacer(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Container(
                            alignment: Alignment.center,
                            padding: const EdgeInsets.symmetric(
                                horizontal: 5.0, vertical: 30.0),
                            decoration: BoxDecoration(
                                color: Colors.transparent
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Container(
                                  margin:
                                  const EdgeInsets.only(top: 4.0),
                                  child: Text(
                                    "Log Out",
                                    style: logOutStyle,
                                  ),
                                )
                              ],
                            )),
                      ],
                    )
                  ],
                ),
                Positioned(
                  width: 12.72 * SizeConfig.widthMultiplier,
                  height: 5.88 * SizeConfig.heightMultiplier,
                  right: 2.54 * SizeConfig.widthMultiplier,
                  top: 2.41 * SizeConfig.heightMultiplier,
                  child: GestureDetector(
                    onTap: null,
                      child: Container(
                      height: 20,
                      decoration: BoxDecoration(
                          border: Border.all(color: Color(0xffF8F1F1)),
                          borderRadius: BorderRadius.circular(10)),
                      child: Icon(
                        Icons.close,
                        color: Colors.black,
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  onTabTap(int index) {
    setState(() {
      selectedTabIndex = index;
//      Phoenix.rebirth(context);
    });
  }

  Future<Timer> simulateInitialDataLoading(Widget page) async {
    return Timer(
      const Duration(seconds: 2),
          () => Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => page,
        ),
      ),
    );
  }
}
