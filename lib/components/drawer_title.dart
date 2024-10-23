import 'package:flutter/material.dart';

class DrawerTitle extends StatelessWidget {
  DrawerTitle({super.key, required this.text, required this.leading,required this.onTap});
final String text;
final Widget leading;
  void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 25),
      child: ListTile(
        title:Text (text,style: TextStyle(
          color: Theme.of(context).colorScheme.inversePrimary
        ),),
        leading: leading,
        onTap: onTap,
      ),
    );
  }
}
