import 'package:flutter/material.dart';
// import 'main.dart';
// import 'input_page.dart';
class ReusedCard extends StatelessWidget {

  ReusedCard( { required this.colour, this.cardchild ,this.onPress });
  final Color colour;
  final Widget? cardchild;
  final VoidCallback? onPress;
  @override
  Widget build(BuildContext context) {
    return   GestureDetector(
      onTap: onPress,
      child: Container(
        padding: EdgeInsets.all(15.0),
        margin: EdgeInsets.all(10.0),
        decoration: BoxDecoration(
          color: colour,
          borderRadius: BorderRadius.circular(10.0),
        ),
        // height: 110,
        child: cardchild,
        // width: 110,
      ),
    );
  }
}
