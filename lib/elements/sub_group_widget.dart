import 'package:flutter/material.dart';
import 'package:my_flutter_application/logic/date_controller.dart';

class SubGroup extends StatefulWidget {
  final dynamic user;

  const SubGroup({this.user, super.key});

  @override
  State<SubGroup> createState() => _SubGroupState();
}

class _SubGroupState extends State<SubGroup> {

  @override
  Widget build(BuildContext context) {

    return Center(
        child: Column(
          children: [
            Text(
              '${DateController.getWeekdayByPosition(
                DateTime.now().weekday,
                )}, '
              '${DateTime.now().day} '
              '${DateController.getMonthByPosition(
                DateTime.now().month,
                )}', 

              style: const TextStyle(
                fontSize: 22,
              ),
            ),
          ],
        ),
      );
  }
}
