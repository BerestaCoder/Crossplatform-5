import 'package:crossplatform5/InterfaceChecker.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(

        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  InterfaceChecker ic = new InterfaceChecker();
  String _inputText = '';

  void _addA(){
    setState(() {
      _inputText+= 'A';
    });
  }
  void _addB(){
    setState(() {
      _inputText+= 'Б';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(

        backgroundColor: Theme.of(context).colorScheme.inversePrimary,

        title: Text(widget.title),
      ),
      body: Center(
        child: Container(
          width: 400,
            child: Column(
              children: [
                SizedBox( height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(ic.isDesktopInterface() ? Icons.desktop_windows : Icons.phone_android),
                    Text(ic.isDesktopInterface() ? 'Включён интерфейс для комптютера' : 'Включён интерфейс для телефона')
                  ],
                ),
                SizedBox( height: 20),
                const TextField(
                  decoration: InputDecoration(
                      hintText: 'Введите что-нибудь'
                  ),
                ),
                SizedBox( height: 20),
                ic.isDesktopInterface() ? Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(onPressed: _addA, child: Text('А')),
                    ElevatedButton(onPressed: _addB, child: Text('Б')),
                  ],
                ) : Text('2')
              ],
            )
        )
      )// This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
