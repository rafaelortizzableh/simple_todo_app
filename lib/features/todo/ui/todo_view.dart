import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'widgets/wrappers.dart';
import 'widgets/add_todo_fab.dart';

const _tabViewCount = 2;

class TodoView extends StatelessWidget {
  const TodoView({Key? key}) : super(key: key);
  static const routeName = 'todos';

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    return DefaultTabController(
      length: _tabViewCount,
      child: Builder(builder: (context) {
        final TabController tabController = DefaultTabController.of(context)!;
        return Scaffold(
          appBar: AppBar(
            title: Text(l10n.appTitle),
            bottom: TabBar(
              tabs: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text('${l10n.todo} 🤓'),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text('${l10n.completed} 👍'),
                ),
              ],
              controller: tabController,
            ),
          ),
          body: TabBarView(
            children: const [TodosListWrapper(), DoneItemsListWrapper()],
            controller: tabController,
          ),
          floatingActionButton: const AddTodoFAB(),
        );
      }),
    );
  }
}
