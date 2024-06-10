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

  // State field(s) for full_name widget.
  FocusNode? fullNameFocusNode;
  TextEditingController? fullNameTextController;
  String? Function(BuildContext, String?)? fullNameTextControllerValidator;
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

  Future<void> signUp(BuildContext context, String name, String surname, String phone, String email, String password) async {
    final url = Uri.parse('http://185.146.1.28:8000/api/auth/sign-up');
    final response = await http.post(
      url,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode({
        'name': name,
        'surname': surname,
        'phone': phone,
        'email': email,
        'password': password,
      }),
    );

    if (response.statusCode == 201) {
      // Navigate to the home page
      context.pushNamed('Activation');
    } else if (response.statusCode == 400) {
      _showErrorPopup(context, 'Invalid input arguments');
    } else if (response.statusCode == 500) {
      _showErrorPopup(context, 'Something went wrong..');
    }
  }

  Future<void> signIn(BuildContext context, String email, String password) async {
    final url = Uri.parse('http://185.146.1.28:8000/api/auth/sign-in');
    final response = await http.post(
      url,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode({
        'email': email,
        'password': password,
      }),
    );

    if (response.statusCode == 200) {
      // Navigate to the activation page
      context.pushNamed('Home');
    } else if (response.statusCode == 400) {
      _showErrorPopup(context, 'Invalid input arguments');
    } else if (response.statusCode == 500) {
      _showErrorPopup(context, 'Something went wrong..');
    }
  }

  void _showErrorPopup(BuildContext context, String message) {
    // Show a popup with the error message
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: Colors.red,
          content: Text(
            message,
            style: TextStyle(color: Colors.white),
          ),
          actions: <Widget>[
            TextButton(
              child: Text('OK', style: TextStyle(color: Colors.white)),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
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
    fullNameFocusNode?.dispose();
    fullNameTextController?.dispose();

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
