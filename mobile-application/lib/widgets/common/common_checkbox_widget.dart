import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../providers/theme_provider.dart';

///
/// data: [{'label': '', 'key': '', 'isChecked': true }]
///
class HorizontalCheckboxWidget extends StatefulWidget {
  const HorizontalCheckboxWidget({this.color, required this.datas});
  final Color? color;
  final List datas;

  @override
  State<HorizontalCheckboxWidget> createState() => _HorizontalCheckboxWidgetState();
}

class _HorizontalCheckboxWidgetState extends State<HorizontalCheckboxWidget> {
  late Color? color;
  late List datas;
  int count = 0;

  @override
  void initState() {
    color = widget.color ?? PRIMARY_COLOR;
    datas = widget.datas;
    super.initState();
  }

  buildCheck(data) {
    return Row(
      children: [
        Checkbox(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(3),
          ),
          value: data['isChecked'],
          // splashRadius: 10,
          visualDensity: VisualDensity.compact,
          fillColor: MaterialStateProperty.all(color),
          onChanged: (bool? newValue) {
            setState(() {
              datas = datas.map((org) => org['key'] == data['key'] ? {...data, 'isChecked': newValue} : org).toList();
            });
          },
        ),
        Text(
          data['label'],
          style: TextStyle(fontWeight: FontWeight.bold, color: color, fontSize: ScreenUtil().setSp(20)),
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Row(mainAxisSize: MainAxisSize.min, children: List.generate(datas.length, (index) => buildCheck(datas[index])));
  }
}
