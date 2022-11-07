import 'package:flutter/material.dart';
import 'package:soccer_app/home/view/home_page.dart';
import 'package:soccer_app/fixtures/view/fixtures.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home>  {
  final PageStorageBucket bucket = PageStorageBucket();
  // final PageController controller = PageController();
   // The index of the selected page.
  int currentIndex = 0;

  // The list of pages.
  List<Widget> pages = [
    const FixturesPage(
      key: Key('FixturesPage'),
    ),
    const HomePage(
      key: Key('HomePage'),
    ),
    const HomePage(),
  ];




  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Soccer App'),
      ),
     
      bottomNavigationBar: BottomNavigationBar(
        onTap: (int index) => setState(() => currentIndex = index),
        currentIndex: currentIndex,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.sports_soccer),
            label: 'Fixtures',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.emoji_events),
            label: 'Leagues',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.personal_injury),
            label: 'Players',
          ),
        ],

        // // Navigates to the selected page
        // onTap: (index) {
        //   // Slide animation when changing pages
        //   controller.animateToPage(
        //     index,
        //     duration: const Duration(milliseconds: 600),
        //     curve: Curves.ease,
        //   );
        //   setState(() {

        //     currentIndex = index;
        //   });
        // },
      ),

      body: PageStorage(
        bucket: bucket,
        child: pages[currentIndex],
      ),
    );
  }
}