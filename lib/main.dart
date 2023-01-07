import 'package:factory_method_practice/dialogs/cupertino_style_dialog.dart';
import 'package:factory_method_practice/dialogs/factory_dialog.dart';
import 'package:factory_method_practice/dialogs/material_style_dialog.dart';
import 'package:flutter/foundation.dart';
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
        primarySwatch: Colors.blue,
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
  Future<void> createAndShowDialog() async {
    final FactoryDialog dialog = isMaterial ? MaterialStyleDialog() : CupertinoStyleDialog();

    dialog.show(context);
  }

  bool isMaterial = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: SizedBox.expand(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            GestureDetector(
              onTap: createAndShowDialog,
              child: decoratedContainer(
                child: styleDescriptionTextWidget(),
              ),
            ),
            Switch(
                value: isMaterial,
                onChanged: (value) {
                  setState(() {
                    isMaterial = value;
                  });
                }),
          ],
        ),
      ),
    );
  }

  Widget decoratedContainer({required Widget child}) {
    return Container(
      padding: const EdgeInsets.all(15.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
        border: Border.all(color: Colors.green, width: 2.0),
      ),
      child: child,
    );
  }

  Widget styleDescriptionTextWidget() {
    final String description = isMaterial ? 'Material' : 'Cupertino';

    return Text(
      description,
      style: TextStyle(
        fontWeight: FontWeight.w600,
        color: Colors.black,
      ),
    );
  }
}
