import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import '/index.dart';
import 'onboarding_contractor_widget.dart' show OnboardingContractorWidget;
import 'package:flutter/material.dart';

class OnboardingContractorModel
    extends FlutterFlowModel<OnboardingContractorWidget> {
  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  bool isDataUploading_contractorProfilePhoto = false;
  FFUploadedFile uploadedLocalFile_contractorProfilePhoto =
      FFUploadedFile(bytes: Uint8List.fromList([]), originalFilename: '');
  String uploadedFileUrl_contractorProfilePhoto = '';

  bool isDataUploading_contractorProfPic = false;
  FFUploadedFile uploadedLocalFile_contractorProfPic =
      FFUploadedFile(bytes: Uint8List.fromList([]), originalFilename: '');

  // State field(s) for ContractorBusName widget.
  FocusNode? contractorBusNameFocusNode;
  TextEditingController? contractorBusNameTextController;
  String? Function(BuildContext, String?)?
      contractorBusNameTextControllerValidator;
  String? _contractorBusNameTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Business Name... is required';
    }

    if (val.length < 1) {
      return 'Business name must be more than one character long.';
    }
    if (val.length > 1000) {
      return 'Business name too long. Please enter a name <1,000 characters long.';
    }

    return null;
  }

  // State field(s) for ContractorFirstName widget.
  FocusNode? contractorFirstNameFocusNode;
  TextEditingController? contractorFirstNameTextController;
  String? Function(BuildContext, String?)?
      contractorFirstNameTextControllerValidator;
  String? _contractorFirstNameTextControllerValidator(
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

  // State field(s) for ContractorLastName widget.
  FocusNode? contractorLastNameFocusNode;
  TextEditingController? contractorLastNameTextController;
  String? Function(BuildContext, String?)?
      contractorLastNameTextControllerValidator;
  String? _contractorLastNameTextControllerValidator(
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

  DateTime? datePicked;
  // State field(s) for DropDownContractorWork widget.
  String? dropDownContractorWorkValue;
  FormFieldController<String>? dropDownContractorWorkValueController;

  @override
  void initState(BuildContext context) {
    contractorBusNameTextControllerValidator =
        _contractorBusNameTextControllerValidator;
    contractorFirstNameTextControllerValidator =
        _contractorFirstNameTextControllerValidator;
    contractorLastNameTextControllerValidator =
        _contractorLastNameTextControllerValidator;
  }

  @override
  void dispose() {
    contractorBusNameFocusNode?.dispose();
    contractorBusNameTextController?.dispose();

    contractorFirstNameFocusNode?.dispose();
    contractorFirstNameTextController?.dispose();

    contractorLastNameFocusNode?.dispose();
    contractorLastNameTextController?.dispose();
  }
}
