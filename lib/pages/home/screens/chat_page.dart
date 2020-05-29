import 'package:aoura_chat/widgets/styleguide/bottom_nav.dart';
import 'package:aoura_chat/widgets/styleguide/dashed_rect.dart';
import 'package:aoura_chat/widgets/styleguide/responsive_ui/size_config.dart';
import 'package:aoura_chat/widgets/styleguide/scroll_configs.dart';
import 'package:flutter/material.dart';
import 'package:kf_drawer/kf_drawer.dart';

class ChatPage extends StatefulWidget {
  final String title;
  final Function startAnimation;

  ChatPage({Key key, this.title, this.startAnimation}) : super(key: key);

  @override
  _ChatPageState createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  int selectedIndex = 0;

  updateIndex(index) {
    print(index);
    setState(() {
      selectedIndex = index;
    });
  }

  Widget accountTab() {
    return Container(
      padding: EdgeInsets.only(top: 32, left: 8.0, right: 6.0),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[],
        ),
      ),
    );
  }

  Widget ChatsCall() {
    return Container(
      padding: EdgeInsets.only(top: 32, left: 8.0, right: 6.0),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[Text("Call")],
        ),
      ),
    );
  }

  Widget ChatsGeneral() {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints viewportConstraints) {
        return ScrollConfiguration(
          behavior: MyBehavior(),
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: ConstrainedBox(
              constraints:
                  BoxConstraints(minHeight: viewportConstraints.maxHeight),
              child: Column(children: [
                Container(
                  margin: EdgeInsets.only(
                    left: 6.11 * SizeConfig.widthMultiplier,
                    right: 6.11 * SizeConfig.widthMultiplier,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Container(
                        child: Row(
                          children: <Widget>[
                            Text(
                              "Messages",
                              style: TextStyle(
                                  fontSize: 3.525 * SizeConfig.textMultiplier,
                                  fontWeight: FontWeight.w700,
                                  color: Color(0xff2F3336)),
                            ),
                            Container(
                                margin: EdgeInsets.only(
                                    top: 0.705 * SizeConfig.heightMultiplier,
                                    left: 0.51 * SizeConfig.widthMultiplier),
                                child: Icon(
                                  Icons.keyboard_arrow_down,
                                  color: Color(0xffFD6768),
                                ))
                          ],
                        ),
                      ),
                      DottedBorder(
                          borderType: BorderType.RRect,
                          radius: Radius.circular(
                              0.94 * SizeConfig.heightMultiplier),
                          color: Colors.grey,
                          child: Center(
                            child: Transform.rotate(
                              angle: 4.75,
                              child: Icon(
                                Icons.tune,
                                size: 2.82 * SizeConfig.textMultiplier,
                                color: Color(0xffFD6768),
                              ),
                            ),
                          ),
                          strokeWidth: 1,
                          padding: EdgeInsets.all(
                              1.175 * SizeConfig.heightMultiplier),
                          dashPattern: [3, 4])
                    ],
                  ),
                ),
                SizedBox(
                  height: 1.41 * SizeConfig.heightMultiplier,
                ),
              ]),
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 3,
      borderRadius: BorderRadius.circular(20),
      child: DefaultTabController(
        initialIndex: 0,
        length: 3,
        child: SafeArea(
          child: Stack(
            children: <Widget>[
              Container(
                  width: MediaQuery.of(context).size.width,
                  height: 60,
                  alignment: Alignment.center,
                  margin: EdgeInsets.symmetric(vertical: 27, horizontal: 24),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          new Text(
                            selectedIndex == 0 ? 'Dashboard' : 'Projects',
                            style: new TextStyle(
                                color: Colors.black45,
                                fontFamily: 'Montserrat',
                                fontWeight: FontWeight.w600,
                                letterSpacing: 0.3,
                                fontSize: 23.0),
                          ),
                        ],
                      ),
                      ClipRRect(
                        borderRadius: new BorderRadius.circular(8.0),
                        child: Image.asset(
                          "assets/images/user.jpeg",
                          width: 50.0,
                          height: 50.0,
                        ),
                      ),
                    ],
                  )),
              Container(
                margin: EdgeInsets.only(top: 130),
                child: TabBarView(physics: PageScrollPhysics(), children: [
                  ChatsGeneral(),
                  ChatsCall(),
                  accountTab(),
                ]),
              ),
              Container(
                  alignment: Alignment.bottomCenter,
                  margin: EdgeInsets.symmetric(vertical: 20),
                  child: CustomBottomNav(updateIndex))
            ],
          ),
        ),
      ),
    );
  }
}
