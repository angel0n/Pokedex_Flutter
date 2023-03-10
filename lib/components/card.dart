import 'package:app_desktop/components/types_badges.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CardInfo extends StatelessWidget {
  final String url;
  final int order;
  final String name;
  final List<String> types;

  const CardInfo(this.name, this.order, this.url, this.types, {super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(8.0),
        child:  SizedBox(
          height: 350,
          child: Card(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SvgPicture.network(url),
                Text("N° ${order.toString().padLeft(4,"0")}",style:  const TextStyle( color: Colors.grey)),
                Text(name, style: const TextStyle(fontSize: 32, fontWeight: FontWeight.bold)),
                Wrap(
                  spacing: 8.0,
                  runSpacing: 4.0,
                  children: types.map((type) => TypesBadges(type)).toList(), 
                ),
                 
              ],
            ),
          ),
        ));
  }
}
