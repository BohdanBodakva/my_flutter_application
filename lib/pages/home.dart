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
                    lectionType: '',
                  ),
                  );

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.sizeOf(context);

    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: MyAppBar(
        title: 'Розклад НУ "ЛП"', 
        preferredHeight: mediaQuery.height * 0.07,
      ),
      body: Container(
        padding: EdgeInsets.only(
          left: mediaQuery.width * 0.05,
          right: mediaQuery.width * 0.05,
        ),
        child: Center(
          child: Column(
            children: [
              SizedBox(
                height: mediaQuery.height * 0.088,
                child: const SubGroup(),
              ),
              SizedBox(
                height: mediaQuery.height * 0.7,
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
                            height: mediaQuery.width * 0.05,
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
