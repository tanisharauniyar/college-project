import 'package:college_project/homepage/homepage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class Startpage extends StatefulWidget {
  const Startpage({Key? key}) : super(key: key);

  @override
  State<Startpage> createState() => _StartpageState();
}

class _StartpageState extends State<Startpage> {
  @override
  void initState() {
    super.initState();
  }

  // @override
  // Widget build(BuildContext context) {
  //   return Scaffold(
  //     body: Center(
  //       child: Padding(
  //         padding: const EdgeInsets.only(top: 140, left: 4, right: 4),
  //         child: Align(
  //           alignment: Alignment.centerRight,
  //           child: SocialMediaRecorder(
  //             // maxRecordTimeInSecond: 5,
  //             startRecording: () {
  //               print("Asdhakdadklasd");
  //
  //               // function called when start recording
  //             },
  //             stopRecording: (_time) {
  //               print("Asdhakdadklasd");
  //               // function called when stop recording, return the recording time
  //             },
  //             sendRequestFunction: (soundFile, _time) async {
  //               print("the current path is ${soundFile.path}");
  //               Directory dir = await getApplicationDocumentsDirectory();
  //               print(dir.path);
  //               final File file = File('${dir.path}/my_file.m4a');
  //             },
  //             encode: AudioEncoderType.AAC,
  //           ),
  //         ),
  //       ),
  //     ),
  //   );
  // }

@override
Widget build(BuildContext context) {
  return SafeArea(
    child: Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child:Stack(
              children: [
                Container(
                    height: 850.h,
                    color: Colors.transparent,
                    child: Image.asset("assets/images/ba.png")
                    ),
                Positioned(
                  top: 350,
                  left: 110,
                  child: Image.asset("assets/images/namaste.png",
                  scale: 2.3,),
                )
              ],
            ),

                // Positioned(
                //     top: 200,
                //     left: -14,
                //     bottom: -90,
                //     right: 20,
                //     //left: 50,
                //     child: Image.asset("assets/images/nepalmap.png",
                //     scale: 1,)),

            ),


         //  5.verticalSpace,
         // Text("welcome!",
         //  style: TextStyle(
         //    fontSize: 70.h,
         //    fontWeight: FontWeight.bold,
         //    color: Colors.green,
         //  ),),
          85.verticalSpace,
          Text(" सुरु गर्न तयार हुनुहुन्छ ?",
          style: TextStyle(
            fontSize: 68.h,
            fontWeight: FontWeight.normal,
            color: Colors.black,
          ),),
          55.verticalSpace,
          InkWell(
            onTap: (){
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (BuildContext context) => HomePage(),
                ),
              );
            },
            child: Container(
              height: 100.h,
              width: 560.w,
              decoration: BoxDecoration(
                color: Colors.red,
                borderRadius: BorderRadius.circular(25),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children:[
                  Text("ल ! सुरु गरौं",
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),),
                  20.horizontalSpace,
                  Icon(Icons.arrow_forward,
                  size: 34,
                  color: Colors.white,),

                ]
              ),

            ),
          )
         ] ),

      ),
    );

}
}
