import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../features.dart';
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
        final tabController = DefaultTabController.of(context)!;
        return Scaffold(
          appBar: AppBar(
            leading: IconButton(
              icon: const Icon(CupertinoIcons.brightness),
              onPressed: () =>
                  Navigator.pushNamed(context, ThemeView.routeName),
            ),
            title: Text('${l10n?.appTitle}'),
            bottom: TabBar(
              indicatorColor: Theme.of(context).colorScheme.secondary,
              tabs: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text('${l10n?.todo} 🤓'),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text('${l10n?.completed} 👍'),
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
