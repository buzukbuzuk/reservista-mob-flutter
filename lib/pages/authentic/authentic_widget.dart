import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'authentic_model.dart';
export 'authentic_model.dart';

class AuthenticWidget extends StatefulWidget {
  const AuthenticWidget({
    super.key,
    this.tabIndex,
  });

  final int? tabIndex;

  @override
  State<AuthenticWidget> createState() => _AuthenticWidgetState();
}

class _AuthenticWidgetState extends State<AuthenticWidget>
    with TickerProviderStateMixin {
  late AuthenticModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  final animationsMap = <String, AnimationInfo>{};

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => AuthenticModel());

    _model.tabBarController = TabController(
      vsync: this,
      length: 2,
      initialIndex: min(
          valueOrDefault<int>(
            widget.tabIndex,
            0,
          ),
          1),
    )..addListener(() => setState(() {}));
    _model.nameTextController ??= TextEditingController();
    _model.nameFocusNode ??= FocusNode();

    _model.surnameTextController ??= TextEditingController();
    _model.surnameFocusNode ??= FocusNode();

    _model.phoneTextController ??= TextEditingController();
    _model.phoneFocusNode ??= FocusNode();

    _model.emailAddressCreateTextController ??= TextEditingController();
    _model.emailAddressCreateFocusNode ??= FocusNode();

    _model.passwordCreateTextController ??= TextEditingController();
    _model.passwordCreateFocusNode ??= FocusNode();

    _model.emailAddressTextController ??= TextEditingController();
    _model.emailAddressFocusNode ??= FocusNode();

    _model.passwordTextController ??= TextEditingController();
    _model.passwordFocusNode ??= FocusNode();

    animationsMap.addAll({
      'containerOnPageLoadAnimation': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          VisibilityEffect(duration: 1.ms),
          FadeEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 400.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
          MoveEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 400.0.ms,
            begin: Offset(0.0, 80.0),
            end: Offset(0.0, 0.0),
          ),
          ScaleEffect(
            curve: Curves.easeInOut,
            delay: 150.0.ms,
            duration: 400.0.ms,
            begin: Offset(0.8, 0.8),
            end: Offset(1.0, 1.0),
          ),
        ],
      ),
      'columnOnPageLoadAnimation1': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          VisibilityEffect(duration: 300.ms),
          FadeEffect(
            curve: Curves.easeInOut,
            delay: 300.0.ms,
            duration: 400.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
          MoveEffect(
            curve: Curves.easeInOut,
            delay: 300.0.ms,
            duration: 400.0.ms,
            begin: Offset(0.0, 20.0),
            end: Offset(0.0, 0.0),
          ),
        ],
      ),
      'columnOnPageLoadAnimation2': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          VisibilityEffect(duration: 300.ms),
          FadeEffect(
            curve: Curves.easeInOut,
            delay: 300.0.ms,
            duration: 400.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
          MoveEffect(
            curve: Curves.easeInOut,
            delay: 300.0.ms,
            duration: 400.0.ms,
            begin: Offset(0.0, 20.0),
            end: Offset(0.0, 0.0),
          ),
        ],
      ),
    });
  }

  @override
  void dispose() {
    _model.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => _model.unfocusNode.canRequestFocus
          ? FocusScope.of(context).requestFocus(_model.unfocusNode)
          : FocusScope.of(context).unfocus(),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
        body: SafeArea(
          top: true,
          child: Stack(
            children: [
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(32.0, 12.0, 32.0, 32.0),
                child: Container(
                  width: double.infinity,
                  height: 230.0,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(16.0),
                  ),
                  alignment: AlignmentDirectional(0.0, 0.0),
                  child: Padding(
                    padding:
                    EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 72.0),
                    child: Text(
                      'reservista',
                      style: FlutterFlowTheme.of(context).displaySmall.override(
                        fontFamily: 'Kumbh Sans',
                        letterSpacing: 0.0,
                      ),
                    ),
                  ),
                ),
              ),
              Align(
                alignment: AlignmentDirectional(0.0, -1.0),
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 170.0, 0.0, 0.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: EdgeInsets.all(12.0),
                        child: Container(
                          width: double.infinity,
                          height: MediaQuery.sizeOf(context).width >= 768.0
                              ? 530.0
                              : 630.0,
                          constraints: BoxConstraints(
                            maxWidth: 570.0,
                          ),
                          decoration: BoxDecoration(
                            color: FlutterFlowTheme.of(context)
                                .secondaryBackground,
                            boxShadow: [
                              BoxShadow(
                                blurRadius: 10.0,
                                color: Color(0x33000000),
                                offset: Offset(0.0, 2.0),
                              )
                            ],
                            borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(12.0),
                              bottomRight: Radius.circular(12.0),
                              topLeft: Radius.circular(36.0),
                              topRight: Radius.circular(36.0),
                            ),
                            border: Border.all(
                              color: FlutterFlowTheme.of(context)
                                  .primaryBackground,
                              width: 2.0,
                            ),
                          ),
                          child: Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 12.0, 0.0, 0.0),
                            child: Column(
                              children: [
                                Align(
                                  alignment: Alignment(0.0, 0),
                                  child: TabBar(
                                    isScrollable: true,
                                    labelColor: FlutterFlowTheme.of(context)
                                        .primaryText,
                                    unselectedLabelColor:
                                    FlutterFlowTheme.of(context)
                                        .secondaryText,
                                    labelPadding:
                                    EdgeInsetsDirectional.fromSTEB(
                                        32.0, 0.0, 32.0, 0.0),
                                    labelStyle: FlutterFlowTheme.of(context)
                                        .titleMedium
                                        .override(
                                      fontFamily: 'Inter',
                                      fontSize: 16.0,
                                      letterSpacing: 0.0,
                                      fontWeight: FontWeight.w600,
                                    ),
                                    unselectedLabelStyle:
                                    FlutterFlowTheme.of(context)
                                        .titleMedium
                                        .override(
                                      fontFamily: 'Inter',
                                      fontSize: 16.0,
                                      letterSpacing: 0.0,
                                      fontWeight: FontWeight.w600,
                                    ),
                                    indicatorColor: Colors.black,
                                    indicatorWeight: 3.0,
                                    tabs: [
                                      Tab(
                                        text: 'Create Account',
                                      ),
                                      Tab(
                                        text: 'Login',
                                      ),
                                    ],
                                    controller: _model.tabBarController,
                                    onTap: (i) async {
                                      [() async {}, () async {}][i]();
                                    },
                                  ),
                                ),
                                Expanded(
                                  child: TabBarView(
                                    controller: _model.tabBarController,
                                    children: [
                                      Align(
                                        alignment:
                                        AlignmentDirectional(0.0, -1.0),
                                        child: Padding(
                                          padding:
                                          EdgeInsetsDirectional.fromSTEB(
                                              24.0, 16.0, 24.0, 0.0),
                                          child: SingleChildScrollView(
                                            child: Column(
                                              mainAxisSize: MainAxisSize.max,
                                              crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                              children: [
                                                if (responsiveVisibility(
                                                  context: context,
                                                  phone: false,
                                                  tablet: false,
                                                ))
                                                  Container(
                                                    width: 230.0,
                                                    height: 40.0,
                                                    decoration: BoxDecoration(
                                                      color: FlutterFlowTheme
                                                          .of(context)
                                                          .secondaryBackground,
                                                    ),
                                                  ),
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                      0.0, 60.0, 0.0, 0.0),
                                                  child: Text(
                                                    'Name',
                                                    style: FlutterFlowTheme.of(
                                                        context)
                                                        .bodyMedium
                                                        .override(
                                                      fontFamily: 'Inter',
                                                      letterSpacing: 0.0,
                                                      fontWeight:
                                                      FontWeight.w600,
                                                    ),
                                                  ),
                                                ),
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                      0.0, 0.0, 0.0, 16.0),
                                                  child: Container(
                                                    width: double.infinity,
                                                    child: TextFormField(
                                                      controller: _model
                                                          .nameTextController,
                                                      focusNode: _model
                                                          .nameFocusNode,
                                                      autofocus: false,
                                                      autofillHints: [
                                                        AutofillHints.name
                                                      ],
                                                      obscureText: false,
                                                      decoration:
                                                      InputDecoration(
                                                        labelText:
                                                        'Enter your name',
                                                        labelStyle:
                                                        FlutterFlowTheme.of(
                                                            context)
                                                            .labelLarge
                                                            .override(
                                                          fontFamily:
                                                          'Inter',
                                                          letterSpacing:
                                                          0.0,
                                                        ),
                                                        enabledBorder:
                                                        OutlineInputBorder(
                                                          borderSide:
                                                          BorderSide(
                                                            color: Color(
                                                                0xFFBEC5D1),
                                                            width: 2.0,
                                                          ),
                                                          borderRadius:
                                                          BorderRadius
                                                              .circular(
                                                              12.0),
                                                        ),
                                                        focusedBorder:
                                                        OutlineInputBorder(
                                                          borderSide:
                                                          BorderSide(
                                                            color: FlutterFlowTheme
                                                                .of(context)
                                                                .primary,
                                                            width: 2.0,
                                                          ),
                                                          borderRadius:
                                                          BorderRadius
                                                              .circular(
                                                              12.0),
                                                        ),
                                                        errorBorder:
                                                        OutlineInputBorder(
                                                          borderSide:
                                                          BorderSide(
                                                            color: FlutterFlowTheme
                                                                .of(context)
                                                                .error,
                                                            width: 2.0,
                                                          ),
                                                          borderRadius:
                                                          BorderRadius
                                                              .circular(
                                                              12.0),
                                                        ),
                                                        focusedErrorBorder:
                                                        OutlineInputBorder(
                                                          borderSide:
                                                          BorderSide(
                                                            color: FlutterFlowTheme
                                                                .of(context)
                                                                .error,
                                                            width: 2.0,
                                                          ),
                                                          borderRadius:
                                                          BorderRadius
                                                              .circular(
                                                              12.0),
                                                        ),
                                                        filled: true,
                                                        fillColor: FlutterFlowTheme
                                                            .of(context)
                                                            .secondaryBackground,
                                                        contentPadding:
                                                        EdgeInsets.all(
                                                            24.0),
                                                      ),
                                                      style: FlutterFlowTheme
                                                          .of(context)
                                                          .bodyLarge
                                                          .override(
                                                        fontFamily: 'Inter',
                                                        letterSpacing: 0.0,
                                                        fontWeight:
                                                        FontWeight
                                                            .normal,
                                                      ),
                                                      keyboardType:
                                                      TextInputType.name,
                                                      validator: _model
                                                          .nameTextControllerValidator
                                                          .asValidator(context),
                                                    ),
                                                  ),
                                                ),
                                                Padding(
                                                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                                                  child: Text(
                                                    'Surname',
                                                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                      fontFamily: 'Inter',
                                                      letterSpacing: 0.0,
                                                      fontWeight: FontWeight.w600,
                                                    ),
                                                  ),
                                                ),
                                                Padding(
                                                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 16.0),
                                                  child: Container(
                                                    width: double.infinity,
                                                    child: TextFormField(
                                                      controller: _model.surnameTextController,
                                                      focusNode: _model.surnameFocusNode,
                                                      autofocus: false,
                                                      autofillHints: [AutofillHints.familyName],
                                                      obscureText: false,
                                                      decoration: InputDecoration(
                                                        labelText: 'Enter your surname',
                                                        labelStyle: FlutterFlowTheme.of(context).labelLarge.override(
                                                          fontFamily: 'Inter',
                                                          letterSpacing: 0.0,
                                                        ),
                                                        enabledBorder: OutlineInputBorder(
                                                          borderSide: BorderSide(
                                                            color: Color(0xFFBEC5D1),
                                                            width: 2.0,
                                                          ),
                                                          borderRadius: BorderRadius.circular(12.0),
                                                        ),
                                                        focusedBorder: OutlineInputBorder(
                                                          borderSide: BorderSide(
                                                            color: FlutterFlowTheme.of(context).primary,
                                                            width: 2.0,
                                                          ),
                                                          borderRadius: BorderRadius.circular(12.0),
                                                        ),
                                                        errorBorder: OutlineInputBorder(
                                                          borderSide: BorderSide(
                                                            color: FlutterFlowTheme.of(context).error,
                                                            width: 2.0,
                                                          ),
                                                          borderRadius: BorderRadius.circular(12.0),
                                                        ),
                                                        focusedErrorBorder: OutlineInputBorder(
                                                          borderSide: BorderSide(
                                                            color: FlutterFlowTheme.of(context).error,
                                                            width: 2.0,
                                                          ),
                                                          borderRadius: BorderRadius.circular(12.0),
                                                        ),
                                                        filled: true,
                                                        fillColor: FlutterFlowTheme.of(context).secondaryBackground,
                                                        contentPadding: EdgeInsets.all(24.0),
                                                      ),
                                                      style: FlutterFlowTheme.of(context).bodyLarge.override(
                                                        fontFamily: 'Inter',
                                                        letterSpacing: 0.0,
                                                        fontWeight: FontWeight.normal,
                                                      ),
                                                      keyboardType: TextInputType.name,
                                                      validator: _model.surnameTextControllerValidator.asValidator(context),
                                                    ),
                                                  ),
                                                ),
                                                Padding(
                                                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                                                  child: Text(
                                                    'Phone',
                                                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                      fontFamily: 'Inter',
                                                      letterSpacing: 0.0,
                                                      fontWeight: FontWeight.w600,
                                                    ),
                                                  ),
                                                ),
                                                Padding(
                                                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 16.0),
                                                  child: Container(
                                                    width: double.infinity,
                                                    child: TextFormField(
                                                      controller: _model.phoneTextController,
                                                      focusNode: _model.phoneFocusNode,
                                                      autofocus: false,
                                                      autofillHints: [AutofillHints.telephoneNumber],
                                                      obscureText: false,
                                                      decoration: InputDecoration(
                                                        labelText: 'Enter your phone number',
                                                        labelStyle: FlutterFlowTheme.of(context).labelLarge.override(
                                                          fontFamily: 'Inter',
                                                          letterSpacing: 0.0,
                                                        ),
                                                        enabledBorder: OutlineInputBorder(
                                                          borderSide: BorderSide(
                                                            color: Color(0xFFBEC5D1),
                                                            width: 2.0,
                                                          ),
                                                          borderRadius: BorderRadius.circular(12.0),
                                                        ),
                                                        focusedBorder: OutlineInputBorder(
                                                          borderSide: BorderSide(
                                                            color: FlutterFlowTheme.of(context).primary,
                                                            width: 2.0,
                                                          ),
                                                          borderRadius: BorderRadius.circular(12.0),
                                                        ),
                                                        errorBorder: OutlineInputBorder(
                                                          borderSide: BorderSide(
                                                            color: FlutterFlowTheme.of(context).error,
                                                            width: 2.0,
                                                          ),
                                                          borderRadius: BorderRadius.circular(12.0),
                                                        ),
                                                        focusedErrorBorder: OutlineInputBorder(
                                                          borderSide: BorderSide(
                                                            color: FlutterFlowTheme.of(context).error,
                                                            width: 2.0,
                                                          ),
                                                          borderRadius: BorderRadius.circular(12.0),
                                                        ),
                                                        filled: true,
                                                        fillColor: FlutterFlowTheme.of(context).secondaryBackground,
                                                        contentPadding: EdgeInsets.all(24.0),
                                                      ),
                                                      style: FlutterFlowTheme.of(context).bodyLarge.override(
                                                        fontFamily: 'Inter',
                                                        letterSpacing: 0.0,
                                                        fontWeight: FontWeight.normal,
                                                      ),
                                                      keyboardType: TextInputType.phone,
                                                      validator: _model.phoneTextControllerValidator.asValidator(context),
                                                    ),
                                                  ),
                                                ),
                                                Text(
                                                  'Email address',
                                                  style: FlutterFlowTheme.of(
                                                      context)
                                                      .bodyMedium
                                                      .override(
                                                    fontFamily: 'Inter',
                                                    letterSpacing: 0.0,
                                                    fontWeight:
                                                    FontWeight.w600,
                                                  ),
                                                ),
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                      0.0, 0.0, 0.0, 16.0),
                                                  child: Container(
                                                    width: double.infinity,
                                                    child: TextFormField(
                                                      controller: _model
                                                          .emailAddressCreateTextController,
                                                      focusNode: _model
                                                          .emailAddressCreateFocusNode,
                                                      autofocus: false,
                                                      autofillHints: [
                                                        AutofillHints.email
                                                      ],
                                                      obscureText: false,
                                                      decoration:
                                                      InputDecoration(
                                                        labelText:
                                                        'example@example.com',
                                                        labelStyle:
                                                        FlutterFlowTheme.of(
                                                            context)
                                                            .labelLarge
                                                            .override(
                                                          fontFamily:
                                                          'Inter',
                                                          letterSpacing:
                                                          0.0,
                                                        ),
                                                        enabledBorder:
                                                        OutlineInputBorder(
                                                          borderSide:
                                                          BorderSide(
                                                            color: Color(
                                                                0xFFBEC5D1),
                                                            width: 2.0,
                                                          ),
                                                          borderRadius:
                                                          BorderRadius
                                                              .circular(
                                                              12.0),
                                                        ),
                                                        focusedBorder:
                                                        OutlineInputBorder(
                                                          borderSide:
                                                          BorderSide(
                                                            color: FlutterFlowTheme
                                                                .of(context)
                                                                .primary,
                                                            width: 2.0,
                                                          ),
                                                          borderRadius:
                                                          BorderRadius
                                                              .circular(
                                                              12.0),
                                                        ),
                                                        errorBorder:
                                                        OutlineInputBorder(
                                                          borderSide:
                                                          BorderSide(
                                                            color: FlutterFlowTheme
                                                                .of(context)
                                                                .error,
                                                            width: 2.0,
                                                          ),
                                                          borderRadius:
                                                          BorderRadius
                                                              .circular(
                                                              12.0),
                                                        ),
                                                        focusedErrorBorder:
                                                        OutlineInputBorder(
                                                          borderSide:
                                                          BorderSide(
                                                            color: FlutterFlowTheme
                                                                .of(context)
                                                                .error,
                                                            width: 2.0,
                                                          ),
                                                          borderRadius:
                                                          BorderRadius
                                                              .circular(
                                                              12.0),
                                                        ),
                                                        filled: true,
                                                        fillColor: FlutterFlowTheme
                                                            .of(context)
                                                            .secondaryBackground,
                                                        contentPadding:
                                                        EdgeInsets.all(
                                                            24.0),
                                                      ),
                                                      style: FlutterFlowTheme
                                                          .of(context)
                                                          .bodyLarge
                                                          .override(
                                                        fontFamily: 'Inter',
                                                        letterSpacing: 0.0,
                                                      ),
                                                      keyboardType:
                                                      TextInputType
                                                          .emailAddress,
                                                      validator: _model
                                                          .emailAddressCreateTextControllerValidator
                                                          .asValidator(context),
                                                    ),
                                                  ),
                                                ),
                                                Text(
                                                  'Password',
                                                  style: FlutterFlowTheme.of(
                                                      context)
                                                      .bodyMedium
                                                      .override(
                                                    fontFamily: 'Inter',
                                                    letterSpacing: 0.0,
                                                    fontWeight:
                                                    FontWeight.w600,
                                                  ),
                                                ),
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                      0.0, 0.0, 0.0, 16.0),
                                                  child: Container(
                                                    width: double.infinity,
                                                    child: TextFormField(
                                                      controller: _model
                                                          .passwordCreateTextController,
                                                      focusNode: _model
                                                          .passwordCreateFocusNode,
                                                      autofocus: false,
                                                      autofillHints: [
                                                        AutofillHints.password
                                                      ],
                                                      obscureText: !_model
                                                          .passwordCreateVisibility,
                                                      decoration:
                                                      InputDecoration(
                                                        labelText:
                                                        '************',
                                                        labelStyle:
                                                        FlutterFlowTheme.of(
                                                            context)
                                                            .labelLarge
                                                            .override(
                                                          fontFamily:
                                                          'Inter',
                                                          letterSpacing:
                                                          0.0,
                                                        ),
                                                        enabledBorder:
                                                        OutlineInputBorder(
                                                          borderSide:
                                                          BorderSide(
                                                            color: Color(
                                                                0xFFBEC5D1),
                                                            width: 2.0,
                                                          ),
                                                          borderRadius:
                                                          BorderRadius
                                                              .circular(
                                                              12.0),
                                                        ),
                                                        focusedBorder:
                                                        OutlineInputBorder(
                                                          borderSide:
                                                          BorderSide(
                                                            color: FlutterFlowTheme
                                                                .of(context)
                                                                .primary,
                                                            width: 2.0,
                                                          ),
                                                          borderRadius:
                                                          BorderRadius
                                                              .circular(
                                                              12.0),
                                                        ),
                                                        errorBorder:
                                                        OutlineInputBorder(
                                                          borderSide:
                                                          BorderSide(
                                                            color: FlutterFlowTheme
                                                                .of(context)
                                                                .error,
                                                            width: 2.0,
                                                          ),
                                                          borderRadius:
                                                          BorderRadius
                                                              .circular(
                                                              12.0),
                                                        ),
                                                        focusedErrorBorder:
                                                        OutlineInputBorder(
                                                          borderSide:
                                                          BorderSide(
                                                            color: FlutterFlowTheme
                                                                .of(context)
                                                                .error,
                                                            width: 2.0,
                                                          ),
                                                          borderRadius:
                                                          BorderRadius
                                                              .circular(
                                                              12.0),
                                                        ),
                                                        filled: true,
                                                        fillColor: FlutterFlowTheme
                                                            .of(context)
                                                            .secondaryBackground,
                                                        contentPadding:
                                                        EdgeInsets.all(
                                                            24.0),
                                                        suffixIcon: InkWell(
                                                          onTap: () => setState(
                                                                () => _model
                                                                .passwordCreateVisibility =
                                                            !_model
                                                                .passwordCreateVisibility,
                                                          ),
                                                          focusNode: FocusNode(
                                                              skipTraversal:
                                                              true),
                                                          child: Icon(
                                                            _model.passwordCreateVisibility
                                                                ? Icons
                                                                .visibility_outlined
                                                                : Icons
                                                                .visibility_off_outlined,
                                                            color: FlutterFlowTheme
                                                                .of(context)
                                                                .secondaryText,
                                                            size: 24.0,
                                                          ),
                                                        ),
                                                      ),
                                                      style: FlutterFlowTheme
                                                          .of(context)
                                                          .bodyLarge
                                                          .override(
                                                        fontFamily: 'Inter',
                                                        letterSpacing: 0.0,
                                                      ),
                                                      validator: _model
                                                          .passwordCreateTextControllerValidator
                                                          .asValidator(context),
                                                    ),
                                                  ),
                                                ),
                                                Align(
                                                  alignment:
                                                  AlignmentDirectional(
                                                      0.0, 0.0),
                                                  child: Padding(
                                                    padding:
                                                    EdgeInsetsDirectional
                                                        .fromSTEB(0.0, 0.0,
                                                        0.0, 16.0),
                                                    child: FFButtonWidget(
                                                      onPressed: () async {
                                                        await _model.signUp(
                                                          context,
                                                          _model
                                                              .nameTextController
                                                              .text,
                                                          _model
                                                              .surnameTextController
                                                              .text, // Surname
                                                          _model
                                                              .phoneTextController
                                                              .text, // Phone
                                                          _model
                                                              .emailAddressCreateTextController
                                                              .text,
                                                          _model
                                                              .passwordCreateTextController
                                                              .text,
                                                        );
                                                      },
                                                      text: 'Registration',
                                                      options: FFButtonOptions(
                                                        width: 230.0,
                                                        height: 52.0,
                                                        padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(
                                                            0.0,
                                                            0.0,
                                                            0.0,
                                                            0.0),
                                                        iconPadding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(
                                                            0.0,
                                                            0.0,
                                                            0.0,
                                                            0.0),
                                                        color: Colors.black,
                                                        textStyle:
                                                        FlutterFlowTheme.of(
                                                            context)
                                                            .titleSmall
                                                            .override(
                                                          fontFamily:
                                                          'Readex Pro',
                                                          color: Colors
                                                              .white,
                                                          letterSpacing:
                                                          0.0,
                                                        ),
                                                        elevation: 3.0,
                                                        borderSide: BorderSide(
                                                          color: Colors
                                                              .transparent,
                                                          width: 1.0,
                                                        ),
                                                        borderRadius:
                                                        BorderRadius
                                                            .circular(40.0),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ).animateOnPageLoad(animationsMap[
                                          'columnOnPageLoadAnimation1']!),
                                        ),
                                      ),
                                      Align(
                                        alignment:
                                        AlignmentDirectional(0.0, -1.0),
                                        child: Padding(
                                          padding:
                                          EdgeInsetsDirectional.fromSTEB(
                                              24.0, 16.0, 24.0, 0.0),
                                          child: SingleChildScrollView(
                                            child: Column(
                                              mainAxisSize: MainAxisSize.max,
                                              crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                              children: [
                                                if (responsiveVisibility(
                                                  context: context,
                                                  phone: false,
                                                  tablet: false,
                                                ))
                                                  Container(
                                                    width: 230.0,
                                                    height: 40.0,
                                                    decoration: BoxDecoration(
                                                      color: FlutterFlowTheme
                                                          .of(context)
                                                          .secondaryBackground,
                                                    ),
                                                  ),
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                      0.0, 60.0, 0.0, 0.0),
                                                  child: Text(
                                                    'Email address',
                                                    style: FlutterFlowTheme.of(
                                                        context)
                                                        .bodyMedium
                                                        .override(
                                                      fontFamily: 'Inter',
                                                      letterSpacing: 0.0,
                                                      fontWeight:
                                                      FontWeight.w600,
                                                    ),
                                                  ),
                                                ),
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                      0.0, 0.0, 0.0, 16.0),
                                                  child: Container(
                                                    width: double.infinity,
                                                    child: TextFormField(
                                                      controller: _model
                                                          .emailAddressTextController,
                                                      focusNode: _model
                                                          .emailAddressFocusNode,
                                                      autofocus: false,
                                                      autofillHints: [
                                                        AutofillHints.email
                                                      ],
                                                      obscureText: false,
                                                      decoration:
                                                      InputDecoration(
                                                        labelText:
                                                        'example@example.com',
                                                        labelStyle:
                                                        FlutterFlowTheme.of(
                                                            context)
                                                            .labelLarge
                                                            .override(
                                                          fontFamily:
                                                          'Inter',
                                                          letterSpacing:
                                                          0.0,
                                                        ),
                                                        enabledBorder:
                                                        OutlineInputBorder(
                                                          borderSide:
                                                          BorderSide(
                                                            color: Color(
                                                                0xFFBEC5D1),
                                                            width: 2.0,
                                                          ),
                                                          borderRadius:
                                                          BorderRadius
                                                              .circular(
                                                              12.0),
                                                        ),
                                                        focusedBorder:
                                                        OutlineInputBorder(
                                                          borderSide:
                                                          BorderSide(
                                                            color: FlutterFlowTheme
                                                                .of(context)
                                                                .primary,
                                                            width: 2.0,
                                                          ),
                                                          borderRadius:
                                                          BorderRadius
                                                              .circular(
                                                              12.0),
                                                        ),
                                                        errorBorder:
                                                        OutlineInputBorder(
                                                          borderSide:
                                                          BorderSide(
                                                            color: FlutterFlowTheme
                                                                .of(context)
                                                                .alternate,
                                                            width: 2.0,
                                                          ),
                                                          borderRadius:
                                                          BorderRadius
                                                              .circular(
                                                              12.0),
                                                        ),
                                                        focusedErrorBorder:
                                                        OutlineInputBorder(
                                                          borderSide:
                                                          BorderSide(
                                                            color: FlutterFlowTheme
                                                                .of(context)
                                                                .alternate,
                                                            width: 2.0,
                                                          ),
                                                          borderRadius:
                                                          BorderRadius
                                                              .circular(
                                                              12.0),
                                                        ),
                                                        filled: true,
                                                        fillColor: FlutterFlowTheme
                                                            .of(context)
                                                            .secondaryBackground,
                                                        contentPadding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(
                                                            24.0,
                                                            24.0,
                                                            0.0,
                                                            24.0),
                                                      ),
                                                      style: FlutterFlowTheme
                                                          .of(context)
                                                          .bodyLarge
                                                          .override(
                                                        fontFamily: 'Inter',
                                                        letterSpacing: 0.0,
                                                      ),
                                                      keyboardType:
                                                      TextInputType
                                                          .emailAddress,
                                                      validator: _model
                                                          .emailAddressTextControllerValidator
                                                          .asValidator(context),
                                                    ),
                                                  ),
                                                ),
                                                Text(
                                                  'Password',
                                                  style: FlutterFlowTheme.of(
                                                      context)
                                                      .bodyMedium
                                                      .override(
                                                    fontFamily: 'Inter',
                                                    letterSpacing: 0.0,
                                                    fontWeight:
                                                    FontWeight.w600,
                                                  ),
                                                ),
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                      0.0, 0.0, 0.0, 16.0),
                                                  child: Container(
                                                    width: double.infinity,
                                                    child: TextFormField(
                                                      controller: _model
                                                          .passwordTextController,
                                                      focusNode: _model
                                                          .passwordFocusNode,
                                                      autofocus: false,
                                                      autofillHints: [
                                                        AutofillHints.password
                                                      ],
                                                      obscureText: !_model
                                                          .passwordVisibility,
                                                      decoration:
                                                      InputDecoration(
                                                        labelText:
                                                        '************',
                                                        labelStyle:
                                                        FlutterFlowTheme.of(
                                                            context)
                                                            .labelLarge
                                                            .override(
                                                          fontFamily:
                                                          'Inter',
                                                          letterSpacing:
                                                          0.0,
                                                        ),
                                                        enabledBorder:
                                                        OutlineInputBorder(
                                                          borderSide:
                                                          BorderSide(
                                                            color: Color(
                                                                0xFFBEC5D1),
                                                            width: 2.0,
                                                          ),
                                                          borderRadius:
                                                          BorderRadius
                                                              .circular(
                                                              12.0),
                                                        ),
                                                        focusedBorder:
                                                        OutlineInputBorder(
                                                          borderSide:
                                                          BorderSide(
                                                            color: FlutterFlowTheme
                                                                .of(context)
                                                                .primary,
                                                            width: 2.0,
                                                          ),
                                                          borderRadius:
                                                          BorderRadius
                                                              .circular(
                                                              12.0),
                                                        ),
                                                        errorBorder:
                                                        OutlineInputBorder(
                                                          borderSide:
                                                          BorderSide(
                                                            color: FlutterFlowTheme
                                                                .of(context)
                                                                .error,
                                                            width: 2.0,
                                                          ),
                                                          borderRadius:
                                                          BorderRadius
                                                              .circular(
                                                              12.0),
                                                        ),
                                                        focusedErrorBorder:
                                                        OutlineInputBorder(
                                                          borderSide:
                                                          BorderSide(
                                                            color: FlutterFlowTheme
                                                                .of(context)
                                                                .error,
                                                            width: 2.0,
                                                          ),
                                                          borderRadius:
                                                          BorderRadius
                                                              .circular(
                                                              12.0),
                                                        ),
                                                        filled: true,
                                                        fillColor: FlutterFlowTheme
                                                            .of(context)
                                                            .secondaryBackground,
                                                        contentPadding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(
                                                            24.0,
                                                            24.0,
                                                            0.0,
                                                            24.0),
                                                        suffixIcon: InkWell(
                                                          onTap: () => setState(
                                                                () => _model
                                                                .passwordVisibility =
                                                            !_model
                                                                .passwordVisibility,
                                                          ),
                                                          focusNode: FocusNode(
                                                              skipTraversal:
                                                              true),
                                                          child: Icon(
                                                            _model.passwordVisibility
                                                                ? Icons
                                                                .visibility_outlined
                                                                : Icons
                                                                .visibility_off_outlined,
                                                            color: FlutterFlowTheme
                                                                .of(context)
                                                                .secondaryText,
                                                            size: 24.0,
                                                          ),
                                                        ),
                                                      ),
                                                      style: FlutterFlowTheme
                                                          .of(context)
                                                          .bodyLarge
                                                          .override(
                                                        fontFamily: 'Inter',
                                                        letterSpacing: 0.0,
                                                      ),
                                                      validator: _model
                                                          .passwordTextControllerValidator
                                                          .asValidator(context),
                                                    ),
                                                  ),
                                                ),
                                                Align(
                                                  alignment:
                                                  AlignmentDirectional(
                                                      0.0, 0.0),
                                                  child: Padding(
                                                    padding:
                                                    EdgeInsetsDirectional
                                                        .fromSTEB(0.0, 0.0,
                                                        0.0, 16.0),
                                                    child: FFButtonWidget(
                                                      onPressed: () async {
                                                        await _model.signIn(
                                                          context,
                                                          _model
                                                              .emailAddressTextController
                                                              .text,
                                                          _model
                                                              .passwordTextController
                                                              .text,
                                                        );
                                                      },
                                                      text: 'Login',
                                                      options: FFButtonOptions(
                                                        width: 230.0,
                                                        height: 52.0,
                                                        padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(
                                                            0.0,
                                                            0.0,
                                                            0.0,
                                                            0.0),
                                                        iconPadding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(
                                                            0.0,
                                                            0.0,
                                                            0.0,
                                                            0.0),
                                                        color: Colors.black,
                                                        textStyle:
                                                        FlutterFlowTheme.of(
                                                            context)
                                                            .titleSmall
                                                            .override(
                                                          fontFamily:
                                                          'Readex Pro',
                                                          color: Colors
                                                              .white,
                                                          letterSpacing:
                                                          0.0,
                                                        ),
                                                        elevation: 3.0,
                                                        borderSide: BorderSide(
                                                          color: Colors
                                                              .transparent,
                                                          width: 1.0,
                                                        ),
                                                        borderRadius:
                                                        BorderRadius
                                                            .circular(40.0),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ).animateOnPageLoad(animationsMap[
                                          'columnOnPageLoadAnimation2']!),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ).animateOnPageLoad(
                            animationsMap['containerOnPageLoadAnimation']!),
                      ),
                    ],
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
