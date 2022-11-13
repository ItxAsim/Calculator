import 'package:flutter/material.dart';

class button extends StatelessWidget {
  final numb;
  final Color color;
  final VoidCallback press;
  const button({
    Key? key,
    required this.numb,
    this.color = Colors.grey,
    required this.press,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: InkWell(
        onTap: press,
        child: Container(
          height: 80,
          decoration: BoxDecoration(
            color: color,
            shape: BoxShape.circle,
          ),
          child: Center(
            child: Text(
              numb,
              style: TextStyle(
                color: Colors.white,
                fontSize: 30,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
