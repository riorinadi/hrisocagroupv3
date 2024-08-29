// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:pdf/widgets.dart' as pw;
import 'package:pdf/pdf.dart';
import 'package:printing/printing.dart';
import 'package:intl/intl.dart';

import 'package:download/download.dart';
import 'package:intl/intl.dart'; // Import this for date and time formatting

Future jsonToCsvAndDownloadAction(String jsonString) async {
  // convert from json to csv and download it, without using csv library
  List<Map<String, dynamic>> jsonList =
      jsonDecode(jsonString).cast<Map<String, dynamic>>();

  // Extract the headers from the first object
  List<String> headers = jsonList[0].keys.toList();

  // Create a string to hold the CSV data
  String csvData = headers.join(",") + "\n";

  // Loop through the objects and add their values to the CSV string
  for (Map<String, dynamic> json in jsonList) {
    List<String> values = [];
    for (String header in headers) {
      values.add(json[header].toString());
    }
    csvData += values.join(",") + "\n";
  }

  // Generate a formatted timestamp for the filename
  final formattedDateTime =
      DateFormat('yyyyMMdd_HHmmss').format(DateTime.now());

  // Custom filename with date, time, and "custom_name"
  final fileName = 'custom_name_$formattedDateTime.csv';

  // Convert the CSV string to a list of bytes (Uint8List)
  Uint8List csvBytes = Uint8List.fromList(csvData.codeUnits);

  // Convert the Uint8List to a Stream<int>
  Stream<int> csvStream = Stream.fromIterable(csvBytes.map((byte) => byte));

  // Download the CSV file with the custom filename
  await download(csvStream, fileName);
}
