// home_widget.dart
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'home_model.dart';
export 'home_model.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class HomeWidget extends StatefulWidget {
  const HomeWidget({super.key});

  @override
  State<HomeWidget> createState() => _HomeWidgetState();
}

class _HomeWidgetState extends State<HomeWidget> {
  late HomeModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = HomeModel();
    _model.initState();
  }

  @override
  void dispose() {
    _model.unfocusNode.dispose();
    _model.textFieldFocusNode?.dispose();
    _model.textController?.dispose();
    _model.dispose();
    super.dispose();
  }

  void navigateToDetails(Map<String, dynamic> restaurant) {
    context.pushNamed('Details', extra: restaurant);
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<HomeModel>.value(
      value: _model,
      child: GestureDetector(
        onTap: () => _model.unfocusNode.canRequestFocus
            ? FocusScope.of(context).requestFocus(_model.unfocusNode)
            : FocusScope.of(context).unfocus(),
        child: Scaffold(
          key: scaffoldKey,
          backgroundColor: Color(0xFFF6F6F6),
          body: SafeArea(
            top: true,
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(16.0, 16.0, 16.0, 8.0),
                    child: TextFormField(
                      controller: _model.textController,
                      focusNode: _model.textFieldFocusNode,
                      autofocus: true,
                      obscureText: false,
                      decoration: InputDecoration(
                        labelText: 'Search',
                        labelStyle: FlutterFlowTheme.of(context).labelMedium.override(
                          fontFamily: 'Inter',
                          fontSize: 12.0,
                          letterSpacing: 0.0,
                          fontWeight: FontWeight.normal,
                        ),
                        hintStyle: FlutterFlowTheme.of(context).labelMedium.override(
                          fontFamily: 'Readex Pro',
                          letterSpacing: 0.0,
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: FlutterFlowTheme.of(context).alternate,
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
                              width: 2.0),
                          borderRadius: BorderRadius.circular(12.0),
                        ),
                        contentPadding: EdgeInsetsDirectional.fromSTEB(20.0, 0.0, 0.0, 0.0),
                        suffixIcon: Icon(
                          Icons.search_rounded,
                          color: FlutterFlowTheme.of(context).secondaryText,
                        ),
                      ),
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                        fontFamily: 'Readex Pro',
                        letterSpacing: 0.0,
                      ),
                      cursorColor: FlutterFlowTheme.of(context).primary,
                      validator: _model.textControllerValidator?.asValidator(context),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(20.0, 0.0, 0.0, 0.0),
                    child: Text(
                      'Explore Restaurants',
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                        fontFamily: 'Inter',
                        color: Color(0xFF1F2937),
                        fontSize: 16.0,
                        letterSpacing: 0.0,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  Consumer<HomeModel>(
                    builder: (context, model, child) {
                      return ListView.builder(
                        padding: EdgeInsets.fromLTRB(0, 8.0, 0, 44.0),
                        shrinkWrap: true,
                        scrollDirection: Axis.vertical,
                        itemCount: model.restaurants.length,
                        itemBuilder: (context, index) {
                          final restaurant = model.restaurants[index];
                          final imageUrl = (restaurant['image_urls'] != null && restaurant['image_urls'].isNotEmpty)
                              ? restaurant['image_urls'][0]
                              : 'https://picsum.photos/seed/287/600';

                          return Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(15.0, 0.0, 15.0, 5.0),
                            child: Material(
                              color: Colors.transparent,
                              elevation: 3.0,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(12.0),
                                  bottomRight: Radius.circular(12.0),
                                  topLeft: Radius.circular(12.0),
                                  topRight: Radius.circular(12.0),
                                ),
                              ),
                              child: Container(
                                width: 100.0,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.only(
                                    bottomLeft: Radius.circular(12.0),
                                    bottomRight: Radius.circular(12.0),
                                    topLeft: Radius.circular(12.0),
                                    topRight: Radius.circular(12.0),
                                  ),
                                  shape: BoxShape.rectangle,
                                  border: Border.all(color: Colors.white, width: 2.0),
                                ),
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(16.0, 8.0, 16.0, 8.0),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: [
                                      Container(
                                        width: 100.0,
                                        height: 100.0,
                                        decoration: BoxDecoration(
                                          color: Color(0xFFE9E9E9),
                                          borderRadius: BorderRadius.circular(12.0),
                                          border: Border.all(color: Color(0xFFE9E9E9)),
                                        ),
                                        child: Padding(
                                          padding: EdgeInsets.all(2.0),
                                          child: ClipRRect(
                                            borderRadius: BorderRadius.circular(10.0),
                                            child: Image.network(
                                              imageUrl,
                                              width: 120.0,
                                              height: 120.0,
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                        ),
                                      ),
                                      Expanded(
                                        child: Padding(
                                          padding: EdgeInsetsDirectional.fromSTEB(12.0, 0.0, 0.0, 0.0),
                                          child: Column(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment: MainAxisAlignment.center,
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                restaurant['name'] ?? 'Restaurant',
                                                style: FlutterFlowTheme.of(context).bodyLarge.override(
                                                  fontFamily: 'Inter',
                                                  letterSpacing: 0.0,
                                                  fontWeight: FontWeight.w600,
                                                ),
                                              ),
                                              RatingBar.builder(
                                                onRatingUpdate: (newValue) => setState(() => _model.ratingBarValue1 = newValue),
                                                itemBuilder: (context, index) => Icon(Icons.star_rounded, color: Colors.black),
                                                direction: Axis.horizontal,
                                                initialRating: _model.ratingBarValue1 ??= 3.0,
                                                itemCount: 5,
                                                itemSize: 12.0,
                                                glowColor: Colors.black,
                                              ),
                                              Row(
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  Align(
                                                    alignment: AlignmentDirectional(-1.0, 0.0),
                                                    child: Icon(
                                                      Icons.location_pin,
                                                      color: Colors.black,
                                                      size: 12.0,
                                                    ),
                                                  ),
                                                  Text(
                                                    restaurant['address'] ?? 'Address',
                                                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                      fontFamily: 'Inter',
                                                      fontSize: 11.0,
                                                      letterSpacing: 0.0,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              Align(
                                                alignment: AlignmentDirectional(1.0, 1.0),
                                                child: FFButtonWidget(
                                                  onPressed: () => navigateToDetails(restaurant),
                                                  text: 'Book',
                                                  options: FFButtonOptions(
                                                    width: 80.0,
                                                    height: 30.0,
                                                    padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                                                    iconPadding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                                                    color: Colors.black,
                                                    textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                                                      fontFamily: 'Inter',
                                                      color: Colors.white,
                                                      fontSize: 12.0,
                                                      letterSpacing: 0.0,
                                                      fontWeight: FontWeight.w600,
                                                    ),
                                                    elevation: 3.0,
                                                    borderSide: BorderSide(color: Colors.transparent, width: 1.0),
                                                    borderRadius: BorderRadius.circular(8.0),
                                                  ),
                                                ),
                                              ),
                                            ].divide(SizedBox(height: 4.0)),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          );
                        },
                      );
                    },
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
