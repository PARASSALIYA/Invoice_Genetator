import 'dart:io';

import 'package:invoice_genetator/header_files.dart';

class PersonalGlobal {
  static String? name;
  static String? phone;
  static String? Address;
  static String? emailAddress;
  static File? image;
  static String? itemname;
  static String? price;
  static String? qty;
  static String? discount;
  static String? taxrate;
  static int SI = 0;
  static bool hide = true;
  static int sv = 0;
  static GlobalKey<FormState> personalInfoKey = GlobalKey<FormState>();
}

var bytes;
var pdfsave;
List favorite = [];
