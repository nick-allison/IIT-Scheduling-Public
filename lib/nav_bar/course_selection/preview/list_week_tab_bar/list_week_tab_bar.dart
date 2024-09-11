import 'package:flutter/material.dart';
import 'package:iitschedulingapp/nav_bar/course_selection/preview/list_week_tab_bar/list_tab/list_tab.dart';
import 'package:iitschedulingapp/nav_bar/course_selection/preview/list_week_tab_bar/week_tab/week_tab.dart';

import 'custom_tab.dart';

class ListWeekTabBar extends StatefulWidget {
  const ListWeekTabBar({Key? key}) : super(key: key);

  @override
  State<ListWeekTabBar> createState() => _ListWeekTabBarState();
}

class _ListWeekTabBarState extends State<ListWeekTabBar>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  int _selectedIndex = 0;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
    _tabController.addListener(() {
      setState(() {
        _selectedIndex = _tabController.index;
      });
    });
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        children: [
          const SizedBox(height: 20),
          Container(
            width: MediaQuery.of(context).size.width * 0.14,
            height: 51.94,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12.0),
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Expanded(
                    child: CustomTab(
                      label: 'List',
                      onTap: () {
                        if (mounted) {
                          _tabController.animateTo(0);
                        }
                      },
                      isSelected: _selectedIndex == 0,
                    ),
                  ),
                  const SizedBox(width: 8.0),
                  Expanded(
                    child: CustomTab(
                      label: 'Week',
                      onTap: () {
                        if (mounted) {
                          _tabController.animateTo(1);
                        }
                      },
                      isSelected: _selectedIndex == 1,
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 20),
          Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20.0),
            ),
            height: 531,
            width: 674,
            child: SizedBox(
              height: 523.11,
              width: double.maxFinite,
              child: TabBarView(
                controller: _tabController,
                children: const [
                  // First tab bar view widget
                  ListTab(),
                  // Second tab bar view widget
                  WeekTab(),
                ],
              ),
            ),
          ),
          const SizedBox(height: 10),
        ],
      ),
    );
  }
}