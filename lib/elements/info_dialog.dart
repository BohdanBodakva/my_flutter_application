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

  double _dialogHeight = 500;
  double i = 0;

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
    final keyboardHeight = MediaQuery.of(context).viewInsets.bottom;
    setState(() {
      // if(keyboardHeight < 500){
      //   _dialogHeight = 400;
      // } else {
        // i = _dialogHeight / (MediaQuery.of(context).size.height - keyboardHeight);

        // _dialogHeight = MediaQuery.of(context).size.height - keyboardHeight + 207;

      // }
      
    });
  }

  @override
  Widget build(BuildContext context) {
    
                return 
         SizedBox(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          // scrollDirection: Axis.vertical,
          child: AlertDialog(
        content: SingleChildScrollView(
          
          child: SizedBox(
            // height: _dialogHeight,
            child: Column(
          // mainAxisAlignment: MainAxisAlignment.center,

          children: 
        widget.titleWidgets

    )
          ),
          
        ) 
        
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