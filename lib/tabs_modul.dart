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
            bottom: const TabBar(
              tabs: [
                Tab(text: 'Palces'),
                Tab(text: 'Inspriation'),
                Tab(text: 'Emontion'),
              ],
            ),
          ),
          body: const TabBarView(
            children: [
              CarouselModule(),
              Text('Nội dung tab 2'),
              Text('Nội dung Tab 3')
            ],
          ),
        ),
      ),
    );
  }
}
