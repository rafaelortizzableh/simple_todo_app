import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/core.dart';
import '../../features.dart';

final todoControllerProvider =
    StateNotifierProvider<TodoController, TodoListState>((ref) {
  final sharedPreferencesProvider = ref.watch(
    sharedPreferencesServiceProvider,
  );
  return TodoController(sharedPreferencesProvider);
});
