import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:players_tracking/video_layout.dart';
import 'package:players_tracking/video_screen.dart';
import 'package:players_tracking/view_image.dart';
import 'cubit/cubit.dart';
import 'cubit/states.dart';

class NewVideoScreen extends StatefulWidget {
  @override
  State<NewVideoScreen> createState() => _NewVideoScreenState();
}

class _NewVideoScreenState extends State<NewVideoScreen> {
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
                  leading: IconButton(
                    icon: const Icon(
                      Icons.arrow_back_outlined,
                      color: Colors.white,
                    ),
                    onPressed: () {
                      Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context){return const VideoLayout();}), (route) => false);
                    },
                  ),
                  title: const Text("Result"),
                ),
                body: state != GetVideosLoadingState() ?
                     SingleChildScrollView(
                      physics: const BouncingScrollPhysics(),
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Padding(
                              padding: EdgeInsets.only(left: 10.0),
                              child: Text(
                                '2D Plane: ',
                                style: TextStyle(fontSize: 25.0, color: Colors.red),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 10.0, horizontal: 0.1),
                              child: MaterialButton(
                                child: Stack(
                                  alignment: Alignment.center,
                                  children: [
                                    const Image(
                                      image: AssetImage('images/11.png'),
                                    ),
                                    Icon(
                                      Icons.play_circle_fill_outlined,
                                      size: 120,
                                      color: Colors.grey[400],
                                    ),
                                  ],
                                ),
                                onPressed: () {
                                  Navigator.push(context,
                                      MaterialPageRoute(builder: (context) {
                                    return VideoScreen(
                                      mediaUrl:
                                          cubit.url1+ '/return_video',
                                    );
                                  }));
                                },
                              ),
                            ),
                            const SizedBox(height: 3.0),
                            Padding(
                              padding: const EdgeInsets.only(
                                  left: 25.0, right: 25.0),
                              child: Container(
                                height: 3.0,
                                color: Colors.blueGrey[200],
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
                            const SizedBox(height: 3.0),
                            Padding(
                              padding: const EdgeInsets.only(
                                  left: 25.0, right: 25.0),
                              child: Container(
                                height: 3.0,
                                color: Colors.blueGrey[200],
                              ),
                            ),
                            const Padding(
                              padding: EdgeInsets.only(left: 10.0),
                              child: Text(
                                'The percentage of numerical superiority: ',
                                style: TextStyle(fontSize: 25.0, color: Colors.red),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 15.0, vertical: 5.0),
                              child: GestureDetector(
                                onTap: (){
                                  Navigator.push(context,
                                      MaterialPageRoute(builder: (context) {
                                        return (const ViewImage());
                                      }));
                                },
                                  child:
                                      Image.asset('images/22.png')),
                            ),
                          ]),
                    )
                     : const Center(child: CircularProgressIndicator(color: Colors.green,))
              );
            }));
  }
}