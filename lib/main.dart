import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:players_tracking/shared/styles/themes.dart';
import 'package:players_tracking/video_layout.dart';
import 'bloc_observer.dart';
import 'constants/constants.dart';
import 'cubit/cubit.dart';
import 'cubit/states.dart';
import 'dark_mode_cubit/dark_mode_cubit.dart';
import 'on_boarding_screen.dart';
import 'shared/local/cache_helper.dart';

void main() {
  BlocOverrides.runZoned(
        () async {
      WidgetsFlutterBinding.ensureInitialized();
      await CacheHelper.init();
      isDark = CacheHelper.getData(key: 'isDark');
      Widget widget;
      bool? onBoarding = CacheHelper.getData(key: 'onBoarding');
      if(onBoarding != null)
      {
        widget = VideoLayout();
      } else
      {
        widget = OnBoardingScreen();
      }
      runApp(MyApp(
        isDark: isDark,
        startWidget: widget,
      ));
        },
    blocObserver: MyBlocObserver(),
  );
}

class MyApp extends StatelessWidget {

  bool? isDark;
  Widget startWidget;

   MyApp({
    this.isDark,
    required this.startWidget,
  });

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => AppCubit()),
        BlocProvider(create: (context) => DarkModeCubit()..changeAppMode(fromShared: isDark)),
      ],
      child: BlocConsumer<AppCubit, AnalyseAppStates>(
        listener: (context, state) {},
        builder: (context, state) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            theme:lightTheme,
            darkTheme:darkTheme,

            themeMode:DarkModeCubit.get(context).isDark == true ? ThemeMode.dark:ThemeMode.light,
            home: startWidget,
          );
        },
      ),
    );

  }

}

