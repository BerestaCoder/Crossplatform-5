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
            child: ic.isDesktopInterface() ? const Column(
              // ========= Интерфейс для компьютера
              children:  [
                SizedBox( height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.desktop_windows),
                    Text('Включён интерфейс для компьютера')
                  ],
                ),
                SizedBox( height: 20),
                TextField(
                  decoration: InputDecoration(
                      hintText: 'Введите что-нибудь'
                  ),
                ),
                 SizedBox( height: 20)
              ],
            ) :
            Column(
              // ========= Интерфейс для телефона
              children: [SizedBox( height: 20),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.phone_android),
                    Text('Включён интерфейс для телефона')
                  ],
                ),
                const SizedBox( height: 20),
                Text('$_inputText'),
                const SizedBox( height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(onPressed: _addA, child: Text('А')),
                    ElevatedButton(onPressed: _addB, child: Text('Б')),
                  ],
                )
              ],
            )
        )
      )// This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
