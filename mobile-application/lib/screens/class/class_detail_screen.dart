import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_sticky_header/flutter_sticky_header.dart';
import 'package:gymsome/screens/class/review_list_screen.dart';

import '../../constants/images.dart';
import '../../providers/class/class_provider.dart';
import '../../providers/theme_provider.dart';
import '../../widgets/home/subpage_app_bar_widget.dart';
import 'class_notice_more.dart';

class ClassDetailScreen extends StatefulWidget {
  const ClassDetailScreen({Key? key}) : super(key: key);

  @override
  State<ClassDetailScreen> createState() => _ClassDetailScreenState();
}

class _ClassDetailScreenState extends State<ClassDetailScreen> with SingleTickerProviderStateMixin {
  OverlayEntry? sticky;
  final GlobalKey _mainSectionKey = GlobalKey();
  final GlobalKey _introSectionKey = GlobalKey();
  final GlobalKey _locationSectionKey = GlobalKey();
  final GlobalKey _noticeSectionKey = GlobalKey();

  late TabController _tabController;
  final ScrollController _scrollController = ScrollController();

  List<String> reviewList = ['assets/images/review1.jpg','assets/images/review2.jpg','assets/images/review3.jpg','assets/images/review4.jpg','assets/images/review5.jpg'];

  double? mainSectionHeight, introSectionHeight, locationSectionHeight, noticeSectionHeight;

  int _current = 0;
  // List imageList = [1, 2, 3, 4, 5];
  List imageList = [GImages.CLS5, GImages.CLS3, GImages.CLS10, GImages.CLS7];
  List menuList = ['소개', '위치', '공지', '후기'];
  int selectedMenu = 0;

  TextStyle titleTextStyle = TextStyle(fontSize: ScreenUtil().setSp(18), fontWeight: FontWeight.bold);

  @override
  initState() {
    _tabController = TabController(length: 4, vsync: this);
    _scrollController.addListener(() {
      if (_scrollController.offset < mainSectionHeight! + introSectionHeight! - 50) {
        _tabController.index = 0;
        return;
      } else if (_scrollController.offset < mainSectionHeight! + introSectionHeight! + locationSectionHeight! - 50) {
        _tabController.index = 1;
        return;
      } else if (_scrollController.offset < mainSectionHeight! + introSectionHeight! + locationSectionHeight! + noticeSectionHeight! - 50) {
        _tabController.index = 2;
        return;
      } else {
        _tabController.index = 3;
      }
    });

    // 위젯 위치 얻기 위한 레이어
    sticky?.remove();
    sticky = OverlayEntry(
      builder: (context) => AnimatedBuilder(
        animation: _scrollController,
        builder: (_, Widget? child) {
          getWidgetSize();

          return Container();
        },
      ),
    );
    SchedulerBinding.instance.addPostFrameCallback((_) => Overlay.of(context)?.insert(sticky!));

    super.initState();
  }

  @override
  dispose() {
    _scrollController.dispose();
    _tabController.dispose();

    sticky?.remove();
    super.dispose();
  }

  Future moveToMenu(double height, {int? time}) =>
      _scrollController.animateTo(height + ScreenUtil().setHeight(30), duration: Duration(milliseconds: time ?? 1000), curve: Curves.easeInOut);

  getWidgetSize() {
    if (mainSectionHeight == null && _mainSectionKey != null && _mainSectionKey.currentContext != null) {
      RenderBox box = _mainSectionKey.currentContext!.findRenderObject() as RenderBox;
      mainSectionHeight = box.size.height; // 크기
    }

    if (introSectionHeight == null && _introSectionKey != null && _introSectionKey.currentContext != null) {
      RenderBox box = _introSectionKey.currentContext!.findRenderObject() as RenderBox;
      introSectionHeight = box.size.height;
    }

    if (locationSectionHeight == null && _locationSectionKey != null && _locationSectionKey.currentContext != null) {
      RenderBox box = _locationSectionKey.currentContext!.findRenderObject() as RenderBox;
      locationSectionHeight = box.size.height;
    }

    if (noticeSectionHeight == null && _noticeSectionKey != null && _noticeSectionKey.currentContext != null) {
      RenderBox box = _noticeSectionKey.currentContext!.findRenderObject() as RenderBox;
      noticeSectionHeight = box.size.height;
    }
  }

