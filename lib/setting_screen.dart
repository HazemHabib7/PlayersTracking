import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:players_tracking/shared/please.dart';
import 'package:players_tracking/webview_screen.dart';
import 'cubit/cubit.dart';
import 'cubit/states.dart';
import 'dark_mode_cubit/dark_mode_cubit.dart';
import 'info_screen.dart';

class SettingScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "More Options",
        ),
        leading: Text(""),
        centerTitle: true,
        backgroundColor: Colors.green,
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: 8.0),
            MaterialButton(
                color: Colors.grey[600],
                child: Row(
                  children: [
                    Icon(Icons.brightness_4_outlined,color: Colors.white,),
                    SizedBox(width: 10,),
                    Text("Change appearance mode",style: TextStyle(fontSize: 15.0,color: Colors.white),),
                  ],
                ),
                height: 53.0,
                minWidth: double.infinity,
                onPressed: (){
                  DarkModeCubit.get(context).changeAppMode();
                  please(context);
                }
            ),
            SizedBox(height: 5.0),

            MaterialButton(
                color: Colors.grey[600],
                child: Row(
                  children: [
                    Icon(Icons.info_outline_rounded,color: Colors.white,),
                    SizedBox(width: 10,),
                    Text("Terms of Service and Privace Policy",style: TextStyle(fontSize: 15.0,color: Colors.white),),
                  ],
                ),
                height: 53.0,
                minWidth: double.infinity,
                onPressed: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context){return InfoScreen();}));
                }
            ),
            SizedBox(height: 5.0),

            MaterialButton(
                color: Colors.grey[600],
                child: Row(
                  children: [
                    Icon(Icons.web_outlined,color: Colors.white,),
                    SizedBox(width: 10,),
                    Text("Visit Damascus University website",style: TextStyle(fontSize: 15.0,color: Colors.white),),
                  ],
                ),
                height: 53.0,
                minWidth: double.infinity,
                onPressed: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context){return WebViewScreen('http://www.damascusuniversity.edu.sy/');}));

                }
            ),
            SizedBox(height: 5.0),

            MaterialButton(
                color: Colors.grey[600],
                child: Row(
                  children: [
                    Icon(Icons.perm_device_info_outlined,color: Colors.white,),
                    SizedBox(width: 10,),
                    Text("Version: 1.0",style: TextStyle(fontSize: 15.0,color: Colors.white),),
                  ],
                ),
                height: 53.0,
                minWidth: double.infinity,
                onPressed: (){

                }
            ),

          ],
        ),
      ),
    );

  }
}
