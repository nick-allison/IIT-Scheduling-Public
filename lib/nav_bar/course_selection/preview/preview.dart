import 'package:flutter/material.dart';

import 'list_week_tab_bar/list_week_tab_bar.dart';

class Preview extends StatelessWidget {
  const Preview({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Create a Container with a width of 47.5% of the screen width
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.45,
      child: const Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          DefaultTabController(
            length: 2,
            child: ListWeekTabBar(),
          ),
        ],
      ),
    );
  }
}
