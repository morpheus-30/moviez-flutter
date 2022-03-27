import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
const Color kbgcolor = Color(0xFF070707);
const Color kCardColor = Color(0xFF252525);
const Color kmainUIcolor = Color(0xFFFFC300);

const kTextFieldDecoration = InputDecoration(
  hintStyle: TextStyle(fontFamily: 'JosefinSans',color: kmainUIcolor),
  hintText: 'Enter Movie Name ',
  contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
  border: OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(10)),
  ),
  enabledBorder: OutlineInputBorder(
    borderSide: BorderSide(color: Colors.yellowAccent, width: 1.0),
    borderRadius: BorderRadius.all(Radius.circular(10)),
  ),
  focusedBorder: OutlineInputBorder(
    borderSide: BorderSide(color: Colors.yellow, width: 2.0),
    borderRadius: BorderRadius.all(Radius.circular(10)),
  ),
);
final alertStyle = AlertStyle(
  backgroundColor: Colors.black,
  animationType: AnimationType.grow,
  isCloseButton: false,
  isOverlayTapDismiss: false,
  descStyle: TextStyle(fontWeight: FontWeight.w100),
  descTextAlign: TextAlign.center,
  animationDuration: Duration(milliseconds: 400),
  alertBorder: RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(20.0),
    side: BorderSide(
      color: kmainUIcolor,
    ),
  ),
  titleTextAlign: TextAlign.center,
  titleStyle: TextStyle(
    fontWeight: FontWeight.bold,
    fontFamily: 'JosefinSans',
    color: kmainUIcolor,
  ),
  alertAlignment: Alignment.center,
);
