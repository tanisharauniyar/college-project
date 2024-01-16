import 'dart:io';
import 'package:avatar_glow/avatar_glow.dart';
import 'package:college_project/homepage/homepage_logic.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_sound/flutter_sound.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:path_provider/path_provider.dart';

class HomePage extends ConsumerStatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  ConsumerState<HomePage> createState() => _HomePageState();
}

class _HomePageState extends ConsumerState<HomePage> {
  bool isrecoderReady = false;

  @override
  void initState() {
    super.initState();
    initrecorder();
  }

  void dispose() {
    recorder.closeRecorder();
    super.dispose();
  }

  final recorder = FlutterSoundRecorder();

  Future record() async {
    if (!isrecoderReady) return;
    Directory appDocDir = await getApplicationDocumentsDirectory();
    String filePath = '${appDocDir.path}/audio.wav';
    await recorder.startRecorder(toFile: filePath);
    print("Recording started: $filePath");
  }

  Future stop() async {
    if (!isrecoderReady) return;
    try {
      final path = await recorder.stopRecorder();
      if (path != null && path.isNotEmpty) {
        final audioFile = File(path);
        print("Recording stopped. Recorded audio path: $audioFile");
      } else {
        print("Error: Recorded audio path is empty or null.");
      }
    } catch (error) {
      print("Error stopping recorder: $error");
    }
    // final path = await recorder.stopRecorder();
    //   final audioFile= File(path!);
    //    print("Recorded audio path:$audioFile");
  }

  Future initrecorder() async {
    final status = await Permission.microphone.request();
    if (status != PermissionStatus.granted) {
      throw "Microphone permission not granted ";
    }
    await recorder.openRecorder();
    isrecoderReady = true;
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: RefreshIndicator(
        onRefresh: () async {},
        child: Scaffold(
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerFloat,
          floatingActionButton: AvatarGlow(
            animate: ref.watch(homepageLogic).islistening,
            duration: const Duration(milliseconds: 2000),
            glowColor: Colors.red.withOpacity(0.2),
            repeat: true,
            child: InkWell(
              onTap: () async {
                if (recorder.isRecording) {
                  await stop();
                } else {
                  await record();
                }
                ref.watch(homepageLogic).lisitening();
              },
              child: CircleAvatar(
                backgroundColor: ref.watch(homepageLogic).islistening
                    ? Colors.red
                    : Colors.black,
                radius: 52,
                child: Icon(
                  ref.watch(homepageLogic).islistening
                      ? Icons.mic
                      : Icons.mic_off_outlined,
                  color: Colors.white,
                  size: 50,
                ),
              ),
            ),
          ),
          appBar: AppBar(
            // backgroundColor: Color(0xffe3e8e7),
            leading: Card(
              elevation: 2,
              child: InkWell(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Icon(
                  Icons.arrow_back_ios,
                  size: 30,
                  color: Colors.black,
                ),
              ),
            ),
            // title: const Center(
            //     child: Text(
            //       " Nepali Speech to Text",
            //       style: TextStyle(
            //         color: Colors.black,
            //         fontSize: 20,
            //         fontWeight: FontWeight.w800,
            //       ),
            //     )),
          ),
          body: Padding(
            padding: EdgeInsets.symmetric(vertical: 36.h, horizontal: 26.h),
            child: Container(
              margin: EdgeInsets.only(bottom: 30.h),
              height: 840.h,
              decoration: BoxDecoration(
                color: const Color(0xffe3e8e7),
                borderRadius: BorderRadius.circular(25),
              ),
              child: const Center(
                child: SingleChildScrollView(
                  child: Text(
                    "बटन होल्ड गर्नुहोस् र बोल्न सुरु गर्नुहोस्..",
                    style: TextStyle(
                      fontSize: 20,
                    ),
                    textAlign: TextAlign.justify,
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
openFiles()async {
  FilePickerResult? resultfile = await FilePicker.platform.pickFiles();
  if (resultfile != null) {
    PlatformFile file = resultfile.files.first;
    print(file.bytes);
    print(file.name);
    print(file.path);
  }else
    print('error');

}

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Center(
//         child: Padding(
//           padding: const EdgeInsets.only(top: 140, left: 4, right: 4),
//           child: Align(
//             alignment: Alignment.centerRight,
//             child: SocialMediaRecorder(
//               // maxRecordTimeInSecond: 5,
//               startRecording: () {
//                 print("Asdhakdadklasd");
//
//                 // function called when start recording
//               },
//               stopRecording: (_time) {
//                 print("Asdhakdadklasd");
//                 // function called when stop recording, return the recording time
//               },
//               sendRequestFunction: (soundFile, _time) async {
//                 print("the current path is ${soundFile.path}");
//                 Directory dir = await getApplicationDocumentsDirectory();
//                 print(dir.path);
//                 final File file = File('${dir.path}/my_file.m4a');
//               },
//               encode: AudioEncoderType.AAC,
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
