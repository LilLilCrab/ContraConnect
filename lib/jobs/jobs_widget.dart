import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/customnavbar_widget.dart';
import '/components/job_widget.dart';
import '/components/new_job_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'jobs_model.dart';
export 'jobs_model.dart';

class JobsWidget extends StatefulWidget {
  const JobsWidget({super.key});

  static String routeName = 'jobs';
  static String routePath = '/jobs';

  @override
  State<JobsWidget> createState() => _JobsWidgetState();
}

class _JobsWidgetState extends State<JobsWidget> {
  late JobsModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => JobsModel());

    logFirebaseEvent('screen_view', parameters: {'screen_name': 'jobs'});
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
        floatingActionButton: Padding(
          padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 102.0),
          child: FloatingActionButton(
            onPressed: () async {
              logFirebaseEvent('JOBS_FloatingActionButton_080j79p3_ON_TA');
              if (valueOrDefault<bool>(
                  currentUserDocument?.isVerified, false)) {
                logFirebaseEvent('FloatingActionButton_bottom_sheet');
                await showModalBottomSheet(
                  isScrollControlled: true,
                  backgroundColor: Colors.transparent,
                  context: context,
                  builder: (context) {
                    return GestureDetector(
                      onTap: () {
                        FocusScope.of(context).unfocus();
                        FocusManager.instance.primaryFocus?.unfocus();
                      },
                      child: Padding(
                        padding: MediaQuery.viewInsetsOf(context),
                        child: NewJobWidget(),
                      ),
                    );
                  },
                ).then((value) => safeSetState(() {}));
              } else {
                logFirebaseEvent('FloatingActionButton_show_snack_bar');
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(
                      'ERROR: NOT Verified',
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            font: GoogleFonts.inter(
                              fontWeight: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .fontWeight,
                              fontStyle: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .fontStyle,
                            ),
                            color: FlutterFlowTheme.of(context).primaryText,
                            letterSpacing: 0.0,
                            fontWeight: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .fontWeight,
                            fontStyle: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .fontStyle,
                          ),
                    ),
                    duration: Duration(milliseconds: 4000),
                    backgroundColor: FlutterFlowTheme.of(context).secondary,
                  ),
                );
              }
            },
            elevation: 0.0,
            child: Container(
              width: double.infinity,
              height: double.infinity,
              decoration: BoxDecoration(
                color: Color(0xFFA27B5C),
                borderRadius: BorderRadius.circular(50.0),
                border: Border.all(
                  color: FlutterFlowTheme.of(context).primaryText,
                  width: 1.0,
                ),
              ),
              child: Icon(
                Icons.add_rounded,
                color: FlutterFlowTheme.of(context).primaryText,
                size: 30.0,
              ),
            ),
          ),
        ),
        body: Stack(
          children: [
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0.0, 24.0, 0.0, 45.0),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 24.0, 0.0),
                    child: Text(
                      'Jobs',
                      style:
                          FlutterFlowTheme.of(context).headlineMedium.override(
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
                    child: StreamBuilder<List<JobsRecord>>(
                      stream: queryJobsRecord(
                        queryBuilder: (jobsRecord) => jobsRecord
                            .where(
                              'user',
                              isEqualTo: currentUserReference,
                            )
                            .where(
                              'completed',
                              isEqualTo: false,
                            ),
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
                        List<JobsRecord> listViewJobsRecordList =
                            snapshot.data!;

                        return ListView.separated(
                          padding: EdgeInsets.zero,
                          scrollDirection: Axis.vertical,
                          itemCount: listViewJobsRecordList.length,
                          separatorBuilder: (_, __) => SizedBox(height: 12.0),
                          itemBuilder: (context, listViewIndex) {
                            final listViewJobsRecord =
                                listViewJobsRecordList[listViewIndex];
                            return InkWell(
                              splashColor: Colors.transparent,
                              focusColor: Colors.transparent,
                              hoverColor: Colors.transparent,
                              highlightColor: Colors.transparent,
                              onTap: () async {
                                logFirebaseEvent(
                                    'JOBS_PAGE_Container_n5z5p4ub_ON_TAP');
                                logFirebaseEvent('job_navigate_to');

                                context.pushNamed(
                                  JobDetailsWidget.routeName,
                                  queryParameters: {
                                    'job': serializeParam(
                                      listViewJobsRecord,
                                      ParamType.Document,
                                    ),
                                  }.withoutNulls,
                                  extra: <String, dynamic>{
                                    'job': listViewJobsRecord,
                                  },
                                );
                              },
                              child: JobWidget(
                                key: Key(
                                    'Keyn5z_${listViewIndex}_of_${listViewJobsRecordList.length}'),
                                job: listViewJobsRecord,
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
            wrapWithModel(
              model: _model.customnavbarModel,
              updateCallback: () => safeSetState(() {}),
              child: CustomnavbarWidget(),
            ),
          ],
        ),
      ),
    );
  }
}
