import 'package:flutter/material.dart';

class NoteSetting extends StatelessWidget {
   NoteSetting({super.key,required this.editTap ,required this.deleteTap});
  final void Function()? editTap;
  final void  Function()? deleteTap;
  @override
  Widget build(BuildContext context) {
    return
        Column(
          children: [
            GestureDetector(
              onTap:editTap ,
              child: Container(
                padding: EdgeInsets.all(8),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                  color: Theme.of(context).colorScheme.background
                ),
                child: Row(
                  children: [
                    (
                    Text('Edit',style: TextStyle(
                      color: Theme.of(context).colorScheme.inversePrimary,
                      fontWeight: FontWeight.bold,
                      fontSize: 20
                    ),)
                    ),
                    Spacer(),
                    Icon(Icons.edit)
                  ],
                ),
              ),
            ),
                  GestureDetector(
                  onTap:deleteTap ,
                  child: Container(
                    padding: EdgeInsets.all(8),
                  decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.background,
                    borderRadius: BorderRadius.circular(5)
                  ),
                  child: Row(
                    children: [
                      (
                      Text('Delete',style: TextStyle(
                          color: Theme.of(context).colorScheme.inversePrimary,
                          fontWeight: FontWeight.bold,
                          fontSize: 20
                      ),)
                      ),
                      Icon(Icons.delete)
                    ],
                  ),
                  ),
                  )
                        ],
        );
  }
}
