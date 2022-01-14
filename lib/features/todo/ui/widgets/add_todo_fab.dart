import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../features.dart';
import 'add_todo_modal.dart';

class AddTodoFAB extends ConsumerWidget {
  const AddTodoFAB({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return FloatingActionButton(
      onPressed: () async {
        Todo? todo = await showModalBottomSheet(
            isScrollControlled: true,
            context: context,
            builder: (context) {
              return const AddTodoModal();
            });
        if (todo != null && todo.title.trim().isNotEmpty) {
          ref.read(todoControllerProvider.notifier).addTodo(todo);
        }
      },
      child: const Icon(CupertinoIcons.add_circled_solid),
    );
  }
}
