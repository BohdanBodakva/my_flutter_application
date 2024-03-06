import 'package:flutter/material.dart';
import 'package:my_flutter_application/enums/font_size.dart';

class InfoDialog extends StatefulWidget{
  final String title;
  final List<Widget> titleWidgets;
  final Widget saveButton;
  final String closeButtonText;
  final int type;

  InfoDialog({
    required this.title,
    required this.titleWidgets,
    required this.saveButton,
    required this.closeButtonText,
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

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);

    double dialogHeight = 0;

    if (widget.type == 0) {
      dialogHeight = mediaQuery.size.height * 0.15;
    }
    else if (widget.type == 1) {
      dialogHeight = mediaQuery.size.height * 0.3;
    }
    
    return SizedBox(
      // height: dialogHeight * 2,
      child: AlertDialog(
      content: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
            Text(
              widget.title,
              style: TextStyle(
                fontSize: MyFontSize.getFontSize(context, 4),
              ),
            ),
            SizedBox(
              height: isKeyboardVisible ? dialogHeight * 0.5 : dialogHeight,
              child: SingleChildScrollView(
                child: SizedBox(
                  width: mediaQuery.size.width,
                  child: Column(
                    children: widget.titleWidgets,
                  ),
                ), 
              ),
            ),
            widget.saveButton
          ],
      ), 
      actions: <Widget>[
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: Text(
            widget.closeButtonText,
          style: TextStyle(
            fontSize: MyFontSize.getFontSize(context, 1),
            ),
          ),
        ),
      ],   
    ),
  );
  }
}
