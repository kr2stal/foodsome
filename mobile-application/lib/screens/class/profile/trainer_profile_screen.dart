import 'dart:io';


import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_sticky_header/flutter_sticky_header.dart';
import 'package:gymsome/screens/class/profile/trainer_profile_edit.dart';
import 'package:mobx/mobx.dart';

import '../../../providers/theme_provider.dart';
import '../../../utils.dart';
import '../../../widgets/home/create_page_app_bar_widget.dart';
import '../../../widgets/home/subpage_app_bar_widget.dart';
import '../../../widgets/home/trainer_bottom_navi_widget.dart';

class TrainerProfileScreen extends StatefulWidget {
  List<File> imageList;
  List indexList;
  List<File> profileList;
  List socialList;
  List hashTagList;
  List localList;
  List introList;
  TrainerProfileScreen(this.imageList, this.indexList, this.profileList, this.socialList, this.hashTagList, this. localList, this.introList, {Key? key}) : super(key: key);

  @override
  State<TrainerProfileScreen> createState() => _TrainerProfileScreenState();
}

class _TrainerProfileScreenState extends State<TrainerProfileScreen> with SingleTickerProviderStateMixin {
  final GlobalKey _mainSectionKey = GlobalKey();

  final ScrollController _scrollController = ScrollController();

  int _imageCurrent = 0;
  late List<File> imageList;
  late List indexList;
  late List<File> profileList;
  late List socialList;
  late List hashTagList;
  late List localList;
  late List introList;
  late String result;
  List<String> reviewList = ['assets/images/cls3.jpg','assets/images/cls8.jpg','assets/images/cls10.jpg'];
  List tagList = ['구로동', 'PT', '개인PT', '그룹PT', '구로헬스장', '물리치료자격증', '구로PT'];
  bool open = false;
  int classes = 3;

