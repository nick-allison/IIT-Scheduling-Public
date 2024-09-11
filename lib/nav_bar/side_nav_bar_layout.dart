import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:iitschedulingapp/nav_bar/settings/settings.dart';
import 'package:iitschedulingapp/nav_bar/tasks/tasks.dart';
import 'package:iitschedulingapp/nav_bar/today/today.dart';

import 'cassie/cassie.dart';
import 'course_selection/course_selection.dart';

class SideMenuLayout extends StatefulWidget {
  const SideMenuLayout({super.key});

  @override
  State<SideMenuLayout> createState() => _SideMenuLayoutState();
}

class _SideMenuLayoutState extends State<SideMenuLayout> {
  final _pageController = PageController();
  bool pageIsScrolling = false;

  @override
  Widget build(BuildContext context) {
    double spacing = MediaQuery.of(context).size.height *
        0.025; // 2.5% of the screen height for top and bottom

    void onScroll(double offset) {
      if (pageIsScrolling == false) {
        pageIsScrolling = true;
        if (offset > 0) {
          _pageController
              .nextPage(
              duration: const Duration(milliseconds: 500),
              curve: Curves.easeInOut)
              .then((value) => pageIsScrolling = false);
          print('next page');
        } else {
          _pageController
              .previousPage(
              duration: const Duration(milliseconds: 500),
              curve: Curves.easeInOut)
              .then((value) => pageIsScrolling = false);
          print('previous page');
        }
      }
    }

    List<Widget> pages = [
      const CourseSelection(),
      const Tasks(),
      const Today(),
      const CASSIE(),
      const Settings(),
    ];

    return Scaffold(
      body: Stack(
        children: [
          // White background for full-screen
          Container(
            color: Colors.white, // Change background color to white
            child: Row(
              children: [
                Column(
                  children: [
                    IconButton(
                        onPressed: () => _pageController.jumpToPage(0),
                        icon: const Icon(Icons.schedule)),
                    IconButton(
                        onPressed: () => _pageController.jumpToPage(1),
                        icon: const Icon(Icons.assignment)),
                    IconButton(
                        onPressed: () => _pageController.jumpToPage(2),
                        icon: const Icon(Icons.notifications)),
                    // Add more IconButton widgets here
                  ],
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.75,
                ),
              ],
            ),
          ),

          // Transparent gray background for smaller widget
          Positioned(
            top: spacing / 2,
            bottom: spacing / 2,
            right: spacing, // 2.5% of the screen width from the right
            child: GestureDetector(
              onPanUpdate: (details) {
                onScroll(details.delta.dy * -1);
              },
              child: Listener(
                onPointerSignal: (pointerSignal) {
                  if (pointerSignal is PointerScrollEvent) {
                    onScroll(pointerSignal.scrollDelta.dy);
                  }
                },
                child: SizedBox(
                  width: MediaQuery.of(context).size.width *
                      0.75, // 75% of the screen width
                  child: PageView.builder(
                    itemCount: pages.length,
                    scrollDirection: Axis.vertical,
                    padEnds: false,
                    controller: _pageController,
                    itemBuilder: (BuildContext context, int index) {
                      return Container(
                        margin: EdgeInsets.only(top: spacing / 2, bottom: spacing / 2),
                        child: pages[index],
                      );
                    },
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}