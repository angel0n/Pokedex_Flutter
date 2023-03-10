import 'package:flutter/material.dart';

class TypesBadges extends StatelessWidget {
  final String type;

  const TypesBadges(this.type,{super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.red[600],
      padding: const EdgeInsets.fromLTRB(5, 0, 5, 0),
      height: 20,
      child: Text(type),
    );
  }
}