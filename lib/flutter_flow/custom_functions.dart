import 'dart:convert';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'lat_lng.dart';
import 'place.dart';
import 'uploaded_file.dart';
import '/backend/backend.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '/backend/schema/structs/index.dart';
import '/auth/firebase_auth/auth_util.dart';

DateTime? getToday() {
  DateTime now = DateTime.now();
  DateTime today = DateTime(now.year, now.month, now.day);
  return today;
}

DateTime getFirstOfMonth() {
  // returns the first of the month
  return DateTime(DateTime.now().year, DateTime.now().month, 1);
}

int? getCountTwoDates(
  DateTime date1,
  DateTime date2,
) {
  // count between 2 dates

  Duration difference = date2.difference(date1);
  return difference.inDays.abs() + 1;
}
