import 'package:shared_preferences/shared_preferences.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'authentic_widget.dart' show AuthenticWidget;
import 'package:flutter/material.dart';
import 'package:dio/dio.dart';

class AuthenticModel extends FlutterFlowModel<AuthenticWidget> {
  /// State fields for stateful widgets in this page.

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

  Dio _dio = Dio();

  AuthenticModel() {
    _dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) async {
          SharedPreferences prefs = await SharedPreferences.getInstance();
          final jwt = prefs.getString('jwt') ?? '';
          final rt = prefs.getString('RT') ?? '';
          if (jwt.isNotEmpty && rt.isNotEmpty) {
            options.headers['Cookie'] = 'jwt=$jwt; RT=$rt';
          }
          return handler.next(options);
        },
      ),
    );
  }

  Future<void> saveCookies(Response response) async {
    final cookies = response.headers.map['set-cookie'];
    if (cookies != null) {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      final accessToken = _extractCookie(cookies, 'jwt');
      final refreshToken = _extractCookie(cookies, 'RT');
      if (accessToken != "" && refreshToken != "") {
        await prefs.setString('jwt', accessToken);
        await prefs.setString('RT', refreshToken);
      } else {
        throw Exception('Failed to extract tokens from cookies.');
      }
    }
  }

  String _extractCookie(List<String> cookies, String key) {
    for (var cookie in cookies) {
      final cookieParts = cookie.split(';');
      for (var part in cookieParts) {
        final partParts = part.split('=');
        if (partParts.length == 2 && partParts[0].trim() == key) {
          return partParts[1].trim();
        }
      }
    }
    return '';
  }

  Future<void> signUp(BuildContext context, String name, String surname, String phone, String email, String password) async {
    final url = 'http://185.146.1.28:8000/api/auth/sign-up';
    final response = await _dio.post(
      url,
      data: {
        'name': name,
        'surname': surname,
        'phone': phone,
        'email': email,
        'password': password,
      },
    );

    if (response.statusCode == 201 || response.statusCode == 200) {
      await saveCookies(response);
      context.go('/activation');
    } else if (response.statusCode == 400) {
      _showErrorPopup(context, response.data['error']);
    } else if (response.statusCode == 500) {
      _showErrorPopup(context, 'Something went wrong..');
    }
  }

  Future<void> signIn(BuildContext context, String email, String password) async {
    final url = 'http://185.146.1.28:8000/api/auth/sign-in';
    final response = await _dio.post(
      url,
      data: {
        'email': email,
        'password': password,
      },
    );

    if (response.statusCode == 200) {
      try {
        await saveCookies(response);
        context.go('/home');
      } catch (e) {
        _showErrorPopup(context, 'Error saving cookies: ${e.toString()}');
      }
    } else if (response.statusCode == 401) {
      _showErrorPopup(context, 'Unauthorized error');
    } else if (response.statusCode == 400) {
      _showErrorPopup(context, response.data['error']);
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
