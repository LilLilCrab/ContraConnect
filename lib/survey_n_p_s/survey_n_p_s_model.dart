import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'survey_n_p_s_widget.dart' show SurveyNPSWidget;
import 'package:flutter/material.dart';

class SurveyNPSModel extends FlutterFlowModel<SurveyNPSWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for RatingBar widget.
  double? ratingBarValue;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    textFieldFocusNode?.dispose();
    textController?.dispose();
  }
}
