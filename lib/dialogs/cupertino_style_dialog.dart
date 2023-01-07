import 'package:factory_method_practice/dialogs/factory_dialog.dart';
import 'package:flutter/cupertino.dart';

class CupertinoStyleDialog extends FactoryDialog{
  @override
  Widget create(BuildContext context) {
    return CupertinoAlertDialog(
      title: Text('Cupertino style'),
    );
  }
}