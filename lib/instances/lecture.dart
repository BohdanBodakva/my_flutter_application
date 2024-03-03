import 'package:flutter/material.dart';

class Lecture{
  final String lectureName;
  final String lecturer;
  final int building;
  final String room;
  final TimeOfDay startTime;
  final TimeOfDay endTime;
  final int lectionNumber;

  Lecture({
    required this.lectureName,
    required this.lecturer,
    required this.building,
    required this.room,
    required this.startTime, 
    required this.endTime,
    required this.lectionNumber,
  });
}
