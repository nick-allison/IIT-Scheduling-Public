import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../selected_courses.dart';
import '../../../selected_courses_color.dart';
import 'schedule_api.dart';

class ListTab extends StatelessWidget {
  const ListTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 8,
        ),
        Consumer<SelectedCourses>(
          builder: (context, selectedCourses, child) {
            return SizedBox(
              height: 471.0958,
              child: ListView.separated(
                itemCount: selectedCourses.courses.length,
                itemBuilder: (context, index) {
                  return SizedBox(
                    height: 40,
                    child: Padding(
                      padding: const EdgeInsets.only(top: 3),
                      child: Column(
                        children: [
                          const Flexible(
                            flex: 1,
                            child: SizedBox(
                              height: 10,
                            ),
                          ),
                          Flexible(
                            flex: 2,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Flexible(
                                  flex: 1,
                                  child: SizedBox(
                                    width: 30,
                                  ),
                                ),
                                Flexible(
                                  flex: 20,
                                  child: Row(
                                    children: [
                                      Container(
                                        width: 17.856,
                                        height: 17.856,
                                        decoration: BoxDecoration(
                                          color: SelectedCourseColor
                                              .values[index].selectedColor,
                                          borderRadius:
                                              BorderRadius.circular(4),
                                        ),
                                      ),
                                      const SizedBox(
                                        width: 8,
                                      ),
                                      Flexible(
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            SizedBox(
                                              width: 582.23,
                                              child: Text(
                                                selectedCourses.courses[index],
                                                overflow: TextOverflow.ellipsis,
                                                style: const TextStyle(
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.w500,
                                                ),
                                              ),
                                            ),
                                            Flexible(
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.end,
                                                children: [
                                                  const SizedBox(
                                                    width: 1,
                                                  ),
                                                  Expanded(
                                                    child: InkWell(
                                                      onTap: () {
                                                        selectedCourses
                                                            .removeCourse(
                                                                selectedCourses
                                                                        .courses[
                                                                    index]);
                                                        selectedCourses
                                                            .setAddedInSelectedCourses(
                                                                false);
                                                      },
                                                      child: const Icon(
                                                        size: 18.5,
                                                        Icons.close,
                                                        color: Colors.red,
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                const Flexible(
                                  flex: 1,
                                  child: SizedBox(
                                    width: 26,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const Flexible(
                            flex: 1,
                            child: SizedBox(
                              height: 10,
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
                separatorBuilder: (context, index) {
                  return const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Flexible(
                        flex: 1,
                        child: SizedBox(
                          width: 30,
                        ),
                      ),
                      Flexible(
                        flex: 20,
                        child: Divider(
                          thickness: 1.8,
                        ),
                      ),
                      Flexible(
                        flex: 1,
                        child: SizedBox(
                          width: 30,
                        ),
                      ),
                    ],
                  );
                },
              ),
            );
          },
        ),
        const SizedBox(
          height: 6,
        ),
        OutlinedButton(
          onPressed: () async {
            var selectedCourses =
                Provider.of<SelectedCourses>(context, listen: false);
            try {
              var courseDetail = await getCourseDetails(selectedCourses);
              print("courseDetail: $courseDetail");
            } catch (e) {
              print("Error fetching course details: $e");
            }
          },
          child: const Text("Generate"),
        ),
        const SizedBox(
          height: 6,
        ),
      ],
    );
  }
}
