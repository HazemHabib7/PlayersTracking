import 'package:flutter/material.dart';

void showLoading(BuildContext context){
showDialog(
  context: context,
  barrierDismissible: false,
  builder:(_)=>WillPopScope(
    onWillPop: _willPopCallback,
    child: AlertDialog(
      backgroundColor: Colors.white,
      shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(8.0)),
         content: Row(
                children: const <Widget>[
                  CircularProgressIndicator(color: Colors.green),
                  Expanded(
                    child: Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text(
                        'Loading....',
                        style:TextStyle(
                          color:Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
    ),
  )
  );
}
Future<bool> _willPopCallback() async {
  return false;
}