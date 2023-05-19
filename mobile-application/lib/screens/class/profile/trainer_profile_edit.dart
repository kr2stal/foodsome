import 'dart:io';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_sticky_header/flutter_sticky_header.dart';
import 'package:image_picker/image_picker.dart';

import '../../../providers/theme_provider.dart';
import '../../../widgets/home/create_page_app_bar_widget.dart';
import '../../../widgets/home/subpage_app_bar_widget.dart';
import 'trainer_profile_edit_detail.dart';
import 'trainer_profile_edit_intro.dart';
import 'trainer_profile_screen.dart';

class TrainerProfileEditScreen extends StatefulWidget {
  const TrainerProfileEditScreen({Key? key}) : super(key: key);

  @override
  State<TrainerProfileEditScreen> createState() => _TrainerProfileEditScreenState();
}

class _TrainerProfileEditScreenState extends State<TrainerProfileEditScreen> with SingleTickerProviderStateMixin {
  final GlobalKey _mainSectionKey = GlobalKey();

  final ScrollController _scrollController = ScrollController();

  int _current = 0;
  int _imageCurrent = 0;
  List<File> imageList = []; // 넘기기
  List indexList = []; // 넘기기
  bool open = false;
  String id = ''; // 넘기기
  String tag = ''; // 넘기기
  String local = ''; 
  String intro = ''; // 넘기기
  List socialList = [];
  List hashTagList = [];
  List localList = [];
  List tagList = ['구로동', 'PT', '개인PT', '그룹PT', '구로헬스장', '물리치료자격증', '구로PT'];

  TextStyle titleTextStyle = TextStyle(fontSize: ScreenUtil().setSp(18), fontWeight: FontWeight.bold);

  ImagePicker _picker = ImagePicker();
  XFile? img;
  List<XFile>? imgs;
  XFile? profileImg;
  File? profileFile;
  
  registGalleryImageData() async {
    imgs = await _picker.pickMultiImage();
    setState(() {
    if(imgs == null){
        
      }
      else{
        for(int i = 0; i<imgs!.length; i++){
          imageList.insert(i, File(imgs![i].path));
          indexList.add(i);
        }
      }
    });
  }

  registCameraImageData() async {
    img = await _picker.pickImage(source: ImageSource.camera);
      setState(() {
        if(img == null){
          
        }
        else{
          imageList.insert(_imageCurrent, File(img!.path));
          indexList.add(_imageCurrent);
          _imageCurrent++;
        }     
      });
  }

  registProfileImageData() async {
    profileImg = await _picker.pickImage(source: ImageSource.gallery);
      setState(() {
      if(profileImg == null){
          
        }
        else{
          profileFile = File(profileImg!.path);
        }
      });
  }

  dividerWidget() => Container(
    height: ScreenUtil().setHeight(10),
    color: Color(0xffF5F6FA),
    width: double.infinity,
  );

