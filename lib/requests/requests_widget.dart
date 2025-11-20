import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/customnavbar_widget.dart';
import '/components/list_request_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'requests_model.dart';
export 'requests_model.dart';

class RequestsWidget extends StatefulWidget {
  const RequestsWidget({super.key});

  static String routeName = 'requests';
  static String routePath = '/requests';

  @override
  State<RequestsWidget> createState() => _RequestsWidgetState();
}

class _RequestsWidgetState extends State<RequestsWidget> {
  late RequestsModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => RequestsModel());

    logFirebaseEvent('screen_view', parameters: {'screen_name': 'requests'});
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
          child: Stack(
            children: [
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 24.0, 0.0, 45.0),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 24.0, 0.0),
                      child: Text(
                        'Requests',
                        style: FlutterFlowTheme.of(context)
                            .headlineMedium
                            .override(
                              font: GoogleFonts.interTight(
                                fontWeight: FlutterFlowTheme.of(context)
                                    .headlineMedium
                                    .fontWeight,
                                fontStyle: FlutterFlowTheme.of(context)
                                    .headlineMedium
                                    .fontStyle,
                              ),
                              letterSpacing: 0.0,
                              fontWeight: FlutterFlowTheme.of(context)
                                  .headlineMedium
                                  .fontWeight,
                              fontStyle: FlutterFlowTheme.of(context)
                                  .headlineMedium
                                  .fontStyle,
                            ),
                      ),
                    ),
                    Expanded(
                      child: StreamBuilder<List<RequestsRecord>>(
                        stream: queryRequestsRecord(
                          queryBuilder: (requestsRecord) =>
                              requestsRecord.where(Filter.or(
                            Filter(
                              'homeowner_ref',
                              isEqualTo: currentUserUid,
                            ),
                            Filter(
                              'contractor_ref',
                              isEqualTo: currentUserReference,
                            ),
                          )),
                        ),
                        builder: (context, snapshot) {
                          // Customize what your widget looks like when it's loading.
                          if (!snapshot.hasData) {
                            return Center(
                              child: SizedBox(
                                width: 50.0,
                                height: 50.0,
                                child: CircularProgressIndicator(
                                  valueColor: AlwaysStoppedAnimation<Color>(
                                    FlutterFlowTheme.of(context).primary,
                                  ),
                                ),
                              ),
                            );
                          }
                          List<RequestsRecord> listViewRequestsRecordList =
                              snapshot.data!;

                          return ListView.separated(
                            padding: EdgeInsets.zero,
                            shrinkWrap: true,
                            scrollDirection: Axis.vertical,
                            itemCount: listViewRequestsRecordList.length,
                            separatorBuilder: (_, __) => SizedBox(height: 12.0),
                            itemBuilder: (context, listViewIndex) {
                              final listViewRequestsRecord =
                                  listViewRequestsRecordList[listViewIndex];
                              return InkWell(
                                splashColor: Colors.transparent,
                                focusColor: Colors.transparent,
                                hoverColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                onTap: () async {
                                  logFirebaseEvent(
                                      'REQUESTS_PAGE_Container_guu23x1w_ON_TAP');
                                  if (valueOrDefault<bool>(
                                      currentUserDocument?.isHomeowner,
                                      false)) {
                                    logFirebaseEvent(
                                        'list_request_navigate_to');

                                    context.pushNamed(
                                      HomeownerReqDetailsWidget.routeName,
                                      queryParameters: {
                                        'request': serializeParam(
                                          listViewRequestsRecord,
                                          ParamType.Document,
                                        ),
                                      }.withoutNulls,
                                      extra: <String, dynamic>{
                                        'request': listViewRequestsRecord,
                                      },
                                    );
                                  } else {
                                    logFirebaseEvent(
                                        'list_request_navigate_to');

                                    context.pushNamed(
                                      ContractorReqDetailsWidget.routeName,
                                      queryParameters: {
                                        'request': serializeParam(
                                          listViewRequestsRecord,
                                          ParamType.Document,
                                        ),
                                      }.withoutNulls,
                                      extra: <String, dynamic>{
                                        'request': listViewRequestsRecord,
                                      },
                                    );
                                  }
                                },
                                child: ListRequestWidget(
                                  key: Key(
                                      'Keyguu_${listViewIndex}_of_${listViewRequestsRecordList.length}'),
                                  request: listViewRequestsRecord,
                                ),
                              );
                            },
                          );
                        },
                      ),
                    ),
                  ].divide(SizedBox(height: 12.0)),
                ),
              ),
              Align(
                alignment: AlignmentDirectional(0.0, 1.0),
                child: wrapWithModel(
                  model: _model.customnavbarModel,
                  updateCallback: () => safeSetState(() {}),
                  child: CustomnavbarWidget(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
