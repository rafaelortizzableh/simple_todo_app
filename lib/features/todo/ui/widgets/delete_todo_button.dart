import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../features.dart';

class DeleteTodoButton extends ConsumerWidget {
  const DeleteTodoButton({Key? key, required this.todo}) : super(key: key);
  final Todo todo;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return IconButton(
      icon: const Icon(Icons.delete),
      onPressed: () => ref
          .read(todoControllerProvider.notifier)
          .deleteTodoFromDoneItems(todo),
    );
  }
}
