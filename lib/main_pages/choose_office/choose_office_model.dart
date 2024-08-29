import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'choose_office_widget.dart' show ChooseOfficeWidget;
import 'package:flutter/material.dart';

class ChooseOfficeModel extends FlutterFlowModel<ChooseOfficeWidget> {
  ///  Local state fields for this page.

  int? totaldoc;

  OfficeRecord? officeDoc;

  double? minimumRadius;

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Stores action output result for [Firestore Query - Query a collection] action in ChooseOffice widget.
  SettingsRecord? settingsOutput;
  // Stores action output result for [Firestore Query - Query a collection] action in ChooseOffice widget.
  List<OfficeRecord>? officeoutput;
  // Stores action output result for [Custom Action - getDistance] action in ChooseOffice widget.
  double? outputdistance;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
