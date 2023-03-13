import 'package:flutter/material.dart';
import 'package:badges/badges.dart' as badges;
class TypesBadges extends StatelessWidget {
  final String type;

  const TypesBadges(this.type,{super.key});

  @override
  Widget build(BuildContext context) {
    return badges.Badge(
      position: badges.BadgePosition.topEnd(top: -10, end: -12),
      showBadge: true,
      ignorePointer: false,
      onTap: () {},
      badgeContent: Text(type),
      badgeStyle: badges.BadgeStyle(
        shape: badges.BadgeShape.square,
        padding: const EdgeInsets.all(3.0),
        borderRadius: BorderRadius.circular(4),
        badgeColor: Colors.blue,
      ),
    );
  }
}