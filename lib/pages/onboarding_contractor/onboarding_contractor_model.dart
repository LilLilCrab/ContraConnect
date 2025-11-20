import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import '/index.dart';
import 'onboarding_contractor_widget.dart' show OnboardingContractorWidget;
import 'package:flutter/material.dart';

class OnboardingContractorModel
    extends FlutterFlowModel<OnboardingContractorWidget> {
  ///  State fields for stateful widgets in this page.

  bool isDataUploading_contractorProfilePhoto = false;
  FFUploadedFile uploadedLocalFile_contractorProfilePhoto =
      FFUploadedFile(bytes: Uint8List.fromList([]), originalFilename: '');
  String uploadedFileUrl_contractorProfilePhoto = '';

  bool isDataUploading_contractorProfPic = false;
  FFUploadedFile uploadedLocalFile_contractorProfPic =
      FFUploadedFile(bytes: Uint8List.fromList([]), originalFilename: '');

  // State field(s) for ContractorFirstName widget.
  FocusNode? contractorFirstNameFocusNode;
  TextEditingController? contractorFirstNameTextController;
  String? Function(BuildContext, String?)?
      contractorFirstNameTextControllerValidator;
  // State field(s) for ContractorLastName widget.
  FocusNode? contractorLastNameFocusNode;
  TextEditingController? contractorLastNameTextController;
  String? Function(BuildContext, String?)?
      contractorLastNameTextControllerValidator;
  DateTime? datePicked;
  // State field(s) for ContractorBusName widget.
  FocusNode? contractorBusNameFocusNode;
  TextEditingController? contractorBusNameTextController;
  String? Function(BuildContext, String?)?
      contractorBusNameTextControllerValidator;
  // State field(s) for DropDownContractorWork widget.
  String? dropDownContractorWorkValue;
  FormFieldController<String>? dropDownContractorWorkValueController;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    contractorFirstNameFocusNode?.dispose();
    contractorFirstNameTextController?.dispose();

    contractorLastNameFocusNode?.dispose();
    contractorLastNameTextController?.dispose();

    contractorBusNameFocusNode?.dispose();
    contractorBusNameTextController?.dispose();
  }
}
