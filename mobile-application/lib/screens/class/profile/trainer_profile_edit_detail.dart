import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../providers/theme_provider.dart';
import 'trainer_profile_setting.dart';

var socialListProvider = StateProvider<List>((_) => []);
var hashTagListProvider = StateProvider<List>((_) => []);
var localListProvider = StateProvider<List>((_) => []);

class TrainerProfileEditDetailScreen extends ConsumerStatefulWidget {
  TrainerProfileEditDetailScreen({Key? key}) : super(key: key);

  @override
  TrainerProfileEditDetailScreenState createState() => TrainerProfileEditDetailScreenState();
}

class TrainerProfileEditDetailScreenState extends ConsumerState<TrainerProfileEditDetailScreen> {
  final GlobalKey _mainSectionKey = GlobalKey();
  late int index;
  TextStyle titleTextStyle = TextStyle(fontSize: ScreenUtil().setSp(18), fontWeight: FontWeight.bold);
  String snsId = '';
  TextEditingController _snsIdController = TextEditingController();
  List socialList = [];
  List hashTagList = [];
  List localList = [];
  List introList = [];
  TextEditingController _hashTagController = TextEditingController();
  String local = '';
  TextEditingController _localController = TextEditingController();
  FocusNode? myFocusNode1;
  FocusNode? myFocusNode2;
  FocusNode? myFocusNode3;
  String? changeValue = '';

  void initState() {
    myFocusNode1 = FocusNode();
    myFocusNode2 = FocusNode();
    myFocusNode3 = FocusNode();
    super.initState();
  }

  @override
  void dispose() {
    _snsIdController.dispose();
    _hashTagController.dispose();
    _localController.dispose();

    socialListProvider = StateProvider<List>((_) => []);
    hashTagListProvider = StateProvider<List>((_) => []);
    localListProvider = StateProvider<List>((_) => []);
    super.dispose();
  }

