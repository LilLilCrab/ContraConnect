import '/backend/backend.dart';
import '/components/customnavbar_widget.dart';
import '/components/job_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'homeowner_jobs_model.dart';
export 'homeowner_jobs_model.dart';

class HomeownerJobsWidget extends StatefulWidget {
  const HomeownerJobsWidget({super.key});

  static String routeName = 'HomeownerJobs';
  static String routePath = '/homeownerJobs';

  @override
  State<HomeownerJobsWidget> createState() => _HomeownerJobsWidgetState();
}

class _HomeownerJobsWidgetState extends State<HomeownerJobsWidget> {
  late HomeownerJobsModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => HomeownerJobsModel());

    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'HomeownerJobs'});
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
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 24.0, 0.0, 24.0),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 24.0, 0.0),
                      child: Text(
                        'Jobs',
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
                      child: StreamBuilder<List<JobsRecord>>(
                        stream: queryJobsRecord(
                          queryBuilder: (jobsRecord) => jobsRecord.where(
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
                                      'HOMEOWNER_JOBS_Container_rhj7dwht_ON_TAP');
                                  logFirebaseEvent('job_navigate_to');

                                  context.pushNamed(
                                    HomeownerJobDetailsWidget.routeName,
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
                                      'Keyrhj_${listViewIndex}_of_${listViewJobsRecordList.length}'),
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
      ),
    );
  }
}
