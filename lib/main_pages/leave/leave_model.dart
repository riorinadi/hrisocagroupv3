import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'leave_widget.dart' show LeaveWidget;
import 'package:flutter/material.dart';

class LeaveModel extends FlutterFlowModel<LeaveWidget> {
  ///  Local state fields for this page.

  int? totalAvaliable;

  int? intI;

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Stores action output result for [Firestore Query - Query a collection] action in Leave widget.
  List<LeaveRecord>? outputleave;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
