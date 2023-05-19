import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../widgets/home/create_page_app_bar_widget.dart';
import '../class_create_screen.dart';
enum SingingCharacter { group, personal }

class ClassCreateScreen9 extends ConsumerStatefulWidget {
  int idx;
  ClassCreateScreen9(this.idx, {Key? key}) : super(key: key);
  

  @override
  ClassCreateScreen9State createState() => ClassCreateScreen9State();
}

class ClassCreateScreen9State extends ConsumerState<ClassCreateScreen9> {
  late int idx;
  final GlobalKey _mainSectionKey = GlobalKey();
  final ScrollController _scrollController = ScrollController();
  SingingCharacter? _character = SingingCharacter.group;

  @override
  void initState() {
    idx = widget.idx;
    super.initState();
  }
  
  @override
  Widget build(BuildContext context) {
    idx = ref.watch(classCreateIndex);
    final StateController<int> classCreateIdx = ref.watch(classCreateIndex.state);
    return Scaffold(
      appBar: CreatePageAppBarWidget(
        '클래스 생성',
      ),
      body: SafeArea(
        child: GestureDetector(
        onTap: () {
        FocusScope.of(context).unfocus();
        },
        child: Container(
        child: CustomScrollView(
          controller: _scrollController, 
          slivers: [
            SliverList(
              delegate: SliverChildListDelegate(
                [
                  Container(
                    child: Column(
                      key: _mainSectionKey,
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(height: ScreenUtil().setHeight(40)),
                        Container(                      
                          child: Image(image: AssetImage('assets/images/map.png'), fit: BoxFit.fitWidth,)
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          ]
        ),
      ),
      ), 
      ),
      bottomNavigationBar: Container(
        height: ScreenUtil().setHeight(81),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Container(
              height: ScreenUtil().setHeight(81),
              width: double.infinity,
              color: Color.fromRGBO(163, 163, 163, 1),
              child: TextButton(
                onPressed: () {
                classCreateIdx.state++;
              },
              child: Text(
                '확인',
                style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: ScreenUtil().setSp(18)),
              ),
              ),
            ),
          ],
        )
      )
    );
  }
}