import 'package:controller_injection_bug/widget/my_count_widget.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Controller Injection Test App',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF267E08),
        ),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Controller Injection Test'),
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
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title + selectedIndex.toString()),
      ),
      bottomNavigationBar: NavigationBar(
        onDestinationSelected: (int index) {
          setState(() {
            selectedIndex = index;
          });
        },
        selectedIndex: selectedIndex,
        destinations: const <Widget>[
          NavigationDestination(
            selectedIcon: Icon(Icons.looks_one_rounded),
            icon: Icon(Icons.looks_one_outlined),
            label: 'Page 1',
          ),
          NavigationDestination(
            selectedIcon: Icon(Icons.looks_two_rounded),
            icon: Icon(Icons.looks_two_outlined),
            label: 'Page 2',
          ),
        ],
      ),
      body: MyPage(selectedIndex: selectedIndex),
    );
  }
}

class MyPage extends StatelessWidget {
  final int selectedIndex;

  const MyPage({super.key, required this.selectedIndex});

  @override
  Widget build(BuildContext context) {
    switch (selectedIndex) {
      case 0:
        return const Padding(
          padding: EdgeInsets.all(15.0),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text('Page 1'),
                MyCountWidget(name: 'Page1Counter'),
              ],
            ),
          ),
        );
      case 1:
        return const Padding(
          padding: EdgeInsets.all(15.0),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text('Page 2'),
                MyCountWidget(name: 'Page2Counter'),
              ],
            ),
          ),
        );
      default:
        throw UnimplementedError(
            'No page implemented for index $selectedIndex');
    }
  }
}
