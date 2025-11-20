import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'signin_widget.dart' show SigninWidget;
import 'package:flutter/material.dart';

class SigninModel extends FlutterFlowModel<SigninWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for Sign-UpEmail widget.
  FocusNode? signUpEmailFocusNode;
  TextEditingController? signUpEmailTextController;
  String? Function(BuildContext, String?)? signUpEmailTextControllerValidator;
  // State field(s) for Sign-UpPassword widget.
  FocusNode? signUpPasswordFocusNode;
  TextEditingController? signUpPasswordTextController;
  late bool signUpPasswordVisibility;
  String? Function(BuildContext, String?)?
      signUpPasswordTextControllerValidator;

  @override
  void initState(BuildContext context) {
    signUpPasswordVisibility = false;
  }

  @override
  void dispose() {
    signUpEmailFocusNode?.dispose();
    signUpEmailTextController?.dispose();

    signUpPasswordFocusNode?.dispose();
    signUpPasswordTextController?.dispose();
  }
}
