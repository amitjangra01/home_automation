import 'package:flutter/material.dart';
import 'package:home_automation/main.dart';
import '../data/data.dart';
import '../widgets/home_page_tile.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage>
    with SingleTickerProviderStateMixin {
  late AnimationController
      iconController; // make sure u have flutter sdk > 2.12.0 (null safety)
  bool isAnimated = false;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    iconController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 1000));
    iconController.forward().then((value) async {
      await Future.delayed(const Duration(seconds: 1));
      iconController.reverse();
    });
  }

  void AnimateIcon() {
    setState(() {
      isAnimated =
          !isAnimated; //if false then change it to true, likewise if true change it to false
      //if true then forword else reverse
      isAnimated ? iconController.forward() : iconController.reverse();
    });
  }

  @override
  void dispose() {
    // implement dispose
    iconController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: ListView(
          children: const [
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.teal,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30),
                  bottomRight: Radius.circular(30),
                ),
              ),
              child: Center(
                child: Text(
                  "Mohesu",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 30,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      appBar: AppBar(
        title: const Text('Mohesu'),
        centerTitle: true,
        // leading: IconButton(
        //   onPressed: () {
        //     AnimateIcon();
        //   },
        //   icon: AnimatedIcon(
        //     icon: AnimatedIcons.menu_close,
        //     progress: iconController,
        //   ),
        // ),
      ),
      body: GridView.count(
        primary: false,
        padding: const EdgeInsets.all(20),
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
        crossAxisCount: 2,
        shrinkWrap: true,
        children: homePageTiles
            .map((e) => HomePageTile(
                  title: e.name,
                  icon: e.icon,
                  index: e.index,
                  radius: 30,
                  devices: e.devices,
                ))
            .toList(),
      ),
    );
  }
}
