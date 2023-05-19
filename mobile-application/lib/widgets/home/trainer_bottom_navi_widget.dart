import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../providers/theme_provider.dart';
import '../../screens/home/trainer_home_layout.dart';

class TrainerBottomNaviWidget extends ConsumerWidget {
  const TrainerBottomNaviWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final StateController<int> menuIdx = ref.watch(menuIndex.state);

    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      selectedItemColor: PRIMARY_COLOR,
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(icon: Icon(Icons.home), label: '홈'),
        BottomNavigationBarItem(icon: Icon(Icons.class_outlined), label: '클래스'),
        BottomNavigationBarItem(icon: Icon(Icons.chat_bubble_outline), label: '채팅'),
        BottomNavigationBarItem(icon: Icon(Icons.person), label: '회원'),
      ],
      currentIndex: menuIdx.state,
      onTap: (int newIndex) {
        menuIdx.state = newIndex;
      },
    );
  }
}
