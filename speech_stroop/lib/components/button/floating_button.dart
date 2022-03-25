import 'package:flutter/material.dart';
import 'package:speech_stroop/constants.dart';

class FloatingButton extends StatelessWidget {
  final void Function() handler;
  FloatingButton(this.handler);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
            width: 56,
            height: 56,
            child: Container(
              decoration: BoxDecoration(
                border: Border.all(color: secondaryColor, width: 1),
                shape: BoxShape.circle,
              ),
              child: FloatingActionButton(
                heroTag: null,
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Icon(Icons.arrow_back, size: 30, color: secondaryColor),
                backgroundColor: const Color(0xFFFBFBFF),
                elevation: 0,
              ),
            ),
          ),
          SizedBox(
            width: 56,
            height: 56,
            child: FloatingActionButton(
              heroTag: null,
              onPressed: () {
                handler();
              },
              child: const Icon(
                Icons.arrow_forward,
                size: 30,
              ),
              backgroundColor: secondaryColor,
              elevation: 0,
            ),
          ),
        ],
      ),
    );
  }
}