  _buildSocialLinkSection() {
    socialList = ref.watch(socialListProvider);
    return Container(
      padding: EdgeInsets.symmetric(horizontal: ScreenUtil().setWidth(16)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
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
                    Row(
                      children: [
                        Icon(Icons.public, size: 24, color: Color.fromRGBO(163, 163, 163, 1)),
                        SizedBox(width: 10),
                        Text('소셜링크', style: TextStyle(fontSize: 18))
                      ],
                    ),
                    SizedBox(height: ScreenUtil().setHeight(10)),
                    Container(
                      height: ScreenUtil().setHeight(3),
                      color: Color.fromRGBO(245, 246, 250, 1),
                      width: double.infinity,
                    ),
                    SizedBox(height: ScreenUtil().setHeight(5)),
                    socialList.length == 0 ?
                    SizedBox(height: ScreenUtil().setHeight(0))
                    :
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        for(int i = 0; i < socialList.length; i++)
                        Column(
                          children: [
                            SizedBox(height: ScreenUtil().setHeight(12)),
                            Text(socialList[i], style: TextStyle(fontSize: ScreenUtil().setSp(18), color: Color(0xffA3A3A3)),),
                          ],
                        ),
                        SizedBox(height: ScreenUtil().setHeight(12)),
                      ],
                    ),
                    TextFormField(
                      cursorColor: Colors.grey,
                      controller: _snsIdController,
                      focusNode: myFocusNode1,
                      decoration: InputDecoration(
                        hintText: 'Sns아이디',
                        border: InputBorder.none
                      ),
                      textInputAction: TextInputAction.done,
                      onFieldSubmitted: (_) => setState(() {
                            changeValue = _snsIdController.text;
                            socialList.add(changeValue);
                            _snsIdController.clear();
                            changeValue = '';
                            myFocusNode1?.unfocus();
                          }),
                      style: TextStyle(fontSize: ScreenUtil().setSp(18), color: Color(0xffA3A3A3)),
                      onChanged: (changeValue) {
                        changeValue = _snsIdController.text;
                      },
                    ),
                    SizedBox(height: ScreenUtil().setHeight(5)),
                    GestureDetector(
                      child: Container(
                        width: double.infinity,
                        height: ScreenUtil().setHeight(35),
                        decoration: BoxDecoration(borderRadius: BorderRadius.circular(5), color: Color.fromRGBO(229, 229, 229, 1)),
                        child: Center(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                '소셜링크 추가',
                                style: TextStyle(fontSize: ScreenUtil().setSp(16), color: Colors.black, fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                        ),
                      ),
                      onTap: () {
                        if(_snsIdController.text == ''){
                          FocusScope.of(context).requestFocus(myFocusNode1);
                        }
                        else{
                          setState(() {
                            changeValue = _snsIdController.text;
                            socialList.add(changeValue);
                            _snsIdController.clear();
                            changeValue = '';
                            myFocusNode1?.unfocus();
                          });
                        }
                      },
                    ),
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

  _buildHashTagSection() {
    hashTagList = ref.watch(hashTagListProvider);
    return Container(
      padding: EdgeInsets.symmetric(horizontal: ScreenUtil().setWidth(16)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
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
                    Row(
                      children: [
                        Icon(Icons.tag, size: 24, color: Color.fromRGBO(163, 163, 163, 1)),
                        SizedBox(width: 10),
                        Text('해시태그', style: TextStyle(fontSize: 18))
                      ],
                    ),
                    SizedBox(height: ScreenUtil().setHeight(10)),
                    Container(
                      height: ScreenUtil().setHeight(3),
                      color: Color.fromRGBO(245, 246, 250, 1),
                      width: double.infinity,
                    ),
                    SizedBox(height: ScreenUtil().setHeight(5)),
                    hashTagList.length == 0 ?
                    SizedBox(height: ScreenUtil().setHeight(0))
                    :
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        for(int i = 0; i < hashTagList.length; i++)
                        Column(
                          children: [
                            SizedBox(height: ScreenUtil().setHeight(12)),
                            Text('#'+hashTagList[i], style: TextStyle(fontSize: ScreenUtil().setSp(18), color: Color(0xffA3A3A3)),),
                          ],
                        ),
                        SizedBox(height: ScreenUtil().setHeight(12)),
                      ],
                    ),
                    TextFormField(
                      cursorColor: Colors.grey,
                      controller: _hashTagController,
                      focusNode: myFocusNode2,
                      decoration: InputDecoration(
                        hintText: '해시태그',
                        prefixText: '#',
                        border: InputBorder.none
                      ),
                      textInputAction: TextInputAction.done,
                      onFieldSubmitted: (_) => setState(() {
                            changeValue = _hashTagController.text;
                            hashTagList.add(changeValue);
                            _hashTagController.clear();
                            changeValue = '';
                            myFocusNode2?.unfocus();
                          }),
                      style: TextStyle(fontSize: ScreenUtil().setSp(18), color: Color(0xffA3A3A3)),
                      onChanged: (changeValue) {
                        changeValue = _hashTagController.text;
                      },
                    ),
                    SizedBox(height: ScreenUtil().setHeight(5)),
                    GestureDetector(
                      child: Container(
                        width: double.infinity,
                        height: ScreenUtil().setHeight(35),
                        decoration: BoxDecoration(borderRadius: BorderRadius.circular(5), color: Color.fromRGBO(229, 229, 229, 1)),
                        child: Center(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                '해시태그 추가',
                                style: TextStyle(fontSize: ScreenUtil().setSp(16), color: Colors.black, fontWeight: FontWeight.bold),
                                // textAlign: TextAlign.center,
                              ),
                            ],
                          ),
                        ),
                      ),
                      onTap: () {
                        if(_hashTagController.text == ''){
                          FocusScope.of(context).requestFocus(myFocusNode2);
                        }
                        else{
                          setState(() {
                            changeValue = _hashTagController.text;
                            hashTagList.add(changeValue);
                            _hashTagController.clear();
                            changeValue = '';
                            myFocusNode2?.unfocus();
                          });
                        }
                      },
                    ),
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

