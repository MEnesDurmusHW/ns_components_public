import 'package:example/components_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:ns_components/ns_components.dart';

void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return const NSApp(
      home: TabBarView(),
      localizationsDelegates: null,
      supportedLocales: null,
    );
  }
}

class TabBarView extends StatelessWidget {
  const TabBarView({super.key});

  final _views = const [
    ComponentsView(),
    SizedBox(),
    SizedBox(),
  ];
  Widget tabBuilder(_, int i) => _views[i];

  @override
  Widget build(BuildContext context) {
    return CupertinoTabScaffold(
      tabBuilder: tabBuilder,
      tabBar: CupertinoTabBar(
        items: [
          NSBottomNavigationBarItem(icon: CupertinoIcons.square_split_1x2_fill, label: 'Components'),
          NSBottomNavigationBarItem(icon: CupertinoIcons.person_2_fill, label: 'Managers'),
          NSBottomNavigationBarItem(icon: CupertinoIcons.wrench_fill, label: 'Utils'),
        ],
      ),
    );
  }
}
