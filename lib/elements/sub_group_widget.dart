import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:my_flutter_application/instances/dateUsed.dart';
import 'package:my_flutter_application/logic/date_controller.dart';

class SubGroup extends StatefulWidget {

  const SubGroup({super.key});

  @override
  State<SubGroup> createState() => _SubGroupState();
}

class _SubGroupState extends State<SubGroup> {
  var currentDate = DateTime.now();
  // var usedDate = currentDate;




  final List<String> items = List.generate(1000, (index) => 'Item ${index + 1}');
  final ScrollController _scrollController = ScrollController();
  int _currentIndex = 0;

  double i = 0;
  List<DateUsed> dates = [
    DateUsed(
      day: DateTime.now().day, 
      month: DateTime.now().month, 
      monthName: DateController.getMonthByPosition(DateTime.now().month), 
      dayOfWeek: DateTime.now().weekday, 
      dayOfWeekName: DateController.getWeekdayByPosition(DateTime.now().weekday), 
      year: DateTime.now().year,
    ),
  ];

  void _scrollToNextItem() {
    // var nextDate = DateController.generateNextDateAndFormatIt(
    //   , 
    //   month, 
    //   day
    // );

    if (_currentIndex < items.length - 1) {
      _currentIndex++;
      i++;
      _scrollController.animateTo(
        200 * i,
        duration: Duration(milliseconds: 500),
        curve: Curves.easeInOut,
      );
      
    }
  }

  void _scrollToPreviousItem() {
      _currentIndex--;
      _scrollController.animateTo(
        200 * (i-1),
        duration: Duration(milliseconds: 500),
        curve: Curves.easeInOut,
      );
      i--;
  }

  void _scrollToCurrentItem() {
      _scrollController.animateTo(
        0,
        duration: Duration(milliseconds: 500),
        curve: Curves.easeInOut,
      );
      i = 0;
      _currentIndex = 0;      
  }
  

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);

    return Container(
      width: mediaQuery.size.width,
      // color: Colors.amber,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Container(
            height: mediaQuery.size.height * 0.04,
            child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            width: mediaQuery.size.width * 0.12,
            child: TextButton(
              onPressed: _scrollToPreviousItem,
              child: const Icon(Icons.arrow_back, size: 22,),
            ),
          ),

          Container(
            height: mediaQuery.size.height * 0.035,
            width: mediaQuery.size.width * 0.55,
            // color: Colors.black,
            child: Center(
              child: Text(
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
            ), 
              
              
            
          ),

          SizedBox(
            width: mediaQuery.size.width * 0.12,
            child: TextButton(
              onPressed: _scrollToNextItem,
              child: const Icon(Icons.arrow_forward, size: 22,),
            ), 
          ),
          // SizedBox(
          //   child: TextButton(
          //     onPressed: _scrollToCurrentItem,
          //     child: Container(),
          //   ), 
          // ),
        ],
      ),
          )
          ,


        Container(
          height: mediaQuery.size.height * 0.03,
          width: mediaQuery.size.width * 0.45,
          // color: Colors.amber,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text('чисельник'),
              
              Container(
                height: mediaQuery.size.height * 0.025,
                width: 2,
                color: const Color.fromARGB(255, 20, 111, 185),
              ),
              Text(' 1 група'),
            ],
          ),
        ),
        ],
      ) ,
    );
    
    

    
  }
}
