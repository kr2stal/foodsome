import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gymsome/services/interceptor.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'logger.dart';
import 'screens/routes.dart';

void main() async {
  await Hive.initFlutter();
  await Hive.openBox<dynamic>('USER_INFO');

  runApp(
    ProviderScope(
      observers: [Logger()],
      child: App(),
    ),
  );
}

class App extends ConsumerWidget {
  const App({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // 세로 위아래 방향 고정
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);

    return ScreenUtilInit(
      designSize: Size(390, 844),
      builder: (BuildContext context, Widget? child) => MaterialApp(
        navigatorKey: ExpiredTokenRetryPolicy.navigatorKey,
        title: 'Flutter boilerplate',
        routes: Routes.routes,
        initialRoute: '/splash',
        onUnknownRoute: (RouteSettings settings) {
          return MaterialPageRoute(
            builder: (BuildContext context) => UnknownScreen(),
          );
        },
        theme: ThemeData(
            primarySwatch: Colors.blue,
            fontFamily: 'NanumSquare',
            scaffoldBackgroundColor: Colors.white,
            backgroundColor: Colors.white,
            textTheme: TextTheme(bodyText1: TextStyle(color: Color(0xff333333)), bodyText2: TextStyle(color: Color(0xff333333))),
            appBarTheme: AppBarTheme(
                backgroundColor: Colors.white,
                systemOverlayStyle: SystemUiOverlayStyle(
                  statusBarColor: Colors.white,
                  statusBarBrightness: Brightness.dark,
                  statusBarIconBrightness: Brightness.dark,
                ))),
        builder: (context, widget) {
          // ScreenUtil.registerToBuild(context);
          // ScreenUtil.setContext(context);
          return MediaQuery(data: MediaQuery.of(context), child: widget!);
        },
        // ignore: prefer_const_literals_to_create_immutables
        supportedLocales: [
          // const Locale('en', 'US'),
          const Locale('ko', 'KR'),
        ],
        // ignore: prefer_const_literals_to_create_immutables
        localizationsDelegates: [
          // A class which loads the translations from JSON files
          // AppLocalizations.delegate,
          // Built-in localization of basic text for Material widgets
          GlobalMaterialLocalizations.delegate,
          // Built-in localization for text direction LTR/RTL
          GlobalWidgetsLocalizations.delegate,
          // Built-in localization of basic text for Cupertino widgets
          GlobalCupertinoLocalizations.delegate,
        ],
        debugShowCheckedModeBanner: false,
        // home: const TrainerHomeScreen(),
      ),
    );
  }
}

class UnknownScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Page Not Found!'),
      ),
      body: Center(
        child: Text('You seem to have been list'),
      ),
    );
  }
}

// Riverpod 사용을 위한 기본 개념
// 
// #===========provider 종류===========#
// StateProvider: read-only. 그러나 값을 바꿀 수 있다. ref.read(state provider.state).변수 = 값
// StateNotifierProvider: immutability 불변성. 사용법은 1.StateNotifier class 만듦 2.StateNotifierProvider 만듦 3.ref.watch(프로바이더)를 빌드 안에 둔다(값이 바뀌면 알아차리는 용도. 트리거) 4.사용 ref.read(프로바이더.notifier).함수()
// ChangeNotifierProvider: 값이 바뀌면 알아차리고 작동. 사용법은 1.ChangeNotifier class 만듦 2.ChangeNotifierProvider 만듦 3.사용 ref.watch(프로바이더) 를 빌드 안에 두고(값이 바뀌면 알라차리는 용도. 트리거), 사용은 ref.read
// FutuerProvider & StreamProvider: 비동기 데이터가 바뀌면 알아차리고 작동. 사용법은 1.빌드 안에 ref.watch(프로바이더)를 둔다(값이 바뀌면 알아차리는 용도. 트리거) 2.when으로 값이 바뀔 때마다 처리하는 로직 설정
//
//
// #===========read(), watch(), listen()===========#
// ref.read() : 프로바이더 읽음. rebuild 트리거는 아님. onpress 콜백함수나 initState 등 lifecycle 안에서 사용. build 안에서는 사용하지 않는 것을 권장
// ref.watch() : 프로바이더 읽음. rebuild 트리거임. 값이 바뀌면 rebuild됨. 그러므로 initState()나 setState()같은 life cycle method안에서 사용하면 안 됨. = 비종기처리에 호출 금지
// ref.listen() : 프로바이더 읽음. rebuild 트리거 아님. 값이 바뀌면 함수 call함. 비동기처리에 호출 금지
//
// read()는 callback handler로,
// watch()는 build()안에서 트리거로,
// listen()은 dialog나, toast, navigator 부를때 
//
//
// #===========.autoDispose(), .family()===========#
//
//
//#===========쓰면 좋을 것===========#
//select
//예:  String name = ref.watch(userProvider.select((user) => user.name));





// Hive 사용을 위한 가이드
//
// #===========순서===========#
// 1. box 생성 => 2. box에 데이터 넣기 => 3. 데이터 가져오기
//
//
// #===========상세===========#
// 1. box 생성: main 에서  await Hive.initFlutter(); await Hive.openBox<Type>('box이름. 아무거나.'); => 데이터는 key-value 형식으로 저장되고, 여기서 Type은 value의 Type이다. 보통 String.
// 2. box에 데이터 넣기: await Hive.box<Type>('box이름').put('키', 벨류);
// 3. 데이터 가져오기: Hive.box<Type>('box이름').get('키');