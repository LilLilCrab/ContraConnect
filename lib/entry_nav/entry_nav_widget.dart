import '/auth/firebase_auth/auth_util.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'entry_nav_model.dart';
export 'entry_nav_model.dart';

class EntryNavWidget extends StatefulWidget {
  const EntryNavWidget({super.key});

  static String routeName = 'Entry_Nav';
  static String routePath = '/entryNav';

  @override
  State<EntryNavWidget> createState() => _EntryNavWidgetState();
}

class _EntryNavWidgetState extends State<EntryNavWidget> {
  late EntryNavModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => EntryNavModel());

    logFirebaseEvent('screen_view', parameters: {'screen_name': 'Entry_Nav'});
    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: Color(0xFFDCD7C9),
        body: SafeArea(
          top: true,
          child: Align(
            alignment: AlignmentDirectional(0.0, 0.0),
            child: InkWell(
              splashColor: Colors.transparent,
              focusColor: Colors.transparent,
              hoverColor: Colors.transparent,
              highlightColor: Colors.transparent,
              onTap: () async {
                logFirebaseEvent('ENTRY_NAV_PAGE_Column_7r9ooku8_ON_TAP');
                if (valueOrDefault<bool>(
                    currentUserDocument?.isHomeowner, false)) {
                  logFirebaseEvent('Column_navigate_to');

                  context.pushNamed(HomeownerJobsWidget.routeName);
                } else {
                  logFirebaseEvent('Column_navigate_to');

                  context.pushNamed(JobsWidget.routeName);
                }
              },
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Align(
                    alignment: AlignmentDirectional(0.0, 0.0),
                    child: Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 24.0),
                      child: Text(
                        'Tap to Connect!',
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              font: GoogleFonts.inter(
                                fontWeight: FontWeight.w500,
                                fontStyle: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .fontStyle,
                              ),
                              fontSize: 26.0,
                              letterSpacing: 0.0,
                              fontWeight: FontWeight.w500,
                              fontStyle: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .fontStyle,
                            ),
                      ),
                    ),
                  ),
                  Flexible(
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(2100.0),
                      child: Image.asset(
                        'assets/images/contraConnectLogo.png',
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
