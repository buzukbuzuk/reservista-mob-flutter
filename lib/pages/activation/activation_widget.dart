import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/material.dart';
import '../../flutter_flow/flutter_flow_icon_button.dart';
import 'activation_model.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:provider/provider.dart';


class ActivationWidget extends StatefulWidget {
  const ActivationWidget({super.key});

  @override
  State<ActivationWidget> createState() => _ActivationWidgetState();
}

class _ActivationWidgetState extends State<ActivationWidget> {
  late ActivationModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ActivationModel());
  }

  @override
  void dispose() {
    _model.dispose();
    super.dispose();
  }

  Future<void> activateAccount(String pinCode) async {
    final url = 'http://185.146.1.28:8000/api/auth/activate';
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final accessToken = prefs.getString('jwt') ?? '';
    final refreshToken = prefs.getString('rt') ?? '';

    final response = await http.post(
      Uri.parse(url),
      headers: {
        'Content-Type': 'application/json',
        'Cookie': 'jwt=$accessToken; rt=$refreshToken',
      },
      body: jsonEncode({'code': pinCode}),
    );

    // Print all cookies sent in the response
    if (response.headers.containsKey('set-cookie')) {
      print('Cookies: ${response.headers['set-cookie']}');

      // Extract tokens from cookies
      final cookies = response.headers['set-cookie'];
      final newAccessToken = _extractCookie(cookies!, 'jwt');
      final newRefreshToken = _extractCookie(cookies, 'RT');

      // Print the extracted tokens
      print('New Access Token: $newAccessToken');
      print('New Refresh Token: $newRefreshToken');

      // Save the new tokens
      await prefs.setString('jwt', newAccessToken);
      await prefs.setString('rt', newRefreshToken);
    }

    if (response.statusCode == 200) {
      context.go('/home'); // Use context.go for named routes with GoRouter
    } else if (response.statusCode == 400) {
      final error = jsonDecode(response.body)['error'];
      _showErrorPopup(context, 'Error: $error');
    } else if (response.statusCode == 401) {
      context.go('/home');
    } else if (response.statusCode == 500) {
      _showErrorPopup(context, 'Something went wrong...');
    }
  }

// Helper function to extract cookies
  String _extractCookie(String cookies, String key) {
    final cookieList = cookies.split(';');
    for (var cookie in cookieList) {
      final cookieParts = cookie.split('=');
      if (cookieParts.length == 2 && cookieParts[0].trim() == key) {
        return cookieParts[1].trim();
      }
    }
    return '';
  }

  void _showErrorPopup(BuildContext context, String message) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Error'),
        content: Text(message),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: Text('OK'),
          ),
        ],
      ),
    );
  }


  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => _model.unfocusNode.canRequestFocus
          ? FocusScope.of(context).requestFocus(_model.unfocusNode)
          : FocusScope.of(context).unfocus(),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: Color(0xFFF6F6F6),
        appBar: AppBar(
          backgroundColor: Color(0xFFF6F6F6),
          automaticallyImplyLeading: false,
          leading: FlutterFlowIconButton(
            borderColor: Colors.transparent,
            borderRadius: 30.0,
            borderWidth: 1.0,
            buttonSize: 60.0,
            icon: Icon(
              Icons.chevron_left,
              color: FlutterFlowTheme.of(context).primaryText,
              size: 30.0,
            ),
            onPressed: () async {
              context.pop();
            },
          ),
          actions: [],
          centerTitle: false,
          elevation: 0.0,
        ),
        body: SafeArea(
          top: true,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Align(
                alignment: AlignmentDirectional(0.0, 0.0),
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 230.0, 0.0, 0.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Align(
                        alignment: AlignmentDirectional(0.0, 0.0),
                        child: Text(
                          'Account activation',
                          style: FlutterFlowTheme.of(context)
                              .displaySmall
                              .override(
                            fontFamily: 'Kumbh Sans',
                            fontSize: 32.0,
                            letterSpacing: 0.0,
                          ),
                        ),
                      ),
                      Align(
                        alignment: AlignmentDirectional(0.0, 0.0),
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 50.0, 0.0, 50.0),
                          child: Text(
                            'Enter the code sent to the e-mail address',
                            textAlign: TextAlign.center,
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                              fontFamily: 'Inter',
                              fontSize: 24.0,
                              letterSpacing: 0.0,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ),
                      PinCodeTextField(
                        autoDisposeControllers: false,
                        appContext: context,
                        length: 6,
                        textStyle:
                        FlutterFlowTheme.of(context).bodyLarge.override(
                          fontFamily: 'Inter',
                          letterSpacing: 0.0,
                        ),
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        enableActiveFill: false,
                        autoFocus: true,
                        enablePinAutofill: false,
                        errorTextSpace: 16.0,
                        showCursor: true,
                        cursorColor: Colors.black,
                        obscureText: false,
                        hintCharacter: '●',
                        keyboardType: TextInputType.number,
                        pinTheme: PinTheme(
                          fieldHeight: 44.0,
                          fieldWidth: 44.0,
                          borderWidth: 2.0,
                          borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(12.0),
                            bottomRight: Radius.circular(12.0),
                            topLeft: Radius.circular(12.0),
                            topRight: Radius.circular(12.0),
                          ),
                          shape: PinCodeFieldShape.box,
                          activeColor: FlutterFlowTheme.of(context).primaryText,
                          inactiveColor: FlutterFlowTheme.of(context).alternate,
                          selectedColor: Colors.black,
                          activeFillColor:
                          FlutterFlowTheme.of(context).primaryText,
                          inactiveFillColor:
                          FlutterFlowTheme.of(context).alternate,
                          selectedFillColor: Colors.black,
                        ),
                        controller: _model.pinCodeController,
                        onChanged: (_) {},
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        validator: _model.pinCodeControllerValidator
                            .asValidator(context),
                      ),
                      Align(
                        alignment: AlignmentDirectional(0.0, 0.0),
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 50.0, 0.0, 10.0),
                          child: FFButtonWidget(
                            onPressed: () {
                              final pinCode = _model.pinCodeController?.text ?? '';
                              if (pinCode.isNotEmpty) {
                                activateAccount(pinCode);
                              } else {
                                _showErrorPopup(context, 'Please enter the activation code.');
                              }
                            },
                            text: 'Send code',
                            options: FFButtonOptions(
                              width: 256.0,
                              height: 49.0,
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  24.0, 0.0, 24.0, 0.0),
                              iconPadding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 0.0, 0.0),
                              color: Colors.black,
                              textStyle: FlutterFlowTheme.of(context)
                                  .titleSmall
                                  .override(
                                fontFamily: 'Inter',
                                color: Colors.white,
                                fontSize: 14.0,
                                letterSpacing: 0.0,
                                fontWeight: FontWeight.bold,
                              ),
                              elevation: 3.0,
                              borderSide: BorderSide(
                                width: 1.0,
                              ),
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                          ),
                        ),
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
