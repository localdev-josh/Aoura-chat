import 'package:aoura_chat/pages/home/screens/settings_page.dart';
import 'package:aoura_chat/utils/anim_utils.dart';
import 'package:aoura_chat/widgets/styleguide/bottom_nav.dart';
import 'package:aoura_chat/widgets/styleguide/nav_items.dart';
import 'package:aoura_chat/widgets/styleguide/responsive_ui/size_config.dart';
import 'package:aoura_chat/widgets/styleguide/text_styles.dart';
import 'package:feather_icons_flutter/feather_icons_flutter.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'chat_page.dart';

class ChatHome extends StatefulWidget {
  AnimationController controller;

  ChatHome(this.controller);

  @override
  _ChatHomeState createState() => _ChatHomeState();
}

class _ChatHomeState extends State<ChatHome> {
  int _counter = 0;
  static String _pageTitle = "Chat general";
  int selectedTabIndex = 0;
  static int selectedIndex = 0;
  static Widget _pageName = ChatPage(
    title: "Chat General",
  );

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  updateIndex(index) {
    print(index);
    setState(() {
      selectedIndex = index;
    });
  }

  startAnimation(AnimationController controller) {
    controller.fling(
        velocity: AnimUtil.isBackpanelVisible(widget.controller) ? -1.0 : 1.0);
  }

  onTabTap(int index) {
    setState(() {
      selectedTabIndex = index;
    });
  }

  void animate(Widget page, String pageTitle) {
    setState(() {
      _pageName = page;
      _pageTitle = pageTitle;
    });
    startAnimation(widget.controller);
  }

  void _backViewOnClick(int position) {
    switch (position) {
      case 0:
        animate(
            ChatPage(
              title: "Chat General",
            ),
            "Chat General");
        break;
      case 1:
        animate(SettingsPage("Edit profile"), "Edit profile");
        break;
      default:
    }
  }

  Widget activityContainer(BuildContext context, BoxConstraints constraint) {
    final ThemeData _theme = Theme.of(context);
    return Container(
      child: Stack(
        children: <Widget>[_backView(_theme), _frontView()],
      ),
    );
  }

  Widget _backView(ThemeData theme) {
    return Material(
      child: Container(
        color: Colors.white,
        width: MediaQuery.of(context).size.width,
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
                      margin: const EdgeInsets.only(left: 19.0, top: 10.0),
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
                                              BorderRadius.circular(10.0)),
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
                                fontSize: 2.27 * SizeConfig.textMultiplier,
                                fontWeight: FontWeight.normal),
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 70,
                    ),
                    NavTabItems(
                      isSelected: selectedTabIndex == 0,
                      onTabTap: () {
                        onTabTap(0);
                        _backViewOnClick(0);
                      },
                      iconName: FeatherIcons.messageSquare,
                      text: "Chats",
                    ),
                    NavTabItems(
                      isSelected: selectedTabIndex == 1,
                      onTabTap: () {
                        onTabTap(1);
                        _backViewOnClick(1);
                      },
                      iconName: FeatherIcons.user,
                      text: "Edit profile",
                    ),
                    SizedBox(
                      height: 1.3 * SizeConfig.heightMultiplier,
                    ),
                    Container(
                      width: 20,
                      height: 10,
                      margin:
                          const EdgeInsets.only(left: 22, top: 20, bottom: 16),
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
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        Container(
                            width: MediaQuery.of(context).size.width,
                            padding: const EdgeInsets.symmetric(
                                horizontal: 5.0, vertical: 30.0),
                            decoration:
                                BoxDecoration(color: Colors.transparent),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Container(
                                  margin: const EdgeInsets.only(top: 4.0),
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

  Widget _frontView() {
    return SlideTransition(
        position: _getSlideAnimation(),
        child: ScaleTransition(
          alignment: Alignment.centerLeft,
          scale: _getScaleAnimation(),
          child: _frontViewBody(),
        ));
  }

  Widget _frontViewBody() {
    return Scaffold(
      appBar: AppBar(
        title: Text("Aoura"),
        backgroundColor: Colors.purple,
        actions: <Widget>[
          GestureDetector(
              onTap: () => startAnimation(widget.controller),
              // I want to call this function in the CustomBottomNav() widget
              child: Icon(Icons.add))
        ],
        leading: IconButton(
          onPressed: () => startAnimation(widget.controller),
          icon: AnimatedIcon(
            icon: AnimatedIcons.arrow_menu,
            progress: widget.controller,
          ),
        ),
      ),
      body: Stack(
        children: <Widget>[
          _pageName,
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: activityContainer,
    );
  }

/*
FrontView Slide Animation
*/

  Animation<Offset> _getSlideAnimation() {
    return Tween(begin: Offset(0.65, 0.0), end: Offset(0, 0)).animate(
        CurvedAnimation(parent: widget.controller, curve: Curves.linear));
  }

/*
Front View Scale Animation
*/

  Animation<double> _getScaleAnimation() {
    return Tween(begin: 0.7, end: 1.0).animate(
        CurvedAnimation(parent: widget.controller, curve: Curves.linear));
  }
}
