import '/backend/backend.dart';
import '/components/customnavbar_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'homeowner_jobs_widget.dart' show HomeownerJobsWidget;
import 'package:flutter/material.dart';

class HomeownerJobsModel extends FlutterFlowModel<HomeownerJobsWidget> {
  ///  Local state fields for this page.
  /// Text recieved in the search bar.
  String? searchText;

  ///  State fields for stateful widgets in this page.

  // State field(s) for searchField widget.
  final searchFieldKey = GlobalKey();
  FocusNode? searchFieldFocusNode;
  TextEditingController? searchFieldTextController;
  String? searchFieldSelectedOption;
  String? Function(BuildContext, String?)? searchFieldTextControllerValidator;
  List<JobsRecord> simpleSearchResults = [];
  // Model for customnavbar component.
  late CustomnavbarModel customnavbarModel;

  @override
  void initState(BuildContext context) {
    customnavbarModel = createModel(context, () => CustomnavbarModel());
  }

  @override
  void dispose() {
    searchFieldFocusNode?.dispose();

    customnavbarModel.dispose();
  }
}
