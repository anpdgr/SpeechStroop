import 'package:flutter/material.dart';

class SliderForm extends StatelessWidget implements PreferredSizeWidget {
  double radioValue;
  final Null Function(double) handler;

  SliderForm(this.radioValue, this.handler);

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return Slider(
        value: radioValue,
        min: 1,
        max: 5,
        divisions: 4,
        label: radioValue.round().toString(),
        onChanged: (radioValue) {
          handler(radioValue);
        });
  }
}
