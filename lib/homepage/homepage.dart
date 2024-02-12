import 'dart:io';
import 'package:avatar_glow/avatar_glow.dart';
import 'package:college_project/homepage/homepage_logic.dart';
import 'package:flutter/material.dart'hide BoxDecoration, BoxShadow;
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_sound/flutter_sound.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:path_provider/path_provider.dart';
import 'package:flutter_inset_box_shadow/flutter_inset_box_shadow.dart';

class HomePage extends ConsumerStatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  ConsumerState<HomePage> createState() => _HomePageState();
}

class _HomePageState extends ConsumerState<HomePage> {
  bool isrecoderReady = false;
  final recorder = FlutterSoundRecorder();

  @override
  void initState() {
    super.initState();
    initrecorder();
  }

  Future initrecorder() async {
    final status = await Permission.microphone.request();
    if (status != PermissionStatus.granted) {
      throw "Microphone permission not granted ";
    }
    await recorder.openRecorder();
    isrecoderReady = true;
  }

  void dispose() {
    recorder.closeRecorder();
    super.dispose();
  }

  String currentFile = "";

  /// sabai recorded audio haru save garya xaum so record garna start garda
  /// 0.001 huna sakxa ani record stop garda 0.05 so tyo error time ma aauxa so euta string banako.
  /// datetime.now() chai date anusar vakhar ko audio haru save garna ho.
  /// .replaceAll le space lai space le,(.) lai(-) le and (:)lai (-)and(-)lai(space)le
  /// replace garya so that error naaos ani dherai files haru time anusar save garera yesto vako.
  /// natra github ma gareko jasto garni

  Future record() async {
    if (!isrecoderReady) return;
    Directory? dir = await getExternalStorageDirectory();
    currentFile =
    '${dir?.path}/${DateTime.now().toString().replaceAll(" ", "").toString().replaceAll(".", "-").toString().replaceAll(":", "-").toString().replaceAll("-", "")}.wav';
    await recorder.startRecorder(toFile: currentFile);
    print("Recording started: $currentFile");
  }

  // Future saveAudioFile(File audioFile) async {
  //   if (!isrecoderReady) return;
  //   try {
  //     List<int> bytes = await audioFile.readAsBytes();
  //     Directory? appDocDirectory = await getExternalStorageDirectory();
  //     print(appDocDirectory?.path);
  //     String filePath = '${appDocDirectory?.path}/DataGrid.xlsx';
  //
  //     await audioFile.writeAsBytes(bytes);
  //
  //     print("Excel file saved to: $filePath");
  //   } catch (error) {
  //     print("Error saving Excel file: $error");
  //   }
  // }

  Future stop() async {
    if (!isrecoderReady) return;
    try {
      final filepath = await recorder.stopRecorder();
      ref.watch(homepageLogic).uploadAudioFile(File(currentFile));
      // print("filepath");
      // print(filepath);
      // print("filepath");
      // if (filepath != null && filepath.isNotEmpty) {
      //   final audioFile = File(filepath);
      //   print("Recording stopped. Recorded audio path: $audioFile");
      //   // await saveAudioFile(audioFile);
      // } else {
      //   print("Error: Recorded audio path is empty or null.");
      // }
    } catch (error) {
      print("Error stopping recorder: $error");
    }
    // final path = await recorder.stopRecorder();
    //   final audioFile= File(path!);
    //    print("Recorded audio path:$audioFile");
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: RefreshIndicator(
        onRefresh: () async {},
        child: Scaffold(
          backgroundColor: Color(0xffE7ECEF),
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerFloat,
          floatingActionButton: Container(
            height: 150,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                AvatarGlow(
                  animate: ref.watch(homepageLogic).islistening,
                  duration: const Duration(milliseconds: 2000),
                  glowColor: Colors.redAccent.withOpacity(0.2),
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
                SizedBox(
                  height: 20,
                ),
                Center(
                  child: Text(
                    !ref.watch(homepageLogic).islistening
                        ? "कृपया! बटन क्लिक गर्नुहोस्.."
                        : "बोल्न सुरु गर्नुहोस्..",
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.black,
                      fontWeight: FontWeight.w600,
                    ),
                    textAlign: TextAlign.justify,
                  ),
                ),
              ],
            ),
          ),
          appBar: AppBar(
            backgroundColor: Color(0xffE7ECEF),
            leading: Padding(
              padding: const EdgeInsets.all(8.0),
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
                       // inset: true,
                      ),
                      BoxShadow(
                          color: Colors.white,
                          offset: Offset(-3, -3),
                          blurRadius: 3,
                          spreadRadius: 2,
                         // inset: true
                      ),
                    ],
                  ),
                child: InkWell(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Icon(
                    Icons.arrow_back_ios,
                    size: 20,
                    color: Colors.black,
                  ),
                ),
              ),
            ),
          ),
          body: Padding(
            padding: EdgeInsets.symmetric(vertical: 20.h, horizontal: 26.h),
            child: Container(
              height: 880.h,
              decoration: BoxDecoration(
                color: Color(0xffE7ECEF),
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                      color: Colors.black.withOpacity(0.5),
                      offset: Offset(3, 3),
                      blurRadius: 3,
                      spreadRadius: 1
                    // inset: true,
                  ),
                  BoxShadow(
                    color: Colors.white,
                    offset: Offset(-3, -3),
                    blurRadius: 3,
                    spreadRadius: 2,
                    // inset: true
                  ),
                ],
              ),
              child: ListView.builder(
                physics: BouncingScrollPhysics(),
                shrinkWrap: true,
                itemCount: ref.watch(homepageLogic).responses.length,
                itemBuilder: (context, index) {
                  return sendVoice(
                   text: (ref.watch(homepageLogic).responses[index]),
                  );
                },
              ),
            ),
          ),
        ),
      ),
    );
  }

  sendVoice({required String text}) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 30.w, vertical: 50.h),
      height: 120.h,
      decoration: BoxDecoration(
        color: Color(0xffE7ECEF),
        borderRadius: BorderRadius.circular(5),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.5),
            offset: Offset(3, 3),
            blurRadius: 3,
            spreadRadius: 1,
            inset: true,
          ),
          BoxShadow(
              color: Colors.white,
              offset: Offset(-3, -3),
              blurRadius: 3,
              spreadRadius: 2,
              inset: true),
        ],
      ),
      child: Center(
        child: Text(
          text,
          style: TextStyle(
            fontSize: 50.r,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
      ),
    );
  }
}
