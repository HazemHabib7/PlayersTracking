import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'cubit/cubit.dart';
import 'cubit/states.dart';

class VideoLayout extends StatelessWidget {
  const VideoLayout({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return  BlocProvider(
        create: (BuildContext context) => AppCubit(),
        child: BlocConsumer<AppCubit, AnalyseAppStates>(
        listener: (BuildContext context, AnalyseAppStates state) {},
    builder: (BuildContext context, AnalyseAppStates state) {
    AppCubit cubit = AppCubit.get(context);

    return Scaffold(
      body: cubit.screens[cubit.currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: cubit.currentIndex,
        onTap: (index) => cubit.stateChange(index),
        items: cubit.items,
      ),
    );
    }));



  }
}
