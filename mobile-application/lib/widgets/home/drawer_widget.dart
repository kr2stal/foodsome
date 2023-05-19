import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive_flutter/hive_flutter.dart';

import '../../constants/icons.dart';
import '../../constants/images.dart';
import '../../providers/theme_provider.dart';
import '../../screens/class/class_create_screen.dart';
import '../../screens/class/profile/trainer_profile_setting.dart';
import '../../utils.dart';

class DrawerWidget extends StatelessWidget {
  DrawerWidget({Key? key}) : super(key: key);
  final Box userBox = Hive.box('USER_INFO');

  List socialList = [];
  List hashTagList = [];
  List localList = [];
  List introList = [];

  _showAlertDialog(BuildContext context) {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            backgroundColor: Color.fromRGBO(245, 246, 250, 1),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            title: Padding(
              padding: EdgeInsets.symmetric(horizontal: ScreenUtil().setWidth(16)),
              child: Text(
                '프로필이 없어요...\n생성하러가볼까요?',
                style: TextStyle(fontSize: ScreenUtil().setSp(18), fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
            ),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  height: ScreenUtil().setHeight(118),
                  width: ScreenUtil().setWidth(268),
                  decoration: BoxDecoration(image: DecorationImage(image: AssetImage('assets/images/cls10.jpg'))),
                ),
                SizedBox(height: ScreenUtil().setHeight(22)),
                Container(
                  width: ScreenUtil().setWidth(268),
                  height: ScreenUtil().setHeight(40),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: Color.fromARGB(255, 75, 60, 247),
                    ),
                    child: TextButton(
                        onPressed: () {
                          Navigator.pop(context);
                          Navigator.push(
                              context, MaterialPageRoute(builder: (context) => TrainerProfileSettingScreen(socialList, hashTagList, localList, introList)));
                        },
                        child: Text('지금 당장', style: TextStyle(fontSize: ScreenUtil().setSp(16), color: Colors.white, fontWeight: FontWeight.bold))),
                  ),
                ),
                SizedBox(height: ScreenUtil().setHeight(10)),
                Container(
                  width: ScreenUtil().setWidth(268),
                  height: ScreenUtil().setHeight(40),
                  child: Container(
                    decoration: BoxDecoration(color: Color.fromRGBO(229, 229, 229, 1), borderRadius: BorderRadius.circular(5)),
                    child: TextButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: Text('다음에...', style: TextStyle(fontSize: ScreenUtil().setSp(16), fontWeight: FontWeight.bold, color: Colors.black))),
                  ),
                ),
              ],
            ),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Drawer(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: ScreenUtil().setWidth(16)),
            child: ListView(
              children: [
                SizedBox(height: ScreenUtil().setHeight(10)),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Align(
                      alignment: Alignment.centerLeft,
                      child: GestureDetector(
                        child: Icon(
                          Icons.close_rounded,
                          color: PRIMARY_COLOR,
                          size: ScreenUtil().setWidth(30),
                        ),
                        onTap: () => Navigator.pop(context),
                      ),
                      //  Container(
                      //   padding: EdgeInsets.zero, // 패딩 설정

                      //   child: IconButton(
                      //     padding: EdgeInsets.zero, // 패딩 설정
                      //     constraints: BoxConstraints(), // constraints
                      //     onPressed: () {},
                      //     icon: Icon(
                      //       Icons.close_rounded,
                      //       color: PRIMARY_COLOR,
                      //       size: ScreenUtil().setWidth(30),
                      //     ),
                      //   ),
                      // ),
                    ),
                    GestureDetector(
                        child: Padding(
                          padding: EdgeInsets.symmetric(vertical: ScreenUtil().setHeight(15)),
                          child: Icon(
                            Icons.manage_accounts_outlined,
                            color: PRIMARY_COLOR,
                            size: ScreenUtil().setWidth(30),
                          ),
                        ),
                        onTap: () => _showAlertDialog(context)),
                  ],
                ),
                SizedBox(height: ScreenUtil().setHeight(28)),

                // 프로필
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  // crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: ScreenUtil().setHeight(60),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            '김짐썸',
                            style: TextStyle(fontSize: ScreenUtil().setSp(25), fontWeight: FontWeight.bold),
                          ),
                          Text(
                            '트레이너',
                            style: TextStyle(fontSize: ScreenUtil().setSp(15), color: Color(0xffA3A3A3)),
                          )
                        ],
                      ),
                    ),
                    //profile
                    SizedBox(
                      height: ScreenUtil().setHeight(60),
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
                      ),
                    ),
                  ],
                ),
                SizedBox(height: ScreenUtil().setHeight(26)),
                // 카운트
                Row(
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          '10',
                          style: TextStyle(fontSize: ScreenUtil().setSp(25), fontWeight: FontWeight.bold, color: PRIMARY_COLOR),
                        ),
                        Text(
                          '클래스',
                          style: TextStyle(fontSize: ScreenUtil().setSp(15), color: Color(0xffA3A3A3)),
                        )
                      ],
                    ),
                    SizedBox(width: ScreenUtil().setWidth(107)),
                    Column(
                      children: [
                        Text(
                          '32',
                          style: TextStyle(fontSize: ScreenUtil().setSp(25), fontWeight: FontWeight.bold, color: PRIMARY_COLOR),
                        ),
                        Text(
                          '회원',
                          style: TextStyle(fontSize: ScreenUtil().setSp(15), color: Color(0xffA3A3A3)),
                        )
                      ],
                    )
                  ],
                ),
                SizedBox(height: ScreenUtil().setHeight(32)),

                Divider(thickness: 1, color: Color(0xffC9C9C9)),
                SizedBox(height: ScreenUtil().setHeight(30)),

                InkWell(
                    child: Row(
                      children: [
                        SizedBox(
                          width: ScreenUtil().setWidth(26),
                          child: Image.asset(
                            GIcons.PERSON_S,
                            fit: BoxFit.fitWidth,
                            cacheWidth: 100,
                          ),
                        ),
                        SizedBox(width: ScreenUtil().setWidth(12)),
                        Text(
                          '클래스 만들기',
                          style: TextStyle(fontSize: ScreenUtil().setSp(15), fontWeight: FontWeight.bold, color: Color(0xff333333)),
                        )
                      ],
                    ),
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => ClassCreateScreen()));
                    }),

                SizedBox(height: ScreenUtil().setHeight(23)),

                GestureDetector(
                  child: Row(
                    children: [
                      SizedBox(
                        width: ScreenUtil().setWidth(26),
                        child: Image.asset(
                          GIcons.PERSON_S,
                          fit: BoxFit.fitWidth,
                          cacheWidth: 100,
                        ),
                      ),
                      SizedBox(width: ScreenUtil().setWidth(12)),
                      Text(
                        '내 루틴',
                        style: TextStyle(fontSize: ScreenUtil().setSp(15), fontWeight: FontWeight.bold, color: Color(0xff333333)),
                      )
                    ],
                  ),
                  onTap: () => showNoPageToast(context),
                ),

                SizedBox(height: ScreenUtil().setHeight(23)),
                GestureDetector(
                  child: Row(
                    children: [
                      SizedBox(
                        width: ScreenUtil().setWidth(26),
                        child: Image.asset(
                          GIcons.PERSON_S,
                          fit: BoxFit.fitWidth,
                          cacheWidth: 100,
                        ),
                      ),
                      SizedBox(width: ScreenUtil().setWidth(12)),
                      Text(
                        '운동 찾기',
                        style: TextStyle(fontSize: ScreenUtil().setSp(15), fontWeight: FontWeight.bold, color: Color(0xff333333)),
                      )
                    ],
                  ),
                  onTap: () => showNoPageToast(context),
                ),
                SizedBox(height: ScreenUtil().setHeight(32)),

                Divider(thickness: 1, color: Color(0xffC9C9C9)),
                SizedBox(height: ScreenUtil().setHeight(36)),
                GestureDetector(
                  child: Row(
                    children: [
                      SizedBox(
                        width: ScreenUtil().setWidth(26),
                        child: Image.asset(
                          GIcons.PERSON_S,
                          fit: BoxFit.fitWidth,
                          cacheWidth: 100,
                        ),
                      ),
                      SizedBox(width: ScreenUtil().setWidth(12)),
                      Text(
                        '사용 가이드',
                        style: TextStyle(fontSize: ScreenUtil().setSp(15), fontWeight: FontWeight.bold, color: Color(0xff333333)),
                      )
                    ],
                  ),
                  onTap: () => showNoPageToast(context),
                ),

                SizedBox(height: ScreenUtil().setHeight(23)),
                GestureDetector(
                  child: Row(
                    children: [
                      SizedBox(
                        width: ScreenUtil().setWidth(26),
                        child: Image.asset(
                          GIcons.PERSON_S,
                          fit: BoxFit.fitWidth,
                          cacheWidth: 100,
                        ),
                      ),
                      SizedBox(width: ScreenUtil().setWidth(12)),
                      Text(
                        '건의사항 보내기',
                        style: TextStyle(fontSize: ScreenUtil().setSp(15), fontWeight: FontWeight.bold, color: Color(0xff333333)),
                      )
                    ],
                  ),
                  onTap: () => showNoPageToast(context),
                ),

                SizedBox(height: ScreenUtil().setHeight(23)),
                GestureDetector(
                  child: Row(
                    children: [
                      SizedBox(
                        width: ScreenUtil().setWidth(26),
                        child: Image.asset(
                          GIcons.PERSON_S,
                          fit: BoxFit.fitWidth,
                          cacheWidth: 100,
                        ),
                      ),
                      SizedBox(width: ScreenUtil().setWidth(12)),
                      Text(
                        '이용 약관',
                        style: TextStyle(fontSize: ScreenUtil().setSp(15), fontWeight: FontWeight.bold, color: Color(0xff333333)),
                      )
                    ],
                  ),
                  onTap: () => showNoPageToast(context),
                ),

                SizedBox(height: ScreenUtil().setHeight(23)),
                GestureDetector(
                  child: Row(
                    children: [
                      SizedBox(
                        width: ScreenUtil().setWidth(26),
                        child: Image.asset(
                          GIcons.PERSON_S,
                          fit: BoxFit.fitWidth,
                          cacheWidth: 100,
                        ),
                      ),
                      SizedBox(width: ScreenUtil().setWidth(12)),
                      Text(
                        '로그아웃',
                        style: TextStyle(fontSize: ScreenUtil().setSp(15), fontWeight: FontWeight.bold, color: Color(0xff333333)),
                      )
                    ],
                  ),
                  onTap: () => showNoPageToast(context),
                ),

                // Padding(
                //   padding: const EdgeInsets.all(8.0),
                //   child: ElevatedButton.icon(
                //     onPressed: () async {
                //       await userBox.put('accessToken', '');
                //       await userBox.put('refreshToken', '');
                //       await userBox.put('userName', '');
                //       await userBox.put('userId', '');
                //       await userBox.put('email', '');
                //       await userBox.put('isLoggedIn', false);

                //       Navigator.pushNamedAndRemoveUntil(context, '/login', (route) => false);
                //     },
                //     icon: Icon(Icons.logout_rounded, color: Colors.black),
                //     label: Text('로그아웃'),
                //   ),
                // ),
              ],
            ),
          ),
        ),
        // Positioned(
        //   top: ScreenUtil().setHeight(25),
        //   right: ScreenUtil().setWidth(16),
        //   child: GestureDetector(
        //       child: Padding(
        //         padding: EdgeInsets.symmetric(vertical: ScreenUtil().setHeight(15)),
        //         child: Icon(
        //           Icons.manage_accounts_outlined,
        //           color: PRIMARY_COLOR,
        //           size: ScreenUtil().setWidth(30),
        //         ),
        //       ),
        //       onTap: () => _showAlertDialog(context)),
        // )
      ],
    );
  }
}
