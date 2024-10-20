import '/flutter_flow/flutter_flow_credit_card_form.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'choose_way_to_deposit_widget.dart' show ChooseWayToDepositWidget;
import 'package:flutter/material.dart';

class ChooseWayToDepositModel
    extends FlutterFlowModel<ChooseWayToDepositWidget> {
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
