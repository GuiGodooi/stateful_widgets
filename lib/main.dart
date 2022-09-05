import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Stateful Widget',
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: const StatefullWidgets(),
    );
  }
}

class StatefullWidgets extends StatefulWidget {
  const StatefullWidgets({Key? key}) : super(key: key);

  @override
  State<StatefullWidgets> createState() => _StatefullWidgetsState();
}

class _StatefullWidgetsState extends State<StatefullWidgets> {
  bool switchVal = true;
  bool checkBoxVal = true;
  double slider1Val = 0.5;
  double slider2Val = 50.0;
  int radioVal = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          children: <Widget>[
            const Text('Switch'),
            Center(
              child: Switch(
                onChanged: (bool value) {
                  setState(() => switchVal = value);
                },
                value: switchVal,
              ),
            ),
            const Text('Disabled Switch'),
            const Center(
              child: Switch(
                onChanged: null,
                value: false,
              ),
            ),
            const Divider(),
            const Text('Checkbox'),
            Checkbox(
              onChanged: (bool? value) {
                if (value != null) {
                  setState(() => checkBoxVal = value);
                }
              },
              value: checkBoxVal,
            ),
            const Text('Disabled Checkbox'),
            const Checkbox(
              tristate: true,
              onChanged: null,
              value: null,
            ),
            const Divider(),
            const Text('Slider'),
            Slider(
              onChanged: (double value) {
                setState(() => slider1Val = value);
              },
              value: slider1Val,
            ),
            const Text('Slider with Divisions and Label'),
            Slider(
              value: slider2Val,
              max: 100.0,
              divisions: 5,
              label: '${slider2Val.round()}',
              onChanged: (double value) {
                setState(() => slider2Val = value);
              },
            ),
            const Divider(),
            const Text('LinearProgressIndicator'),
            // **When value=null, progress indicators become stateless.**
            const LinearProgressIndicator(),
            const Divider(),
            const Text('CircularProgressIndicator'),
            const Center(child: CircularProgressIndicator()),
            const Divider(),
            const Text('Radio'),
            Row(
              children: [0, 1, 2, 3]
                  .map(
                    (int index) => Radio<int>(
                      value: index,
                      groupValue: radioVal,
                      onChanged: (int? value) {
                        if (value != null) {
                          setState(() => radioVal = value);
                        }
                      },
                    ),
                  )
                  .toList(),
            ),
            const Divider(),
          ],
        ),
      ),
    );
  }
}
