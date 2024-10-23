import 'package:flutter/material.dart';
import 'package:notes_isar/components/drawer_title.dart';
import 'package:notes_isar/view/setting_page.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Theme.of(context).colorScheme.background,
      child: Column(
        children: [
          DrawerHeader(child: Container(
            width: double.infinity,
              margin: EdgeInsets.symmetric(horizontal: 25),
              child: Icon(Icons.note,size: 100,))),
          DrawerTitle(text: 'Home', leading: Icon(Icons.home), onTap: ()=>Navigator.pop(context)),
          DrawerTitle(text: 'Setting', leading: Icon(Icons.settings), onTap: (){
            Navigator.pop(context);
            Navigator.push(context, MaterialPageRoute(builder: (context)=>SettingPage()));
          }),

        ],
      ),
    );
  }
}
