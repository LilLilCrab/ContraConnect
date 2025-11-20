import '/components/customnavbar_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'profile_config_widget.dart' show ProfileConfigWidget;
import 'package:flutter/material.dart';

class ProfileConfigModel extends FlutterFlowModel<ProfileConfigWidget> {
  ///  State fields for stateful widgets in this page.

  bool isDataUploading_uploadData2j5 = false;
  FFUploadedFile uploadedLocalFile_uploadData2j5 =
      FFUploadedFile(bytes: Uint8List.fromList([]), originalFilename: '');
  String uploadedFileUrl_uploadData2j5 = '';

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
