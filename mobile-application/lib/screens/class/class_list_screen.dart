import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../providers/class/class_provider.dart';
import '../../providers/theme_provider.dart';
import '../../widgets/class/class_tile_widget.dart';
import '../../widgets/common/common_checkbox_widget.dart';
import '../../widgets/common/common_textfield_widget.dart';
import 'class_detail_screen.dart';

GlobalKey _classTileWidget = GlobalKey();

class ClassListScreen extends StatefulWidget {
  const ClassListScreen({Key? key}) : super(key: key);

  @override
  State<ClassListScreen> createState() => _ClassListScreenState();
}

enum ViewType { proceeding, recruiting, end }

class _ClassListScreenState extends State<ClassListScreen> with TickerProviderStateMixin {
  late TabController _tabController;
  TextEditingController _textController = TextEditingController();
  bool checkP = true, checkG = true;

  @override
  void initState() {
    _tabController = TabController(length: 3, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    _tabController.dispose();
    _textController.dispose();
    super.dispose();
  }

  _buildProceedingView() {
    return _buildTabView(view: ViewType.proceeding);
  }

  _buildRecruitingView() {
    return _buildTabView(view: ViewType.recruiting);
  }

  _buildEndView() {
    return _buildTabView(view: ViewType.end);
  }

  classTypeFilter() {
    return HorizontalCheckboxWidget(datas: const [
      {'key': 'P', 'label': 'P', 'isChecked': true},
      {'key': 'G', 'label': 'G', 'isChecked': true},
    ]);
  }

  getWidgetSize(ref) {
    double widgetSize = 0;
    if (_classTileWidget.currentContext != null) {
      RenderBox temp = _classTileWidget.currentContext?.findRenderObject() as RenderBox;
      widgetSize = temp.size.width;
    }

    return widgetSize;
  }

  _buildListView({view}) {
    return Consumer(
      builder: (context, ref, child) {
        final listData = view == ViewType.proceeding
            ? ref.watch(getClassListProvider)
            : view == ViewType.recruiting
                ? ref.watch(getSiimilarClassListProvider)
                : ref.watch(getEndClassListProvider);
        return listData.when(
          data: (data) {
            var widthSize = getWidgetSize(ref);
            return GridView.builder(
                // physics: NeverScrollableScrollPhysics(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 171 / 235,
                    crossAxisSpacing: ScreenUtil().setWidth(16),
                    mainAxisSpacing: ScreenUtil().setHeight(19)),
                itemCount: data.length,
                itemBuilder: (context, index) {
                  // for get widget size
                  // if (index == 0)
                  //   return Padding(
                  //     padding: EdgeInsets.only(bottom: ScreenUtil().setHeight(16)),
                  //     child: InkWell(
                  //       child: Container(
                  //         // key: view == ViewType.proceeding ? _classTileWidget : null,
                  //         child: ClassTileWidget(
                  //           widthSize: widthSize,
                  //           cls: data[index],
                  //           view: view,
                  //         ),
                  //       ),
                  //       onTap: () {
                  //         Navigator.push(context, MaterialPageRoute(builder: (context) => ClassDetailScreen()));
                  //       },
                  //     ),
                  //   );

                  return Padding(
                    padding: EdgeInsets.only(bottom: ScreenUtil().setHeight(16)),
                    child: InkWell(
                      child: Container(
                        child: ClassTileWidget(
                          widthSize: widthSize,
                          cls: data[index],
                          view: view,
                        ),
                      ),
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => ClassDetailScreen()));
                      },
                    ),
                  );
                });
          },
          error: (Object error, StackTrace? stackTrace) {
            return Container();
          },
          loading: () {
            print('=======loading');

            return GridView.builder(
                // physics: NeverScrollableScrollPhysics(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 171 / 235,
                    crossAxisSpacing: ScreenUtil().setWidth(16),
                    mainAxisSpacing: ScreenUtil().setHeight(19)),
                itemCount: 1,
                itemBuilder: (context, index) {
                  // for get widget size
                  return Padding(
                    padding: EdgeInsets.only(bottom: ScreenUtil().setHeight(16)),
                    child: Container(
                      key: _classTileWidget,
                      color: Colors.transparent,
                    ),
                  );
                });
          },
        );

        // return Container();
      },
    );
  }

  _buildTabView({view}) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: ScreenUtil().setWidth(16)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          SizedBox(height: ScreenUtil().setHeight(16)),
          searchTextfieldWidget(controller: _textController, label: '클래스를 검색해보세요.'),
          SizedBox(height: ScreenUtil().setHeight(10)),
          classTypeFilter(),
          SizedBox(height: ScreenUtil().setHeight(10)),
          Expanded(child: _buildListView(view: view)),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
            decoration: BoxDecoration(border: Border(bottom: BorderSide(color: Color(0xffE5E5E5)))),
            height: ScreenUtil().setHeight(50),
            child: TabBar(
              tabs: const [Text('진행중'), Text('모집중'), Text('완료')],
              indicatorColor: PRIMARY_COLOR,
              labelColor: Color(0xff333333),
              labelStyle: TextStyle(fontWeight: FontWeight.bold, fontFamily: 'NanumSquare', fontSize: ScreenUtil().setSp(18)),
              unselectedLabelStyle: TextStyle(fontSize: ScreenUtil().setSp(18), fontFamily: 'NanumSquare'),
              unselectedLabelColor: Color(0xffA3A3A3),
              controller: _tabController,
            )),
        Expanded(
            child: TabBarView(
          controller: _tabController,
          children: [
            _buildProceedingView(),
            _buildRecruitingView(),
            _buildEndView(),
          ],
        ))
      ],
    );
  }
}
