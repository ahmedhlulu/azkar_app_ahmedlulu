import 'package:flutter/material.dart';

class OutBoardingIndicator extends StatelessWidget {
  final double marginEnd;
  final bool selected;

  OutBoardingIndicator({
    this.marginEnd = 0,
    this.selected = false
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsetsDirectional.only(end: marginEnd),
      width: 15,
      height: 15,
      decoration: BoxDecoration(
        color: selected ? Colors.blue.shade900 : Colors.grey.shade400,
        shape: BoxShape.circle,
      ),
    );
  }
}