  TextStyle titleTextStyle = TextStyle(fontSize: ScreenUtil().setSp(18), fontWeight: FontWeight.bold);
  Color favoriteColor = Color.fromRGBO(254, 0, 124, 1);
  bool isColored = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    imageList = widget.imageList;
    indexList = widget.indexList;
    profileList = widget.profileList;
    socialList = widget.socialList;
    hashTagList = widget.hashTagList;
    localList = widget.localList;
    introList = widget.introList; 
  }

  @override
  void dispose() {
    super.dispose();
  }

  dividerWidget() => Container(
    height: ScreenUtil().setHeight(10),
    color: Color(0xffF5F6FA),
    width: double.infinity,
  );

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

  _buildImageView() {
    return Container(
      child: Column(
        children: [
          AppBar(
            // backgroundColor: Colors.white,
            toolbarHeight: 110,
            iconTheme: IconThemeData(color: Colors.black),
            elevation: 0,
            title: Text(
              '내 프로필',
              style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: ScreenUtil().setSp(22)),
            ),
            titleSpacing: 0,
            centerTitle: false,
            actions: [
              TextButton(
                  onPressed: () {
                    showNoPageToast(context);
                  },
                  child: Text(
                    'Edit',
                    style: TextStyle(color: PRIMARY_COLOR, fontWeight: FontWeight.bold),
                  )
                )
            ],
          ),
          Stack(
            children: [
              Column(
                children: [
                  Container(
                    alignment: Alignment.center,
                    color: Color(0xffF5F6FA),
                    height: ScreenUtil().setHeight(280),
                    child: CarouselSlider(
                      options: CarouselOptions(
                          height: MediaQuery.of(context).size.height,
                          autoPlay: false,
                          enlargeCenterPage: true,
                          enableInfiniteScroll: false,
                          // aspectRatio: 375 / 682,
                          viewportFraction: 1.0,
                          onPageChanged: (index, reason) {
                            setState(() {
                              _imageCurrent = index;
                            });
                          }),
                      items: indexList.map((i) {
                        return Builder(
                          builder: (BuildContext context) {
                            return Container(
                                width: MediaQuery.of(context).size.width,
                                // margin: EdgeInsets.symmetric(horizontal: 5.0),
                                decoration: BoxDecoration(color: Color(0xffF5F6FA),
                              image: DecorationImage(
                                image: FileImage(imageList[i]),
                              )));
                          },
                        );
                      }).toList(),
                    )
                  ),
                  SizedBox(height: ScreenUtil().setHeight(50)),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: ScreenUtil().setWidth(16)),
                    child: Row(
                      children: [
                        profileList.length == 0?
                        Container(
                          width: 69,
                          height: 69,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle, 
                            color: Color.fromRGBO(195, 195, 195, 1)
                          ),
                        )
                        :Container(
                          width: 69,
                          height: 69,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle, 
                            color: Color.fromRGBO(195, 195, 195, 1),
                            image: DecorationImage(
                              image: FileImage(profileList[0]),
                              fit: BoxFit.cover
                            )
                          ),
                        ),
                        SizedBox(width: ScreenUtil().setWidth(10)),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              '김짐썸',
                              style: TextStyle(fontSize: ScreenUtil().setSp(24), fontWeight: FontWeight.bold),
                            ),
                            SizedBox(height: ScreenUtil().setHeight(10)),
                            Row(
                              children: [
                                if(socialList.length == 0)
                                Text('sns 아이디, 링크', style: TextStyle(color: Color.fromRGBO(124, 124, 124, 1), fontSize: ScreenUtil().setSp(15)))
                                else
                                for(int i = 0; i < socialList.length; i++)
                                Text(socialList[i], style: TextStyle(color: Color.fromRGBO(124, 124, 124, 1), fontSize: ScreenUtil().setSp(15)))
                              ],
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                  SizedBox(height: ScreenUtil().setHeight(38)),
                ],
              ),
              Positioned(
                left: 10,
                top: 200,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: imageList.asMap().entries.map((entry) {
                    return GestureDetector(
                      // onTap: () => _controller.animateToPage(entry.key),
                      child: Container(
                        width: 8.0,
                        height: 8.0,
                        margin: EdgeInsets.symmetric(vertical: 8.0, horizontal: 2.0),
                        decoration: BoxDecoration(shape: BoxShape.circle, color: _imageCurrent == entry.key ? PRIMARY_COLOR : Color(0xff575757).withOpacity(0.5)),
                      ),
                    );
                  }).toList(),
                ),
              ),
              Positioned(
                right: 20,
                top: 190,
                child: InkWell(
                  child: Card(
                    elevation: 3,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(150)
                    ),
                    child: Container(
                      width: 64,
                      height: 64,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.white
                      ),
                      child: Icon(
                        Icons.favorite, 
                        color: isColored ? Color.fromRGBO(254, 0, 124, 1) : Colors.grey, 
                        size: ScreenUtil().setSp(26.19),),
                    ),
                  ),
                  onTap: () {
                    setState(() {
                      isColored = !isColored;
                    });
                  },
                )              
              ),
            ]
          ),
          Padding(
            padding: EdgeInsets.only(left: ScreenUtil().setWidth(20)),
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  for(int i = 0; i < hashTagList.length; i ++)
                  Row(
                    children: [
                      Container(
                        padding: EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color: Color.fromRGBO(241, 244, 253, 1),
                        ),
                        child: Center(
                          child:
                          hashTagList.length == 0  
                          ? Text('#'+tagList[i], style: TextStyle(fontSize: ScreenUtil().setSp(18), color: Color.fromRGBO(124, 124, 124, 1)),)
                          : Text('#'+hashTagList[i], style: TextStyle(fontSize: ScreenUtil().setSp(18), color: Color.fromRGBO(124, 124, 124, 1)),)
                        )
                      ),
                      SizedBox(width: ScreenUtil().setWidth(10)),
                    ],
                  )
                ],
              ),
            ),
          ),
          SizedBox(height: ScreenUtil().setHeight(50)),
        ]
      )  
    );
  }

  _buildIntroduce() {
    return Container(
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: ScreenUtil().setWidth(8)),
            child: CreatePageAppBarWidget(
              '소개',
              actions: [
                TextButton(
                  onPressed: () {},
                  child: Text(
                    '',
                    style: TextStyle(color: PRIMARY_COLOR, fontWeight: FontWeight.bold),
                  )
                )
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: ScreenUtil().setWidth(22)),
            child: Column(
              children: [
                SizedBox(height: ScreenUtil().setHeight(20)),
                if(introList.length == 0)
                Container(
                  child: 
                  Text(
                    '많은 대회실력으로 인증한 몸 만들기 전문가! 다이어트반 부터 헬스트레이너 준비반까지 다양한 클래스를 운영하고 있습니다.\n\n물리치료 자격증을 보유하고 있습니다.\n\n…',
                    style: TextStyle(fontSize: 16, color: Color.fromRGBO(124, 124, 124, 1)),
                  ),
                )
                else
                Container(
                  child: 
                  Text(
                    introList[0],
                    style: TextStyle(fontSize: 16, color: Color.fromRGBO(124, 124, 124, 1)),
                  ),
                ),
                SizedBox(height: ScreenUtil().setHeight(40)),
                GestureDetector(
                  child: Container(
                    
                    width: double.infinity,
                    height: ScreenUtil().setHeight(54),
                    decoration: BoxDecoration(borderRadius: BorderRadius.circular(10), color: Color(0xffF5F6FA)),
                    child: Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            '더보기',
                            style: TextStyle(fontSize: ScreenUtil().setSp(18), color: Color(0xff575757)),
                            // textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                    ),
                  ),
                  onTap: () {
                    
                  },
                ),
                SizedBox(height: ScreenUtil().setHeight(40)),
              ],
            )
          )
        ]
      )  
    );
  }

  _buildTrainerClassWidget() {
    return Container(
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: ScreenUtil().setWidth(8)),
            child: SizedBox(
      height: ScreenUtil().setHeight(310),
      child: Column(
        children: [
          SizedBox(height: ScreenUtil().setHeight(48)),
          Container(
            padding: EdgeInsets.symmetric(horizontal: ScreenUtil().setWidth(16)),
            child: Row(
              children: [
                Text(
                  '선생님의 클래스',
                  style: titleTextStyle,
                ),
                SizedBox(width : ScreenUtil().setWidth(5)),
                Text(
                  '$classes개',
                  style: TextStyle(color: PRIMARY_COLOR, fontWeight: FontWeight.bold, fontSize: 12),
                )
              ],
            ),
          ),
          SizedBox(height: ScreenUtil().setHeight(30)),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
                children: List.generate(
                    classes,
                    (index) => Container(
                          margin:
                              EdgeInsets.only(left: ScreenUtil().setWidth(16), bottom: ScreenUtil().setHeight(10), top: ScreenUtil().setHeight(5)),
                          decoration: BoxDecoration(boxShadow: [BoxShadow(blurRadius: 6.0, color: Color(0xff29000000), offset: Offset(0.0, 3.0))]),
                          width: ScreenUtil().setWidth(120),
                          child: Column(
                            children: [
                              Stack(children: [
                                Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.vertical(top: Radius.circular(10)),
                                    color: Colors.grey[300],
                                  ),
                                  height: ScreenUtil().setHeight(87),
                                  width: double.infinity,
                                  child: Image.asset(
                                    reviewList[index],
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                Positioned(
                                    left: 0,
                                    bottom: 0,
                                    child: Container(
                                      width: ScreenUtil().setWidth(35),
                                      height: ScreenUtil().setHeight(15),
                                      color: PRIMARY_COLOR,
                                      child: Center(
                                        child: Text('모집중', style: TextStyle(fontSize: ScreenUtil().setSp(8), color: Colors.white)),
                                      ),
                                    )),
                                Positioned(
                                    right: 5,
                                    top: 5,
                                    child: Icon(
                                      Icons.favorite_border,
                                      color: Colors.white,
                                    ))
                              ]),
                              Container(
                                width: double.infinity,
                                height: ScreenUtil().setHeight(100),
                                padding: EdgeInsets.symmetric(horizontal: ScreenUtil().setWidth(8)),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.vertical(bottom: Radius.circular(10)),
                                  color: Colors.white,
                                ),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      '퍼스널트레이닝',
                                      style: TextStyle(fontSize: ScreenUtil().setSp(14), fontWeight: FontWeight.bold),
                                    ),
                                    SizedBox(height: ScreenUtil().setHeight(7)),
                                    Text(
                                      '#주말 #왕초보 #시작 #다이어트 #운동',
                                      style: TextStyle(fontSize: ScreenUtil().setSp(11.5), color: Color(0xffA3A3A3)),
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                        ))),
          )
        ],
      ),
    )
          ),
          SizedBox(height: ScreenUtil().setHeight(80)),
        ]
      )  
    );
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      child: Scaffold(
      body: CustomScrollView(controller: _scrollController, slivers: [
        SliverList(
          delegate: SliverChildListDelegate(
            [
              Column(
                key: _mainSectionKey,
                children: [
                  _buildImageView(),
                  dividerWidget(),
                  _buildIntroduce(),
                  dividerWidget(),
                  _buildTrainerClassWidget()
                ],
              )
            ],
          ),
        ),
      ]),
      bottomNavigationBar: const TrainerBottomNaviWidget(),
    ), 
    onWillPop: () {
      return _onBackKey();
    } 
    );
  }
}


