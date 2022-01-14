import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'complete_todo_button.dart';
import 'delete_todo_button.dart';
import '../../../features.dart';

class TodoListTile extends ConsumerWidget {
  const TodoListTile({Key? key, required this.todo}) : super(key: key);
  final Todo todo;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Dismissible(
      key: UniqueKey(),
      onDismissed: (_) {
        if (!todo.done) {
          ref.read(todoControllerProvider.notifier).markTodoAsDone(todo);
        } else {
          ref
              .read(todoControllerProvider.notifier)
              .deleteTodoFromDoneItems(todo);
        }
      },
      child: ListTile(
          title: Text(
            todo.title,
            overflow: TextOverflow.ellipsis,
          ),
          subtitle: Text(
            todo.description,
            overflow: TextOverflow.ellipsis,
          ),
          trailing: todo.done
              ? DeleteTodoButton(todo: todo)
              : CompleteTodoButton(todo: todo)),
    );
  }
}
