import '/components/customnavbar_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'homeowner_jobs_widget.dart' show HomeownerJobsWidget;
import 'package:flutter/material.dart';

class HomeownerJobsModel extends FlutterFlowModel<HomeownerJobsWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for customnavbar component.
  late CustomnavbarModel customnavbarModel;

  @override
  void initState(BuildContext context) {
    customnavbarModel = createModel(context, () => CustomnavbarModel());
  }

  @override
  void dispose() {
    customnavbarModel.dispose();
  }
}
