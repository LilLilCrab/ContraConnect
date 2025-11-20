import '/auth/firebase_auth/auth_util.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'package:flutter/material.dart';
import 'customnavbar_model.dart';
export 'customnavbar_model.dart';

class CustomnavbarWidget extends StatefulWidget {
  const CustomnavbarWidget({super.key});

  @override
  State<CustomnavbarWidget> createState() => _CustomnavbarWidgetState();
}

class _CustomnavbarWidgetState extends State<CustomnavbarWidget> {
  late CustomnavbarModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CustomnavbarModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: AlignmentDirectional(0.0, 1.0),
      child: Container(
        width: double.infinity,
        height: 45.0,
        decoration: BoxDecoration(
          color: Color(0xFF3F4F44),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          children: [
            Expanded(
              child: InkWell(
                splashColor: Colors.transparent,
                focusColor: Colors.transparent,
                hoverColor: Colors.transparent,
                highlightColor: Colors.transparent,
                onTap: () async {
                  logFirebaseEvent('CUSTOMNAVBAR_COMP_JobsNav_ON_TAP');
                  if (valueOrDefault<bool>(
                      currentUserDocument?.isHomeowner, false)) {
                    logFirebaseEvent('JobsNav_navigate_to');

                    context.pushNamed(HomeownerJobsWidget.routeName);
                  } else {
                    logFirebaseEvent('JobsNav_navigate_to');

                    context.pushNamed(JobsWidget.routeName);
                  }

                  logFirebaseEvent('JobsNav_update_component_state');
                  _model.jNColor = Color(0xFFDCD7C9);
                  _model.rNColor = Color(0xB3A27B5C);
                  _model.pNColor = Color(0xB3A27B5C);
                  safeSetState(() {});
                },
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(
                      Icons.handyman,
                      color: _model.jNColor,
                      size: 24.0,
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: InkWell(
                splashColor: Colors.transparent,
                focusColor: Colors.transparent,
                hoverColor: Colors.transparent,
                highlightColor: Colors.transparent,
                onTap: () async {
                  logFirebaseEvent('CUSTOMNAVBAR_COMP_RequestsNav_ON_TAP');
                  logFirebaseEvent('RequestsNav_navigate_to');

                  context.pushNamed(RequestsWidget.routeName);

                  logFirebaseEvent('RequestsNav_update_component_state');
                  _model.jNColor = Color(0xB3A27B5C);
                  _model.rNColor = Color(0xFFDCD7C9);
                  _model.pNColor = Color(0xB3A27B5C);
                  safeSetState(() {});
                },
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(
                      Icons.receipt,
                      color: _model.rNColor,
                      size: 24.0,
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: InkWell(
                splashColor: Colors.transparent,
                focusColor: Colors.transparent,
                hoverColor: Colors.transparent,
                highlightColor: Colors.transparent,
                onTap: () async {
                  logFirebaseEvent('CUSTOMNAVBAR_COMP_ProfileNav_ON_TAP');
                  logFirebaseEvent('ProfileNav_navigate_to');

                  context.pushNamed(ProfileConfigWidget.routeName);

                  logFirebaseEvent('ProfileNav_update_component_state');
                  _model.jNColor = Color(0xB3A27B5C);
                  _model.rNColor = Color(0xB3A27B5C);
                  _model.pNColor = Color(0xFFDCD7C9);
                  safeSetState(() {});
                },
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(
                      Icons.person,
                      color: _model.pNColor,
                      size: 24.0,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
