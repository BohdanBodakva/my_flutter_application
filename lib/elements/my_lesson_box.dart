import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:my_flutter_application/elements/my_add_button.dart';
import 'package:my_flutter_application/enums/font_size.dart';
import 'package:my_flutter_application/instances/lecture.dart';


class MyLessonBox extends StatefulWidget {
  final Lecture lecture;
  final dynamic homework;

  const MyLessonBox({
    required this.lecture,
    required this.homework,
    super.key,
  });

  @override
  State<MyLessonBox> createState() => _MyLessonBoxState();
}

class _MyLessonBoxState extends State<MyLessonBox> {

  @override
  Widget build(BuildContext context){
    final mediaQuery = MediaQuery.of(context);

    return Container(
      height: mediaQuery.size.height * 0.27,
      decoration: BoxDecoration(
          border: Border.all(
            color: const Color.fromARGB(255, 20, 111, 185),
            width: 2,
          ),
          borderRadius: BorderRadius.circular(20),
        ),
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 14),
            child: SizedBox(
              width: mediaQuery.size.width * 0.15,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Column(
                    children: [
                      Text(
                    'Лекція:',
                    style: TextStyle(
                      fontSize: MyFontSize.getFontSize(context, 1),
                    ),
                  ),
                  Text(
                    '${widget.lecture.lectionNumber}',
                    style: TextStyle(
                      fontSize: MyFontSize.getFontSize(context, 4),
                    ),
                  ),
                    ],
                  ),
                  
                  // Container(height: 18,),
                  Column(
                    children: [
                      Text(
                    'Час:',
                    style: TextStyle(
                      fontSize: MyFontSize.getFontSize(context, 1),
                    ),
                  ),
                  Container(height: 4,),
                  Text(
                    '${widget.lecture.startTime.hour}:'
                    '${widget.lecture.startTime.minute}',
                    style: TextStyle(
                      fontSize: MyFontSize.getFontSize(context, 2),
                    ),
                  ),
                  Text(
                    '${widget.lecture.endTime.hour}:'
                    '${widget.lecture.endTime.minute}',
                    style: TextStyle(
                      fontSize: MyFontSize.getFontSize(context, 2),
                    ),
                  ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 14, bottom: 14, right: 10),
            child: Container(
              width: 1.5,
              color: const Color.fromARGB(255, 20, 111, 185),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 14, bottom: 14),
            child: SizedBox(
              width: mediaQuery.size.width * 0.7,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(
                    widget.lecture.lectureName,
                    style: TextStyle(
                      fontSize: MyFontSize.getFontSize(context, 2),
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Column(
                      children: [
                        Text(
                          widget.lecture.lecturer,
                          style: TextStyle(
                            fontSize: MyFontSize.getFontSize(context, 1),
                          ),
                        ),
                        Text(
                          '${widget.lecture.building} кор., '
                          '${widget.lecture.room} ауд.',

                          style: TextStyle(
                            fontSize: MyFontSize.getFontSize(context, 1),
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      MyAddButton(
                        onPressed: ()=>{}, 
                        homeworkIsPresent: true, 
                        buttonText: 'Домашнє завдання',
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
