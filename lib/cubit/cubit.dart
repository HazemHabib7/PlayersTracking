import 'dart:convert';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:gallery_saver/gallery_saver.dart';
import 'package:path_provider/path_provider.dart';
import 'package:players_tracking/cubit/states.dart';
import 'package:toast/toast.dart';
import 'package:video_player/video_player.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../my_home_screen.dart';
import '../new_video_screen.dart';
import '../second_video_screen.dart';
import '../setting_screen.dart';
import '../shared/local/cache_helper.dart';
import '../shared/remote/http_helper.dart';
import '../show_loading.dart';
import '../third_video_screen.dart';

class AppCubit extends Cubit<AnalyseAppStates> {
  AppCubit() : super(AnalyseInitialState());

  static AppCubit get(context) => BlocProvider.of(context);


String url1="https://ff67-178-52-121-206.eu.ngrok.io/";


  var currentIndex = 0;
  bool isPlay = true;
  Dio dio = new Dio();
  List<Widget> screens =
  [
    MyHomeScreen(),
    SettingScreen(),
  ];


  List<BottomNavigationBarItem> items =
  [
    BottomNavigationBarItem(
        icon: Icon(Icons.sports_soccer_outlined),
        label: "Home"
    ),
    BottomNavigationBarItem(
        icon: Icon(Icons.settings_outlined),
        label: "More"
    ),

  ];


  void postVideo(File file, String link,context) {

    HttpHelper.post(file, link,context).then((value) {
      print(value);
      Navigator.pop(context);
      Toast.show(
          'Upload Successfully', duration: Toast.lengthLong,
          gravity: Toast.bottom);
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) {
                return SecondVideoScreen();
              }));
      emit(PostVideoSuccessState());
    }).catchError((Error) {
      print(Error.toString());
      Navigator.pop(context);
      Toast.show('Error', duration: Toast.lengthLong,
          gravity: Toast.bottom);
      emit(PostVideoErrorState());
    });
  }
  void postVideo1(File file, String link,context) {

    HttpHelper.post(file, link,context).then((value) {
      print(value);
      Navigator.pop(context);
      Toast.show(
          'Uploaded Successfully', duration: Toast.lengthLong,
          gravity: Toast.bottom);
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) {
                return ThirdVideoScreen();
              }));
      emit(PostVideo1SuccessState());
    }).catchError((Error) {
      print(Error.toString());
      Navigator.pop(context);
      Toast.show('Error', duration: Toast.lengthLong,
          gravity: Toast.bottom);
      emit(PostVideo1ErrorState());
    });
  }
  void postVideo2(File file, String link,context) {

    HttpHelper.post(file, link,context).then((value) {
      print(value);
      Navigator.pop(context);
      Toast.show(
          'Upload Successfully', duration: Toast.lengthLong,
          gravity: Toast.bottom);
      Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context){return NewVideoScreen();}), (route) => false);
      emit(PostVideo2SuccessState());
    }).catchError((Error) {
      print(Error.toString());
      Navigator.pop(context);
      Toast.show('Error', duration: Toast.lengthLong,
          gravity: Toast.bottom);
      emit(PostVideo2ErrorState());
    });
  }



  File? selectedVideo;
  late VideoPlayerController videoPlayerController;
  dynamic video;

  Future<void> addVideo() async {
    video =
    await ImagePicker.platform.pickVideo(source: ImageSource.gallery);
  }

  void addNewVideo() {
    emit(GetVideosLoadingState());
    addVideo().then((value) {
      emit(AddVideoSuccessState());
      if (video != null) {
        selectedVideo = File(video.path);
        videoPlayerController = VideoPlayerController.file(selectedVideo!)
          ..initialize().then((value) {
            videoPlayerController.play();
            emit(GetVideoState());
          });
      }
      // emit(PlayVideoState());
    }).catchError((Error) {
      print(Error.toString());
      emit(AddVideoErrorState());
    });
  }


  bool isMute = false;

  void mute() {
    videoPlayerController.setVolume(isMute?1:0);
    isMute = !isMute;
    emit(MuteVideoState());
  }

  @override
  void dispose() {
    dispose();
    videoPlayerController.dispose();
  }

  int? stateChange(int index) {
    currentIndex = index;
    emit(ChangeBottomNavState());
    return null;
  }


  void isplay() {
    isPlay
        ? videoPlayerController.pause()
        : videoPlayerController.play();
    isPlay = !isPlay;
    emit(PlayVideoState());
  }

  bool isPause = false;

  void pauseVideo() {
    isPause = !isPause;
    videoPlayerController.pause();
    emit(PauseVideoState());
  }

  // bool isNew = false;
  // void deleteToAdd() {
  //   isNew = !isNew;
  //   isDelete = !isDelete;
  //
  //   emit(NewVideoState());
  // }

  Future getVideo(String header, String path) async {
    var response = await http.get(Uri.https(header, path));
    var jsonData = jsonDecode(response.body);
    emit(GetNewVideoState());
  }

  Future<void> downloadVideo(BuildContext context, String _url) async {
    if (_url.isNotEmpty) {
      showLoading(context);
      try {
        var timeKey = new DateTime.now().millisecondsSinceEpoch;
        String fileName = '$timeKey.mp4';
        var dirTosSave = await getApplicationDocumentsDirectory();
        await dio.download(_url, '${dirTosSave.path}/$fileName');
        Navigator.pop(context);
        emit(DownloadVideoSuccessState());
        Toast.show(
            'Download Successfully', duration: Toast.lengthLong,
            gravity: Toast.bottom);
      } catch (e) {
        emit(DownloadVideoErrorState());
        Navigator.pop(context);
        print('$e');
        Toast.show('Error', duration: Toast.lengthLong,
            gravity: Toast.bottom);
      }
    }
  }

  Future save(String url,context) async {
    showLoading(context);
    return await GallerySaver.saveImage(url);
  }
   void save1(String url,context) async{
    save(url,context).then((value) async {
      emit(DownloadImageSuccessState());
      Toast.show(
          'Download Successfully', duration: Toast.lengthLong,
          gravity: Toast.bottom);
      Navigator.pop(context);
      // return await GallerySaver.saveImage(url);

    }).catchError((onError){
      emit(DownloadImageErrorState());
      Navigator.pop(context);
      Toast.show(
          'Download Successfully', duration: Toast.lengthLong,
          gravity: Toast.bottom);

    });
  }
}