  _buildLocalSection() {
    localList = ref.watch(localListProvider);
    return Container(
      padding: EdgeInsets.symmetric(horizontal: ScreenUtil().setWidth(16)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
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
                    Row(
                      children: [
                        Icon(Icons.where_to_vote_outlined, size: 24, color: Color.fromRGBO(163, 163, 163, 1)),
                        SizedBox(width: 10),
                        Text('근무지', style: TextStyle(fontSize: 18))
                      ],
                    ),
                    SizedBox(height: ScreenUtil().setHeight(10)),
                    Container(
                      height: ScreenUtil().setHeight(3),
                      color: Color.fromRGBO(245, 246, 250, 1),
                      width: double.infinity,
                    ),
                    SizedBox(height: ScreenUtil().setHeight(5)),
                    localList.length == 0 ?
                    SizedBox(height: ScreenUtil().setHeight(0))
                    :
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        for(int i = 0; i < localList.length; i++)
                        Column(
                          children: [
                            SizedBox(height: ScreenUtil().setHeight(12)),
                            Text(localList[i], style: TextStyle(fontSize: ScreenUtil().setSp(18), color: Color(0xffA3A3A3)),),
                          ],
                        ),
                        SizedBox(height: ScreenUtil().setHeight(12)),
                      ],
                    ),
                    TextFormField(
                      cursorColor: Colors.grey,
                      controller: _localController,
                      focusNode: myFocusNode3,
                      decoration: InputDecoration(
                        hintText: '근무지',
                        border: InputBorder.none
                      ),
                      textInputAction: TextInputAction.done,
                      onFieldSubmitted: (_) => setState(() {
                            changeValue = _localController.text;
                            localList.add(changeValue);
                            _localController.clear();
                            changeValue = '';
                            myFocusNode3?.unfocus();
                          }),
                      style: TextStyle(fontSize: ScreenUtil().setSp(18), color: Color(0xffA3A3A3)),
                      onChanged: (changeValue) {
                        changeValue = _localController.text;
                      },
                    ),
                    SizedBox(height: ScreenUtil().setHeight(5)),
                    GestureDetector(
                      child: Container(
                        width: double.infinity,
                        height: ScreenUtil().setHeight(35),
                        decoration: BoxDecoration(borderRadius: BorderRadius.circular(5), color: Color.fromRGBO(229, 229, 229, 1)),
                        child: Center(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                '근무지 추가',
                                style: TextStyle(fontSize: ScreenUtil().setSp(16), color: Colors.black, fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                        ),
                      ),
                      onTap: () {
                        if(_localController.text == ''){
                          FocusScope.of(context).requestFocus(myFocusNode3);
                        }
                        else{
                          setState(() {
                            changeValue = _localController.text;
                            localList.add(changeValue);
                            _localController.clear();
                            changeValue = '';
                            myFocusNode3?.unfocus();
                          });
                        }
                      },
                    ),
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
    socialList = ref.watch(socialListProvider);
    hashTagList = ref.watch(hashTagListProvider);
    localList = ref.watch(localListProvider);
    return Scaffold(
      appBar: AppBar(
      // backgroundColor: Colors.white,
      toolbarHeight: 90,
      iconTheme: IconThemeData(color: Colors.black),
      elevation: 0,
      backgroundColor: Color.fromRGBO(245, 246, 250, 1),
      title: Text(
        '상세 정보 수정',
        style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: ScreenUtil().setSp(22)),
      ),
      titleSpacing: 0,
      centerTitle: false,
      actions: [
        TextButton(
          onPressed: () {
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
                      _buildSocialLinkSection(),
                      _buildHashTagSection(),
                      _buildLocalSection()
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