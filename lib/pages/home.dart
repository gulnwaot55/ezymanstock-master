import 'package:StockManager/helper/app_setting.dart';
import 'package:StockManager/helper/function.dart';
import 'package:StockManager/helper/globalData.dart';
import 'package:StockManager/helper/gradient_icon.dart';
import 'package:StockManager/helper/qrcode_manage.dart';
import 'package:StockManager/pages/login.dart';
import 'package:StockManager/pages/showapi.dart';
import 'package:StockManager/pages/showqr.dart';
import 'package:StockManager/pages/upload_gellary.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

class home extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _homeState();
  }
}

onShowAPI(context) {
  Navigator.push(context, MaterialPageRoute(builder: (context) => showAPI()));
}

onQRCameraForAmount(context) {
  QRCode().openQRCamera(context, editAmount: 1);
}

onQRCameraForSign(context) {
  QRCode().openQRCamera(context, editAmount: 2);
}

onQRCameraManage(context) {
  QRCode().openQRCamera(context, editAmount: 3); //using
}

onGellaryManage(context) {
  QRCodes().openQRCameras(context, editAmount: 4);
}

// onAbout(context){

// }

onLastestQRCode(context) {
  // QRCode().setQRtext('32122010003');
  if (QRCode().getQRtext() != 'Unknown') {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => showQRCode()));
  } else {
    function().showNotify(
      context: context,
      title: Settings.notify['home']['NoScan']['title'],
      message: Settings.notify['home']['NoScan']['message'],
      buttonText: Settings.notify['home']['NoScan']['button'],
    );
  }
}

onLogout(context) {
  globalData.token = null;
  globalData.login_name = null;
  Navigator.push(context, MaterialPageRoute(builder: (context) => login()));
}

class _homeState extends State<home> {
  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  _onMenuClick(context) {
    _scaffoldKey.currentState.openDrawer();
  }

