import 'package:college_project/homepage/homepage.dart';
import 'package:flutter/material.dart' hide BoxDecoration, BoxShadow;
import 'package:flutter_inset_box_shadow/flutter_inset_box_shadow.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SecondPage extends StatefulWidget {
  const SecondPage({Key? key}) : super(key: key);

  @override
  State<SecondPage> createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {
  @override
  void initState() {
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xffE7ECEF),
        body: Column(children: [
          Padding(
            padding: EdgeInsets.symmetric(vertical: 70.h,horizontal: 35.w),
            child: Container(
              decoration: BoxDecoration(
                color: Color(0xffE7ECEF),
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.5),
                    offset: Offset(3, 3),
                    blurRadius: 3,
                    spreadRadius: 1,
                    //  inset: true,
                  ),
                  BoxShadow(
                    color: Colors.white,
                    offset: Offset(-3, -3),
                    blurRadius: 3,
                    spreadRadius: 2,
                    //inset: true
                  ),
                ],
              ),
              child: Stack(
                children: [
                  Container(
                      height: 850.h,
                      child: Image.asset("assets/images/ba.png")),
                  Positioned(
                    top: 350,
                    left: 110,
                    child: Image.asset(
                      "assets/images/namaste.png",
                      scale: 2.3,
                    ),
                  )
                ],
              ),
            ),
          ),

          //  5.verticalSpace,
          // Text("welcome!",
          //  style: TextStyle(
          //    fontSize: 70.h,
          //    fontWeight: FontWeight.bold,
          //    color: Colors.green,
          //  ),),
          20.verticalSpace,
          Text(
            " सुरु  गर्न  तयार  हुनुहुन्छ ?",
            style: TextStyle(
              fontSize: 78.r,
              fontWeight: FontWeight.w200,
              color: Colors.black,
            ),
          ),
          25.verticalSpace,
          InkWell(
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (BuildContext context) => HomePage(),
                ),
              );
            },
            child: Container(
              height: 90.h,
              width: 550.w,
              decoration: BoxDecoration(
                color: Colors.red,
                borderRadius: BorderRadius.circular(6),
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  height: 70.h,
                  width: 500.w,
                  decoration: BoxDecoration(
                    color: Color(0xffE7ECEF),
                    borderRadius: BorderRadius.circular(6),
                  ),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "ल ! सुरु गरौं",
                          style: TextStyle(
                            fontSize: 75.r,
                            fontWeight: FontWeight.bold,
                            color: Colors.red,
                          ),
                        ),
                        20.horizontalSpace,
                        Icon(
                          Icons.arrow_forward_ios,
                          size: 60.r,
                          color: Colors.red,
                        ),
                      ]),
                ),
              ),
            ),
          )
        ]),
      ),
    );
  }
}
