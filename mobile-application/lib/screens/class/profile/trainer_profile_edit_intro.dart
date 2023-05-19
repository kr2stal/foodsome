import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gymsome/screens/class/profile/trainer_profile_setting.dart';
import '../../../providers/theme_provider.dart';

var introProvider = StateProvider<String>((_) => '');

class TrainerProfileEditIntroScreen extends ConsumerStatefulWidget {
  List socialList;
  List hashTagList;
  List localList;
  TrainerProfileEditIntroScreen(this.socialList, this. hashTagList, this. localList, {Key? key}) : super(key: key);

  @override
  TrainerProfileEditIntroScreenState createState() => TrainerProfileEditIntroScreenState();
}

class TrainerProfileEditIntroScreenState extends ConsumerState<TrainerProfileEditIntroScreen> {
  final GlobalKey _mainSectionKey = GlobalKey();
  late int index;

  String? value;
  String intro = '';
  List introList = [];
  late List socialList;
  late List hashTagList;
  late List localList;

  TextStyle titleTextStyle = TextStyle(fontSize: ScreenUtil().setSp(18), fontWeight: FontWeight.bold);
  TextEditingController _introController = TextEditingController();
  

  void initState() {
    super.initState();
    socialList = widget.socialList;
    hashTagList = widget.hashTagList;
    localList = widget.localList;
  }

  @override
  void dispose() {
    _introController.dispose();
    super.dispose();
  }

  _buildIntroSection() {
    intro = ref.watch(introProvider);
    return Container(
      padding: EdgeInsets.symmetric(horizontal: ScreenUtil().setWidth(16)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
              width: 69,
              height: 69,
              decoration: BoxDecoration(shape: BoxShape.circle, color: Color.fromRGBO(195, 195, 195, 1))
              ),
              SizedBox(width: ScreenUtil().setWidth(10)),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '김짐썸',
                    style: TextStyle(fontSize: ScreenUtil().setSp(24), fontWeight: FontWeight.bold),
                  )
                ],
              )
            ],
          ),
          SizedBox(height: ScreenUtil().setHeight(30)),
          Container(
            width: double.infinity,
            child: Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20)
              ),
              elevation: 0,
              child: Padding(
                padding: EdgeInsets.all(ScreenUtil().setHeight(18)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextFormField(
                      controller: _introController,
                      maxLines: 10,
                      maxLength: 1000,
                      decoration: InputDecoration(
                        hintText: '소개를 추가하여 회원님에 대해 더 많이 알릴 수 있습니다',
                        border: InputBorder.none
                      ),
                      style: TextStyle(fontSize: ScreenUtil().setSp(18), color: Color(0xffA3A3A3)),
                      onChanged: (value) {
                        value = _introController.text;
                        introList.insert(0, value);
                      },
                    )
                  ],
                )
              )
            )
          ),
          SizedBox(height: ScreenUtil().setHeight(10)),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    intro = ref.watch(introProvider);
    return Scaffold(
      appBar: AppBar(
      // backgroundColor: Colors.white,
      toolbarHeight: 70,
      iconTheme: IconThemeData(color: Colors.black),
      elevation: 0,
      backgroundColor: Color.fromRGBO(245, 246, 250, 1),
      title: Text(
        '소개 수정',
        style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: ScreenUtil().setSp(22)),
      ),
      titleSpacing: 0,
      centerTitle: false,
      actions: [
        TextButton(
          onPressed: ()async {
            Navigator.pushReplacement(context, MaterialPageRoute(
                  builder: (BuildContext context) =>
                    TrainerProfileSettingScreen(socialList, hashTagList, localList, introList)));
          },
          child: Text(
            'Save',
            style: TextStyle(color: PRIMARY_COLOR, fontWeight: FontWeight.bold),
          )
        )
      ],
    ),
      body: Container( 
        color: Color.fromRGBO(245, 246, 250, 1),
        child : CustomScrollView(
          slivers: [
            SliverList(
              delegate: SliverChildListDelegate(
                [
                  Column(
                    key: _mainSectionKey,
                    children: [
                      _buildIntroSection()
                    ],
                  )
                ],
              ),
            ),
          ]
        )
      ),
    );
  }
}