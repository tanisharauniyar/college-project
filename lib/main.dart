import 'package:college_project/homepage/homepage.dart';
import 'package:college_project/second_page/secondpage.dart';
import 'package:college_project/splash_screen/splashscreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(1080, 1360),
      builder: (_, context)
      {
        return ProviderScope(
            child: MaterialApp(
            debugShowCheckedModeBanner:false,
          title: 'ASR',
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
            useMaterial3: true,
            visualDensity: VisualDensity.adaptivePlatformDensity,
          ),
          //home: HomePage(),
              home: HomePage (),
        ),
      );}
    );
  }
}



