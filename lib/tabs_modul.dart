import 'package:assingment_34/submit_form_module.dart';
import 'package:flutter/material.dart';
import 'package:assingment_34/carousel_module.dart';

class TabsModule extends StatefulWidget {
  const TabsModule({super.key});

  @override
  State<TabsModule> createState() => _TabsModule();
}

class _TabsModule extends State<TabsModule> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: AppBar(
            bottom: PreferredSize(
              preferredSize: const Size.fromHeight(kToolbarHeight),
              child: Container(
                alignment: Alignment.centerLeft,
                child: const TabBar(
                  tabAlignment: TabAlignment.start,
                  tabs: [
                    Tab(text: 'Places'),
                    Tab(text: 'Inspiration'),
                    Tab(text: 'Emotion'),
                  ],
                  isScrollable: true,
                ),
              ),
            ),
          ),
          body: const TabBarView(
            children: [CarouselModule(), StudentList(), Text('Nội dung Tab 3')],
          ),
        ),
      ),
    );
  }
}
