import 'package:flutter/material.dart';

class CustomScreenWithTabBar extends StatefulWidget {
  const CustomScreenWithTabBar({
    super.key,
    required this.appBarTitle,
    required this.tabs,
    required this.tabsView,
  });

  final String appBarTitle;
  final List<Widget> tabs;
  final List<Widget> tabsView;

  @override
  State<CustomScreenWithTabBar> createState() => _CustomScreenWithTabBarState();
}

class _CustomScreenWithTabBarState extends State<CustomScreenWithTabBar> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: widget.tabs.length,
      child: Builder(
        builder: (context) {
          final TabController controller = DefaultTabController.of(context);
          controller.addListener(() {});
          return Scaffold(
            appBar: AppBar(
              toolbarHeight: 100,
              centerTitle: true,
              title: Text(widget.appBarTitle),
              actions: const [CircleAvatar()],
              bottom: TabBar(
                physics: const BouncingScrollPhysics(),
                isScrollable: true,
                tabAlignment: TabAlignment.center,
                labelColor: Colors.white,
                unselectedLabelColor: Colors.black,
                labelPadding: const EdgeInsets.all(0),
                indicator: BoxDecoration(
                  color: const Color.fromARGB(253, 51, 100, 224),
                  shape: BoxShape.rectangle,
                  borderRadius: BorderRadius.circular(10),
                ),
                tabs: widget.tabs,
              ),
            ),
            body: TabBarView(
              children: widget.tabsView,
            ),
          );
        },
      ),
    );
  }
}
