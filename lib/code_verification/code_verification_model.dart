import '/flutter_flow/flutter_flow_util.dart';
import 'code_verification_widget.dart' show CodeVerificationWidget;
import 'package:flutter/material.dart';

class CodeVerificationModel extends FlutterFlowModel<CodeVerificationWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;
  // State field(s) for PinCode widget.
  TextEditingController? pinCodeController;
  String? Function(BuildContext, String?)? pinCodeControllerValidator;

  @override
  void initState(BuildContext context) {
    pinCodeController = TextEditingController();
  }

  @override
  void dispose() {
    textFieldFocusNode?.dispose();
    textController?.dispose();

    pinCodeController?.dispose();
  }
}
