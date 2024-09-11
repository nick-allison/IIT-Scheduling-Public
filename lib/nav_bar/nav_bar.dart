import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:iitschedulingapp/nav_bar/side_nav_bar_layout.dart'; // Import the SideNavBarLayout
import 'package:iitschedulingapp/nav_bar/top_nav_bar_layout.dart'; // Import the TopNavBarLayout\
import 'package:iitschedulingapp/nav_bar/bottom_nav_bar_layout.dart'; // Renamed to clarify its purpose
import 'dart:io' show Platform; // Import Platform from dart:io

class NavBar extends StatefulWidget {
  const NavBar({Key? key}) : super(key: key);

  @override
  State<NavBar> createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  // Function to build the appropriate navigation bar layout based on the platform
  Widget navBarBuilder() {
    if (kIsWeb) {
      return const TopNavBarLayout(); // Display the top navigation bar for web
    } else if (Platform.isAndroid || Platform.isIOS) {
      return const BottomNavBarLayout(); // Display the bottom navigation bar for Android and iOS
      // You can optionally use a custom navigation bar instead of BottomNavBarLayout
    } else {
      return const SideMenuLayout(); // Display a side menu layout for other platforms
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: navBarBuilder(), // Build the selected navigation bar layout
    );
  }
}