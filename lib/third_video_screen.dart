import 'dart:core';
import 'dart:io';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:video_player/video_player.dart';
import 'package:flutter/material.dart';
import 'cubit/cubit.dart';
import 'cubit/states.dart';

class ThirdVideoScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => AppCubit(),
      child: BlocConsumer<AppCubit, AnalyseAppStates>(
          listener: (BuildContext context, AnalyseAppStates state) {},
          builder: (BuildContext context, AnalyseAppStates state) {
            AppCubit cubit = AppCubit.get(context);

            return Scaffold(
              appBar: AppBar(
                // title: Text("Players Tracking"),
                centerTitle: true,
                backgroundColor: Colors.green,
              ),
              body: Center(
                child: SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        if (cubit.selectedVideo == null)
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: const [
                              Icon(
                                Icons.video_collection_outlined,
                                size: 100,
                                color: Colors.grey,
                              ),
                              Text(
                                "No Videos Yet, Please Select The Right Side Video",
                                style: TextStyle(
                                    color: Colors.grey,
                                    fontWeight: FontWeight.bold),
                              ),
                            ],
                          )
                        else
                          Column(
                            children: [
                              const Text('Right Side',style: TextStyle(color: Colors.brown,fontSize: 28),),
                              Padding(
                                padding: const EdgeInsets.only(
                                    left: 25.0, right: 25.0),
                                child: Container(
                                  height: 3.0,
                                  color: Colors.blueGrey,
                                ),
                              ),
                              const SizedBox(height: 3.0),
                              Padding(
                                padding: const EdgeInsets.only(
                                    left: 10.0, right: 10.0),
                                child: Container(
                                  height: 3.0,
                                  color: Colors.blueGrey,
                                ),
                              ),
                              const SizedBox(height: 15.0),
                              SizedBox(
                                width: MediaQuery.of(context).size.width * 0.95,
                                child: cubit.videoPlayerController.value
                                    .isInitialized
                                    ? AspectRatio(
                                  aspectRatio: cubit.videoPlayerController
                                      .value.aspectRatio,
                                  child: VideoPlayer(
                                      cubit.videoPlayerController),
                                )
                                    : Container(),
                              ),
                              SizedBox(
                                width: MediaQuery.of(context).size.width * 0.95,
                                child: VideoProgressIndicator(
                                    cubit.videoPlayerController,
                                    allowScrubbing: true,
                                    colors: const VideoProgressColors(
                                        playedColor: Colors.green)),
                                height: 18.0,
                              ),
                              const SizedBox(height: 4.0),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Container(
                                    decoration: BoxDecoration(
                                        color: Colors.red,
                                        borderRadius:
                                        BorderRadius.circular(50.0)),
                                    child: IconButton(
                                      onPressed: () async {
                                        Duration? d = await cubit
                                            .videoPlayerController.position;
                                        var d1 = d! - const Duration(seconds: 10);
                                        cubit.videoPlayerController.seekTo(d1);
                                      },
                                      icon: const Text(
                                        "<<",
                                        style: TextStyle(color: Colors.white),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(width: 12.0),
                                  Container(
                                    decoration: BoxDecoration(
                                        color: Colors.red,
                                        borderRadius:
                                        BorderRadius.circular(50.0)),
                                    child: IconButton(
                                      onPressed: () async {
                                        cubit.isplay();
                                      },
                                      icon: Icon(
                                        cubit.videoPlayerController.value
                                            .isPlaying
                                            ? Icons.pause
                                            : Icons.play_arrow,
                                      ),
                                      iconSize: 50.0,
                                      color: Colors.white,
                                    ),
                                  ),
                                  const SizedBox(width: 12.0),
                                  Container(
                                    decoration: BoxDecoration(
                                        color: Colors.red,
                                        borderRadius:
                                        BorderRadius.circular(50.0)),
                                    child: IconButton(
                                        onPressed: () async {
                                          Duration? d = await cubit
                                              .videoPlayerController.position;
                                          var d2 = d! + const Duration(seconds: 10);
                                          cubit.videoPlayerController
                                              .seekTo(d2);
                                        },
                                        icon: const Text(">>",
                                            style: TextStyle(
                                                color: Colors.white))),
                                  ),
                                  const SizedBox(width: 35.0),
                                  ElevatedButton(
                                    onPressed: () async {
                                      cubit.mute();
                                    },
                                    child: cubit.isMute
                                        ? const Icon(Icons.volume_mute)
                                        : const Icon(Icons.volume_up),
                                  ),
                                ],
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Container(
                                  // color: Colors.deepOrange,
                                  decoration: BoxDecoration(
                                      color: Colors.green,
                                      borderRadius:
                                      BorderRadius.circular(15.0)),
                                  child: TextButton(
                                      onPressed: () async {
                                        cubit.videoPlayerController.pause();
                                        final res = cubit.postVideo2(
                                            File(cubit.selectedVideo!.path),
                                            cubit.url1 + "/video_analyse3",
                                            context);
                                      },
                                      child: Row(
                                          mainAxisSize: MainAxisSize.min,
                                          children: const [
                                            Text(
                                              "Analyse  ",
                                              style: TextStyle(
                                                color: Colors.white,
                                              ),
                                            ),
                                            Icon(Icons.analytics_outlined,size: 30,color: Colors.white,)
                                          ])),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(
                                    left: 10.0, right: 10.0),
                                child: Container(
                                  height: 3.0,
                                  color: Colors.blueGrey,
                                ),
                              ),
                              const SizedBox(height: 3.0),
                              Padding(
                                padding: const EdgeInsets.only(
                                    left: 25.0, right: 25.0),
                                child: Container(
                                  height: 3.0,
                                  color: Colors.blueGrey,
                                ),
                              ),
                            ],
                          ),
                      ]
                  ),
                ),
              ),
              floatingActionButton: FloatingActionButton(
                backgroundColor: Colors.green,
                onPressed: () {
                  cubit.addNewVideo();
                  if (cubit.videoPlayerController != null) {
                    cubit.videoPlayerController.pause();
                  }
                },
                tooltip: 'Add New Video',
                child: const Icon(Icons.add),
              ),
            );
          }),
    );
  }
}
