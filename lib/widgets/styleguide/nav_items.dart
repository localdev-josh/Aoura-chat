import 'package:aoura_chat/widgets/styleguide/responsive_ui/size_config.dart';
import 'package:aoura_chat/widgets/styleguide/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

import 'container_styles.dart';

class NavTabItems extends StatelessWidget {
  final bool isSelected;
  final String text;
  final IconData iconName;
  final Function onTabTap;

  NavTabItems({this.isSelected, this.text, this.onTabTap, this.iconName});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTabTap,
      child: AnimatedContainer(
          width: 45.9 * SizeConfig.widthMultiplier,
          margin: EdgeInsets.only(left: SizeConfig.widthMultiply(13)),
          padding: EdgeInsets.symmetric(
              horizontal: 1.27 * SizeConfig.widthMultiplier,
              vertical: 1.32 * SizeConfig.heightMultiplier),
          decoration: isSelected ? selectedTabStyle : defaultTabStyle,
          duration: const Duration(milliseconds: 300),
          child: Row(
            children: <Widget>[
              Container(
                alignment: Alignment.center,
                padding: EdgeInsets.symmetric(
                    vertical: SizeConfig.heightMultiply(16),
                    horizontal: SizeConfig.widthMultiply(16)),
                decoration: BoxDecoration(
                    color: isSelected ? selectedColorMenu : colorMenu,
                    borderRadius: BorderRadius.circular(10)),
                child: Icon(
                  iconName,
                  size: 18,
                  color: isSelected ? selectedIconStyle : iconStyle,
                ),
              ),
              Container(
                margin: EdgeInsets.only(
                    top: 0.47 * SizeConfig.heightMultiplier, left: 14),
                child: AnimatedDefaultTextStyle(
                  child: Text(text),
                  style: isSelected ? selectedMenuTextStyle : menuTextStyle,
                  duration: const Duration(milliseconds: 300),
                ),
              )
            ],
          )),
    );
  }
}
