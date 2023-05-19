import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../providers/account/login_provider.dart';
import '../../widgets/toast_widget.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _idController = TextEditingController();
  final TextEditingController _pwController = TextEditingController();

  @override
  void dispose() {
    _idController.dispose();
    _pwController.dispose();
    super.dispose();
  }

  Future login(ref) async {
    var result = await ref.watch(loginNotifyProvider.notifier).login(id: _idController.text, pw: _pwController.text);

    if (result == 'success') {
      moveToHome();
    }

    if (result == 'fail') {
      failLogin();
    }
  }

  moveToHome() {
    showToast('로그인 성공', context);
    Navigator.pushNamedAndRemoveUntil(context, '/home', (route) => false);
  }

  failLogin() {
    showToast('로그인 실패', context);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScopeNode currentFocus = FocusScope.of(context);
        if (!currentFocus.hasPrimaryFocus && currentFocus.focusedChild != null) {
          FocusManager.instance.primaryFocus?.unfocus();
        }
      },
      child: SafeArea(
        child: Scaffold(
          appBar: AppBar(),
          body: Center(
            child: Consumer(
              builder: (BuildContext context, WidgetRef ref, Widget? child) {
                return SizedBox(
                  width: ScreenUtil().setWidth(300),
                  height: ScreenUtil().setHeight(300),
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        TextFormField(
                          controller: _idController,
                          decoration: InputDecoration(hintText: '아이디'),
                        ),
                        TextFormField(
                          controller: _pwController,
                          decoration: InputDecoration(hintText: '비밀번호'),
                        ),
                        SizedBox(height: ScreenUtil().setHeight(30)),
                        ElevatedButton(
                            onPressed: () async {
                              await login(ref);
                            },
                            child: Text('로그인'))
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
