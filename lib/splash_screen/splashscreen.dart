import 'package:college_project/second_page/secondpage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  void initState() {
    Future.delayed(const Duration(seconds: 5)).then((value) {
      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(
          builder: (context) => SecondPage(),
        ),
        (Route<dynamic> route) => false,
      );
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xffE7ECEF),
         body:BuildContainer(),
        ),

    );
  }

  BuildContainer() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(vertical: 117),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Center(
                  child: Image.asset("assets/images/mic-removebg-preview.png",
                  scale:5.sp,),
                ),
              ),
              30.verticalSpace,
              Text(" नेपाली अडियो टू टेक्स्ट 🎤 ",
              style: TextStyle(
                fontSize: 50.h,
                fontWeight: FontWeight.bold,
                color: Colors.black
              ),),
              // 300.verticalSpace,
              // Image.asset( "assets/images/flag.jpg",
              // scale: 1.sp,),
            ],

          ),
        ),
        //420.verticalSpace,
        // Container(
        //   height: 420.h,
        //   width: double.infinity,
        //   //color: Colors.red,
        //   child: Image.asset( "assets/images/flag.jpg",
        //   scale: 1.spMax,),
        // )
      ],
    );
  }
}
// 300.verticalSpace,
// Image.asset( "assets/images/flag.jpg",
// scale: 1.sp,),
