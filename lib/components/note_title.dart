import 'package:flutter/material.dart';

class NoteTitle extends StatelessWidget {
  const NoteTitle({
    super.key,
    required this.text,
    required this.onEditPressed,
    required this.onDeletePressed,
  });

  final String text;
  final void Function()? onEditPressed;
  final void Function()? onDeletePressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 25,vertical: 10),
      padding: const EdgeInsets.only(top: 10, right: 25, left: 25),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.primary,
        borderRadius: BorderRadius.circular(9),
      ),
      child: ListTile(
        title: Text(
          text,
          overflow: TextOverflow.ellipsis, // Handles long text overflow
        ),
        trailing: Row(
          mainAxisSize: MainAxisSize.min, // Ensures row takes up minimal space
          children: [
            IconButton(
              onPressed: onEditPressed,
              icon: const Icon(Icons.edit),
            ),
            IconButton(
              onPressed: onDeletePressed,
              icon: const Icon(Icons.delete),
            ),
          ],
        ),
      ),
    );
  }
}
