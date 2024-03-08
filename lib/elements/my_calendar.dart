import 'package:flutter/material.dart';
import 'package:my_flutter_application/elements/footer.dart';
import 'package:my_flutter_application/elements/my_app_bar.dart';

class MyCalendar extends StatefulWidget {
  final dynamic user;

  const MyCalendar({this.user, super.key});

  @override
  State<MyCalendar> createState() => _MyCalendarState();
}

class _MyCalendarState extends State<MyCalendar> {

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.sizeOf(context);

    

    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: MyAppBar(
        title: 'Календар', 
        preferredHeight: mediaQuery.height * 0.07,
      ),
      body: Material(
        child: CalendarDatePicker(
          initialDate: DateTime.now(), 
          firstDate: DateTime.parse('20200101'), 
          lastDate: DateTime.parse('20250101'),
          onDateChanged: (DateTime d) => {},
        ),
      ),
      bottomNavigationBar: const Footer(),
    );
  }
}
