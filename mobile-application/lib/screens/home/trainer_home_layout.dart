import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_flutter/hive_flutter.dart';

import '../../widgets/home/app_bar_widget.dart';
import '../../widgets/home/drawer_widget.dart';
import '../../widgets/home/trainer_bottom_navi_widget.dart';
import '../chat/chat_screen.dart';
import '../class/class_list_screen.dart';
import '../member/member_screen.dart';
import 'trainer_home_screen.dart';

final menuIndex = StateProvider((_) => 0);
var scaffoldKey = GlobalKey<ScaffoldState>();

class TrainerHomeLayout extends ConsumerStatefulWidget {
  const TrainerHomeLayout({Key? key}) : super(key: key);

  @override
  TrainerHomeLayoutState createState() => TrainerHomeLayoutState();
}

class TrainerHomeLayoutState extends ConsumerState<TrainerHomeLayout> {
  final helloWorldProvider = Provider((_) => 'Hello world');
  final Box userBox = Hive.box('USER_INFO');

  List bodys = [
    {'title': '', 'container': TrainerHomeScreen()},
    {'title': '', 'container': ClassListScreen()},
    {'title': '', 'container': ChatScreen()},
    {'title': '', 'container': MemberScreen()},
  ];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final String value = ref.watch(helloWorldProvider);
    final int idx = ref.watch(menuIndex);

    return Scaffold(
        key: scaffoldKey,
        appBar: AppBarWidget(bodys[idx]['title'] as String),
        // body: bodys[provider.menuIndex],
        body: bodys[idx]['container'] as Widget,
        bottomNavigationBar: const TrainerBottomNaviWidget(),
        drawer: DrawerWidget());
  }
}
