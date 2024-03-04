import 'package:flutter/material.dart';
import 'package:my_flutter_application/elements/footer.dart';
import 'package:my_flutter_application/elements/my_app_bar.dart';
import 'package:my_flutter_application/elements/my_lesson_box.dart';
import 'package:my_flutter_application/elements/sub_group_widget.dart';
import 'package:my_flutter_application/instances/lecture.dart';

class HomePage extends StatefulWidget {
  final dynamic user;

  const HomePage({this.user, super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Lecture> lecturesList = List.generate(6, (index) => Lecture(
                    lectureName: 'Сенсори та виконавчі механізми',
                    lecturer: 'Павельчак А. Г.',
                    building: 5,
                    room: '609',
                    startTime: TimeOfDay.now(),
                    endTime: TimeOfDay.now(),
                    lectionNumber: 5,
                  ),
                  );

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);

    return Scaffold(
      appBar: MyAppBar(preferredHeight: mediaQuery.size.height * 0.07,),
      body: Container(
        padding: EdgeInsets.only(
          bottom: mediaQuery.size.width * 0.05, 
          left: mediaQuery.size.width * 0.05,
          right: mediaQuery.size.width * 0.05,
        ),
        child: Center(
          child: Column(
            children: [
              SizedBox(
                height: mediaQuery.size.height * 0.065,
                child: const SubGroup(),
              ),
              SizedBox(
                height: mediaQuery.size.height * 0.7,
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                    for (Lecture lecture in lecturesList)
                      Column(
                        children: [
                          MyLessonBox(
                            lecture: lecture,
                            homework: null,
                          ),
                          Container(
                            height: mediaQuery.size.width * 0.05,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
        ),
          ],
        ),
      ),  
      ),
      bottomNavigationBar: const Footer(),
    );
  }
}
