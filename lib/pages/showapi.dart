import 'package:StockManager/helper/app_setting.dart';
import 'package:StockManager/helper/database_manage.dart';
import 'package:StockManager/pages/login.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class showAPI extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _showAPIState();
  }
}

class _showAPIState extends State<showAPI> {
  FocusNode _apiFocusNode;
  String _api;

  @override
  void initState() {
    super.initState();
    _apiFocusNode = FocusNode();
    setAPI();
  }

  @override
  void dispose() {
    _apiFocusNode.dispose();
    super.dispose();
  }

  setAPI() async {
    String _api = await DBManage().getAPI();
    setState(() {
      this._api = _api;
    });
  }


  _onBack(context) {
    Navigator.of(context).pop();
  }

  Widget HorizontalShow() {
    return Column(
      children: [
        Flexible(
          flex: 2,
          child: Align(
            alignment: Alignment.center,
            child: Padding(
              padding: const EdgeInsets.only(top: 50.0),
              child: Center(
                child: Row(
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 30 / 100,
                      child: Image.asset(
                        Settings.language['ShowAPI']['Icon'],
                      ),
                    ),
                    ConstrainedBox(
                      constraints: BoxConstraints(
                        maxWidth:
                            MediaQuery.of(context).size.width * 60 / 100,
                      ),
                      child: Text(
                        '$_api',
                        style: GoogleFonts.prompt(fontSize: 26),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
        Flexible(
          flex: 1,
          child: Padding(
            padding: const EdgeInsets.only(top: 22.0),
            child: Align(
              child: SizedBox(
                  width: MediaQuery.of(context).size.width * 90 / 100,
                  height: 58,
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(5)),
                        boxShadow: [
                          BoxShadow(
                              color: Colors.grey[300],
                              blurRadius: 5,
                              offset: Offset(0.0, 4.0)),
                        ]),
                    child: FlatButton(
                        onPressed: () => {_onBack(context)},
                        child: Text(
                          Settings.language['ShowAPI']['Back'],
                          style: GoogleFonts.prompt(
                              fontSize: 18, color:Settings.theme["font_color"]),
                        ),
                        color: Settings.theme['color'],
                        shape: new RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(5)),
                        )),
                  )),
            ),
          ),
        ),
      ],
    );
  }

  Widget VerticleShow(context) {
    return Column(
      children: [
        Flexible(
          flex: 4,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                Settings.language['ShowAPI']['Icon'],
                scale: 2,
              ),
              Align(
                alignment: Alignment.center,
                child: ConstrainedBox(
                    constraints: BoxConstraints(
                      maxWidth: MediaQuery.of(context).size.width * 90 / 100,
                    ),
                    child: Text(
                      '$_api',
                      style: GoogleFonts.prompt(fontSize: 26),
                    )),
              ),
            ],
          ),
        ),
        Flexible(
          flex: 1,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                  width: MediaQuery.of(context).size.width * 90 / 100,
                  height: 58,
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(5)),
                        boxShadow: [
                          BoxShadow(
                              color: Colors.grey[300],
                              blurRadius: 5,
                              offset: Offset(0.0, 4.0)),
                        ]),
                    child: FlatButton(
                        onPressed: () => {_onBack(context)},
                        child: Text(
                          Settings.language['ShowAPI']['Back'],
                          style: GoogleFonts.prompt(
                              fontSize: 18, color:Settings.theme["font_color"]),
                        ),
                        color: Settings.theme['color'],
                        shape: new RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(5)),
                        )),
                  )),
            ],
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      alignment: Alignment.center,
      child: (MediaQuery.of(context).orientation == Orientation.portrait)
          ? VerticleShow(context)
          : HorizontalShow(),
    ));
  }
}
