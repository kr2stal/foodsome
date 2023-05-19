import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../widgets/home/create_page_app_bar_widget.dart';
import '../class_create_screen.dart';


enum SingingCharacter { group, personal }

class ClassCreateScreen4 extends ConsumerStatefulWidget {
  int idx;
  ClassCreateScreen4(this.idx, {Key? key}) : super(key: key);
  

  @override
  ClassCreateScreen4State createState() => ClassCreateScreen4State();
}

class ClassCreateScreen4State extends ConsumerState<ClassCreateScreen4> {
  late int idx;
  List<Class> classes = <Class>[];
  final GlobalKey _mainSectionKey = GlobalKey();
  final ScrollController _scrollController = ScrollController();
  SingingCharacter? _character = SingingCharacter.group;

  @override
  void initState() {
    idx = widget.idx;
    super.initState();
    classes.add(new Class("5회", false));
    classes.add(new Class('10회', false));
    classes.add(new Class("20회", false));
    classes.add(new Class('30회', false));
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
        child: Container(
        child: CustomScrollView(
          controller: _scrollController, 
          slivers: [
            SliverList(
              delegate: SliverChildListDelegate(
                [
                  Column(
                    key: _mainSectionKey,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.white
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            SizedBox(height: ScreenUtil().setHeight(120)),
                            Text('클래스 횟수를', style: TextStyle(fontWeight: FontWeight.bold, fontSize: ScreenUtil().setSp(25)),),
                            Text('알려주세요.', style: TextStyle(fontWeight: FontWeight.bold, fontSize: ScreenUtil().setSp(25)),),
                            SizedBox(height: ScreenUtil().setHeight(66)),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                for(int i = 0; i < 4; i++)
                                Padding(
                                  padding: EdgeInsets.fromLTRB(ScreenUtil().setWidth(16), 0, ScreenUtil().setWidth(16), 0),
                                  child: Container(
                                    width: ScreenUtil().setWidth(350),
                                    child: InkWell(
                                      onTap: () {
                                        setState(() {
                                          classes.forEach((gender) => gender.isSelected = false);
                                          classes[i].isSelected = true;
                                        });
                                        Future.delayed(const Duration(milliseconds: 500), () {
                                          classCreateIdx.state++;	
                                        });
                                      },
                                      child: CustomRadioWidget2(classes[i]), 
                                    )
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.fromLTRB(ScreenUtil().setWidth(16), 0, ScreenUtil().setWidth(16), 0),
                                  child: Container(
                                    width: ScreenUtil().setWidth(350),
                                    child: Card(
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(5),
                                        side: BorderSide(
                                          color:  Color.fromRGBO(163, 163, 163, 1)
                                        )
                                      ),
                                      child: Container(
                                        height: ScreenUtil().setHeight(85),
                                        width: ScreenUtil().setWidth(350),
                                        alignment: Alignment.center,
                                        child: GestureDetector(
                                          child: Container(
                                            child: TextField(
                                              cursorColor: Colors.grey,
                                              textInputAction: TextInputAction.go,
                                              onSubmitted: (value) {
                                                Future.delayed(const Duration(milliseconds: 200), () {
                                                  classCreateIdx.state++;	
                                                });
                                              },
                                              textAlign: TextAlign.center,
                                              decoration: InputDecoration(
                                                contentPadding: EdgeInsets.all(ScreenUtil().setWidth(16)),
                                                hintText: '직접입력',
                                                isDense: true,
                                                focusedBorder: InputBorder.none,
                                                enabledBorder: InputBorder.none,
                                                errorBorder: InputBorder.none,
                                                disabledBorder: InputBorder.none,
                                              ),
                                            ),
                                          ),
                                          onTap: () {
                                            setState(() {
                                              classes.forEach((gender) => gender.isSelected = false);
                                            });
                                          },
                                        )
                                      )
                                    ),
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ]
        ),
      ),
      )
    );
  }
}

class Class {
  String name;
  bool isSelected;

  Class(this.name, this.isSelected);
}

class CustomRadioWidget2 extends StatelessWidget {
  Class _class;

  CustomRadioWidget2(this._class);

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(5),
        side: BorderSide(
          color:  _class.isSelected ? Colors.transparent : Color.fromRGBO(163, 163, 163, 1)
        )
      ),
      color: _class.isSelected ? Color.fromRGBO(235, 240, 255, 1) : Colors.white,
      child: Container(
        height: ScreenUtil().setHeight(80),
        width: ScreenUtil().setWidth(164),
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  padding: EdgeInsets.only(left: 10, bottom: 30),
                  child: _class.isSelected 
                  ? Icon(
                    Icons.check_circle,
                    color: Color.fromRGBO(75, 60, 247, 1),
                  )
                  : Icon(
                    Icons.check_circle_outline,
                    color: Color.fromRGBO(163, 163, 163, 1),
                  ),
                ),
                SizedBox(width: ScreenUtil().setWidth(110)),
                Text(
                  _class.name,
                  style: TextStyle(
                      color: Colors.black, fontWeight: FontWeight.bold, fontSize: ScreenUtil().setSp(18)),
                ),
              ],
            ),
          ],
        ),
      )
    );
  }
}