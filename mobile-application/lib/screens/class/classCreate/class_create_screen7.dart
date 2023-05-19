import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../widgets/home/create_page_app_bar_widget.dart';
import 'package:image_picker/image_picker.dart';

import '../class_create_screen.dart';

enum SingingCharacter { group, personal }

class ClassCreateScreen7 extends ConsumerStatefulWidget {
  int idx;
  ClassCreateScreen7(this.idx, {Key? key}) : super(key: key);
  

  @override
  ClassCreateScreen7State createState() => ClassCreateScreen7State();
}

class ClassCreateScreen7State extends ConsumerState<ClassCreateScreen7> {
  late int idx;
  final GlobalKey _mainSectionKey = GlobalKey();
  final ScrollController _scrollController = ScrollController();
  SingingCharacter? _character = SingingCharacter.group;

  ImagePicker _picker = ImagePicker();
  XFile? img;
  List<File> imageList = [];
  int _imageCurrent = 0;
  List indexList = [];

  @override
  void initState() {
    idx = widget.idx;
    super.initState();
  }

  registGalleryImageData() async {
    img = await _picker.pickImage(source: ImageSource.gallery);
    setState(() {
    if(img == null){
        
      }
      else{
        imageList.insert(0, File(img!.path));
      }
    });
  }

  registCameraImageData() async {
    img = await _picker.pickImage(source: ImageSource.camera);
      setState(() {
        if(img == null){
          
        }
        else{
          imageList.insert(0, File(img!.path));
        }     
      });
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
                            Text('클래스 이미지 등록', style: TextStyle(fontWeight: FontWeight.bold, fontSize: ScreenUtil().setSp(25)),),
                            SizedBox(height: ScreenUtil().setHeight(92)),
                            // ignore: prefer_if_elements_to_conditional_expressions
                            imageList.length == 0 ?
                            InkWell(
                              child: Container(
                                height: ScreenUtil().setHeight(129),
                                width: ScreenUtil().setWidth(129),
                                child: Card(
                                  color: Color.fromRGBO(230, 230, 230, 1),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Icon(CupertinoIcons.photo, color: Color.fromRGBO(163, 163, 163, 1), size: ScreenUtil().setHeight(34.49),),
                                      SizedBox(height: ScreenUtil().setHeight(11.57),),
                                      Text('클래스 이미지 등록', style: TextStyle(color: Color.fromRGBO(163, 163, 163, 1), fontSize: ScreenUtil().setSp(10)))
                                    ],
                                  ),
                                )
                              ),
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
                                              ),
                                            ),
                                      ],
                                    )
                                  )
                                );
                              },
                            )
                            : 
                            Container(
                                width: ScreenUtil().setWidth(129),
                                child: Card(
                                  color: Color.fromRGBO(230, 230, 230, 1),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Image(
                                        image: FileImage(imageList[0]), fit: BoxFit.fitWidth,
                                      )
                                    ],
                                  ),
                                )
                              ),
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
      ),
      ),
      bottomSheet: Container(
        height: ScreenUtil().setHeight(81),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Expanded(
              child: InkWell(
                child: Container(
                  height: ScreenUtil().setHeight(81),
                  width: double.infinity,
                  color: Color.fromRGBO(124, 124, 124, 1),

                  child: Column(
                    children: [
                      SizedBox(height: ScreenUtil().setHeight(16)),
                      Center(
                        child: Text(
                          '이전',
                          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: ScreenUtil().setSp(25)),
                        ),
                      )
                    ],
                  )
                ),
                onTap: () {
                  classCreateIdx.state--;
                },
              )
            ),
            Expanded(
              child: InkWell(
                child: Container(
                  height: ScreenUtil().setHeight(81),
                  width: double.infinity,
                  color: Color.fromRGBO(163, 163, 163, 1),

                  child: Column(
                    children: [
                      SizedBox(height: ScreenUtil().setHeight(16)),
                      Center(
                        child: Text(
                          '다음',
                          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: ScreenUtil().setSp(25)),
                        ),
                      )
                    ],
                  )
                ),
                onTap: () {
                  classCreateIdx.state++;
                },
              )
            ),
          ],
        )
      ),
    );
  }

  void _showToast(BuildContext context) {
    final scaffold = ScaffoldMessenger.of(context);
    scaffold.showSnackBar(
      SnackBar(
        content: const Text('준비중', style: TextStyle(color: Colors.black),),
        action: SnackBarAction(label: '취소', onPressed: scaffold.hideCurrentSnackBar, textColor: Colors.blue,),
        backgroundColor: Colors.white,
      ),
    );
  }
}