import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Widget searchTextfieldWidget({required TextEditingController controller, required String label}) => TextFormField(
    textAlign: TextAlign.start,
    maxLength: 40,
    maxLines: 1,
    autocorrect: false,
    controller: controller,
    keyboardType: TextInputType.text,
    decoration: InputDecoration(
      isDense: true,
      filled: true,
      fillColor: Color(0xffEFEFEF),
      focusColor: Colors.white,
      border: OutlineInputBorder(borderRadius: BorderRadius.circular(5), borderSide: BorderSide(color: Color(0xffEFEFEF), width: 1)),
      focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(5), borderSide: BorderSide(color: Color(0xffEFEFEF), width: 1)),
      enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(5), borderSide: BorderSide(color: Color(0xffEFEFEF), width: 1)),
      counterText: '',
      hintText: label,
      hintStyle: TextStyle(color: Color(0xffA3A3A3), fontSize: ScreenUtil().setSp(15)),
      prefixIcon: Container(
        constraints: BoxConstraints(),
        child: Icon(
          Icons.search,
          color: Color(0xffA3A3A3),
        ),
      ),
      suffixIcon: GestureDetector(
        child: Icon(
          Icons.cancel_outlined,
          color: Color(0xffA3A3A3),
        ),
        onTap: () {
          controller.clear();
        },
      ),
    ));

Widget messageTextfieldWidget({required TextEditingController controller, required String label}) => TextFormField(
    textAlign: TextAlign.start,
    maxLength: 40,
    maxLines: 1,
    autocorrect: false,
    controller: controller,
    keyboardType: TextInputType.text,
    decoration: InputDecoration(
      isDense: true,
      filled: true,
      fillColor: Color(0xffEFEFEF),
      focusColor: Colors.white,
      border: OutlineInputBorder(borderRadius: BorderRadius.circular(5), borderSide: BorderSide(color: Color(0xffEFEFEF), width: 1)),
      focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(5), borderSide: BorderSide(color: Color(0xffEFEFEF), width: 1)),
      enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(5), borderSide: BorderSide(color: Color(0xffEFEFEF), width: 1)),
      counterText: '',
      hintText: label,
      hintStyle: TextStyle(color: Color(0xffA3A3A3), fontSize: ScreenUtil().setSp(15)),
    ));
