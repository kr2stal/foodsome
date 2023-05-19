import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../providers/theme_provider.dart';
import '../../widgets/home/subpage_app_bar_widget.dart';

class ReviewDetailScreen extends StatefulWidget {
  const ReviewDetailScreen({Key? key}) : super(key: key);

  @override
  State<ReviewDetailScreen> createState() => _ReviewDetailScreenState();
}

class _ReviewDetailScreenState extends State<ReviewDetailScreen> {
  final GlobalKey _mainSectionKey = GlobalKey();
  final ScrollController _scrollController = ScrollController();
  final TextEditingController _replyController = TextEditingController();
  late TapGestureRecognizer _tapGestureRecognizer;
  bool? isKeyboard = false;
  List replyList = [];
  int replyIndex = 0;
  FocusNode? myFocusNode;

  List<String> reviewList = ['assets/images/review1.jpg','assets/images/review2.jpg','assets/images/review3.jpg','assets/images/review4.jpg','assets/images/review5.jpg'];

  void initState() {
    myFocusNode = FocusNode();
    _tapGestureRecognizer = TapGestureRecognizer()..onTap = _handleTap;
    super.initState();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    _replyController.dispose();
    _tapGestureRecognizer.dispose();
    super.dispose();
  }

  void _handleTap()async {
    setState(() {
      isKeyboard = true;
    });

    Future.delayed(Duration(milliseconds: 100), () {FocusScope.of(context).requestFocus(myFocusNode);});
  }

  _buildReviewContainer(){
    return Container(
      decoration: BoxDecoration( 
        color: Colors.white
      ),
      child: Column(
        children: [
          SizedBox(height: ScreenUtil().setHeight(30)),
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
                              initialRating: 4.5,
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
                              '4.8',
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
          SizedBox(height: ScreenUtil().setHeight(15)),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: ScreenUtil().setWidth(5)),
              child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                  children: List.generate(
                      5,
                      (index) => Container(
                            margin: EdgeInsets.only(left: ScreenUtil().setWidth(10)),
                            width: ScreenUtil().setWidth(86),
                            child: AspectRatio(
                              aspectRatio: 1,
                              child: Container(
                                child: Image.asset(
                                  reviewList[index],
                                  fit: BoxFit.contain,
                                )
                              ),
                            ),
                          ))),
            ),
          ),
          SizedBox(height: ScreenUtil().setHeight(18)),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: ScreenUtil().setWidth(16)),
            child: Text('헬스를 본격적으로 시작해보고 싶어서 상담 후 짐썸쌤과 운동을 시작하게 되었습니다! 어디가 문제인지 어떤 운동을 해야하는지 체계적으로 잘 알려주셔서 운동하는 즐거움도 함께 배웠어요. 감사합니다.'),
          ),
          SizedBox(height: ScreenUtil().setHeight(16)),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: ScreenUtil().setWidth(16)),
            child: Container(
              height: ScreenUtil().setHeight(48),
              width: ScreenUtil().setWidth(358),
              padding: EdgeInsets.fromLTRB(ScreenUtil().setWidth(20), ScreenUtil().setHeight(14), ScreenUtil().setWidth(16), ScreenUtil().setHeight(13.14)),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Color.fromRGBO(248, 248, 248, 1),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text.rich(
                        TextSpan(
                          children: [
                            TextSpan(
                              text: '좋아요     ', style: TextStyle(color: PRIMARY_COLOR),
                            ),
                            TextSpan(
                              text: '     댓글     ', style: TextStyle(color: PRIMARY_COLOR),
                              recognizer: _tapGestureRecognizer,
                            ),
                            TextSpan(
                              text: '     공유     ', style: TextStyle(color: PRIMARY_COLOR),
                            )
                          ]
                        )
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      GestureDetector(
                        child: Icon(
                          Icons.more_horiz,
                          color: Color.fromRGBO(163, 163, 163, 1),
                        ),
                        onTap: () {
                          showCupertinoModalPopup(
                          context: context, 
                          builder: (BuildContext context) => Container(
                            height: ScreenUtil().setHeight(212),
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
                                              child: Text('리뷰 신고하기', style: TextStyle(fontSize: ScreenUtil().setSp(14), color: Color.fromRGBO(51, 51, 51, 1))),
                                              onPressed: () {
                                                Navigator.pop(context, '');
                                              },
                                            ),
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
                    ],
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: ScreenUtil().setHeight(20)),
        ],
      ),
    );
  }

  _buildReplyWrite() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: ScreenUtil().setWidth(16)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: ScreenUtil().setHeight(50)),
          Container(
            height: ScreenUtil().setHeight(5),
            decoration: BoxDecoration(
              color: Color.fromRGBO(245, 246, 250, 1)
            )
          ),
          SizedBox(height: ScreenUtil().setHeight(12)),
          Container(
            height: ScreenUtil().setHeight(50),
            width: ScreenUtil().setWidth(350),
            child: Card(
              elevation: 0,
              color: Color.fromRGBO(239, 239, 239, 1),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5)
              ),
              child: TextField(
                focusNode: myFocusNode,
                controller: _replyController,
                cursorColor: Colors.grey,
                textAlign: TextAlign.start,
                textInputAction: TextInputAction.done,
                onChanged: (value) {
                  value = _replyController.text;
                },
                onSubmitted: (value) {
                  if(_replyController.text.trim() != '')
                  setState(() {
                    _replyController.text = value;
                    replyList.add(_replyController.text);
                    replyIndex++;
                    _replyController.clear();
                    isKeyboard = false;
                  });
                  else{

                  }
                },
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.all(ScreenUtil().setWidth(16)),
                  hintText: '댓글 달기',
                  hintStyle: TextStyle(color: Color.fromRGBO(163, 163, 163, 1), fontSize: ScreenUtil().setSp(13)),
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

  _buildReplyContainer(int i) {
    return Container(
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: ScreenUtil().setWidth(22)),
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
                  padding: EdgeInsets.only(
                    top: ScreenUtil().setHeight(16),
                    bottom: ScreenUtil().setHeight(20),
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
                    crossAxisAlignment: CrossAxisAlignment.start,
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
                        child: Text(replyList[i]),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
          SizedBox(height: ScreenUtil().setHeight(16)),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: SubpageAppBarWidget(
        '리뷰상세',
      ),
      body: Container(
        child: CustomScrollView(
          controller: _scrollController, 
          slivers: [
            SliverList(
              delegate: SliverChildListDelegate(
                [
                  Column(
                    key: _mainSectionKey,
                    children: [
                      _buildReviewContainer(),
                      if(isKeyboard == true)
                      _buildReplyWrite(),
                      if(replyList.length != 0)
                      for(int i = 0; i < replyList.length; i++)
                      _buildReplyContainer(i),
                    ],
                  )
                ],
              ),
            ),
          ]
        ),
      )
    );
  }
}
