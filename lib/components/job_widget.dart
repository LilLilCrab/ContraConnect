import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'job_model.dart';
export 'job_model.dart';

class JobWidget extends StatefulWidget {
  const JobWidget({
    super.key,
    required this.job,
  });

  final JobsRecord? job;

  @override
  State<JobWidget> createState() => _JobWidgetState();
}

class _JobWidgetState extends State<JobWidget> {
  late JobModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => JobModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 24.0, 0.0),
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          color: Color(0xFFA27B5C),
          borderRadius: BorderRadius.circular(24.0),
          border: Border.all(
            color: FlutterFlowTheme.of(context).primaryText,
          ),
        ),
        child: Padding(
          padding: EdgeInsets.all(12.0),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            children: [
              Theme(
                data: ThemeData(
                  checkboxTheme: CheckboxThemeData(
                    visualDensity: VisualDensity.compact,
                    materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                    shape: CircleBorder(),
                  ),
                  unselectedWidgetColor: FlutterFlowTheme.of(context).alternate,
                ),
                child: Checkbox(
                  value: _model.checkboxValue ??= widget.job!.completed,
                  onChanged: (newValue) async {
                    safeSetState(() => _model.checkboxValue = newValue!);
                  },
                  side: (FlutterFlowTheme.of(context).alternate != null)
                      ? BorderSide(
                          width: 2,
                          color: FlutterFlowTheme.of(context).alternate,
                        )
                      : null,
                  activeColor: FlutterFlowTheme.of(context).primaryText,
                  checkColor: FlutterFlowTheme.of(context).info,
                ),
              ),
              Flexible(
                child: Text(
                  valueOrDefault<String>(
                    widget.job?.title,
                    'title',
                  ),
                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                        font: GoogleFonts.inter(
                          fontWeight: FlutterFlowTheme.of(context)
                              .bodyMedium
                              .fontWeight,
                          fontStyle:
                              FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                        ),
                        letterSpacing: 0.0,
                        fontWeight:
                            FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                        fontStyle:
                            FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                      ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
