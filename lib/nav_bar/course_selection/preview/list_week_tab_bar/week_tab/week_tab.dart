import 'package:flutter/material.dart';
import 'package:flutter_layout_grid/flutter_layout_grid.dart';

class WeekTab extends StatefulWidget {
  const WeekTab({Key? key}) : super(key: key);

  @override
  State<WeekTab> createState() => _WeekTabState();
}

class _WeekTabState extends State<WeekTab> {
  // Define constants for colors
  static const Color colorOrange = Colors.orange;

  // Define days of the week and time slots
  List<String> daysOfWeek = [
    'monday',
    'tuesday',
    'wednesday',
    'thursday',
    'friday'
  ];
  List<String> timeSlots = [
    '800',
    '900',
    '1000',
    '1100',
    '1200',
    '1300',
    '1400',
    '1500',
    '1600',
    '1700',
    '1800',
    '1900',
    '2000',
    '2100',
    '2200'
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: LayoutGrid(
        areas: '''
        .      monday tuesday wednesday thursday friday
        8      mon8   tue8     wed8      thu9     fri8
        9      mon9   tue9     wed9      thu9     fri9
        10     mon10  tue10    wed10     thu10    fri10
        11     mon11  tue11    wed11     thu11    fri11
        12     mon12  tue12    wed12     thu12    fri12
        13     mon13  tue13    wed13     thu13    fri13
        14     mon14  tue14    wed14     thu14    fri14
        15     mon15  tue15    wed15     thu15    fri15
        16     mon16  tue16    wed16     thu16    fri16
        17     mon17  tue17    wed17     thu17    fri17
        18     mon18  tue18    wed18     thu18    fri18
        19     mon19  tue19    wed19     thu19    fri19
        20     mon20  tue20    wed20     thu20    fri20
        21     mon21  tue21    wed21     thu21    fri21
        22     mon22  tue22    wed22     thu22    fri22
      ''',
        columnSizes: [1.fr, 1.fr, 1.fr, 1.fr, 1.fr, 1.fr],
        rowSizes: List.filled(16, 1.fr),
        children: [
          // Column 1
          gridArea('.').containing(Container(color: Colors.transparent)),
          for(int i = 8; i < 23; i++)
            gridArea(i.toString()).containing(Container(color: Colors.transparent, child: Text('$i'),)),
          // Column 2
          gridArea('monday').containing(Container(color: Colors.transparent, child: const Text('Monday'),)),
          for(int i = 8; i < 23; i++)
            gridArea('mon$i').containing(Container(color: Colors.yellow)),
          // Column 3
          gridArea('tuesday').containing(Container(color: Colors.transparent, child: const Text('Tuesday'),)),
          for(int i = 8; i < 23; i++)
            gridArea('tue$i').containing(Container(color: Colors.blue)),
          // Column 4
          gridArea('wednesday').containing(Container(color: Colors.transparent, child: const Text('Wednesday'),)),
          for(int i = 8; i < 23; i++)
            gridArea('wed$i').containing(Container(color: Colors.pink)),
          // Column 5
          gridArea('thursday').containing(Container(color: Colors.transparent, child: const Text('Thursday'),)),
          for(int i = 8; i < 23; i++)
            gridArea('thu$i').containing(Container(color: Colors.grey)),
          // Column 6
          gridArea('friday').containing(Container(color: Colors.transparent, child: const Text('Friday'),)),
          for(int i = 8; i < 23; i++)
            gridArea('fri$i').containing(Container(color: Colors.white)),
        ],
      ),
    );
  }
}