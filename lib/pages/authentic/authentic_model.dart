import 'package:shared_preferences/shared_preferences.dart';

import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:math';
import 'authentic_widget.dart' show AuthenticWidget;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;

class AuthenticModel extends FlutterFlowModel<AuthenticWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // State field(s) for TabBar widget.
  TabController? tabBarController;
  int get tabBarCurrentIndex =>
      tabBarController != null ? tabBarController!.index : 0;
  // State field(s) for name widget.
  FocusNode? nameFocusNode;
  TextEditingController? nameTextController;
  String? Function(BuildContext, String?)? nameTextControllerValidator;
  // State field(s) for surname widget.
  FocusNode? surnameFocusNode;
  TextEditingController? surnameTextController;
  String? Function(BuildContext, String?)? surnameTextControllerValidator;
  // State field(s) for phone widget.
  FocusNode? phoneFocusNode;
  TextEditingController? phoneTextController;
  String? Function(BuildContext, String?)? phoneTextControllerValidator;
  // State field(s) for emailAddress_Create widget.
  FocusNode? emailAddressCreateFocusNode;
  TextEditingController? emailAddressCreateTextController;
  String? Function(BuildContext, String?)?
      emailAddressCreateTextControllerValidator;
  // State field(s) for password_Create widget.
  FocusNode? passwordCreateFocusNode;
  TextEditingController? passwordCreateTextController;
  late bool passwordCreateVisibility;
  String? Function(BuildContext, String?)?
      passwordCreateTextControllerValidator;
  // State field(s) for emailAddress widget.
  FocusNode? emailAddressFocusNode;
  TextEditingController? emailAddressTextController;
  String? Function(BuildContext, String?)? emailAddressTextControllerValidator;
  // State field(s) for password widget.
  FocusNode? passwordFocusNode;
  TextEditingController? passwordTextController;
  late bool passwordVisibility;
  String? Function(BuildContext, String?)? passwordTextControllerValidator;

  Future<void> saveCookies(http.Response response) async {
    final cookies = response.headers['set-cookie'];
    if (cookies != null) {
      print(cookies); // For debugging
      SharedPreferences prefs = await SharedPreferences.getInstance();
      final accessToken = _extractCookie(cookies, 'jwt');
      final refreshToken = _extractCookie(cookies, 'RT');
      print("access token: $accessToken"); // For debugging
      print("refresh token: $refreshToken"); // For debugging
      if (accessToken != "" && refreshToken != "") {
        await prefs.setString('jwt', accessToken);
        await prefs.setString('RT', refreshToken);
      } else {
        throw Exception('Failed to extract tokens from cookies.');
      }
    }
  }

  String _extractCookie(String cookies, String key) {
    final cookieList = cookies.split(';');
    for (var cookie in cookieList) {
      final cookieParts = cookie.split('=');
      if (cookieParts.length == 2 && cookieParts[0].trim() == key) {
        return cookieParts[1];
      }
    }
    return '';
  }

  Future<Map<String, String>> getCookies() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final accessToken = prefs.getString('jwt') ?? '';
    final refreshToken = prefs.getString('RT') ?? '';
    return {
      'jwt': accessToken,
      'RT': refreshToken,
    };
  }

  Future<http.Response> makeRequest(String url, String method, {Map<String, String>? headers, dynamic body}) async {
    final cookieHeaders = await getCookies();
    final mergedHeaders = {...?headers, ...cookieHeaders};

    if (method == 'POST') {
      return await http.post(
        Uri.parse(url),
        headers: mergedHeaders,
        body: body,
      );
    } else if (method == 'GET') {
      return await http.get(
        Uri.parse(url),
        headers: mergedHeaders,
      );
    } else {
      throw UnsupportedError('Unsupported HTTP method');
    }
  }

  Future<void> signUp(BuildContext context, String name, String surname, String phone, String email, String password) async {
    final url = 'http://185.146.1.28:8000/api/auth/sign-up';
    final response = await makeRequest(
      url,
      'POST',
      headers: <String, String>{'Content-Type': 'application/json; charset=UTF-8'},
      body: jsonEncode({
        'name': name,
        'surname': surname,
        'phone': phone,
        'email': email,
        'password': password,
      }),
    );

    if (response.statusCode == 201 || response.statusCode == 200) {
      await saveCookies(response);
      context.go('/activation'); // Use context.go for named routes with GoRouter
    } else if (response.statusCode == 400) {
      _showErrorPopup(context, jsonDecode(response.body)['error']);
    } else if (response.statusCode == 500) {
      _showErrorPopup(context, 'Something went wrong..');
    }
  }

  Future<void> signIn(BuildContext context, String email, String password) async {
    final url = 'http://185.146.1.28:8000/api/auth/sign-in';
    final response = await makeRequest(
      url,
      'POST',
      headers: <String, String>{'Content-Type': 'application/json; charset=UTF-8'},
      body: jsonEncode({
        'email': email,
        'password': password,
      }),
    );

    if (response.statusCode == 200) {
      try {
        await saveCookies(response);
        context.go('/home'); // Use context.go for named routes with GoRouter
      } catch (e) {
        _showErrorPopup(context, 'Error saving cookies: ${e.toString()}');
      }
    } else if (response.statusCode == 401) {
      _showErrorPopup(context, 'Unauthorized error');
    } else if (response.statusCode == 400) {
      _showErrorPopup(context, jsonDecode(response.body)['error']);
    } else if (response.statusCode == 500) {
      _showErrorPopup(context, 'Something went wrong...');
    }
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
  void initState(BuildContext context) {
    passwordCreateVisibility = false;
    passwordVisibility = false;
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    tabBarController?.dispose();
    nameFocusNode?.dispose();
    nameTextController?.dispose();

    surnameFocusNode?.dispose();
    surnameTextController?.dispose();

    phoneFocusNode?.dispose();
    phoneTextController?.dispose();

    emailAddressCreateFocusNode?.dispose();
    emailAddressCreateTextController?.dispose();

    passwordCreateFocusNode?.dispose();
    passwordCreateTextController?.dispose();

    emailAddressFocusNode?.dispose();
    emailAddressTextController?.dispose();

    passwordFocusNode?.dispose();
    passwordTextController?.dispose();
  }
}
