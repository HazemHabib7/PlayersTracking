import 'package:flutter/material.dart';

void please(BuildContext context){
showDialog(
  context: context,
  barrierDismissible: false,
  builder:(_)=>WillPopScope(
    onWillPop: _willPopCallback,
    child: AlertDialog(
      backgroundColor: Colors.white,
      shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(8.0)),
         content: Container(
           height: 95.0,
           child: Column(
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text(
                        'Please restart the application',
                        style:TextStyle(
                          color:Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    TextButton(onPressed: (){
                      Navigator.pop(context);
                    }, child: Text('Ok',style: TextStyle(color: Colors.green),),),
                  ],
                ),
         ),
    ),
  )
  );
}
Future<bool> _willPopCallback() async {
  return false;
}