import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'onboarding_homeowner_widget.dart' show OnboardingHomeownerWidget;
import 'package:flutter/material.dart';

class OnboardingHomeownerModel
    extends FlutterFlowModel<OnboardingHomeownerWidget> {
  ///  State fields for stateful widgets in this page.

  bool isDataUploading_newProfilePhoto = false;
  FFUploadedFile uploadedLocalFile_newProfilePhoto =
      FFUploadedFile(bytes: Uint8List.fromList([]), originalFilename: '');
  String uploadedFileUrl_newProfilePhoto = '';

  bool isDataUploading_homeownerProfPic = false;
  FFUploadedFile uploadedLocalFile_homeownerProfPic =
      FFUploadedFile(bytes: Uint8List.fromList([]), originalFilename: '');

  // State field(s) for CustomerFirstName widget.
  FocusNode? customerFirstNameFocusNode;
  TextEditingController? customerFirstNameTextController;
  String? Function(BuildContext, String?)?
      customerFirstNameTextControllerValidator;
  // State field(s) for CustomerLastName widget.
  FocusNode? customerLastNameFocusNode;
  TextEditingController? customerLastNameTextController;
  String? Function(BuildContext, String?)?
      customerLastNameTextControllerValidator;
  DateTime? datePicked;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    customerFirstNameFocusNode?.dispose();
    customerFirstNameTextController?.dispose();

    customerLastNameFocusNode?.dispose();
    customerLastNameTextController?.dispose();
  }
}
