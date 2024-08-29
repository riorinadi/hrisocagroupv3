import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/custom_code/actions/index.dart' as actions;
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'choose_office_model.dart';
export 'choose_office_model.dart';

class ChooseOfficeWidget extends StatefulWidget {
  const ChooseOfficeWidget({super.key});

  @override
  State<ChooseOfficeWidget> createState() => _ChooseOfficeWidgetState();
}

class _ChooseOfficeWidgetState extends State<ChooseOfficeWidget> {
  late ChooseOfficeModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  LatLng? currentUserLocationValue;

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ChooseOfficeModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      currentUserLocationValue =
          await getCurrentUserLocation(defaultLocation: const LatLng(0.0, 0.0));
      _model.settingsOutput = await querySettingsRecordOnce(
        singleRecord: true,
      ).then((s) => s.firstOrNull);
      _model.totaldoc = null;
      _model.minimumRadius = _model.settingsOutput?.minRadius.toDouble();
      setState(() {});
      FFAppState().officeAppState = [];
      setState(() {});
      _model.officeoutput = await queryOfficeRecordOnce();
      _model.totaldoc = _model.officeoutput?.length;
      setState(() {});
      while (_model.totaldoc! > 0) {
        _model.totaldoc = _model.totaldoc! + -1;
        setState(() {});
        _model.outputdistance = await actions.getDistance(
          _model.officeoutput![_model.totaldoc!].latlong!,
          currentUserLocationValue!,
        );
        FFAppState().addToOfficeAppState(OfficeDatatypeStruct(
          name: _model.officeoutput?[_model.totaldoc!].name,
          distance: _model.outputdistance,
          officeRef: _model.officeoutput?[_model.totaldoc!].reference,
        ));
        setState(() {});
      }
    });

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Title(
        title: 'ChooseOffice',
        color: FlutterFlowTheme.of(context).primary.withAlpha(0XFF),
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Scaffold(
            key: scaffoldKey,
            backgroundColor: const Color(0xFFF1F4F8),
            appBar: PreferredSize(
              preferredSize: const Size.fromHeight(80.0),
              child: AppBar(
                backgroundColor: FlutterFlowTheme.of(context).customColor12,
                automaticallyImplyLeading: false,
                leading: Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(0.0, 15.0, 0.0, 15.0),
                  child: FlutterFlowIconButton(
                    borderColor: Colors.transparent,
                    borderRadius: 100.0,
                    borderWidth: 1.0,
                    buttonSize: 60.0,
                    icon: const Icon(
                      Icons.chevron_left,
                      color: Colors.white,
                      size: 20.0,
                    ),
                    onPressed: () async {
                      context.pop();
                    },
                  ),
                ),
                title: Text(
                  'Choose Office',
                  style: FlutterFlowTheme.of(context).headlineMedium.override(
                        fontFamily: 'Poppins',
                        color: Colors.white,
                        fontSize: 18.0,
                        letterSpacing: 0.0,
                        fontWeight: FontWeight.w500,
                      ),
                ),
                actions: const [],
                centerTitle: true,
                toolbarHeight: double.infinity,
                elevation: 2.0,
              ),
            ),
            body: SafeArea(
              top: true,
              child: SingleChildScrollView(
                primary: false,
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(10.0, 10.0, 10.0, 0.0),
                      child: Builder(
                        builder: (context) {
                          final officeGen = FFAppState()
                              .officeAppState
                              .sortedList(keyOf: (e) => e.distance, desc: false)
                              .toList();

                          return ListView.separated(
                            padding: EdgeInsets.zero,
                            shrinkWrap: true,
                            scrollDirection: Axis.vertical,
                            itemCount: officeGen.length,
                            separatorBuilder: (_, __) => const SizedBox(height: 5.0),
                            itemBuilder: (context, officeGenIndex) {
                              final officeGenItem = officeGen[officeGenIndex];
                              return InkWell(
                                splashColor: Colors.transparent,
                                focusColor: Colors.transparent,
                                hoverColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                onTap: () async {
                                  if (_model.minimumRadius! <
                                      officeGenItem.distance) {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                        content: const Text(
                                          'Office too far',
                                          style: TextStyle(
                                            color: Colors.white,
                                          ),
                                        ),
                                        duration: const Duration(milliseconds: 4000),
                                        backgroundColor:
                                            FlutterFlowTheme.of(context)
                                                .customColor12,
                                      ),
                                    );
                                  } else {
                                    context.pushNamed(
                                      'Dashboard',
                                      queryParameters: {
                                        'officeRef': serializeParam(
                                          officeGenItem.officeRef,
                                          ParamType.DocumentReference,
                                        ),
                                        'officeDistance': serializeParam(
                                          officeGenItem.distance,
                                          ParamType.double,
                                        ),
                                        'officeName': serializeParam(
                                          officeGenItem.name,
                                          ParamType.String,
                                        ),
                                      }.withoutNulls,
                                    );
                                  }
                                },
                                child: ListTile(
                                  leading: const FaIcon(
                                    FontAwesomeIcons.building,
                                  ),
                                  title: Text(
                                    officeGenItem.name,
                                    textAlign: TextAlign.start,
                                    style: FlutterFlowTheme.of(context)
                                        .titleLarge
                                        .override(
                                          fontFamily: 'Poppins',
                                          fontSize: 18.0,
                                          letterSpacing: 0.0,
                                          fontWeight: FontWeight.normal,
                                        ),
                                  ),
                                  subtitle: Text(
                                    formatNumber(
                                      officeGenItem.distance,
                                      formatType: FormatType.compact,
                                    ),
                                    style: FlutterFlowTheme.of(context)
                                        .labelMedium
                                        .override(
                                          fontFamily: 'Poppins',
                                          fontSize: 12.0,
                                          letterSpacing: 0.0,
                                        ),
                                  ),
                                  trailing: Icon(
                                    Icons.arrow_forward_ios,
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryText,
                                    size: 15.0,
                                  ),
                                  tileColor: FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                  dense: false,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(12.0),
                                  ),
                                ),
                              );
                            },
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ));
  }
}
