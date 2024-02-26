import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    const title = 'Flutter Demo';
    return MaterialApp(
      title: title,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.green),
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final _controller = TextEditingController();

  int _counter = 0;
  int _numberToAdd = 0;
  int _sum = 0;

  bool _isInputValid = true;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
    _countSum();
  }

  void _setValueToAdd(int value) {
    setState(() {
      _numberToAdd = value;
    });
    _countSum();
  }

  bool _validateIfValueIsInteger(String value){
    return int.tryParse(value) != null;
  }

  void _countSum() {
    setState(() {
      _sum = _counter + _numberToAdd;
    });
  }

  void _clearAllFieds() {
    setState(() {
      _counter = 0;
      _numberToAdd = 0;
      _sum = 0;
      _controller.clear();
      _isInputValid = true;
    });
  }

  void _invalidFormParameters() {
    setState(() {
      _numberToAdd = 0;
      _countSum();
      _controller.clear();
      _renderInvalidInputMessage();
    });
  }

  void _validateFormParameters() {
    setState(() {
      _isInputValid = true;
    });
  }

  void _renderInvalidInputMessage(){
    setState(() {
      _isInputValid = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('My Flutter App'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (_isInputValid) const Text('') else const Text(
               'Only digits allowed!',
              style: TextStyle(
                color: Colors.red,
              ),
            ),
            SizedBox(
              width: 300,
              height: 75,
              child: TextFormField(
                controller: _controller,
                onChanged: (value) {
                  if (_validateIfValueIsInteger(value)){
                    _setValueToAdd(int.parse(value));
                    _validateFormParameters();
                  } else {
                    _invalidFormParameters();
                  }
                },
                decoration: const InputDecoration(
                  border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(15)),
                ),
                hintText: 'Enter number to add',
             ),
                textInputAction: TextInputAction.done,
             ),
            ),
            const Text(
              'You have pushed the button (times):',
            ),
            Text(
              '$_numberToAdd + $_counter = $_sum',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            FloatingActionButton(
              onPressed: _clearAllFieds,
              child: const Icon(Icons.clear),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), 
    );
  }
}
