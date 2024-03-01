import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:home_automation/app/home/provider.dart';
import '../../data/constants.dart';
import '../widgets/home_page_tile.dart';

class MyHomePage extends ConsumerStatefulWidget {
  const MyHomePage({super.key});

  @override
  ConsumerState<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends ConsumerState<MyHomePage>
    with SingleTickerProviderStateMixin {
  late AnimationController
      iconController; // make sure u have flutter sdk > 2.12.0 (null safety)
  bool isAnimated = false;
  @override
  void initState() {
    super.initState();
    iconController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 1000));
    iconController.forward().then((value) async {
      await Future.delayed(const Duration(seconds: 1));
      iconController.reverse();
    });
    loadRooms(ref);
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
    iconController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final mode = AdaptiveTheme.of(context).mode;
    final rooms = ref.watch(roomsStateNotifierProvider);
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
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          setState(() {
            if (mode == AdaptiveThemeMode.light) {
              AdaptiveTheme.of(context).setDark();
            } else {
              AdaptiveTheme.of(context).setLight();
            }
          });
        },
        child: Icon(mode == AdaptiveThemeMode.light
            ? Icons.light_mode
            : Icons.dark_mode),
      ),
      body: GridView.count(
        primary: false,
        padding: const EdgeInsets.all(20),
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
        crossAxisCount: 2,
        shrinkWrap: true,
        children:
            rooms.map((room) => HomePageTile(radius: 30, room: room)).toList(),
      ),
    );
  }
}

void loadRooms(WidgetRef ref) {
  Future.delayed(const Duration(milliseconds: 10),
      () => ref.read(roomsStateNotifierProvider.notifier).setData(roomsList));
}
