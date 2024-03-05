import 'package:flutter/material.dart';

class InfoDialog extends StatefulWidget{
  final String title;
  final List<Widget> titleWidgets;
  final String buttonText;
  final int type;

  InfoDialog({
    required this.title,
    required this.titleWidgets,
    required this.buttonText,
    this.type = 0,
    super.key,
  });

  @override
  State<InfoDialog> createState() => _InfoDialogState();
}

class _InfoDialogState extends State<InfoDialog> with WidgetsBindingObserver {
  bool isKeyboardVisible = false;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangeMetrics() {
    super.didChangeMetrics();
    final bottomInset = WidgetsBinding.instance.window.viewInsets.bottom;
    setState(() {
      isKeyboardVisible = bottomInset > 0;
    });
  }






  double _dialogHeight = 500;
  double i = 0;

  @override
  Widget build(BuildContext context) {



    



    // ===================================

    final mediaQuery = MediaQuery.of(context);

    double dialogHeight = 0;

    if (widget.type == 0) {
      dialogHeight = mediaQuery.size.height * 0.3;
    }
    else if (widget.type == 1) {
      dialogHeight = mediaQuery.size.height * 0.7;
    }
    
    return SizedBox(
      child: AlertDialog(
      content: Column(
        children: [
            Text('sdfdsfsdfd'),
            Container(
              height: isKeyboardVisible ? dialogHeight * 0.3 : dialogHeight,
              child: SingleChildScrollView(
          // keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.,
          child: Container(
            // height: isKeyboardVisible ? dialogHeight * 0.3 : dialogHeight,
          width: mediaQuery.size.width,
          // color: Colors.amber,
            child: Column(
          // mainAxisAlignment: MainAxisAlignment.center,

          children: 
        widget.titleWidgets

    )
          ),
          
        ),
            ),
            


        Text('sdfdsdsfdsfds')
          ],
        ), 
         
        
    )
);
                  
                 


                














  // double realInfoDialogHeight = 0, realInfoDialogWidth = 0;
  // double infoDialogHeight = 0, infoDialogWidth = 0;

  // bool scrollInfoDialog = false;



  // @override
  // Widget build(BuildContext context){
  //   var mediaQuery = MediaQuery.of(context);

  //   infoDialogHeight = 0;
  //   realInfoDialogHeight = 0;
  //   infoDialogWidth = 0;
  //   realInfoDialogWidth = 0;

    

  //   if (widget.type == 0){
  //     infoDialogHeight = mediaQuery.size.height * 0.2;
  //     infoDialogWidth = mediaQuery.size.width * 0.4;
  //   } else if (widget.type == 1) {
  //     infoDialogHeight = mediaQuery.size.height * 0.75;
  //     infoDialogWidth = mediaQuery.size.width * 0.85;

  //     realInfoDialogHeight = mediaQuery.size.height * 0.75;
  //     realInfoDialogWidth = mediaQuery.size.width * 0.85;
  //   }

  //   return AlertDialog(
  //     shape: const RoundedRectangleBorder(
  //       borderRadius:
  //         BorderRadius.all(
  //           Radius.circular(10),
  //         ),
  //       ),
  //       content: Builder(
  //         builder: (context) {
  //           return SizedBox(
  //             height: infoDialogHeight,
  //             width: infoDialogWidth,
  //             child: Center(
  //               child: SizedBox(
  //                 child: Padding(
  //                   padding: const EdgeInsets.only(top: 12),
  //                   child: Column(
  //                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //                     children: [
  //                       Text(
  //                         widget.title,
  //                         style: const TextStyle(
  //                           fontSize: 22,
  //                         ),
  //                       ),

  //                         Column(children: [
  //                               for (var widg in widget.titleWidgets)
  //                                 widg,
  //                             ],
  //                         ),
                            
                          

  //                       TextButton(
  //                         onPressed: () => {
  //                           Navigator.of(context).pop(),
  //                         },
  //                         child: Text(widget.buttonText),
  //                       ),
  //                     ],
  //                   ),
  //                 ),
  //               ),
  //             ),
  //           );
  //         },
  //       ),
  //     );
  // }
}
}