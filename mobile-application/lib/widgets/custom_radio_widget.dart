import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Class {
  String name;
  bool isSelected;

  Class(this.name, this.isSelected);
}

List<String> classImage = ['assets/images/groupTraining.jpg', 'assets/images/personalTraining.jpg'];

class CustomRadioWidget extends StatelessWidget {
  Class _class;
  int index;

  CustomRadioWidget(this._class, this.index);

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
        side: BorderSide(
          color:  _class.isSelected ? Colors.transparent : Color.fromRGBO(163, 163, 163, 1)
        )
      ),
      color: _class.isSelected ? Color.fromRGBO(235, 240, 255, 1) : Colors.white,
      child: Container(
        height: ScreenUtil().setHeight(225),
        width: ScreenUtil().setWidth(174),
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  padding: EdgeInsets.only(left: 10),
                  child: _class.isSelected 
                  ? Icon(
                    Icons.check_circle,
                    color: Color.fromRGBO(75, 60, 247, 1),
                  )
                  : Icon(
                    Icons.check_circle_outline,
                    color: Color.fromRGBO(163, 163, 163, 1),
                  ),
                )
              ],
            ),
            SizedBox(height: ScreenUtil().setHeight(10),),
            Container(
              height: ScreenUtil().setHeight(113),
              width: ScreenUtil().setWidth(93),
              decoration: BoxDecoration(
                border: Border.all(width: 1, color: Colors.transparent),
                image: DecorationImage(image: AssetImage(classImage[index]))
              ),
            ),
            SizedBox(height: 24),
            Text(
              _class.name,
              style: TextStyle(
                  color: Colors.black, fontWeight: FontWeight.bold, fontSize: ScreenUtil().setSp(18)),
            )
          ],
        ),
      )
    );
  }
}