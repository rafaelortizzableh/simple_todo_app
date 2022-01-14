import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../features.dart';

class CompleteTodoButton extends ConsumerWidget {
  const CompleteTodoButton({Key? key, required this.todo}) : super(key: key);
  final Todo todo;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return IconButton(
      icon: const Icon(Icons.check_circle),
      onPressed: () =>
          ref.read(todoControllerProvider.notifier).markTodoAsDone(todo),
    );
  }
}
