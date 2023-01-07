import 'package:flutter/material.dart';

abstract class FactoryDialog{
  Widget create(BuildContext context);

  Future<void> show(BuildContext context){
    final dialog = create(context);

    return showDialog(context: context, builder: (_){
      return dialog;
    });
  }
}