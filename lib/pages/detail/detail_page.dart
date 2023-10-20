import 'package:flutter/material.dart';
import 'package:flutter_ui_common/flutter_ui_common.dart';
import 'package:go_router/go_router.dart';

enum DisplayType { mobile, table, web }

extension on DisplayType {
  Widget leading(Widget child) {
    switch (this) {
      case DisplayType.mobile:
        return child;
      case DisplayType.table:
        return child;
      case DisplayType.web:
        return const SizedBox.shrink();
    }
  }

  Widget navigationRail(BuildContext context, TabDetail tab) {
    switch (this) {
      case DisplayType.mobile:
        return const SizedBox.shrink();
      case DisplayType.table:
        return NavigationRail(
          onDestinationSelected: (value) =>
              TabDetail.values[value].callback(context),
          destinations: [
            for (final tab in TabDetail.values)
              NavigationRailDestination(
                icon: tab.icon,
                selectedIcon: tab.selected,
                label: Text(tab.label),
              ),
          ],
          selectedIndex: tab.index,
        );
      case DisplayType.web:
        return const SizedBox.shrink();
    }
  }

  Widget bottomAppBar(BuildContext context, TabDetail tab) {
    switch (this) {
      case DisplayType.mobile:
        return BottomNavigationBar(
          items: <BottomNavigationBarItem>[
            for (final tab in TabDetail.values)
              BottomNavigationBarItem(
                icon: tab.icon,
                label: tab.label,
              ),
          ],
          currentIndex: tab.index,
          backgroundColor: Colors.red.withOpacity(.5),
          unselectedItemColor: Colors.black87,
          selectedItemColor: Colors.amber[800],
          onTap: (i) => TabDetail.values[i].callback(context),
        );
      case DisplayType.table:
        return const SizedBox.shrink();
      case DisplayType.web:
        return const SizedBox.shrink();
    }
  }

  List<Widget> actions(BuildContext context, TabDetail selected) {
    switch (this) {
      case DisplayType.mobile:
        return [];
      case DisplayType.table:
        return [];
      case DisplayType.web:
        return TabDetail.values
            .map(
              (e) => ButtonWidget.icon(
                callback: () => e.callback(context),
                icon: e == selected ? e.selected : e.icon,
                backgroundColor: e == selected
                    ? Colors.grey.withOpacity(.5)
                    : Colors.transparent,
              ),
            )
            .toList();
    }
  }
}

extension NumX on num {
  DisplayType get type {
    if (toDouble() > 1200) {
      return DisplayType.web;
    } else if (toDouble() > 600) {
      return DisplayType.table;
    }
    return DisplayType.mobile;
  }
}

enum TabDetail {
  categories,
  products,
  contacts,
  news,
  none,
}

class TabAction {
  final Widget icon;
  final Widget selected;
  final String title;
  final VoidCallback callback;

  TabAction({
    required this.icon,
    required this.selected,
    required this.title,
    required this.callback,
  });
}

extension TabX on TabDetail {
  Widget get icon {
    switch (this) {
      case TabDetail.categories:
        return const Icon(Icons.category_outlined);
      case TabDetail.products:
        return const Icon(Icons.padding_outlined);
      case TabDetail.contacts:
        return const Icon(Icons.contact_page_outlined);
      case TabDetail.news:
        return const Icon(Icons.newspaper_outlined);
      case TabDetail.none:
        return const Icon(Icons.details_outlined);
    }
  }

  Widget get selected {
    switch (this) {
      case TabDetail.categories:
        return const Icon(Icons.category);
      case TabDetail.products:
        return const Icon(Icons.padding);
      case TabDetail.contacts:
        return const Icon(Icons.contact_page);
      case TabDetail.news:
        return const Icon(Icons.newspaper);
      case TabDetail.none:
        return const Icon(Icons.details);
    }
  }

  String get label {
    switch (this) {
      case TabDetail.categories:
        return 'Categories';
      case TabDetail.products:
        return 'Products';
      case TabDetail.contacts:
        return 'Contacts';
      case TabDetail.news:
        return 'News';
      case TabDetail.none:
        return 'Detail';
    }
  }

  void callback(BuildContext context) {
    switch (this) {
      case TabDetail.categories:
        context.go('/detail/s/categories');
        break;
      case TabDetail.products:
        context.go('/detail/s/products');
        break;
      case TabDetail.contacts:
        context.go('/detail/s/contacts');
        break;
      case TabDetail.news:
        context.go('/detail/s/news');
        break;
      case TabDetail.none:
        context.go('/detail');
        break;
    }
  }

  static List<TabAction> actions(BuildContext context) {
    return TabDetail.values
        .map(
          (e) => TabAction(
            icon: e.icon,
            selected: e.selected,
            title: e.label,
            callback: () => e.callback(context),
          ),
        )
        .toList();
  }
}

extension StringX on String {
  TabDetail get tab {
    switch (this) {
      case 'categories':
        return TabDetail.categories;
      case 'products':
        return TabDetail.products;
      case 'contacts':
        return TabDetail.contacts;
      case 'news':
        return TabDetail.news;
      case '':
        return TabDetail.none;
    }
    return TabDetail.none;
  }
}

class DetailPage extends StatefulWidget {
  const DetailPage({
    super.key,
    required this.tab,
  });

  final TabDetail tab;

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      final displayType = constraints.maxWidth.type;
      return Scaffold(
        appBar: AppBar(
          leading: displayType.leading(
            GestureDetector(
              onTap: () {
                if (context.canPop()) context.pop();
              },
              child: const Icon(
                Icons.chevron_left,
                color: Colors.white,
              ),
            ),
          ),
          title: Text(
            widget.tab.label.toUpperCase(),
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w700,
            ),
          ),
          actions: displayType.actions(context, widget.tab),
          backgroundColor: Colors.purpleAccent,
        ),
        bottomNavigationBar: displayType.bottomAppBar(context, widget.tab),
        body: Row(
          children: [
            AnimatedContainer(
              duration: const Duration(milliseconds: 250),
              child: displayType.navigationRail(context, widget.tab),
            ),
            const Expanded(
              child: Center(
                child: Text('Detail'),
              ),
            ),
          ],
        ),
      );
    });
  }
}
