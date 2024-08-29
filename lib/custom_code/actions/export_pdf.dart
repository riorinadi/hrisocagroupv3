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

Future exportPdf(List<AttendanceRecord> attendanceDoc) async {
  // Add your function code here!
  final pdf = pw.Document();
//
  // Tambahkan halaman ke dokumen PDF
  pdf.addPage(
    pw.MultiPage(
      pageFormat: PdfPageFormat.a4.landscape,
      build: (context) => [
        // Header PDF
        pw.Header(
          level: 0,
          child: pw.Column(
            crossAxisAlignment: pw.CrossAxisAlignment.start,
            children: [
              pw.Text(
                'Attendance',
                style: pw.TextStyle(
                  fontWeight: pw.FontWeight.bold,
                  fontSize: 20,
                ),
              ),
              pw.SizedBox(
                  height: 5), // Spasi antara teks "VMS Data" dan teks tambahan
              pw.Text(
                'Total Attendance: ${attendanceDoc.length}',
                style: pw.TextStyle(
                  fontSize: 14,
                ),
              ),
            ],
          ),
        ),
        // Tabel dari array teks dengan gaya teks khusus
        pw.Table.fromTextArray(
          cellStyle: pw.TextStyle(fontSize: 7), // Gaya teks untuk seluruh tabel
          headerStyle: pw.TextStyle(
            fontWeight: pw.FontWeight.bold,
            fontSize: 7,
          ), // Gaya teks untuk header tabel
          context: context,
          columnWidths: {
            0: pw.FixedColumnWidth(20),
            1: pw.FixedColumnWidth(60),
            2: pw.FixedColumnWidth(60),
            3: pw.FixedColumnWidth(60),
            4: pw.FixedColumnWidth(80),
          },
          data: <List<String>>[
            <String>[
              'No',
              'Date',
              'Clockin',
              'Clockout',
            ],
            ...attendanceDoc.asMap().entries.map(
                  (entry) => [
                    (entry.key + 1).toString(), // Nomor urut dimulai dari 1
                    DateFormat('dd-MM-yyyy').format(entry.value.checkinTime!),
                    DateFormat('h:mm').format(entry.value.checkinTime!),
                    entry.value.isCheckout == true
                        ? DateFormat('h:mm').format(entry.value.checkoutTime!)
                        : '',
                  ],
                ),
          ],
        ),
      ],
    ),
  );

  // Print atau simpan dokumen PDF
  await Printing.layoutPdf(
    onLayout: (PdfPageFormat format) async => pdf.save(),
  );
}
