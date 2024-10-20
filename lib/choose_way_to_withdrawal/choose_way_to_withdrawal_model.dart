import '/flutter_flow/flutter_flow_credit_card_form.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'choose_way_to_withdrawal_widget.dart' show ChooseWayToWithdrawalWidget;
import 'package:flutter/material.dart';

class ChooseWayToWithdrawalModel
    extends FlutterFlowModel<ChooseWayToWithdrawalWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;
  // State field(s) for CreditCardForm widget.
  final creditCardFormKey = GlobalKey<FormState>();
  CreditCardModel creditCardInfo = emptyCreditCard();
  // State field(s) for CheckboxListTile widget.
  bool? checkboxListTileValue1;
  // State field(s) for CheckboxListTile widget.
  bool? checkboxListTileValue2;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    textFieldFocusNode?.dispose();
    textController?.dispose();
  }
}
