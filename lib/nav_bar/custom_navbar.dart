import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:iitschedulingapp/constants.dart';

class CustomNavBar extends StatelessWidget {
  const CustomNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            SvgPicture.asset(
                height: deviceHeight,
                width: deviceWidth,
                'assets/svgs/Custom_NavBarV2.svg'),
          ],
        ));
  }
}