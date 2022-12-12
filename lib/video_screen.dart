import 'package:better_player/better_player.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'cubit/cubit.dart';
import 'cubit/states.dart';
class VideoScreen extends StatefulWidget {
  final String mediaUrl;
  const VideoScreen({ required this.mediaUrl});
  @override
  State<VideoScreen> createState() => _VideoScreenState();
}

class _VideoScreenState extends State<VideoScreen> {
  late BetterPlayerController _betterPlayerController;
  final GlobalKey _betterPlayerKey = GlobalKey();
  @override
  void initState(){
    BetterPlayerConfiguration betterPlayerConfiguration = const BetterPlayerConfiguration(
      aspectRatio: 16/9,
      fit: BoxFit.contain,
    );
    BetterPlayerDataSource dataSource = BetterPlayerDataSource(
        BetterPlayerDataSourceType.network,
      widget.mediaUrl
    );
    _betterPlayerController = BetterPlayerController(betterPlayerConfiguration);
    _betterPlayerController.setupDataSource(dataSource);
    _betterPlayerController.setBetterPlayerGlobalKey(_betterPlayerKey);
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (BuildContext context) => AppCubit(),
        child: BlocConsumer<AppCubit, AnalyseAppStates>(
        listener: (BuildContext context, AnalyseAppStates state) {},
    builder: (BuildContext context, AnalyseAppStates state) {
    AppCubit cubit = AppCubit.get(context);
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 25.0,right: 25.0),
                child: Container(
                  height: 3.0,
                  color: Colors.blueGrey,
                ),
              ),
              const SizedBox(height: 3.0),
              Padding(
                padding: const EdgeInsets.only(left: 10.0,right: 10.0),
                child: Container(
                  height: 3.0,
                  color: Colors.blueGrey,
                ),
              ),
              const Text("2D Plane",style: TextStyle(fontSize: 25.0,color: Colors.red)),
              const SizedBox(height: 8.0,),
              AspectRatio(aspectRatio: 16/9,
                child: BetterPlayer(key: _betterPlayerKey,controller: _betterPlayerController),
              ),
              const SizedBox(height: 6.0,),
              Padding(
                padding: const EdgeInsets.only(left: 10.0,right: 10.0),
                child: Container(
                  height: 3.0,
                  color: Colors.blueGrey,
                ),
              ),
              const SizedBox(height: 3.0),
              Padding(
                padding: const EdgeInsets.only(left: 25.0,right: 25.0),
                child: Container(
                  height: 3.0,
                  color: Colors.blueGrey,
                ),
              ),

            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.blue,
        onPressed: () {
          cubit.downloadVideo(context,cubit.url1 + '/return_video');
        },
        child: const Icon(Icons.cloud_download),
        tooltip: 'Download',
      ),
    );




    }
        )
    );




  }
}
