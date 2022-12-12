import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'cubit/cubit.dart';
import 'cubit/states.dart';

class ViewImage extends StatelessWidget {
  const ViewImage({Key? key}) : super(key: key);

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
                    child: Column(children: [
                      SizedBox(
                        height: 10.0,
                      ),
                      Text('The percentage of numerical superiority:',textAlign: TextAlign.center,
                        style: TextStyle(color: Colors.brown, fontSize: 28),),
                      SizedBox(height: 10.0,),
                      Container(
                        child: Column(children: [
                          Image.network(
                              cubit.url1 + "/return_image"),
                          SizedBox(height: 10.0),
                          Container(
                            decoration: BoxDecoration(
                                color: Colors.blue,
                                borderRadius:
                                BorderRadius.circular(15.0)),
                            child: TextButton(
                                onPressed: () async {
                                  String url = cubit.url1 + "/return_image";
                                  cubit.save1(url, context);
                                  // await GallerySaver.saveImage(url);
                                },
                                child: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      const Text(
                                        "Download  ",
                                        style: TextStyle(
                                          color: Colors.white,
                                        ),
                                      ),
                                      Icon(Icons.download_outlined, size: 30,
                                        color: Colors.white,)
                                    ])),
                          ),
                        ]),
                      ),
                    ]),
                  ),
                ),
              );
            }));
  }
}