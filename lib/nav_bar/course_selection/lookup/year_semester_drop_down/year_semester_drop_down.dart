import 'package:flutter/material.dart';

class YearSemesterDropDown extends StatefulWidget {
  const YearSemesterDropDown({Key? key}) : super(key: key);

  @override
  State<YearSemesterDropDown> createState() => _YearSemesterDropDownState();
}

class _YearSemesterDropDownState extends State<YearSemesterDropDown> {
  // Use the enum values for the items
  List<String> items = [
    '2021 - Fall',
    '2022 - Spring',
    '2022 - Summer',
    '2023 - Fall',
  ];

  // current item
  String selectedItem = '2023 - Fall';

  @override
  Widget build(BuildContext context) {
    double dropdownWidth = MediaQuery.of(context).size.width * 0.11;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        // create the dropdown button wrapped in a Container
        SizedBox(
          width: dropdownWidth, // Set the width here
          child: DropdownButton<String>(
            isExpanded: true,
            hint: const Text('Select Year-Semester'),
            value: selectedItem,
            underline: Container(
              height: 0,
            ),
            onChanged: (newValue) {
              setState(() {
                selectedItem = newValue!;
              });
            },
            selectedItemBuilder: (BuildContext context) {
              return items.map<Widget>((String text) {
                return Center(
                  child: Text(
                    text,
                    overflow: TextOverflow.ellipsis,
                  ),
                );
              }).toList();
            },
            items: items.map((item) {
              return DropdownMenuItem<String>(
                value: item,
                child: Text(
                  item,
                  style: const TextStyle(color: Colors.black),
                ),
              );
            }).toList(),
          ),
        ),
      ],
    );
  }

  // Define a getter method to access the selected item
  String getSelectedYearSemester() {
    return selectedItem;
  }
}