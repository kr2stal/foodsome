import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../widgets/home/subpage_app_bar_widget.dart';
import 'class_notice_detail.dart';


var classNoticeIndex = StateProvider((_) => 0);

class ClassNoticeMoreScreen extends ConsumerStatefulWidget {
  const ClassNoticeMoreScreen({Key? key}) : super(key: key);

  @override
  ClassNoticeMoreScreenState createState() => ClassNoticeMoreScreenState();
}

class ClassNoticeMoreScreenState extends ConsumerState<ClassNoticeMoreScreen> {
  final GlobalKey _mainSectionKey = GlobalKey();
  final ScrollController _scrollController = ScrollController();
  final TextEditingController searchController = TextEditingController();
  String searchContent = '';

  TextStyle titleTextStyle = TextStyle(fontSize: ScreenUtil().setSp(18), fontWeight: FontWeight.bold);

  List noticeList =[{'content': '[일반] 8월 26일 금요일 개인적인 사정으로 하루만 쉬어가도록하겠습니다', 'date': '08. 16. 화'},
    {'content': '[일반] 5월 12일 부터 19일 까지 체육관 내부 공사로 인해 부득이 하게 휴관을 해야할 것 같습니다. 참고 바랍니다.', 'date': '04. 24. 일'},
    {'content': '[일반] 8월 26일 금요일 개인적인 사정으로 하루만 쉬어가도록하겠습니다', 'date': '08. 16. 화'},
    {'content': '[일반] 5월 12일 부터 19일 까지 체육관 내부 공사로 인해 부득이 하게 휴관을 해야할 것 같습니다. 참고 바랍니다.', 'date': '04. 24. 일'}];

  @override
  void dispose() {
    classNoticeIndex = StateProvider((_) => 0);
    super.dispose();
  }

  dividerWidget() => Container(
        height: ScreenUtil().setHeight(10),
        color: Color(0xffF5F6FA),
        width: double.infinity,
      );

  _buildNoticeSearch() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: ScreenUtil().setWidth(16)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: ScreenUtil().setHeight(12)),
          Container(
            height: ScreenUtil().setHeight(65),
            width: ScreenUtil().setWidth(350),
            child: Card(
              elevation: 0,
              color: Color.fromRGBO(239, 239, 239, 1),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5)
              ),
              child: TextField(
                controller: searchController,
                cursorColor: Colors.grey,
                textAlign: TextAlign.start,
                textInputAction: TextInputAction.done,
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.all(ScreenUtil().setWidth(16)),
                  prefixIcon: Icon(Icons.search_sharp, color: Color.fromRGBO(163, 163, 163, 1)),
                  suffixIcon: IconButton(
                    icon: Icon(Icons.highlight_off_rounded, color: Color.fromRGBO(163, 163, 163, 1)),
                    onPressed: () {
                      searchController.clear();
                    }
                  ),
                  hintText: '검색어를 입력해주세요.',
                  hintStyle: TextStyle(color: Color.fromRGBO(163, 163, 163, 1), fontSize: ScreenUtil().setSp(15)),
                  isDense: true,
                  focusedBorder: InputBorder.none,
                  enabledBorder: InputBorder.none,
                  errorBorder: InputBorder.none,
                  disabledBorder: InputBorder.none,
                ),
              ),
            )
          ),
          SizedBox(height: ScreenUtil().setHeight(20)),
        ],
      ),
    );
  }

  _buildNoticeSection() {
    return InkWell(
      child: Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ...List.generate(
            1,
            (index) => GestureDetector(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.fromLTRB(ScreenUtil().setWidth(16), ScreenUtil().setHeight(27), ScreenUtil().setWidth(16), 0),
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
                        SizedBox(height: ScreenUtil().setHeight(11.98)),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              width: ScreenUtil().setWidth(328),
                              child: Text('[공지] 수업 특성상 커리큘럼이 유연하게 변경될수 있습니다', style: TextStyle(fontSize: ScreenUtil().setSp(15)),
                            overflow: TextOverflow.ellipsis),
                            ),
                            Icon(Icons.arrow_forward_ios_outlined, color: Color.fromRGBO(51, 51, 51, 1), size: ScreenUtil().setSp(11.36),)
                          ],
                        ),
                        SizedBox(height: ScreenUtil().setHeight(5)),
                        Text(
                          '02. 12. 토',
                          style: TextStyle(fontSize: ScreenUtil().setSp(14), color: Color(0xffA3A3A3)),
                        ),
                        SizedBox(height: ScreenUtil().setHeight(32)),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    ),
    onTap: () {
      Navigator.push(context, MaterialPageRoute(builder: (context) => ClassNoticeDetailScreen(-1)));
    },
    );
  }

  _buildNoticeList(){
    return 
          ListView.builder(
            scrollDirection: Axis.vertical,
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemCount: noticeList.length,
            itemBuilder: (_, index) =>
            InkWell(                                     
              child: Container(
                child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: ScreenUtil().setHeight(3),
                    color: Color(0xffF5F6FA),
                    width: double.infinity,
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(ScreenUtil().setWidth(16), ScreenUtil().setHeight(27), ScreenUtil().setWidth(16), 0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: ScreenUtil().setHeight(5)),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              width: ScreenUtil().setWidth(328),
                              child: Text(noticeList[index]['content'], style: TextStyle(fontSize: ScreenUtil().setSp(15),
                              overflow: TextOverflow.ellipsis))
                            ),
                            Icon(Icons.arrow_forward_ios_outlined, color: Color.fromRGBO(51, 51, 51, 1), size: ScreenUtil().setSp(11.36),)
                          ],
                        ),
                        SizedBox(height: ScreenUtil().setHeight(10)),
                        Text(
                          noticeList[index]['date'],
                          style: TextStyle(fontSize: ScreenUtil().setSp(14), color: Color(0xffA3A3A3)),
                        ),
                        SizedBox(height: ScreenUtil().setHeight(32)),
                      ],
                    ),
                  ),
                ],
              ),
              ),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => ClassNoticeDetailScreen(index)));
              },
            )
          );
  }

  @override
  Widget build(BuildContext context) {
    int idx = ref.watch(classNoticeIndex);
    final StateController<int> classNoticeIdx = ref.watch(classNoticeIndex.state);

    return Scaffold(
      appBar: SubpageAppBarWidget(
        '공지사항',
      ),
      body: CustomScrollView(controller: _scrollController, slivers: [
        SliverList(
          delegate: SliverChildListDelegate(
            [
              Column(
                key: _mainSectionKey,
                children: [
                  _buildNoticeSearch(),
                  dividerWidget(),
                  _buildNoticeSection(),
                  _buildNoticeList()
                ],
              )
            ],
          ),
        ),
      ]),
    );
  }
}