  @override
  Widget build(BuildContext context) {
    Widget menuItem(
        Widget icon, Text text, Text desc, bool background, Function fn) {
      Widget _show;
      if (background) {
        _show = Padding(
          padding: const EdgeInsets.only(top: 18.0),
          child: SizedBox(
              width: MediaQuery.of(context).size.width * 90 / 100,
              height: 100,
              child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(5)),
                      boxShadow: [
                        BoxShadow(
                            color: Colors.grey[300],
                            blurRadius: 5,
                            offset: Offset(0.0, 4.0)),
                      ]),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(5)),
                      gradient: LinearGradient(
                        begin: Alignment(-1.0, -4.0),
                        end: Alignment(1.0, 4.0),
                        colors: [
                          const Color.fromRGBO(0, 176, 155, 1),
                          const Color.fromRGBO(103, 224, 63, 1)
                        ],
                      ),
                    ),
                    child: FlatButton(
                      onPressed: () => {fn()},
                      child: Row(
                        children: [
                          icon,
                          Padding(
                            padding: const EdgeInsets.only(left: 16.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                text,
                                ConstrainedBox(
                                  constraints: BoxConstraints(
                                    maxWidth:
                                        MediaQuery.of(context).size.width *
                                            60 /
                                            100,
                                  ),
                                  child: desc,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ))),
        );
      } else {
        _show = Padding(
          padding: const EdgeInsets.only(top: 18.0),
          child: SizedBox(
              width: MediaQuery.of(context).size.width * 90 / 100,
              height: 100,
              child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(5)),
                  ),
                  child: OutlineButton(
                    borderSide:
                        BorderSide(color: Settings.theme['color'], width: 3),
                    highlightedBorderColor: Settings.theme['color'],
                    shape: new RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(5)),
                    ),
                    onPressed: () => {fn()},
                    child: Row(
                      children: [
                        RadiantGradientMask(child: icon),
                        Padding(
                          padding: const EdgeInsets.only(left: 16.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              text,
                              ConstrainedBox(
                                constraints: BoxConstraints(
                                  maxWidth: MediaQuery.of(context).size.width *
                                      60 /
                                      100,
                                ),
                                child: desc,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    color: Settings.theme['color'],
                  ))),
        );
      }
      return _show;
    }

    return WillPopScope(
      onWillPop: () {},
      child: Scaffold(
        key: _scaffoldKey,
        drawer: sideMenu(context),
        appBar: AppBar(
            backgroundColor: Colors.white,
            shadowColor: Settings.theme['color'],
            title: Text(
              Settings.language['Menu']['Home'],
              style: GoogleFonts.prompt(
                  color: Settings.theme['color'], fontWeight: FontWeight.w600),
            ),
            leading: FlatButton(
              child: Icon(
                Icons.menu,
                color: Settings.theme['color'],
                size: 30,
              ),
              highlightColor: Colors.transparent,
              splashColor: Colors.transparent,
              onPressed: () => {_onMenuClick(context)},
            )),
        body: Container(
          alignment: Alignment.center,
          child: ListView(
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 16.0),
                child: Column(
                  children: [
                    menuItem(
                        Icon(
                          Icons.camera,
                          color: Colors.white,
                          size: 50,
                        ),
                        Text(
                          Settings.language['Menu']['QRCamera'],
                          style: GoogleFonts.prompt(
                              fontSize: 22,
                              color: Settings.theme["font_color"]),
                        ),
                        Text(
                          Settings.language['Menu']['QRCamera_Desc'],
                          style: GoogleFonts.prompt(
                              fontSize: 16,
                              color: Settings.theme["font_color"]),
                        ),
                        true,
                        
                        () => onQRCameraManage(context)),
                    menuItem(
                        Icon(
                          Icons.photo_camera_back_rounded,
                          color: Colors.white,
                          size: 50,
                        ),
                        Text(
                          Settings.language['Menu']['Drawer_Gellary'],
                          style: GoogleFonts.prompt(
                              fontSize: 22,
                              color: Settings.theme["font_color"]),
                        ),
                        Text(
                          Settings.language['Menu']['Drawers_Gellary'],
                          style: GoogleFonts.prompt(
                              fontSize: 16,
                              color: Settings.theme["font_color"]),
                        ),
                        true,
                        () => onGellaryManage(context)),
                        
                    // menuItem(
                    //     Padding(
                    //       padding: const EdgeInsets.only(right: 12.0),
                    //       child: Icon(
                    //         FontAwesomeIcons.boxOpen,
                    //         color: Settings.theme["font_color"],
                    //         size: 40,
                    //       ),
                    //     ),
                    //     Text(
                    //       Settings.language['Menu']['QRCamera'],
                    //       style: GoogleFonts.prompt(
                    //           fontSize: 22,
                    //           color: Settings.theme["font_color"]),
                    //     ),
                    //     Text(
                    //       Settings.language['Menu']['QRCamera_Desc'],
                    //       style: GoogleFonts.prompt(
                    //           fontSize: 16,
                    //           color: Settings.theme["font_color"]),
                    //     ),
                    //     true,
                    //     () => onQRCameraForAmount(context)),
                    // menuItem(
                    //     Icon(
                    //       Icons.print,
                    //       color: Colors.white,
                    //       size: 50,
                    //     ),
                    //     Text(
                    //       Settings.language['Menu']['Lastest_Product'],
                    //       style: GoogleFonts.prompt(
                    //           fontSize: 22, color: Settings.theme['color']),
                    //     ),
                    //     Text(
                    //       Settings.language['Menu']['Lastest_Product_Desc'],
                    //       style: GoogleFonts.prompt(
                    //           fontSize: 16, color: Settings.theme['color']),
                    //     ),
                    //     false,
                    //     () => onQRCameraForSign(context)),
                    menuItem(
                        Icon(
                          Icons.logout,
                          color: Colors.white,
                          size: 50,
                        ),
                        Text(
                          Settings.language['Menu']['Logout'],
                          style: GoogleFonts.prompt(
                            fontSize: 22,
                            color: Colors.white,
                          ),
                        ),
                        Text(Settings.language['Menu']['Logout_Desc'],
                            style: GoogleFonts.prompt(
                              fontSize: 16,
                              color: Colors.white,
                            )),
                        true,
                        () => onLogout(context)),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class sideMenu extends StatelessWidget {
  BuildContext oldPageContext;

  sideMenu(BuildContext context) {
    oldPageContext = context;
  }

  getTopIMG(context) {
    return (MediaQuery.of(context).orientation == Orientation.portrait)
        ? Padding(
            padding: const EdgeInsets.only(top: 24.0, bottom: 8),
            child: Image.asset(
              Settings.theme['logo'],
              height: MediaQuery.of(context).size.width * 40 / 100,
            ),
          )
        : Container();
  }

  @override
  Widget build(BuildContext context) {
    onLogout() {
      Navigator.push(context, MaterialPageRoute(builder: (context) => login()));
    }

    return Drawer(
        child: Scaffold(
      bottomNavigationBar: ListTile(
        leading: Icon(Icons.exit_to_app, size: 31),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              Settings.language['Menu']['Drawer_Logout'],
              style: GoogleFonts.prompt(fontWeight: FontWeight.w500),
            ),
            Text(
              Settings.language['Version'],
              style: GoogleFonts.prompt(fontWeight: FontWeight.w500),
            ),
          ],
        ),
        onTap: () => {onLogout()},
      ),
      body: ListView(
        children: [
          getTopIMG(context),
          Padding(
            padding: const EdgeInsets.only(bottom: 14.0),
            child: Center(
              child: Text("ผู้ใช้งาน: ${globalData.login_name}",
                  style: GoogleFonts.prompt(
                      fontWeight: FontWeight.w500,
                      fontSize: 18,
                      color: Settings.theme["color"])),
            ),
          ),
          ListTile(
            leading: Icon(Icons.camera, size: 30),
            title: Text(
              Settings.language['Menu']['Drawer_QRCamera'],
              style: GoogleFonts.prompt(fontWeight: FontWeight.w500),
            ),
            onTap: () => {onQRCameraManage(oldPageContext)},
          ),
          ListTile(
            leading: Icon(Icons.photo_size_select_actual_rounded, size: 30),
            title: Text(
              Settings.language['Menu']['Drawer_Gellary'],
              style: GoogleFonts.prompt(fontWeight: FontWeight.w500),
            ),
            onTap: () => {onQRCameraManage(oldPageContext)},
          ),
          // ListTile(
          //   leading: FaIcon(FontAwesomeIcons.boxOpen),
          //   title: Text(
          //     Settings.language['Menu']['Drawer_QRCamera'],
          //     style: GoogleFonts.prompt(fontWeight: FontWeight.w500),
          //   ),
          //   onTap: () => {onQRCameraForAmount(oldPageContext)},
          // ),
          // ListTile(
          //   leading: Icon(Icons.print, size: 31),
          //   title: Text(
          //     Settings.language['Menu']['Drawer_Lastest_Product'],
          //     style: GoogleFonts.prompt(fontWeight: FontWeight.w500),
          //   ),
          //   onTap: () => {onQRCameraForSign(oldPageContext)},
          // ),
        ],
      ),
    ));
  }
}

