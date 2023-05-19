import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../providers/theme_provider.dart';
import '../../widgets/home/create_page_app_bar_widget.dart';
import '../../widgets/home/subpage_app_bar_widget.dart';
import '../../widgets/toast_widget.dart';
import '../home/trainer_home_screen.dart';
import 'classCreate/class_create_screen4.dart';
import 'classCreate/class_create_screen5.dart';
import 'classCreate/class_create_screen1.dart';
import 'classCreate/class_create_screen10.dart';
import 'classCreate/class_create_screen11.dart';
import 'classCreate/class_create_screen2.dart';
import 'classCreate/class_create_screen3.dart';
import 'classCreate/class_create_screen4.dart';
import 'classCreate/class_create_screen5.dart';
import 'classCreate/class_create_screen6.dart';
import 'classCreate/class_create_screen7.dart';
import 'classCreate/class_create_screen8.dart';
import 'classCreate/class_create_screen9.dart';

var classCreateIndex = StateProvider((_) => 0);

class ClassCreateScreen extends ConsumerStatefulWidget {
  const ClassCreateScreen({Key? key}) : super(key: key);

  @override
  ClassCreateScreenState createState() => ClassCreateScreenState();
}

class ClassCreateScreenState extends ConsumerState<ClassCreateScreen> {
  final GlobalKey _mainSectionKey = GlobalKey();
  final ScrollController _scrollController = ScrollController();

  Future<bool> _onBackKey() async {
  return await showDialog(
    context: context, 
    builder: (BuildContext context) {
      return AlertDialog(
        backgroundColor: Colors.white,
        title: Text('작성을 중단하시겠습니까?', style: TextStyle(color: Colors.black, fontSize: 18)),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context, true);
            },
            child: Text('네')
          ),
          TextButton(
            onPressed: () {
              Navigator.pop(context, false);
            },
            child: Text('아니요')
          )
        ],
      );
    }
  );
}

  @override
  void dispose() {
    classCreateIndex = StateProvider((_) => 0);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    int idx = ref.watch(classCreateIndex);
    final StateController<int> classCreateIdx = ref.watch(classCreateIndex.state);
    List bodys = [{'title': '클래스 만들기', 'container': ClassCreateScreen1()},
    {'title': '', 'container': ClassCreateScreen2(idx)},
    {'title': '', 'container': ClassCreateScreen3(idx)},
    {'title': '', 'container': ClassCreateScreen4(idx)},
    {'title': '', 'container': ClassCreateScreen5(idx)},
    {'title': '', 'container': ClassCreateScreen6(idx)},
    {'title': '', 'container': ClassCreateScreen7(idx)},
    {'title': '', 'container': ClassCreateScreen8(idx)},
    {'title': '', 'container': ClassCreateScreen9(idx)},
    {'title': '보러가기', 'container': ClassCreateScreen11()}];

    return WillPopScope(
      child: Scaffold(
      body: bodys[idx]['container'] as Widget,
      bottomSheet: 
      Container(
        height: ScreenUtil().setHeight(81),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            if(bodys[idx]['title'] != '')
            Container(
              height: ScreenUtil().setHeight(81),
              width: double.infinity,
              color: Color.fromRGBO(75, 60, 247, 1),
              child: TextButton(
              onPressed: () {
                if(9 > classCreateIdx.state)
                {classCreateIdx.state++;}
                else{
                  Navigator.pop(context);
                  showToast('클래스가 생성되었습니다.', context);
                }
              },
              child: Column(
                children: [
                  SizedBox(height: ScreenUtil().setHeight(16)),
                  Text(
                    bodys[idx]['title'] as String,
                    style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: ScreenUtil().setSp(25)),
                  ),
                ],
              )
            ),
            )
          ],
        )
      )
    ),
    onWillPop: () {
      return _onBackKey();
    }
    );
  }
}




