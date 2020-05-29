import 'package:aoura_chat/pages/home/screens/main_page.dart';
import 'package:feather_icons_flutter/feather_icons_flutter.dart';
import 'package:flutter/cupertino.dart';
import "package:flutter/material.dart";
import 'custom_drawer.dart';

class CustomBottomNav extends StatefulWidget {
  final Function updateIndex;

  CustomBottomNav(this.updateIndex);

  @override
  State<StatefulWidget> createState() {
    return _CustomBottomNav();
  }
}

class _CustomBottomNav extends State<CustomBottomNav> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    double myHeight = 70;
    return Material(
      elevation: 20.0,
      color: Color(0xff2F3034),
      shape: new RoundedRectangleBorder(
        borderRadius: new BorderRadius.circular(8.0),
      ),
      child: Container(
          height: myHeight,
          width: MediaQuery.of(context).size.width / 1.14,
          padding: EdgeInsets.only(right: 10, left: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              GestureDetector(
                // I want to open the drawer from this tap
                onTap: null,
                child: Container(
                  alignment: Alignment.center,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Icon(
                        Icons.wrap_text,
                        size: 23,
                        color: Colors.white,
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                width: 1.0,
                color: Color(0xff464749),
                margin: EdgeInsets.only(left: 20, right: 1),
                height: 25,
              ),
              Expanded(
                child: Container(
                  child: TabBar(
                    tabs: [
                      Tab(
                        icon: Icon(
                          FeatherIcons.home,
                          size: 19,
                        ),
                      ),
                      Tab(
                        icon: Icon(
                          FeatherIcons.list,
                          size: 19,
                        ),
                      ),
                      Tab(
                        icon: Icon(
                          FeatherIcons.search,
                          size: 19,
                        ),
                      ),
                    ],
                    onTap: (int index) {
                      setState(() {
                        _selectedIndex = index;
                      });

                      widget.updateIndex(index);
                    },
                    indicatorColor: Colors.transparent,
                    indicatorSize: TabBarIndicatorSize.label,
                    labelColor: Color(0xffFF6668),
                    unselectedLabelColor: Colors.white,
                  ),
                ),
              ),
              Container(
                width: 54,
                height: 51,
                child: RaisedButton(
                  shape: new RoundedRectangleBorder(
                    borderRadius: new BorderRadius.circular(8),
                  ),
                  color: Color(0xff2D55DB),
                  child: Icon(
                    Icons.add,
                    size: 23,
                    color: Colors.white,
                  ),
                  onPressed: () {},
                ),
              )
            ],
          )),
    );
  }
}