  _buildImageView() {
    return Container(
      child: Column(
        children: [
          AppBar(
            // backgroundColor: Colors.white,
            toolbarHeight: 90,
            iconTheme: IconThemeData(color: Colors.black),
            elevation: 0,
            title: Text(
              '프로필 편집',
              style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: ScreenUtil().setSp(22)),
            ),
            titleSpacing: 0,
            centerTitle: false,
            actions: [
              TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text(
                    'save',
                    style: TextStyle(color: PRIMARY_COLOR, fontWeight: FontWeight.bold),
                  )
                )
            ],
          ),
          Stack(
            children: [
              if (imageList.length == 0) 
              Container(
                alignment: Alignment.center,
                height: ScreenUtil().setHeight(280),
                width: MediaQuery.of(context).size.width,
                // margin: EdgeInsets.symmetric(horizontal: 5.0),
                decoration: BoxDecoration(color: Color(0xffF5F6FA)),
                child: Center(
                  child: Text(
                    '',
                    style: TextStyle(fontSize: 16.0),
                  ),
                )
              ) 
              else 
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
                        _current = index;
                      });
                    }),
                    items: indexList.map((i) {
                      return Builder(
                        builder: (BuildContext context) {
                          return Container(
                            width: MediaQuery.of(context).size.width,
                            // margin: EdgeInsets.symmetric(horizontal: 5.0),
                            decoration: BoxDecoration(
                              color: Color(0xffF5F6FA),
                              image: DecorationImage(
                                image: FileImage(imageList[i]),
                              )
                            ),
                          );
                        },
                      );
                    }).toList(),
                )
              ),
              Positioned(
                left: 10,
                top: 250,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: imageList.asMap().entries.map((entry) {
                    return GestureDetector(
                      // onTap: () => _controller.animateToPage(entry.key),
                      child: Container(
                        width: 8.0,
                        height: 8.0,
                        margin: EdgeInsets.symmetric(vertical: 8.0, horizontal: 2.0),
                        decoration: BoxDecoration(shape: BoxShape.circle, color: _current == entry.key ? PRIMARY_COLOR : Color(0xff575757).withOpacity(0.5)),
                      ),
                    );
                  }).toList(),
                ),
              ),
              Positioned(
                right: 10,
                bottom: 10,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [GestureDetector(
                      onTap: () { 
                        showCupertinoModalPopup(
                          context: context, 
                          builder: (BuildContext context) => Container(
                            height: ScreenUtil().setHeight(281),
                            color: Colors.transparent,
                            child: Column(
                              children: [
                                Padding(
                                  padding: EdgeInsets.symmetric(horizontal: ScreenUtil().setWidth(12)),
                                  child: CupertinoActionSheet(
                                    actions: <Widget>[
                                      Container(
                                        color: Colors.white,
                                        child: Column(
                                          children: [
                                            CupertinoActionSheetAction(
                                              child: Text('사진 찍기', style: TextStyle(fontSize: ScreenUtil().setSp(14), color: Color.fromRGBO(51, 51, 51, 1))),
                                              onPressed: () {
                                                registCameraImageData();
                                                Navigator.pop(context, '');
                                              },
                                            ),
                                            Container(
                                              height: ScreenUtil().setHeight(1),
                                              color: Color(0xffF5F6FA),
                                              width: double.infinity,
                                            ),
                                            CupertinoActionSheetAction(
                                              child: Text('앨범에서 가져오기', style: TextStyle(fontSize: ScreenUtil().setSp(14), color: Color.fromRGBO(51, 51, 51, 1))),
                                              onPressed: () {
                                                registGalleryImageData();
                                                Navigator.pop(context, '');
                                              },
                                            )
                                          ],
                                        ),
                                      )
                                    ],
                                  ),              
                                ),
                                SizedBox(height: ScreenUtil().setHeight(8)),
                                Container(
                                      height: ScreenUtil().setHeight(81),
                                      width: double.infinity,
                                      color: Color.fromRGBO(75, 60, 247, 1),
                                      child: TextButton(
                                        onPressed: () {
                                        Navigator.pop(context, '취소');
                                      },
                                      child: Text(
                                        '취소',
                                        style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: ScreenUtil().setSp(18)),
                                      ),
                                      )
                                    ),
                              ],
                            )
                          )
                        );
                      },
                      child: Container(
                        width: 40,
                        height: 40,
                        margin: EdgeInsets.symmetric(vertical: 8.0, horizontal: 2.0),
                        decoration: BoxDecoration(shape: BoxShape.circle, color: Color.fromRGBO(195, 195, 195, 1),),
                        child: Icon(Icons.camera_alt_rounded, size: 25,),
                      ),
                    )
                  ]
                ),
              ),
            ] 
          ),
        ]
      )  
    );
  }

  _buildProfileImageView() {
    return Container(
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: ScreenUtil().setWidth(8)),
            child: CreatePageAppBarWidget(
              '프로필 사진',
              actions: [
                TextButton(
                  onPressed: () {
                    registProfileImageData();
                  },
                  child: Text(
                    '수정',
                    style: TextStyle(color: PRIMARY_COLOR, fontWeight: FontWeight.bold),
                  )
                )
              ],
            ),
          ),
          Column(
            children: [
              SizedBox(height: ScreenUtil().setHeight(20)),
              profileFile == null?
              Container(
                width: 120,
                height: 120,
                decoration: BoxDecoration(
                  shape: BoxShape.circle, 
                  color: Color.fromRGBO(241, 241, 241, 1)
                ),
              )
              :Container(
                width: 120,
                height: 120,
                decoration: BoxDecoration(
                  shape: BoxShape.circle, 
                  color: Color.fromRGBO(241, 241, 241, 1),
                  image: DecorationImage(
                    image: FileImage(profileFile!),
                    fit: BoxFit.cover
                  )
                ),
              ),
              SizedBox(height: ScreenUtil().setHeight(40)),
            ] 
          ),
        ]
      )  
    );
  }

  _buildDetailInfo() {
    return Container(
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: ScreenUtil().setWidth(8)),
            child: CreatePageAppBarWidget(
              '상세 정보',
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => TrainerProfileEditDetailScreen()));
                  },
                  child: Text(
                    '수정',
                    style: TextStyle(color: PRIMARY_COLOR, fontWeight: FontWeight.bold),
                  )
                )
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: ScreenUtil().setWidth(18)),
            child: Column(
            children: [
              SizedBox(height: ScreenUtil().setHeight(20)),
              Row(
                children: [
                  Icon(Icons.public, size: 30),
                  SizedBox(width: 10),
                  Text('소셜링크')
                ],
              ),
              Padding(
                padding: EdgeInsets.all(12),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Sns 아이디', style: TextStyle(fontSize: 16, color: Color.fromRGBO(124, 124, 124, 1))),
                  ],
                ),
              ),
              Row(
                children: [
                  Icon(Icons.tag_sharp, size: 30),
                  SizedBox(width: 10),
                  Text('해시태그')
                ],
              ),
              Padding(
                padding: EdgeInsets.only(top: ScreenUtil().setHeight(12)),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      child: Row(
                        children: [
                          for(int i = 0; i < 4; i ++)
                          Row(
                            children: [
                              Container(
                                padding: EdgeInsets.all(8),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                  color: Color.fromRGBO(241, 244, 253, 1),
                                ),
                                child: Center(
                                  child: Text('#'+tagList[i], style: TextStyle(fontSize: ScreenUtil().setSp(14), color: Color.fromRGBO(124, 124, 124, 1)),),
                                )
                              ),
                              SizedBox(width: ScreenUtil().setWidth(10)),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                )
              ),
              Padding(
                padding: EdgeInsets.only(top: ScreenUtil().setHeight(12)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      child: Row(
                        children: [
                          for(int i = 4; i < 7; i ++)
                          Row(
                            children: [
                              Container(
                                padding: EdgeInsets.all(8),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                  color: Color.fromRGBO(241, 244, 253, 1),
                                ),
                                child: Center(
                                  child: Text('#'+tagList[i], style: TextStyle(fontSize: ScreenUtil().setSp(14), color: Color.fromRGBO(124, 124, 124, 1)),),
                                )
                              ),
                              SizedBox(width: ScreenUtil().setWidth(10)),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                )
              ),
              SizedBox(height: ScreenUtil().setHeight(20)),
              Row(
                children: [
                  Icon(Icons.where_to_vote_outlined, size: 30),
                  SizedBox(width: 10),
                  Text('근무지')
                ],
              ),
              Padding(
                padding: EdgeInsets.all(12),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('KingGYM, 서울특별시 구로구', style: TextStyle(fontSize: 16, color: Color.fromRGBO(124, 124, 124, 1))),
                  ],
                ),
              ),
              SizedBox(height: ScreenUtil().setHeight(40)),
            ] 
          ),
          )
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
                  onPressed: () {
                    // Navigator.push(context, MaterialPageRoute(builder: (context) => TrainerProfileEditIntroScreen()));
                  },
                  child: Text(
                    '수정',
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
                SizedBox(height: ScreenUtil().setHeight(40)),
                Container(
                  child: Text(
                    '많은 대회실력으로 인증한 몸 만들기 전문가! 다이어트반 부터 헬스트레이너 준비반까지 다양한 클래스를 운영하고 있습니다.\n\n물리치료 자격증을 보유하고 있습니다.\n\n…',
                    style: TextStyle(fontSize: 16, color: Color.fromRGBO(124, 124, 124, 1)),
                  ),
                ),
                SizedBox(height: ScreenUtil().setHeight(40)),
              ],
            )
          )
        ]
      )  
    );
  }

  _buildOpenWidget() {
    return Container(
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: ScreenUtil().setWidth(8)),
            child: CreatePageAppBarWidget(
              '전체공개',
              actions: [
                CupertinoSwitch(
                // This bool value toggles the switch.
                value: open,
                thumbColor: Colors.white,
                trackColor: Color.fromRGBO(163, 163, 163, 1),
                activeColor: Color.fromRGBO(80, 99, 238, 1),
                onChanged: (bool? value) {
                  // This is called when the user toggles the switch.
                  setState(() {
                    open = value!;
                  });
                },
              ),
              ],
            ),
          ),
          SizedBox(height: ScreenUtil().setHeight(80)),
        ]
      )  
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(controller: _scrollController, slivers: [
        SliverList(
          delegate: SliverChildListDelegate(
            [
              Column(
                key: _mainSectionKey,
                children: [
                  _buildImageView(),
                  _buildProfileImageView(),
                  dividerWidget(),
                  _buildDetailInfo(),
                  dividerWidget(),
                  _buildIntroduce(),
                  dividerWidget(),
                  _buildOpenWidget()
                ],
              )
            ],
          ),
        ),
      ]),
    );
  }
}
