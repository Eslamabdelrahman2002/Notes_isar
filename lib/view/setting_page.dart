import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:notes_isar/theme/theme_provider.dart';
import 'package:provider/provider.dart';

class SettingPage extends StatelessWidget {
  const SettingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
appBar: AppBar(
  backgroundColor: Colors.transparent,
  elevation: 0,
  foregroundColor: Theme.of(context).colorScheme.inversePrimary,
),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 25,vertical: 20),
        margin: EdgeInsets.symmetric(horizontal: 25,vertical: 10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          color: Theme.of(context).colorScheme.primary
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Dark Mode',style: TextStyle(fontWeight: FontWeight.bold,color: Theme.of(context).colorScheme.inversePrimary),),
            CupertinoSwitch(value: Provider.of<ThemeProvider>(context,listen: false).isDarkMode
                ,onChanged: (value){
              Provider.of<ThemeProvider>(context,listen: false).toggleTheme();
                })
          ],
        ),
      ),
    );
  }
}
