import '/backend/backend.dart';
import '/components/customnavbar_widget.dart';
import '/components/job_widget.dart';
import '/flutter_flow/flutter_flow_autocomplete_options_list.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:text_search/text_search.dart';
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
    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      logFirebaseEvent('HOMEOWNER_JOBS_HomeownerJobs_ON_INIT_STA');
      logFirebaseEvent('HomeownerJobs_update_app_state');
      FFAppState().searchIsActive = false;
      safeSetState(() {});
    });

    _model.searchFieldTextController ??= TextEditingController();

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return StreamBuilder<List<JobsRecord>>(
      stream: queryJobsRecord(
        queryBuilder: (jobsRecord) => jobsRecord.where(
          'completed',
          isEqualTo: false,
        ),
      ),
      builder: (context, snapshot) {
        // Customize what your widget looks like when it's loading.
        if (!snapshot.hasData) {
          return Scaffold(
            backgroundColor: Color(0xFFDCD7C9),
            body: Center(
              child: SizedBox(
                width: 50.0,
                height: 50.0,
                child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(
                    FlutterFlowTheme.of(context).primary,
                  ),
                ),
              ),
            ),
          );
        }
        List<JobsRecord> homeownerJobsJobsRecordList = snapshot.data!;

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
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Align(
                    alignment: AlignmentDirectional(-1.0, -1.0),
                    child: Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(24.0, 12.0, 0.0, 0.0),
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
                  ),
                  Container(
                    width: 300.0,
                    height: 65.0,
                    decoration: BoxDecoration(
                      color: Color(0xDCFFFFFF),
                      borderRadius: BorderRadius.circular(24.0),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        FlutterFlowIconButton(
                          borderRadius: 8.0,
                          buttonSize: 40.0,
                          icon: Icon(
                            Icons.search,
                            color: Color(0xFFA27B5C),
                            size: 24.0,
                          ),
                          onPressed: () async {
                            logFirebaseEvent(
                                'HOMEOWNER_JOBS_PAGE_search_ICN_ON_TAP');
                            logFirebaseEvent('IconButton_firestore_query');
                            await queryJobsRecordOnce(
                              queryBuilder: (jobsRecord) =>
                                  jobsRecord.whereIn('title', ['']),
                            );
                          },
                        ),
                        Expanded(
                          child: Align(
                            alignment: AlignmentDirectional(0.02, 0.0),
                            child: Container(
                              width: 200.0,
                              child: Autocomplete<String>(
                                initialValue: TextEditingValue(),
                                optionsBuilder: (textEditingValue) {
                                  if (textEditingValue.text == '') {
                                    return const Iterable<String>.empty();
                                  }
                                  return homeownerJobsJobsRecordList
                                      .map((e) => e.title)
                                      .toList()
                                      .where((option) {
                                    final lowercaseOption =
                                        option.toLowerCase();
                                    return lowercaseOption.contains(
                                        textEditingValue.text.toLowerCase());
                                  });
                                },
                                optionsViewBuilder:
                                    (context, onSelected, options) {
                                  return AutocompleteOptionsList(
                                    textFieldKey: _model.searchFieldKey,
                                    textController:
                                        _model.searchFieldTextController!,
                                    options: options.toList(),
                                    onSelected: onSelected,
                                    textStyle: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          font: GoogleFonts.inter(
                                            fontWeight:
                                                FlutterFlowTheme.of(context)
                                                    .bodyMedium
                                                    .fontWeight,
                                            fontStyle:
                                                FlutterFlowTheme.of(context)
                                                    .bodyMedium
                                                    .fontStyle,
                                          ),
                                          letterSpacing: 0.0,
                                          fontWeight:
                                              FlutterFlowTheme.of(context)
                                                  .bodyMedium
                                                  .fontWeight,
                                          fontStyle:
                                              FlutterFlowTheme.of(context)
                                                  .bodyMedium
                                                  .fontStyle,
                                        ),
                                    textHighlightStyle: TextStyle(),
                                    elevation: 4.0,
                                    optionBackgroundColor:
                                        FlutterFlowTheme.of(context)
                                            .primaryBackground,
                                    optionHighlightColor:
                                        FlutterFlowTheme.of(context)
                                            .secondaryBackground,
                                    maxHeight: 200.0,
                                  );
                                },
                                onSelected: (String selection) {
                                  safeSetState(() => _model
                                      .searchFieldSelectedOption = selection);
                                  FocusScope.of(context).unfocus();
                                },
                                fieldViewBuilder: (
                                  context,
                                  textEditingController,
                                  focusNode,
                                  onEditingComplete,
                                ) {
                                  _model.searchFieldFocusNode = focusNode;

                                  _model.searchFieldTextController =
                                      textEditingController;
                                  return TextFormField(
                                    key: _model.searchFieldKey,
                                    controller: textEditingController,
                                    focusNode: focusNode,
                                    onEditingComplete: onEditingComplete,
                                    onChanged: (_) => EasyDebounce.debounce(
                                      '_model.searchFieldTextController',
                                      Duration(milliseconds: 2000),
                                      () async {
                                        logFirebaseEvent(
                                            'HOMEOWNER_JOBS_searchField_ON_TEXTFIELD_');
                                        logFirebaseEvent(
                                            'searchField_simple_search');
                                        safeSetState(() {
                                          _model.simpleSearchResults =
                                              TextSearch(
                                            homeownerJobsJobsRecordList
                                                .map(
                                                  (record) =>
                                                      TextSearchItem.fromTerms(
                                                          record, [
                                                    record.title,
                                                    record.details,
                                                    record.typeOfWork,
                                                    record.startingPrice
                                                  ]),
                                                )
                                                .toList(),
                                          )
                                                  .search(_model
                                                      .searchFieldTextController
                                                      .text)
                                                  .map((r) => r.object)
                                                  .toList();
                                          ;
                                        });
                                        logFirebaseEvent(
                                            'searchField_update_app_state');
                                        FFAppState().searchIsActive = true;
                                        safeSetState(() {});
                                      },
                                    ),
                                    autofocus: false,
                                    enabled: true,
                                    autofillHints: [AutofillHints.jobTitle],
                                    obscureText: false,
                                    decoration: InputDecoration(
                                      isDense: true,
                                      labelStyle: FlutterFlowTheme.of(context)
                                          .labelMedium
                                          .override(
                                            font: GoogleFonts.inter(
                                              fontWeight:
                                                  FlutterFlowTheme.of(context)
                                                      .labelMedium
                                                      .fontWeight,
                                              fontStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .labelMedium
                                                      .fontStyle,
                                            ),
                                            letterSpacing: 0.0,
                                            fontWeight:
                                                FlutterFlowTheme.of(context)
                                                    .labelMedium
                                                    .fontWeight,
                                            fontStyle:
                                                FlutterFlowTheme.of(context)
                                                    .labelMedium
                                                    .fontStyle,
                                          ),
                                      hintText: 'Search for work..!',
                                      hintStyle: FlutterFlowTheme.of(context)
                                          .labelMedium
                                          .override(
                                            font: GoogleFonts.inter(
                                              fontWeight:
                                                  FlutterFlowTheme.of(context)
                                                      .labelMedium
                                                      .fontWeight,
                                              fontStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .labelMedium
                                                      .fontStyle,
                                            ),
                                            color: Color(0xB557636C),
                                            letterSpacing: 0.0,
                                            fontWeight:
                                                FlutterFlowTheme.of(context)
                                                    .labelMedium
                                                    .fontWeight,
                                            fontStyle:
                                                FlutterFlowTheme.of(context)
                                                    .labelMedium
                                                    .fontStyle,
                                          ),
                                      enabledBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: Color(0x00000000),
                                          width: 1.0,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: Color(0x00000000),
                                          width: 1.0,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                      ),
                                      errorBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: FlutterFlowTheme.of(context)
                                              .error,
                                          width: 1.0,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                      ),
                                      focusedErrorBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: FlutterFlowTheme.of(context)
                                              .error,
                                          width: 1.0,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                      ),
                                      filled: true,
                                      fillColor: FlutterFlowTheme.of(context)
                                          .secondaryBackground,
                                    ),
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          font: GoogleFonts.inter(
                                            fontWeight:
                                                FlutterFlowTheme.of(context)
                                                    .bodyMedium
                                                    .fontWeight,
                                            fontStyle:
                                                FlutterFlowTheme.of(context)
                                                    .bodyMedium
                                                    .fontStyle,
                                          ),
                                          letterSpacing: 0.0,
                                          fontWeight:
                                              FlutterFlowTheme.of(context)
                                                  .bodyMedium
                                                  .fontWeight,
                                          fontStyle:
                                              FlutterFlowTheme.of(context)
                                                  .bodyMedium
                                                  .fontStyle,
                                        ),
                                    cursorColor: FlutterFlowTheme.of(context)
                                        .primaryText,
                                    enableInteractiveSelection: true,
                                    validator: _model
                                        .searchFieldTextControllerValidator
                                        .asValidator(context),
                                  );
                                },
                              ),
                            ),
                          ),
                        ),
                        FlutterFlowIconButton(
                          borderRadius: 8.0,
                          buttonSize: 40.0,
                          icon: Icon(
                            Icons.clear,
                            color: Color(0xFFA27B5C),
                            size: 24.0,
                          ),
                          onPressed: () async {
                            logFirebaseEvent(
                                'HOMEOWNER_JOBS_PAGE_clear_ICN_ON_TAP');
                            logFirebaseEvent(
                                'IconButton_clear_text_fields_pin_codes');
                            safeSetState(() {
                              _model.searchFieldTextController?.clear();
                            });
                            logFirebaseEvent('IconButton_update_app_state');
                            FFAppState().searchIsActive = false;
                            safeSetState(() {});
                          },
                        ),
                      ],
                    ),
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 0.0, 0.0),
                        child: Text(
                          'Search results',
                          style:
                              FlutterFlowTheme.of(context).titleSmall.override(
                                    font: GoogleFonts.interTight(
                                      fontWeight: FlutterFlowTheme.of(context)
                                          .titleSmall
                                          .fontWeight,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .titleSmall
                                          .fontStyle,
                                    ),
                                    letterSpacing: 0.0,
                                    fontWeight: FlutterFlowTheme.of(context)
                                        .titleSmall
                                        .fontWeight,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .titleSmall
                                        .fontStyle,
                                  ),
                        ),
                      ),
                      Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 24.0, 0.0),
                        child: Text(
                          _model.simpleSearchResults.length.toString(),
                          style:
                              FlutterFlowTheme.of(context).titleSmall.override(
                                    font: GoogleFonts.interTight(
                                      fontWeight: FlutterFlowTheme.of(context)
                                          .titleSmall
                                          .fontWeight,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .titleSmall
                                          .fontStyle,
                                    ),
                                    letterSpacing: 0.0,
                                    fontWeight: FlutterFlowTheme.of(context)
                                        .titleSmall
                                        .fontWeight,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .titleSmall
                                        .fontStyle,
                                  ),
                        ),
                      ),
                    ],
                  ),
                  if (!FFAppState().searchIsActive)
                    Builder(
                      builder: (context) {
                        final nosearch = homeownerJobsJobsRecordList.toList();

                        return ListView.separated(
                          padding: EdgeInsets.zero,
                          shrinkWrap: true,
                          scrollDirection: Axis.vertical,
                          itemCount: nosearch.length,
                          separatorBuilder: (_, __) => SizedBox(height: 12.0),
                          itemBuilder: (context, nosearchIndex) {
                            final nosearchItem = nosearch[nosearchIndex];
                            return InkWell(
                              splashColor: Colors.transparent,
                              focusColor: Colors.transparent,
                              hoverColor: Colors.transparent,
                              highlightColor: Colors.transparent,
                              onTap: () async {
                                logFirebaseEvent(
                                    'HOMEOWNER_JOBS_Container_27rcsn4p_ON_TAP');
                                logFirebaseEvent('job_navigate_to');

                                context.pushNamed(
                                  HomeownerJobDetailsWidget.routeName,
                                  queryParameters: {
                                    'job': serializeParam(
                                      nosearchItem,
                                      ParamType.Document,
                                    ),
                                  }.withoutNulls,
                                  extra: <String, dynamic>{
                                    'job': nosearchItem,
                                  },
                                );
                              },
                              child: JobWidget(
                                key: Key(
                                    'Key27r_${nosearchIndex}_of_${nosearch.length}'),
                                job: nosearchItem,
                              ),
                            );
                          },
                        );
                      },
                    ),
                  if (FFAppState().searchIsActive)
                    Builder(
                      builder: (context) {
                        final jobsearch = _model.simpleSearchResults.toList();

                        return ListView.separated(
                          padding: EdgeInsets.zero,
                          shrinkWrap: true,
                          scrollDirection: Axis.vertical,
                          itemCount: jobsearch.length,
                          separatorBuilder: (_, __) => SizedBox(height: 12.0),
                          itemBuilder: (context, jobsearchIndex) {
                            final jobsearchItem = jobsearch[jobsearchIndex];
                            return InkWell(
                              splashColor: Colors.transparent,
                              focusColor: Colors.transparent,
                              hoverColor: Colors.transparent,
                              highlightColor: Colors.transparent,
                              onTap: () async {
                                logFirebaseEvent(
                                    'HOMEOWNER_JOBS_Container_e4tgrvsr_ON_TAP');
                                logFirebaseEvent('job_navigate_to');

                                context.pushNamed(
                                  HomeownerJobDetailsWidget.routeName,
                                  queryParameters: {
                                    'job': serializeParam(
                                      jobsearchItem,
                                      ParamType.Document,
                                    ),
                                  }.withoutNulls,
                                  extra: <String, dynamic>{
                                    'job': jobsearchItem,
                                  },
                                );
                              },
                              child: JobWidget(
                                key: Key(
                                    'Keye4t_${jobsearchIndex}_of_${jobsearch.length}'),
                                job: jobsearchItem,
                              ),
                            );
                          },
                        );
                      },
                    ),
                  Flexible(
                    child: Align(
                      alignment: AlignmentDirectional(0.0, 1.0),
                      child: wrapWithModel(
                        model: _model.customnavbarModel,
                        updateCallback: () => safeSetState(() {}),
                        child: CustomnavbarWidget(),
                      ),
                    ),
                  ),
                ].divide(SizedBox(height: 24.0)),
              ),
            ),
          ),
        );
      },
    );
  }
}
