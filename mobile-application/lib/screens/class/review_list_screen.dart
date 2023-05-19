import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../providers/theme_provider.dart';
import '../../widgets/home/subpage_app_bar_widget.dart';
import 'review_detail_screen.dart';

class ReviewListScreen extends StatefulWidget {
  const ReviewListScreen({Key? key}) : super(key: key);

  @override
  State<ReviewListScreen> createState() => _ReviewListScreenState();
}

class _ReviewListScreenState extends State<ReviewListScreen> {
  final GlobalKey _mainSectionKey = GlobalKey();
  final ScrollController _scrollController = ScrollController();
  late TapGestureRecognizer _tapGestureRecognizer;

  List<String> reviewList = ['assets/images/review1.jpg','assets/images/review2.jpg','assets/images/review3.jpg','assets/images/review4.jpg','assets/images/review5.jpg'];

  void initState() {
    super.initState();
    _tapGestureRecognizer = TapGestureRecognizer()..onTap = _handleTap;
  }

  @override
  void dispose() {
    _tapGestureRecognizer.dispose();
    super.dispose();
  }

  void _handleTap() {
    Navigator.push(context, MaterialPageRoute(builder: (context) => (ReviewDetailScreen())));
  }

  _buildSummaryContainer() {
    return Container(
      // height: ScreenUtil().setHeight(110),
      decoration: BoxDecoration( 
        color: Colors.white
      ),
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: ScreenUtil().setWidth(16)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: ScreenUtil().setHeight(30)),
                Text.rich(TextSpan(
                    text: '총 ',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: ScreenUtil().setSp(18)),
                    children: [TextSpan(text: '222건', style: TextStyle(color: PRIMARY_COLOR)), TextSpan(text: '의 후기가 있습니다.')])),
                SizedBox(height: ScreenUtil().setHeight(16)),
                Container(
                  height: ScreenUtil().setHeight(110),
                  width: ScreenUtil().setWidth(358),
                  padding: EdgeInsets.fromLTRB(ScreenUtil().setWidth(20), ScreenUtil().setHeight(14), ScreenUtil().setWidth(16), ScreenUtil().setHeight(13.14)),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Color.fromRGBO(248, 248, 248, 1)
                  ),
                  child: Row(
                    children: [
                      Column(
                        children: [
                          Text(
                            '총 평점',
                            style: TextStyle(fontWeight: FontWeight.bold, fontSize: ScreenUtil().setSp(15), color: Color.fromRGBO(87, 87, 87, 1)),
                          ),
                          Text(
                            '4.8',
                            style: TextStyle(fontWeight: FontWeight.bold, fontSize: ScreenUtil().setSp(32), color: Color.fromRGBO(51, 51, 51, 1)),
                          ),
                          RatingBar.builder(
                            initialRating: 4.5,
                            minRating: 0,
                            direction: Axis.horizontal,
                            allowHalfRating: true,
                            itemCount: 5,
                            unratedColor: Colors.grey[200],
                            // itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
                            itemSize: ScreenUtil().setWidth(15.86),
                            itemBuilder: (context, _) => Icon(
                              Icons.star,
                              color: Colors.amber,
                            ),
                            onRatingUpdate: (rating) {},
                            ignoreGestures: true,
                          ),
                        ],
                      ),
                      SizedBox(width: ScreenUtil().setWidth(20.8)),
                      VerticalDivider(
                        thickness: 1,
                        color: Color.fromRGBO(201, 201, 201, 1),
                      ),
                      SizedBox(width: ScreenUtil().setWidth(16)),
                      Container(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Row(
                              children: [
                                Text(
                                  '5',
                                  style: TextStyle(fontSize: ScreenUtil().setSp(10), color: Color.fromRGBO(163, 163, 163, 1)),
                                ),
                                Icon(
                                  Icons.star,
                                  color: Color.fromRGBO(255, 212, 57, 1),
                                  size: 10,
                                ),
                                Stack(
                                  children: [
                                    Container(
                                      width: ScreenUtil().setWidth(150),
                                      height: ScreenUtil().setHeight(7),
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(5),
                                        color: Color.fromRGBO(230, 230, 230, 1)
                                      ),
                                    ),
                                    Container(
                                      width: ScreenUtil().setWidth(140),
                                      height: ScreenUtil().setHeight(7),
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(5),
                                        color: Color.fromRGBO(255, 212, 57, 1)
                                      ),
                                    ),
                                  ],
                                )
                              ],
                            ),
                            Row(
                              children: [
                                Text(
                                  '4',
                                  style: TextStyle(fontSize: ScreenUtil().setSp(10), color: Color.fromRGBO(163, 163, 163, 1)),
                                ),
                                Icon(
                                  Icons.star,
                                  color: Color.fromRGBO(255, 212, 57, 1),
                                  size: 10,
                                ),
                                Stack(
                                  children: [
                                    Container(
                                      width: ScreenUtil().setWidth(150),
                                      height: ScreenUtil().setHeight(7),
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(5),
                                        color: Color.fromRGBO(230, 230, 230, 1)
                                      ),
                                    ),
                                    Container(
                                      width: ScreenUtil().setWidth(40),
                                      height: ScreenUtil().setHeight(7),
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(5),
                                        color: Color.fromRGBO(255, 212, 57, 1)
                                      ),
                                    ),
                                  ],
                                )
                              ],
                            ),
                            Row(
                              children: [
                                Text(
                                  '3',
                                  style: TextStyle(fontSize: ScreenUtil().setSp(10), color: Color.fromRGBO(163, 163, 163, 1)),
                                ),
                                Icon(
                                  Icons.star,
                                  color: Color.fromRGBO(255, 212, 57, 1),
                                  size: 10,
                                ),
                                Stack(
                                  children: [
                                    Container(
                                      width: ScreenUtil().setWidth(150),
                                      height: ScreenUtil().setHeight(7),
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(5),
                                        color: Color.fromRGBO(230, 230, 230, 1)
                                      ),
                                    ),
                                    Container(
                                      width: ScreenUtil().setWidth(15),
                                      height: ScreenUtil().setHeight(7),
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(5),
                                        color: Color.fromRGBO(255, 212, 57, 1)
                                      ),
                                    ),
                                  ],
                                )
                              ],
                            ),
                            Row(
                              children: [
                                Text(
                                  '2',
                                  style: TextStyle(fontSize: ScreenUtil().setSp(10), color: Color.fromRGBO(163, 163, 163, 1)),
                                ),
                                Icon(
                                  Icons.star,
                                  color: Color.fromRGBO(255, 212, 57, 1),
                                  size: 10,
                                ),
                                Stack(
                                  children: [
                                    Container(
                                      width: ScreenUtil().setWidth(150),
                                      height: ScreenUtil().setHeight(7),
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(5),
                                        color: Color.fromRGBO(230, 230, 230, 1)
                                      ),
                                    ),
                                    Container(
                                      width: ScreenUtil().setWidth(10),
                                      height: ScreenUtil().setHeight(7),
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(5),
                                        color: Color.fromRGBO(255, 212, 57, 1)
                                      ),
                                    ),
                                  ],
                                )
                              ],
                            ),
                            Row(
                              children: [
                                Text(
                                  '1',
                                  style: TextStyle(fontSize: ScreenUtil().setSp(10), color: Color.fromRGBO(163, 163, 163, 1)),
                                ),
                                Icon(
                                  Icons.star,
                                  color: Color.fromRGBO(255, 212, 57, 1),
                                  size: 10,
                                ),
                                Stack(
                                  children: [
                                    Container(
                                      width: ScreenUtil().setWidth(150),
                                      height: ScreenUtil().setHeight(7),
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(5),
                                        color: Color.fromRGBO(230, 230, 230, 1)
                                      ),
                                    ),
                                    Container(
                                      width: ScreenUtil().setWidth(7),
                                      height: ScreenUtil().setHeight(7),
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(5),
                                        color: Color.fromRGBO(255, 212, 57, 1)
                                      ),
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                SizedBox(height: ScreenUtil().setHeight(20)),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: List.generate(4,
                      (index) => Container(
                        margin: EdgeInsets.only(right: ScreenUtil().setWidth(10)),
                        width: ScreenUtil().setWidth(77),
                        child: AspectRatio(
                          aspectRatio: 1,
                          child: Container(
                            color: index == 3 
                              ? Colors.grey
                              : Colors.grey[200],
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                index == 3 ?
                                Text(
                                  '+ 102',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontSize: ScreenUtil().setSp(15),
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white
                                  ),   
                                )
                                :Image.asset(
                                  reviewList[index],
                                  fit: BoxFit.contain,
                                )
                              ],
                            )
                          ),
                        ),
                      )
                    )
                  ),
                ),
                SizedBox(height: ScreenUtil().setHeight(20)),
              ],
            ),
          ),
        ],
      ),
    );
  }

  _buildReviewContainer1(){
    return Container(
      decoration: BoxDecoration( 
        color: Colors.white
      ),
      child: Column(
        children: [
          Container(
            height: ScreenUtil().setHeight(10),
            decoration: BoxDecoration(
              color: Color.fromRGBO(245, 246, 250, 1)
            )
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
                              '양유진',
                              style: TextStyle(fontSize: ScreenUtil().setSp(18), fontWeight: FontWeight.bold),
                            ),
                            SizedBox(width: ScreenUtil().setWidth(10)),
                            Text(
                              '월요직장인반',
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
                  '04. 12. 화',
                  style: TextStyle(fontSize: ScreenUtil().setSp(14), color: Color(0xffA3A3A3)),
                )
              ],
            ),
          ),
          SizedBox(height: ScreenUtil().setHeight(28)),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: ScreenUtil().setWidth(16)),
            child: Text.rich(TextSpan(
                text: '헬스를 본격적으로 시작해보고 싶어서 상담 후 짐썸쌤과 운동을 시작하게 되었습니다!...',
                style: TextStyle(fontSize: ScreenUtil().setSp(13)),
                children: [
                  TextSpan(
                    text: '더보기', style: TextStyle(color: PRIMARY_COLOR),
                    recognizer: _tapGestureRecognizer,
                  )
                ]
              )
            ),
          ),
          SizedBox(height: ScreenUtil().setHeight(22)),
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
                      Text(
                        '좋아요     댓글     공유',
                        style: TextStyle(color: Color.fromRGBO(80, 99, 238, 1)),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Icon(
                        Icons.more_horiz,
                        color: Color.fromRGBO(163, 163, 163, 1),
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
          SizedBox(height: ScreenUtil().setHeight(28)),
          Container(
            height: ScreenUtil().setHeight(10),
            decoration: BoxDecoration(
              color: Color.fromRGBO(245, 246, 250, 1)
            )
          ),
          SizedBox(height: ScreenUtil().setHeight(48)),
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
          SizedBox(height: ScreenUtil().setHeight(22)),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: ScreenUtil().setWidth(16)),
            child: Text.rich(TextSpan(
                text: '기존에 하고 있던 운동 더 잘하고 싶어서 웨이트 하려고 pt등록 했는데, 운동 목적에 맞게 짐썸쌤이 너무 잘 알려주셔서 헬스 시작하고 기존에 하던 운동 그레이드 올랐...',
                style: TextStyle(fontSize: ScreenUtil().setSp(13)),
                children: [
                  TextSpan(
                    text: '더보기', style: TextStyle(color: PRIMARY_COLOR),
                    recognizer: _tapGestureRecognizer,
                  )
                ]
              )
            ),
          ),
          SizedBox(height: ScreenUtil().setHeight(28)),
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
                      Text(
                        '좋아요     댓글     공유',
                        style: TextStyle(color: Color.fromRGBO(80, 99, 238, 1)),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Icon(
                        Icons.more_horiz,
                        color: Color.fromRGBO(163, 163, 163, 1),
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
          SizedBox(height: ScreenUtil().setHeight(28)),
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
          SizedBox(height: ScreenUtil().setHeight(48)),
        ],
      ),
    );
  }

  _buildReviewContainer2(){
    return Container(
      decoration: BoxDecoration( 
        color: Colors.white
      ),
      child: Column(
        children: [
          Container(
            height: ScreenUtil().setHeight(10),
            decoration: BoxDecoration(
              color: Color.fromRGBO(245, 246, 250, 1)
            )
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
                              '서민규',
                              style: TextStyle(fontSize: ScreenUtil().setSp(18), fontWeight: FontWeight.bold),
                            ),
                            SizedBox(width: ScreenUtil().setWidth(10)),
                            Text(
                              '금요직장인반',
                              style: TextStyle(fontSize: ScreenUtil().setSp(14), color: Color(0xff7C7C7C)),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            RatingBar.builder(
                              initialRating: 4.0,
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
                              '4.1',
                              style: TextStyle(fontSize: ScreenUtil().setSp(12), color: Color(0xffA3A3A3)),
                            )
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
                Text(
                  '11. 24. 목',
                  style: TextStyle(fontSize: ScreenUtil().setSp(14), color: Color(0xffA3A3A3)),
                )
              ],
            ),
          ),
          SizedBox(height: ScreenUtil().setHeight(28)),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: ScreenUtil().setWidth(16)),
            child: Text.rich(TextSpan(
                text: '헬스를 처음 시작했는데 친절하게 잘 알려주셔서 재밌고 안전하게 운동을 했습니다!...',
                style: TextStyle(fontSize: ScreenUtil().setSp(13)),
                children: [
                  TextSpan(
                    text: '더보기', style: TextStyle(color: PRIMARY_COLOR),
                    recognizer: _tapGestureRecognizer,
                  )
                ]
              )
            ),
          ),
          SizedBox(height: ScreenUtil().setHeight(22)),
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
                      Text(
                        '좋아요     댓글     공유',
                        style: TextStyle(color: Color.fromRGBO(80, 99, 238, 1)),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Icon(
                        Icons.more_horiz,
                        color: Color.fromRGBO(163, 163, 163, 1),
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
          SizedBox(height: ScreenUtil().setHeight(28)),
          Container(
            height: ScreenUtil().setHeight(10),
            decoration: BoxDecoration(
              color: Color.fromRGBO(245, 246, 250, 1)
            )
          ),
          SizedBox(height: ScreenUtil().setHeight(48)),
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
                              '서연이',
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
          SizedBox(height: ScreenUtil().setHeight(22)),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: ScreenUtil().setWidth(16)),
            child: Text.rich(TextSpan(
                text: '원래 다니던 헬스장을 그만두고 친구의 추천으로 이곳으로 옮기게 되었는데 커리큘럼이 정말 맘에 들고 효과도 좋아서 덕분에 많이 늘은 것 같아요. 정말...',
                style: TextStyle(fontSize: ScreenUtil().setSp(13)),
                children: [
                  TextSpan(
                    text: '더보기', style: TextStyle(color: PRIMARY_COLOR),
                    recognizer: _tapGestureRecognizer,
                  )
                ]
              )
            ),
          ),
          SizedBox(height: ScreenUtil().setHeight(28)),
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
                      Text(
                        '좋아요     댓글     공유',
                        style: TextStyle(color: Color.fromRGBO(80, 99, 238, 1)),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Icon(
                        Icons.more_horiz,
                        color: Color.fromRGBO(163, 163, 163, 1),
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
          SizedBox(height: ScreenUtil().setHeight(28)),
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
                        child: Text('좋은 리뷰 감사합니다. 다 회원님이 잘 따라와주셔서 좋은 효과를 본 것 같습니다. 앞으로도 잘 부탁드립니다!'),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
          SizedBox(height: ScreenUtil().setHeight(48)),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: SubpageAppBarWidget(
        '수강생의 후기',
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
                      _buildSummaryContainer(),
                      _buildReviewContainer1(),
                      _buildReviewContainer2(),
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
