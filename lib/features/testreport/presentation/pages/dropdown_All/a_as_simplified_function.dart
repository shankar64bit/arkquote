// ignore_for_file: missing_return

import 'package:flutter/cupertino.dart';
import 'package:flutter_testreports/features/testreport/presentation/pages/dropdown_All/Auser_input_validation_exnt.dart/validation_extension_methods.dart';
import '../../../data/models/equipment/acb/acb_model.dart';
import '../../widgets/custom_text_form_field.dart';
import '../../widgets/custom_text_form_field_For_number.dart';
import 'MegaGigaTeraRadioButton/em_ir_radio_button_page.dart';

simplifiedFor_Diplay_for_all_PC_numpad(
    String hinttext, TextEditingController tc) {
  return Padding(
    padding: EdgeInsets.fromLTRB(150, 0, 150, 10),
    child: CustomTextFormFieldForNumber(
      controller: tc,
      hintText: hinttext,
      validator: (val) {
        if (!val.IsValueEmpty) {
          return 'Field should not be empty';
        }
      },
    ),
  );
}

simplifiedFor_Display_for_all_Mobile_numpad(
    String hinttext, TextEditingController tc) {
  return Padding(
    padding: EdgeInsets.fromLTRB(10, 0, 10, 10),
    child: CustomTextFormFieldForNumber(
      controller: tc,
      hintText: hinttext,
      validator: (val) {
        if (!val.IsValueEmpty) {
          return 'Field should not be empty';
        }
      },
    ),
  );
}

simplifiedFor_Diplay_for_all_PC_alphanum(
    String hinttext, TextEditingController tc) {
  return Padding(
    padding: EdgeInsets.fromLTRB(150, 0, 150, 10),
    child: CustomTextFormField(
      controller: tc,
      hintText: hinttext,
      validator: (val) {
        if (!val.IsValueEmpty) {
          return 'Field should not be empty';
        }
      },
    ),
  );
}

simplifiedFor_Display_for_all_Mobile_alphanum(
    String hinttext, TextEditingController tc) {
  return Padding(
    padding: EdgeInsets.fromLTRB(10, 0, 10, 10),
    child: CustomTextFormField(
      controller: tc,
      hintText: hinttext,
      validator: (val) {
        if (!val.IsValueEmpty) {
          return 'Field should not be empty';
        }
      },
    ),
  );
}
// --------------------------------------------------------------

convertValue(double value, String selected) {
  if (selected == 'm' || selected == 'mega') {
    value = value * 1;
  }
  if (selected == 'g' || selected == 'giga') {
    value = value * 1000;
  }
  if (selected == 't' || selected == 'terra') {
    value = value * 1000000;
  }
  return value;
}

convertValue_for_ok_notOK(double value, String selected) {
  if (selected == 'ok') {
    value = 1.00;
  }
  if (selected == 'notOk') {
    value = 0.00;
  }
  return value;
}

// ---------------------------------------------
powt_td_page_PC_numpad(TextEditingController tc, String hinttext) {
  return Padding(
    padding: EdgeInsets.fromLTRB(150, 0, 150, 10),
    child: CustomTextFormFieldForNumber(
      controller: tc,
      hintText: hinttext,
      validator: (val) {
        if (!val.IsValueEmpty) {
          return 'Field should not be empty';
        }
      },
    ),
  );
}

powt_td_page_mobile_numpad(TextEditingController tc, String hinttext) {
  return Padding(
    padding: EdgeInsets.fromLTRB(10, 0, 10, 10),
    child: CustomTextFormFieldForNumber(
      controller: tc,
      hintText: hinttext,
      validator: (val) {
        if (!val.IsValueEmpty) {
          return 'Field should not be empty';
        }
      },
    ),
  );
}
// ----------------------------------------------------------------

simplified_acb_vos_IR_test(String hinttext, TextEditingController tc,
    AcbModel ntr, Enum_EM_ir_17_mgt selectedvalue) {
  print('object');
  return Padding(
    padding: EdgeInsets.fromLTRB(10, 0, 10, 10),
    child: Column(
      children: [
        CustomTextFormFieldForNumber(
          controller: tc,
          hintText: hinttext,
          validator: (val) {
            if (!val.IsValueEmpty) {
              return 'Field should not be empty';
            }

            if (ntr.etype == 'vcb' ||
                ntr.etype == 'ocb' ||
                ntr.etype == 'sf6') {
              if (ntr.ratedSystemVoltage == 11 &&
                  double.parse(tc.text) < 22 &&
                  selectedvalue == Enum_EM_ir_17_mgt.mega) {
                return '  KV [should be above 22MR]';
              }
              if (ntr.ratedSystemVoltage == 11 &&
                  double.parse(tc.text) < 0.022 &&
                  selectedvalue == Enum_EM_ir_17_mgt.giga) {
                return '  KV [should be above 0.022MR]';
              }
              if (ntr.ratedSystemVoltage == 11 &&
                  double.parse(tc.text) < 0.000022 &&
                  selectedvalue == Enum_EM_ir_17_mgt.terra) {
                return '  KV [should be above 0.000022MR]';
              }
            }
          },
        ),
      ],
    ),
  );
}
