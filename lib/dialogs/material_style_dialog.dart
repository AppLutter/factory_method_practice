import 'package:factory_method_practice/dialogs/factory_dialog.dart';
import 'package:flutter/material.dart';

class MaterialStyleDialog extends FactoryDialog{
  @override
  Widget create(BuildContext context) {
    return AlertDialog(
      title: Text('Material stlye'),
    );
  }
}