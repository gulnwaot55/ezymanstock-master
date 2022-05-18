import 'package:flutter/material.dart';

class Settings {
  static Map<String, dynamic> language = {
    "Version": "V. 3.4r",
    "Welcome": "ยินดีต้อนรับ",
    "Login": {
      "Textbox_Username": "Username",
      "Textbox_OTP": "OTP",
      "Ver_Button_GetOTP": "Get",
      "Hor_Button_GetOTP": "Get OTP",
      "Button_Login": "Login",
      "Hor_Button_Setup": "Setup",
    },
    "Setup": {
      "Api1": "Local",
      "Save": "Save",
      "Back": "Back",
      "Api2": "Online",
    },
    "Menu": {
      "Home": "Home",
      "QRCamera": "Manage product",
      "QRCamera_Desc": " จัดการสินค้า",
      "Lastest_Product": "Edit Product Sign",
      "Lastest_Product_Desc": "  แก้ไขจำนวนป้ายที่ต้องการทั้งหมด",
      "ShowAPI": "Show API",
      "ShowAPI_Desc": "  แสดง api ที่ถูกตั้งค่าไว้",
      "Logout": "Logout",
      "Logout_Desc": " ออกจากระบบ",
      "Drawer_QRCamera": "Manage Product",
      "Drawer_Lastest_Product": "Edit Product Sign",
      "Drawer_Logout": "Logout",
      "Drawer_Gellary": "Upload Picture Product",
      "Drawers_Gellary": "เลือกรูปภาพเพื่อ Scan",
    },
    "QRCamera": {"Cancel": "Cancel", "Flash": true, "Color": "#ffffff"},
    "Lastest_Product": {
      "Title": "แก้ไข จำนวนของสินค้า",
      "bcode": "รหัสสินค้า : ",
      "descr": "ชื่อสินค้า : ",
      "model": "รุ่น : ",
      "brand": "ยี่ห้อ : ",
      "vendor": "บริษัท : ",
      "uI1": "หน่วย : ",
      "locatioN1": "ที่เก็บ : ",
      "qtyoH2": "คงเหลือ : ",
      "Textbox_Count": "จำนวนสินค้าคงเหลือ",
      "Sign_Textbox_Count": "จำนวนป้ายที่ต้องการ",
      "Loc_Textbox_Count": "ตำแหน่งที่เก็บ",
      "Button_Save": "แก้ไขข้อมูลสินค้า",
    },
    "Edit_Product_Sign": {
      "Title": "แก้ไขจำนวน ป้าย สินค้า",
      "Button_Save": "แก้ไขจำนวน ป้าย สินค้า",
    },
    "ShowAPI": {
      "Icon": "assets/images/Smile.png",
      "Back": "Back",
    }
  };

  static Map<String, dynamic> notify = {
    "Login": {
      "Username_input": {
        "title": "Error",
        "message": "please input Username",
        "button": "OK"
      },
      "OTP_input": {
        "title": "Error",
        "message": "please input OTP",
        "button": "OK"
      },
      "Failed": {
        "title": "Login Failed",
        "message": "username or otp is wrong",
        "button": "OK"
      },
      "OTP_Success": {
        "title": "Success",
        "message": "request otp success",
        "button": "OK"
      },
      "OTP_Notfound": {
        "title": "Not found",
        "message": "username not found",
        "button": "OK"
      },
    },
    "home": {
      "NoScan": {
        "title": "Error",
        "message": "Not found lastest product",
        "button": "OK"
      },
    },
    "ScanProduct": {
      "Notfound_Product": {
        "title": "Notfound",
        "message": "Not found this product code",
        "button": "OK"
      },
    },
    "last_product": {
      "Success": {
        "title": "Success",
        "message": "บันทึกข้อมูลสำเร็จแล้ว",
        "button": "OK"
      },
      "notNumber": {
        "title": "Error",
        "message": "กรุณาระบุข้อมูลเป็นตัวเลขเท่านั้น",
        "button": "OK"
      },
      "Empty": {
        "title": "Error",
        "message": "กรุณากรอกข้อมูลให้ครบทุกช่อง",
        "button": "OK"
      },
      "Failed": {
        "title": "Error",
        "message": "เกิดข้อผิดพลาดไม่สามารถบันทึกข้อมูลได้",
        "button": "OK"
      },
    },
    "sign_product": {
      "Success": {
        "title": "Success",
        "message": "บันทึกข้อมูลสำเร็จแล้ว",
        "button": "OK"
      },
      "notNumber": {
        "title": "Error",
        "message": "กรุณาระบุข้อมูลเป็นตัวเลขเท่านั้น",
        "button": "OK"
      },
      "Empty": {
        "title": "Error",
        "message": "กรุณากรอกข้อมูลให้ครบทุกช่อง",
        "button": "OK"
      },
      "Failed": {
        "title": "Error",
        "message": "เกิดข้อผิดพลาดไม่สามารถบันทึกข้อมูลได้",
        "button": "OK"
      },
    },
    "setup": {
      "Success": {
        "title": "Success",
        "message": "API Successfully saved",
        "button": "OK"
      },
      "Failed": {
        "title": "Error",
        "message": "Please fill your information completely",
        "button": "OK"
      },
    }
  };

  static Map<String, dynamic> theme = {
    "logo": "assets/images/icon.png",
    "color": Color.fromRGBO(36, 178, 75, 1), //Color.fromRGBO(89, 153, 126, 1),
    "nearcolor":
        Color.fromRGBO(31, 152, 64, 1), //Color.fromRGBO(46, 120, 93, 1),
    "font_color": Colors.white,
    "device_preview": false,
  };
}
