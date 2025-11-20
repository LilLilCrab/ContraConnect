import '/flutter_flow/flutter_flow_util.dart';
import 'new_job_widget.dart' show NewJobWidget;
import 'package:flutter/material.dart';

class NewJobModel extends FlutterFlowModel<NewJobWidget> {
  ///  State fields for stateful widgets in this component.

  // State field(s) for TitleInput widget.
  FocusNode? titleInputFocusNode;
  TextEditingController? titleInputTextController;
  String? Function(BuildContext, String?)? titleInputTextControllerValidator;
  // State field(s) for DetailsInput widget.
  FocusNode? detailsInputFocusNode;
  TextEditingController? detailsInputTextController;
  String? Function(BuildContext, String?)? detailsInputTextControllerValidator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    titleInputFocusNode?.dispose();
    titleInputTextController?.dispose();

    detailsInputFocusNode?.dispose();
    detailsInputTextController?.dispose();
  }
}
