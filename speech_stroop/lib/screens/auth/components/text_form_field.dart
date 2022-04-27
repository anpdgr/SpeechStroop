import 'package:flutter/material.dart';

class TextFormFieldCustom extends StatelessWidget {
  final TextEditingController controller;
  final String labelText;
  final TextInputType keyboardType;
  final String Function(String val) validator;
  final void Function(String val) onChanged;
  final void Function() onTap;

  TextFormFieldCustom(this.controller, this.labelText, this.keyboardType, this.validator, this.onChanged, [this.onTap]);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
                    controller: controller,
                    obscureText: false,
                    decoration: InputDecoration(
                      labelText: labelText,
                      enabledBorder: OutlineInputBorder(
                        borderSide: const BorderSide(
                          color: Color(0xFFA7A5A5),
                          width: 1,
                        ),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: const BorderSide(
                          color: Color(0xFFA7A5A5),
                          width: 1,
                        ),
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    style: const TextStyle(
                      fontWeight: FontWeight.w300,
                    ),
                    textAlign: TextAlign.start,
                    keyboardType: keyboardType,
                    validator: validator,
                    onChanged: onChanged,
                    onTap: onTap
                  );
  }
}
