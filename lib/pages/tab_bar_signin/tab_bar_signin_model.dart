import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'tab_bar_signin_widget.dart' show TabBarSigninWidget;
import 'package:flutter/material.dart';

class TabBarSigninModel extends FlutterFlowModel<TabBarSigninWidget> {
  ///  Local state fields for this page.

  bool homeownerToContValue = true;

  ///  State fields for stateful widgets in this page.

  // State field(s) for TabBar widget.
  TabController? tabBarController;
  int get tabBarCurrentIndex =>
      tabBarController != null ? tabBarController!.index : 0;
  int get tabBarPreviousIndex =>
      tabBarController != null ? tabBarController!.previousIndex : 0;

  // State field(s) for Sign-InEmail widget.
  FocusNode? signInEmailFocusNode;
  TextEditingController? signInEmailTextController;
  String? Function(BuildContext, String?)? signInEmailTextControllerValidator;
  // State field(s) for Sign-InPassword widget.
  FocusNode? signInPasswordFocusNode;
  TextEditingController? signInPasswordTextController;
  late bool signInPasswordVisibility;
  String? Function(BuildContext, String?)?
      signInPasswordTextControllerValidator;
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
  // State field(s) for Sign-UpConfirmPassword widget.
  FocusNode? signUpConfirmPasswordFocusNode;
  TextEditingController? signUpConfirmPasswordTextController;
  late bool signUpConfirmPasswordVisibility;
  String? Function(BuildContext, String?)?
      signUpConfirmPasswordTextControllerValidator;
  // State field(s) for HomeownertoCont widget.
  bool? homeownertoContValue;

  @override
  void initState(BuildContext context) {
    signInPasswordVisibility = false;
    signUpPasswordVisibility = false;
    signUpConfirmPasswordVisibility = false;
  }

  @override
  void dispose() {
    tabBarController?.dispose();
    signInEmailFocusNode?.dispose();
    signInEmailTextController?.dispose();

    signInPasswordFocusNode?.dispose();
    signInPasswordTextController?.dispose();

    signUpEmailFocusNode?.dispose();
    signUpEmailTextController?.dispose();

    signUpPasswordFocusNode?.dispose();
    signUpPasswordTextController?.dispose();

    signUpConfirmPasswordFocusNode?.dispose();
    signUpConfirmPasswordTextController?.dispose();
  }
}