  _buildImageView() {
    return Stack(children: [
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
            items: imageList.map((i) {
              return Builder(
                builder: (BuildContext context) {
                  return Container(
                      width: MediaQuery.of(context).size.width,
                      // margin: EdgeInsets.symmetric(horizontal: 5.0),
                      decoration: BoxDecoration(color: Color(0xffF5F6FA)),
                      child: Center(
                          child: Image.asset(
                        i,
                        fit: BoxFit.fitWidth,
                        cacheWidth: 600,
                      )
                          // child: Text(
                          //   'image $i',
                          //   style: TextStyle(fontSize: 16.0),
                          // ),
                          ));
                },
              );
            }).toList(),
          )),

      // =================== indicator ===================
      Positioned(
        right: 5,
        bottom: 0,
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
    ]);
  }

  _buildTitleView() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: ScreenUtil().setWidth(16)),
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: ScreenUtil().setHeight(27)),
          Text(
            '구로 | 헬스',
            style: TextStyle(fontSize: ScreenUtil().setSp(15), color: Color(0xffA3A3A3)),
          ),
          SizedBox(height: ScreenUtil().setHeight(8)),
          Text(
            '헬스 왕초보반',
            style: TextStyle(fontSize: ScreenUtil().setSp(25), fontWeight: FontWeight.bold),
          ),
          SizedBox(height: ScreenUtil().setHeight(50)),
          Row(
            children: [
              Flexible(
                child: Container(
                  height: ScreenUtil().setHeight(75),
                  padding: EdgeInsets.only(bottom: ScreenUtil().setHeight(20)),
                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(5), color: Color(0xffF1F4FD)),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        '1회',
                        style: TextStyle(fontSize: ScreenUtil().setSp(18)),
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(width: ScreenUtil().setWidth(14)),
                      Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text(
                            '30,000원',
                            style: TextStyle(
                              fontSize: ScreenUtil().setSp(12),
                              color: Color(0xffA3A3A3),
                              decoration: TextDecoration.lineThrough,
                            ),
                            textAlign: TextAlign.end,
                          ),
                          SizedBox(height: ScreenUtil().setWidth(3)),
                          Text(
                            '30,000원',
                            style: TextStyle(fontSize: ScreenUtil().setSp(18), fontWeight: FontWeight.bold, color: PRIMARY_COLOR),
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(width: ScreenUtil().setWidth(9)),
              Flexible(
                child: Container(
                  height: ScreenUtil().setHeight(75),
                  padding: EdgeInsets.only(bottom: ScreenUtil().setHeight(20)),
                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(5), color: Color(0xffF1F4FD)),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        '10회',
                        style: TextStyle(fontSize: ScreenUtil().setSp(18)),
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(width: ScreenUtil().setWidth(14)),
                      Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text(
                            '300,000원',
                            style: TextStyle(
                              fontSize: ScreenUtil().setSp(12),
                              color: Color(0xffA3A3A3),
                              decoration: TextDecoration.lineThrough,
                            ),
                            textAlign: TextAlign.end,
                          ),
                          SizedBox(height: ScreenUtil().setWidth(3)),
                          Text(
                            '280,000원',
                            style: TextStyle(fontSize: ScreenUtil().setSp(18), fontWeight: FontWeight.bold, color: PRIMARY_COLOR),
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: ScreenUtil().setHeight(50)),
        ],
      ),
    );
  }

  _buildTabView() {
    return Container(
      child: SliverStickyHeader(
        header: Container(
          color: Colors.white,
          height: ScreenUtil().setHeight(70),
          padding: EdgeInsets.symmetric(horizontal: ScreenUtil().setWidth(16)),
          alignment: Alignment.centerLeft,
          child: TabBar(
            controller: _tabController,
            // indicatorPadding: EdgeInsets.all(8),
            indicatorColor: PRIMARY_COLOR,
            labelColor: PRIMARY_COLOR,
            labelStyle: TextStyle(fontWeight: FontWeight.bold, fontFamily: 'NanumSquare'),
            unselectedLabelStyle: TextStyle(fontWeight: FontWeight.normal, fontFamily: 'NanumSquare'),
            unselectedLabelColor: Color(0xffA3A3A3),
            tabs: menuList
                .map((menu) => Container(
                      padding: EdgeInsets.only(bottom: ScreenUtil().setHeight(8)),
                      child: Text(
                        menu,
                      ),
                    ))
                .toList(),
            onTap: (index) {
              switch (index) {
                case 0:
                  moveToMenu(mainSectionHeight!);
                  break;

                case 1:
                  moveToMenu(mainSectionHeight! + introSectionHeight!);
                  break;

                case 2:
                  locationSectionHeight == null
                      ? moveToMenu(mainSectionHeight! + introSectionHeight!, time: 500)
                          .then((value) => moveToMenu(mainSectionHeight! + introSectionHeight! + locationSectionHeight!, time: 500))
                      : moveToMenu(mainSectionHeight! + introSectionHeight! + locationSectionHeight!);
                  break;

                case 3:
                  noticeSectionHeight == null
                      ? moveToMenu(mainSectionHeight! + introSectionHeight!, time: 500).then(
                          (value) => moveToMenu(mainSectionHeight! + introSectionHeight! + locationSectionHeight! + noticeSectionHeight!, time: 500))
                      : moveToMenu(mainSectionHeight! + introSectionHeight! + locationSectionHeight! + noticeSectionHeight!);
                  break;
                default:
              }
            },
          ),
        ),
        sliver: SliverList(
            delegate: SliverChildListDelegate([
          Column(
            key: _introSectionKey,
            children: [
              _buildIntroSection(),
              dividerWidget(),
            ],
          ),
          _buildLocationSection(),
          dividerWidget(),
          _buildNoticeSection(),
          dividerWidget(),
          _buildReviewSection(),
          dividerWidget(),
          _buildSimilarClassSection()
        ])),
      ),
    );
  }

  _buildIntroSection() {
    return Container(
      // key: _introSectionKey,
      padding: EdgeInsets.symmetric(horizontal: ScreenUtil().setWidth(16)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: ScreenUtil().setHeight(34)),
          Text(
            '클래스 소개',
            style: titleTextStyle,
          ),
          SizedBox(height: ScreenUtil().setHeight(34)),
          Row(
            children: [
              Container(
                  width: ScreenUtil().setWidth(100),
                  child: AspectRatio(
                    aspectRatio: 1,
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.grey,
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Image.asset(
                          GImages.TRN1,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  )),
              SizedBox(width: ScreenUtil().setWidth(20)),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '김짐썸',
                    style: TextStyle(fontSize: ScreenUtil().setSp(18), fontWeight: FontWeight.bold),
                  ),
                  Text('sns 아이디'),
                  Text('링크'),
                ],
              )
            ],
          ),
          SizedBox(height: ScreenUtil().setHeight(38)),
          Text(
            '많은 대회실력으로 인증한 몸 만들기 전문가! 다이어트반 부터 헬스트레이너 준비반까지 다양한 클래스를 운영하고 있습니다.',
            style: TextStyle(fontSize: ScreenUtil().setSp(15)),
          ),
          SizedBox(height: ScreenUtil().setHeight(48)),
          Container(
            width: double.infinity,
            height: ScreenUtil().setHeight(54),
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(5), color: Color(0xffF1F4FD)),
            child: Center(
              child: Text(
                '매주 월 수 금 오후 7시 진행',
                style: TextStyle(fontSize: ScreenUtil().setSp(18), fontWeight: FontWeight.bold),
                // textAlign: TextAlign.center,
              ),
            ),
          ),
          SizedBox(height: ScreenUtil().setHeight(16)),
          Text(
              '헬스 왕초보 분들을 위한 그룹피티입니다. 기초체력 측정부터 시작하여 자신에게 맞는 운동을 찾고 헬스의 즐거움을 … 헬스 왕초보 분들을 위한 그룹피티입니다. 기초체력 측정부터 시작하여 자신에게 맞는 운동을 찾고 헬스의 즐거움을 … 헬스 왕초보 분들을 위한 그룹피티입니다. 기초체력 측정부터 시작하여 자신에게 맞는 운동을 찾고 헬스의 즐거움을 … 헬스 왕초보 분들을 위한 그룹피티입니다. 기초체력 측정부'),
          SizedBox(height: ScreenUtil().setHeight(26)),
          Container(
            padding: EdgeInsets.only(
              top: ScreenUtil().setHeight(13),
              bottom: ScreenUtil().setHeight(12),
              left: ScreenUtil().setWidth(12),
              right: ScreenUtil().setWidth(16),
            ),
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(10), color: Color(0xffF1F4FD)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  '공지',
                  style: TextStyle(fontSize: ScreenUtil().setSp(13), fontWeight: FontWeight.bold),
                ),
                SizedBox(width: ScreenUtil().setWidth(30)),
                Text(
                  '매주 월 수 금 오후 7시 진행',
                  style: TextStyle(fontSize: ScreenUtil().setSp(12)),
                ),
              ],
            ),
          ),
          SizedBox(height: ScreenUtil().setHeight(57)),
        ],
      ),
    );
  }

  _buildLocationSection() {
    return Container(
      key: _locationSectionKey,
      // padding: EdgeInsets.symmetric(horizontal: ScreenUtil().setWidth(16)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: ScreenUtil().setHeight(48)),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: ScreenUtil().setWidth(16)),
            child: Text('클래스 위치', style: titleTextStyle),
          ),
          SizedBox(height: ScreenUtil().setHeight(16)),
          Container(
            height: ScreenUtil().setHeight(226),
            width: double.infinity,
            color: Colors.grey,
            child: Image.asset(
              GImages.MAP,
              fit: BoxFit.fitWidth,
            ),
          ),
          SizedBox(height: ScreenUtil().setHeight(20)),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: ScreenUtil().setWidth(16)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Icon(Icons.location_on, color: Color(0xff7C7C7C)),
                    Text(
                      '서울시 구로구 디지털로 288',
                      style: TextStyle(fontSize: ScreenUtil().setSp(12), color: Color(0xff7C7C7C)),
                    )
                  ],
                ),
                GestureDetector(
                  child: Text(
                    '주소복사',
                    style: TextStyle(fontSize: ScreenUtil().setSp(12), color: Color(0xff1400FF)),
                  ),
                  onTap: () {},
                )
              ],
            ),
          ),
          SizedBox(height: ScreenUtil().setHeight(51)),
        ],
      ),
    );
  }

  _buildNoticeSection() {
    return Container(
      key: _noticeSectionKey,
      padding: EdgeInsets.symmetric(horizontal: ScreenUtil().setWidth(16)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: ScreenUtil().setHeight(48)),
          Text('클래스 공지', style: titleTextStyle),
          SizedBox(height: ScreenUtil().setHeight(32)),
          Container(
            padding: EdgeInsets.only(
              top: ScreenUtil().setHeight(10),
              bottom: ScreenUtil().setHeight(12),
              left: ScreenUtil().setWidth(16),
              right: ScreenUtil().setWidth(14),
            ),
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(10), color: Color(0xffF8F8F8)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Icon(Icons.push_pin_rounded, color: Color(0xff5063EE)),
                    Text(
                      '고정됨',
                      style: TextStyle(fontSize: ScreenUtil().setSp(14), color: Color(0xff5063EE)),
                    )
                  ],
                ),
                SizedBox(height: ScreenUtil().setHeight(10)),
                Text(
                  '수업 특성상 커리큘럼이 유연하게 변경될 수 있습니다.',
                  style: TextStyle(fontSize: ScreenUtil().setSp(15)),
                ),
                SizedBox(height: ScreenUtil().setHeight(5)),
                Text(
                  '02. 12. 토',
                  style: TextStyle(fontSize: ScreenUtil().setSp(14), color: Color(0xffA3A3A3)),
                )
              ],
            ),
          ),
          SizedBox(height: ScreenUtil().setHeight(10)),
          ...List.generate(
            2,
            (index) => Padding(
              padding: EdgeInsets.symmetric(vertical: ScreenUtil().setHeight(27)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: ScreenUtil().setHeight(10)),
                  Text(
                    '수업 특성상 커리큘럼이 유연하게 변경될 수 있습니다.',
                    style: TextStyle(fontSize: ScreenUtil().setSp(15)),
                  ),
                  SizedBox(height: ScreenUtil().setHeight(5)),
                  Text(
                    '02. 12. 토',
                    style: TextStyle(fontSize: ScreenUtil().setSp(14), color: Color(0xffA3A3A3)),
                  )
                ],
              ),
            ),
          ),
          Container(
              width: double.infinity,
              height: ScreenUtil().setHeight(54),
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(5), color: Color(0xffF5F6FA)),
              child: InkWell(
                child: Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        '더보기',
                        style: TextStyle(fontSize: ScreenUtil().setSp(18), color: Color(0xff575757)),
                        // textAlign: TextAlign.center,
                      ),
                      SizedBox(width: ScreenUtil().setWidth(10)),
                      Text(
                        '1개',
                        style: TextStyle(fontSize: ScreenUtil().setSp(12), color: Color(0xff5063EE)),
                      )
                    ],
                  ),
                ),
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => ClassNoticeMoreScreen()));
                },
              )),
          SizedBox(height: ScreenUtil().setHeight(48)),
        ],
      ),
    );
  }

  _buildReviewSection() {
    return Container(
      // padding: EdgeInsets.symmetric(horizontal: ScreenUtil().setWidth(16)),
      width: double.infinity,
      child: Column(
        children: [
          SizedBox(height: ScreenUtil().setHeight(48)),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: ScreenUtil().setWidth(16)),
            child: Row(
              children: [
                Text(
                  '수강생의 후기',
                  style: titleTextStyle,
                )
              ],
            ),
          ),
          SizedBox(height: ScreenUtil().setHeight(28)),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: ScreenUtil().setWidth(16)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Container(
                      width: ScreenUtil().setWidth(43),
                      child: AspectRatio(
                          aspectRatio: 1,
                          child: Container(
                            decoration: BoxDecoration(borderRadius: BorderRadius.circular(10), color: Color(0xffA3A3A3)),
                            child: Icon(Icons.person, color: Colors.white),
                          )),
                    ),
                    SizedBox(width: ScreenUtil().setWidth(18)),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Text(
                              '최바람',
                              style: TextStyle(fontSize: ScreenUtil().setSp(18), fontWeight: FontWeight.bold),
                            ),
                            SizedBox(width: ScreenUtil().setWidth(10)),
                            Text(
                              '퍼스널 트레이닝',
                              style: TextStyle(fontSize: ScreenUtil().setSp(14), color: Color(0xff7C7C7C)),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            RatingBar.builder(
                              initialRating: 3.5,
                              minRating: 0,
                              direction: Axis.horizontal,
                              allowHalfRating: true,
                              itemCount: 5,
                              unratedColor: Colors.grey[200],
                              // itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
                              itemSize: ScreenUtil().setWidth(20),

                              itemBuilder: (context, _) => Icon(
                                Icons.star,
                                color: Colors.amber,
                              ),
                              onRatingUpdate: (rating) {},
                              ignoreGestures: true,
                            ),
                            Text(
                              '3.5',
                              style: TextStyle(fontSize: ScreenUtil().setSp(12), color: Color(0xffA3A3A3)),
                            )
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
                Text(
                  '04. 05. 화',
                  style: TextStyle(fontSize: ScreenUtil().setSp(14), color: Color(0xffA3A3A3)),
                )
              ],
            ),
          ),
          SizedBox(height: ScreenUtil().setHeight(28)),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: ScreenUtil().setWidth(16)),
            child: Text('기존에 하고 있던 운동 더 잘하고 싶어서 웨이트 하려고 pt등록 했는데, 운동 목적에 맞게 짐썸쌤이 너무 잘 알려주셔서 헬스 시작하고 기존에 하던 운동 그레이드 올랐... 더보기'),
          ),
          SizedBox(height: ScreenUtil().setHeight(22)),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
                children: List.generate(
                    5,
                    (index) => Container(
                          margin: EdgeInsets.only(left: ScreenUtil().setWidth(10)),
                          width: ScreenUtil().setWidth(86),
                          child: AspectRatio(
                            aspectRatio: 1,
                            child: Image.asset(
                              reviewList[index],
                              fit: BoxFit.contain,
                            )
                          ),
                        ))),
          ),
          SizedBox(height: ScreenUtil().setHeight(16)),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: ScreenUtil().setWidth(16)),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              mainAxisSize: MainAxisSize.max,
              children: [
                CircleAvatar(
                  backgroundImage: AssetImage('assets/images/review2.jpg')
                ),
                Container(
                  width: MediaQuery.of(context).size.width * 0.75,
                  margin: EdgeInsets.only(top: ScreenUtil().setHeight(10)),
                  padding: EdgeInsets.only(
                    top: ScreenUtil().setHeight(16),
                    bottom: ScreenUtil().setHeight(27),
                    left: ScreenUtil().setWidth(16),
                    right: ScreenUtil().setWidth(16),
                  ),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(15),
                        bottomRight: Radius.circular(15),
                        bottomLeft: Radius.circular(15),
                      ),
                      color: Color(0xffEFEFEF)),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(
                                '김짐썸',
                                style: TextStyle(fontSize: ScreenUtil().setSp(18), fontWeight: FontWeight.bold),
                              ),
                              SizedBox(width: ScreenUtil().setWidth(10)),
                              Text(
                                '트레이너',
                                style: TextStyle(fontSize: ScreenUtil().setSp(14), color: Color(0xff7C7C7C)),
                              ),
                            ],
                          ),
                          Text(
                            '04. 12. 화',
                            style: TextStyle(fontSize: ScreenUtil().setSp(12), color: Color(0xffA3A3A3)),
                          )
                        ],
                      ),
                      SizedBox(height: ScreenUtil().setHeight(10)),
                      SizedBox(
                        // width: ScreenUtil().setWidth(260),
                        child: Text('리뷰 달아주셔서 감사합니다. 회원님이 열심히 따라와주셔서 가르쳐줄 맛이 나네요. 앞으로도 열심히 해봅시다!'),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
          SizedBox(height: ScreenUtil().setHeight(44)),
          GestureDetector(
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: ScreenUtil().setWidth(16)),
              width: double.infinity,
              height: ScreenUtil().setHeight(54),
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(5), color: Color(0xffF5F6FA)),
              child: Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      '리뷰 더보기',
                      style: TextStyle(fontSize: ScreenUtil().setSp(18), color: Color(0xff575757)),
                      // textAlign: TextAlign.center,
                    ),
                    SizedBox(width: ScreenUtil().setWidth(10)),
                    Text(
                      '220개',
                      style: TextStyle(fontSize: ScreenUtil().setSp(12), color: Color(0xff5063EE)),
                    )
                  ],
                ),
              ),
            ),
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => ReviewListScreen()));
            },
          ),
          SizedBox(height: ScreenUtil().setHeight(51)),
        ],
      ),
    );
  }

  _buildSimilarClassSection() {
    return SizedBox(
      height: ScreenUtil().setHeight(310),
      child: Column(
        children: [
          SizedBox(height: ScreenUtil().setHeight(48)),
          Container(
            padding: EdgeInsets.symmetric(horizontal: ScreenUtil().setWidth(16)),
            child: Row(
              children: [
                Text(
                  '이 클래스와 유사한 클래스',
                  style: titleTextStyle,
                )
              ],
            ),
          ),
          SizedBox(height: ScreenUtil().setHeight(13)),
          SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Consumer(
                builder: (context, ref, child) {
                  final classList = ref.watch(getSiimilarClassListProvider);
                  return classList.when(
                      data: (cls) {
                        return Row(
                            children: List.generate(
                                cls.length,
                                (index) => Container(
                                      margin: EdgeInsets.only(
                                          left: ScreenUtil().setWidth(16), bottom: ScreenUtil().setHeight(10), top: ScreenUtil().setHeight(5)),
                                      decoration: BoxDecoration(
                                          boxShadow: [BoxShadow(blurRadius: 6.0, color: Color(0xff29000000), offset: Offset(0.0, 3.0))]),
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
                                              child: ClipRRect(
                                                borderRadius: BorderRadius.only(topLeft: Radius.circular(10), topRight: Radius.circular(10)),
                                                child: Image.asset(
                                                  GImages().getClsImage('${cls[index].image!}'),
                                                  fit: BoxFit.fitWidth,
                                                  cacheWidth: 300,
                                                ),
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
                                            height: ScreenUtil().setHeight(87),
                                            padding: EdgeInsets.symmetric(horizontal: ScreenUtil().setWidth(8)),
                                            decoration: BoxDecoration(
                                              borderRadius: BorderRadius.vertical(bottom: Radius.circular(10)),
                                              color: Colors.white,
                                            ),
                                            child: Column(
                                              mainAxisAlignment: MainAxisAlignment.center,
                                              children: [
                                                Text(
                                                  cls[index].classNm,
                                                  style: TextStyle(fontSize: ScreenUtil().setSp(15), fontWeight: FontWeight.bold),
                                                  textAlign: TextAlign.center,
                                                ),
                                                SizedBox(height: ScreenUtil().setHeight(7)),
                                                Text(
                                                  cls[index].hashtag!,
                                                  style: TextStyle(
                                                    fontSize: ScreenUtil().setSp(12),
                                                    color: Color(0xffA3A3A3),
                                                  ),
                                                  textAlign: TextAlign.center,
                                                ),
                                              ],
                                            ),
                                          )
                                        ],
                                      ),
                                    )));
                      },
                      error: (error, stackTrace) => Row(),
                      loading: () => Row());
                },
              ))
        ],
      ),
    );
  }

  dividerWidget() => Container(
        height: ScreenUtil().setHeight(10),
        color: Color(0xffF5F6FA),
        width: double.infinity,
      );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: SubpageAppBarWidget(
        '',
        actions: [
          TextButton(
              onPressed: () {},
              child: Text(
                'Edit',
                style: TextStyle(color: PRIMARY_COLOR, fontWeight: FontWeight.bold),
              ))
        ],
      ),
      body: CustomScrollView(controller: _scrollController, slivers: [
        SliverList(
          delegate: SliverChildListDelegate(
            [
              Column(
                key: _mainSectionKey,
                children: [
                  _buildImageView(),
                  _buildTitleView(),
                  dividerWidget(),
                ],
              )
            ],
          ),
        ),
        _buildTabView()
      ]),
    );
  }
}
