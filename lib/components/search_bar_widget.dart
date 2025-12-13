import '/backend/backend.dart';
import '/components/job_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'search_bar_model.dart';
export 'search_bar_model.dart';

class SearchBarWidget extends StatefulWidget {
  const SearchBarWidget({super.key});

  @override
  State<SearchBarWidget> createState() => _SearchBarWidgetState();
}

class _SearchBarWidgetState extends State<SearchBarWidget> {
  late SearchBarModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SearchBarModel());

    _model.searchFieldTextController ??= TextEditingController();
    _model.searchFieldFocusNode ??= FocusNode();

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
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
                  logFirebaseEvent('SEARCH_BAR_COMP_search_ICN_ON_TAP');
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
                    child: TextFormField(
                      controller: _model.searchFieldTextController,
                      focusNode: _model.searchFieldFocusNode,
                      onChanged: (_) => EasyDebounce.debounce(
                        '_model.searchFieldTextController',
                        Duration(milliseconds: 2000),
                        () async {
                          logFirebaseEvent(
                              'SEARCH_BAR_searchField_ON_TEXTFIELD_CHAN');
                          logFirebaseEvent(
                              'searchField_update_component_state');
                          _model.searchText =
                              _model.searchFieldTextController.text;
                          safeSetState(() {});
                          logFirebaseEvent('searchField_update_app_state');
                          FFAppState().searchIsActive = true;
                          safeSetState(() {});
                        },
                      ),
                      autofocus: false,
                      enabled: true,
                      obscureText: false,
                      decoration: InputDecoration(
                        isDense: true,
                        labelStyle:
                            FlutterFlowTheme.of(context).labelMedium.override(
                                  font: GoogleFonts.inter(
                                    fontWeight: FlutterFlowTheme.of(context)
                                        .labelMedium
                                        .fontWeight,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .labelMedium
                                        .fontStyle,
                                  ),
                                  letterSpacing: 0.0,
                                  fontWeight: FlutterFlowTheme.of(context)
                                      .labelMedium
                                      .fontWeight,
                                  fontStyle: FlutterFlowTheme.of(context)
                                      .labelMedium
                                      .fontStyle,
                                ),
                        hintText: 'Search for work..!',
                        hintStyle:
                            FlutterFlowTheme.of(context).labelMedium.override(
                                  font: GoogleFonts.inter(
                                    fontWeight: FlutterFlowTheme.of(context)
                                        .labelMedium
                                        .fontWeight,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .labelMedium
                                        .fontStyle,
                                  ),
                                  color: Color(0xB557636C),
                                  letterSpacing: 0.0,
                                  fontWeight: FlutterFlowTheme.of(context)
                                      .labelMedium
                                      .fontWeight,
                                  fontStyle: FlutterFlowTheme.of(context)
                                      .labelMedium
                                      .fontStyle,
                                ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Color(0x00000000),
                            width: 1.0,
                          ),
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Color(0x00000000),
                            width: 1.0,
                          ),
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        errorBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: FlutterFlowTheme.of(context).error,
                            width: 1.0,
                          ),
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        focusedErrorBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: FlutterFlowTheme.of(context).error,
                            width: 1.0,
                          ),
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        filled: true,
                        fillColor:
                            FlutterFlowTheme.of(context).secondaryBackground,
                      ),
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            font: GoogleFonts.inter(
                              fontWeight: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .fontWeight,
                              fontStyle: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .fontStyle,
                            ),
                            letterSpacing: 0.0,
                            fontWeight: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .fontWeight,
                            fontStyle: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .fontStyle,
                          ),
                      cursorColor: FlutterFlowTheme.of(context).primaryText,
                      enableInteractiveSelection: true,
                      validator: _model.searchFieldTextControllerValidator
                          .asValidator(context),
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
                  logFirebaseEvent('SEARCH_BAR_COMP_clear_ICN_ON_TAP');
                  logFirebaseEvent('IconButton_clear_text_fields_pin_codes');
                  safeSetState(() {
                    _model.searchFieldTextController?.clear();
                  });
                },
              ),
            ],
          ),
        ),
        StreamBuilder<List<JobsRecord>>(
          stream: queryJobsRecord(
            queryBuilder: (jobsRecord) => jobsRecord.where(Filter.or(
              Filter(
                'details',
                isEqualTo: _model.searchText,
              ),
              Filter(
                'title',
                isLessThanOrEqualTo: _model.searchText,
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
            List<JobsRecord> listViewJobsRecordList = snapshot.data!;

            return ListView.separated(
              padding: EdgeInsets.zero,
              shrinkWrap: true,
              scrollDirection: Axis.vertical,
              itemCount: listViewJobsRecordList.length,
              separatorBuilder: (_, __) => SizedBox(height: 12.0),
              itemBuilder: (context, listViewIndex) {
                final listViewJobsRecord =
                    listViewJobsRecordList[listViewIndex];
                return Visibility(
                  visible: () {
                    if ((listViewJobsRecord.title == _model.searchText) &&
                        !listViewJobsRecord.completed) {
                      return true;
                    } else if ((listViewJobsRecord.details ==
                            _model.searchText) &&
                        !listViewJobsRecord.completed) {
                      return true;
                    } else {
                      return false;
                    }
                  }(),
                  child: InkWell(
                    splashColor: Colors.transparent,
                    focusColor: Colors.transparent,
                    hoverColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    onTap: () async {
                      logFirebaseEvent('SEARCH_BAR_Container_zron673y_ON_TAP');
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
                          'Keyzro_${listViewIndex}_of_${listViewJobsRecordList.length}'),
                      job: listViewJobsRecord,
                    ),
                  ),
                );
              },
            );
          },
        ),
      ],
    );
  }
}
