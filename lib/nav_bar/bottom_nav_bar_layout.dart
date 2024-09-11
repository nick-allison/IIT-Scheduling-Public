import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class BottomNavBarLayout extends StatefulWidget {
  const BottomNavBarLayout({super.key});

  @override
  State<BottomNavBarLayout> createState() => _BottomNavBarLayoutState();
}

class _BottomNavBarLayoutState extends State<BottomNavBarLayout> {
  final _pageController = PageController();
  bool pageIsScrolling = false;

  @override
  Widget build(BuildContext context) {
    double topBarHeight = MediaQuery.of(context).size.height * 0.1;
    double topPadding = MediaQuery.of(context).padding.top;

    void onScroll(double offset) {
      if (pageIsScrolling == false) {
        pageIsScrolling = true;
        if (offset > 0) {
          _pageController
              .nextPage(
            duration: const Duration(milliseconds: 500),
            curve: Curves.easeInOut,
          )
              .then((value) => pageIsScrolling = false);
          print('Next page');
        } else {
          _pageController
              .previousPage(
            duration: const Duration(milliseconds: 500),
            curve: Curves.easeInOut,
          )
              .then((value) => pageIsScrolling = false);
          print('Previous page');
        }
      }
    }

    List<Widget> pages = [
      ClipRRect(
        borderRadius: const BorderRadius.only(
          bottomLeft: Radius.circular(20.0),
          bottomRight: Radius.circular(20.0),
        ),
        child: Container(
          width: MediaQuery.of(context).size.width, // Take up whole width
          padding: EdgeInsets.only(top: topPadding), // Add top padding
          decoration: BoxDecoration(
            color: Colors.grey.withOpacity(0.3),
          ),
          child: const Center(
            child: Text(
              'Page 1 Content',
              style: TextStyle(
                fontSize: 18.0,
                color: Colors.black,
              ),
            ),
          ),
        ),
      ),
      ClipRRect(
        borderRadius: const BorderRadius.only(
          bottomLeft: Radius.circular(20.0),
          bottomRight: Radius.circular(20.0),
        ),
        child: Container(
          width: MediaQuery.of(context).size.width, // Take up whole width
          padding: EdgeInsets.only(top: topPadding), // Add top padding
          decoration: BoxDecoration(
            color: Colors.grey.withOpacity(0.3),
          ),
          child: const Center(
            child: Text(
              'Page 2 Content',
              style: TextStyle(
                fontSize: 18.0,
                color: Colors.black,
              ),
            ),
          ),
        ),
      ),
      ClipRRect(
        borderRadius: const BorderRadius.only(
          bottomLeft: Radius.circular(20.0),
          bottomRight: Radius.circular(20.0),
        ),
        child: Container(
          width: MediaQuery.of(context).size.width, // Take up whole width
          padding: EdgeInsets.only(top: topPadding), // Add top padding
          decoration: BoxDecoration(
            color: Colors.grey.withOpacity(0.3),
          ),
          child: const Center(
            child: Text(
              'Page 3 Content',
              style: TextStyle(
                fontSize: 18.0,
                color: Colors.black,
              ),
            ),
          ),
        ),
      ),
      ClipRRect(
        borderRadius: const BorderRadius.only(
          bottomLeft: Radius.circular(20.0),
          bottomRight: Radius.circular(20.0),
        ),
        child: Container(
          width: MediaQuery.of(context).size.width, // Take up whole width
          padding: EdgeInsets.only(top: topPadding), // Add top padding
          decoration: BoxDecoration(
            color: Colors.grey.withOpacity(0.3),
          ),
          child: const Center(
            child: Text(
              'Page 4 Content',
              style: TextStyle(
                fontSize: 18.0,
                color: Colors.black,
              ),
            ),
          ),
        ),
      ),
    ];

    return Scaffold(
      body: Stack(
        children: [
          // Page content taking up the whole screen
          Positioned.fill(
            left: 0,
            right: 0,
            bottom: topBarHeight, // Leave space for icons at the bottom
            child: GestureDetector(
              onPanUpdate: (details) {
                onScroll(details.delta.dx);
              },
              child: Listener(
                onPointerSignal: (pointerSignal) {
                  if (pointerSignal is PointerScrollEvent) {
                    onScroll(pointerSignal.scrollDelta.dx);
                  }
                },
                child: PageView.builder(
                  itemCount: pages.length,
                  controller: _pageController,
                  itemBuilder: (BuildContext context, int index) {
                    return pages[index];
                  },
                ),
              ),
            ),
          ),
          // Icons at the bottom
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                IconButton(
                  onPressed: () => _pageController.jumpToPage(0),
                  icon: const Icon(Icons.schedule),
                ),
                IconButton(
                  onPressed: () => _pageController.jumpToPage(1),
                  icon: const Icon(Icons.assignment),
                ),
                IconButton(
                  onPressed: () => _pageController.jumpToPage(2),
                  icon: const Icon(Icons.notifications),
                ),
                IconButton(
                  onPressed: () => _pageController.jumpToPage(3),
                  icon: const Icon(Icons.person),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}