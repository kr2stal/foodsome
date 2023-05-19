import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

class MypageScreen extends StatefulWidget {
  MypageScreen({super.key}) {
    getMyInfo();
  }
  String? memberNm;

  getMyInfo() {
    Box userBox = Hive.box('USER_INFO');
    memberNm = userBox.get('userName');
  }

  @override
  State<MypageScreen> createState() => _MypageScreenState();
}

class _MypageScreenState extends State<MypageScreen> {
  bool selected = false;
  double _height = 100, _widte = 100;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: Column(children: <Widget>[
      ...List.generate(
          5,
          (index) => Container(
              margin: EdgeInsets.all(3),
              height: 50,
              width: double.infinity,
              color: Colors.teal[100 * (index % 9 + 1)],
              child: Text(index.toString()))),
      SizedBox(height: 10),
      SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: List.generate(
                10,
                (index) => GestureDetector(
                      child: Container(
                        padding: const EdgeInsets.all(8.0),
                        margin: const EdgeInsets.all(8.0),
                        child: AnimatedSize(
                          duration: const Duration(milliseconds: 1000),
                          curve: Curves.fastOutSlowIn,
                          child: Container(
                              // margin: EdgeInsets.all(10),
                              height: _height,
                              width: _widte,
                              color: Colors.teal[100 * (index % 5 + 1)],
                              child: Text(index.toString())),
                        ),
                      ),
                    )),
          )),
      GestureDetector(
        onTap: () {
          setState(() {
            selected = !selected;
          });
        },
        child: Container(
          padding: const EdgeInsets.all(8.0),
          margin: const EdgeInsets.all(8.0),
          child: AnimatedSize(
            duration: const Duration(milliseconds: 1000),
            // reverseDuration: const Duration(milliseconds: 1000),
            curve: Curves.fastOutSlowIn,
            child: Container(
                // margin: EdgeInsets.all(10),
                height: _height,
                width: selected ? double.infinity : 100,
                color: Colors.teal,
                child: Center(child: Text(widget.memberNm!))),
          ),
        ),
      ),
      SizedBox(height: 10),
      ...List.generate(
          10,
          (index) => Container(
              margin: EdgeInsets.all(3),
              height: 50,
              width: double.infinity,
              color: Colors.teal[100 * (index % 9 + 1)],
              child: Text(index.toString()))),
    ]));
  }
}
