import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'onboarding_homeowner_widget.dart' show OnboardingHomeownerWidget;
import 'package:flutter/material.dart';

class OnboardingHomeownerModel
    extends FlutterFlowModel<OnboardingHomeownerWidget> {
  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  bool isDataUploading_newProfilePhoto = false;
  FFUploadedFile uploadedLocalFile_newProfilePhoto =
      FFUploadedFile(bytes: Uint8List.fromList([]), originalFilename: '');
  String uploadedFileUrl_newProfilePhoto = '';

  bool isDataUploading_homeownerProfPic = false;
  FFUploadedFile uploadedLocalFile_homeownerProfPic =
      FFUploadedFile(bytes: Uint8List.fromList([]), originalFilename: '');

  // State field(s) for CustomerLastName widget.
  FocusNode? customerLastNameFocusNode;
  TextEditingController? customerLastNameTextController;
  String? Function(BuildContext, String?)?
      customerLastNameTextControllerValidator;
  String? _customerLastNameTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Last Name... is required';
    }

    if (val.length < 1) {
      return 'Please enter a name longer than one character.';
    }
    if (val.length > 100) {
      return 'Name too long. Please enter a name <100 characters long.';
    }

    return null;
  }

  // State field(s) for CustomerFirstName widget.
  FocusNode? customerFirstNameFocusNode;
  TextEditingController? customerFirstNameTextController;
  String? Function(BuildContext, String?)?
      customerFirstNameTextControllerValidator;
  String? _customerFirstNameTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'First Name... is required';
    }

    if (val.length < 1) {
      return 'Please enter a name longer than one character.';
    }
    if (val.length > 100) {
      return 'Name too long. Please enter a name <100 characters long.';
    }

    return null;
  }

  DateTime? datePicked;

  @override
  void initState(BuildContext context) {
    customerLastNameTextControllerValidator =
        _customerLastNameTextControllerValidator;
    customerFirstNameTextControllerValidator =
        _customerFirstNameTextControllerValidator;
  }

  @override
  void dispose() {
    customerLastNameFocusNode?.dispose();
    customerLastNameTextController?.dispose();

    customerFirstNameFocusNode?.dispose();
    customerFirstNameTextController?.dispose();
  }
}
