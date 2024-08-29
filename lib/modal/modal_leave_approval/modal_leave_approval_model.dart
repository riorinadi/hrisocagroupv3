import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'modal_leave_approval_widget.dart' show ModalLeaveApprovalWidget;
import 'package:flutter/material.dart';

class ModalLeaveApprovalModel
    extends FlutterFlowModel<ModalLeaveApprovalWidget> {
  ///  State fields for stateful widgets in this component.

  final formKey = GlobalKey<FormState>();
  // State field(s) for description widget.
  FocusNode? descriptionFocusNode1;
  TextEditingController? descriptionTextController1;
  String? Function(BuildContext, String?)? descriptionTextController1Validator;
  // State field(s) for description widget.
  FocusNode? descriptionFocusNode2;
  TextEditingController? descriptionTextController2;
  String? Function(BuildContext, String?)? descriptionTextController2Validator;
  // Stores action output result for [Backend Call - Read Document] action in Button widget.
  UsersRecord? senderOutput2;
  // Stores action output result for [Backend Call - Read Document] action in Button widget.
  UsersRecord? senderOutput;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    descriptionFocusNode1?.dispose();
    descriptionTextController1?.dispose();

    descriptionFocusNode2?.dispose();
    descriptionTextController2?.dispose();
  }
}
