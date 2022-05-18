import 'package:StockManager/helper/app_setting.dart';
import 'package:flutter/material.dart';

class function {
  showNotify(
      {title, message, buttonText, @required context, Function fn = null}) {
    showDialog(
        context: context,
        builder: (_) => new AlertDialog(
              title: new Text("$title"),
              content: new Text("$message"),
              actions: <Widget>[
                FlatButton(
                  child: Text('$buttonText',style: TextStyle(color: Settings.theme['color']),),
                  onPressed: () {
                    Navigator.of(context).pop();
                    if (fn != null) {
                      fn();
                    }
                  },
                )
              ],
            ));
  }
}
