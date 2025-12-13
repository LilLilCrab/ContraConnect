import '/flutter_flow/flutter_flow_util.dart';
import 'update_field_bar_widget.dart' show UpdateFieldBarWidget;
import 'package:flutter/material.dart';

class UpdateFieldBarModel extends FlutterFlowModel<UpdateFieldBarWidget> {
  ///  State fields for stateful widgets in this component.

  // State field(s) for EmailField widget.
  FocusNode? emailFieldFocusNode;
  TextEditingController? emailFieldTextController;
  String? Function(BuildContext, String?)? emailFieldTextControllerValidator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    emailFieldFocusNode?.dispose();
    emailFieldTextController?.dispose();
  }
}
