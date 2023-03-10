// ignore_for_file: missing_return, prefer_const_constructors, non_constant_identifier_names
import 'package:flutter/material.dart';
import 'package:flutter_testreports/features/testreport/data/models/equipment/acb/acb_model.dart';
import 'package:flutter_testreports/features/testreport/presentation/pages/dropdown_All/Auser_input_validation_exnt.dart/validation_extension_methods.dart';
import 'package:flutter_testreports/features/testreport/data/models/equipment/acb/acb_ir_test_model.dart';
import 'package:flutter_testreports/features/testreport/presentation/providers/equipment_acb_provider/acb_ir_provider.dart';
import 'package:get_it_mixin/get_it_mixin.dart';
import '../../../../../injection_container.dart';
import '../../providers/equipment_acb_provider/acb_provider.dart';
import '../../widgets/custom_text_form_field_For_number.dart';
import '../dropdown_All/MegaGigaTeraRadioButton/em_ir_radio_button_page.dart';
import '../dropdown_All/a_as_simplified_function.dart';
import '../dropdown_All/equipmentUsed.dart';
import '../dropdown_All/responsive_tool/google_sign_in_out/google_login_controller.dart';

// the formkey used to validate the forms with key
final _formKey = GlobalKey<FormState>();
// SingingCharacter character = SingingCharacter.giga;

class AddAcbIrPage extends StatelessWidget with GetItMixin {
  Map args = {};
  int ACB_ID;
  int TR_ID;

  AddAcbIrPage(this.args, {Key key}) : super(key: key);

  final TextEditingController _nOcontroller = TextEditingController();
  final TextEditingController _ybcontroller = TextEditingController();
  final TextEditingController _brcontroller = TextEditingController();
  final TextEditingController _rncontroller = TextEditingController();
  final TextEditingController _yncontroller = TextEditingController();
  final TextEditingController _bncontroller = TextEditingController();
  final TextEditingController _recontroller = TextEditingController();
  final TextEditingController _yecontroller = TextEditingController();
  final TextEditingController _becontroller = TextEditingController();
  final TextEditingController _necontroller = TextEditingController();
  final TextEditingController _rrcontroller = TextEditingController();
  final TextEditingController _yycontroller = TextEditingController();
  final TextEditingController _bbcontroller = TextEditingController();
  final TextEditingController _nncontroller = TextEditingController();
  final TextEditingController _SerialNOcontroller = TextEditingController();
  final TextEditingController _rycontroller = TextEditingController();

  String get selectedValueForEquipmentUse =>
      EquipmentTypeList().getEquipmentuse();

  // For validation purpose, using this getter below
  // int get selectedKeyvcb => AddVCBDetails(args).send_RSV_to_vcb_ocb_sfe();

  Enum_EM_ir_17_mgt get selectedGMTrrvalue => MGT_rR().get_MGT_rR();
  Enum_EM_ir_17_mgt get selectedGMTyyvalue => MGT_yY().get_MGT_yY();
  Enum_EM_ir_17_mgt get selectedGMTbbvalue => MGT_bB().get_MGT_bB();
  Enum_EM_ir_17_mgt get selectedGMTnnvalue => MGT_nN().get_MGT_nN();
  Enum_EM_ir_17_mgt get selectedGMTrEvalue => MGT_re().get_MGT_re();
  Enum_EM_ir_17_mgt get selectedGMTyEvalue => MGT_ye().get_MGT_ye();
  Enum_EM_ir_17_mgt get selectedGMTbEvalue => MGT_be().get_MGT_be();
  Enum_EM_ir_17_mgt get selectedGMTnEvalue => MGT_ne().get_MGT_ne();
  Enum_EM_ir_17_mgt get selectedGMTrYvalue => MGT_ry().get_MGT_ry();
  Enum_EM_ir_17_mgt get selectedGMTyBvalue => MGT_yb().get_MGT_yb();
  Enum_EM_ir_17_mgt get selectedGMTbRvalue => MGT_br().get_MGT_br();
  Enum_EM_ir_17_mgt get selectedGMTrNvalue => MGT_rn().get_MGT_rn();
  Enum_EM_ir_17_mgt get selectedGMTyNvalue => MGT_yn().get_MGT_yn();
  Enum_EM_ir_17_mgt get selectedGMTbNvalue => MGT_bn().get_MGT_bn();
  Enum_EM_ir_17_mgt get selectedGMTcbvalue => MGT_cb().get_MGT_cb();
  Enum_EM_ir_17_mgt get selectedGMTcrvalue => MGT_cr().get_MGT_cr();
  Enum_EM_ir_17_mgt get selectedGMTcyvalue => MGT_cy().get_MGT_cy();

  setTrNo() {
    _nOcontroller.text = args['TrNo'].toString();
    _SerialNOcontroller.text = args['Serial_No'].toString();
    ACB_ID = args['acbDatabaseID'];
    TR_ID = args['trDatabaseID'];
  }

  @override
  Widget build(BuildContext context) {
    final AcbModel ntr = watchOnly((AcbProvider x) => x.acbModel);

    setTrNo();
    int id;
    var mob = const Text('Add ACB-IR Details', style: TextStyle(fontSize: 15));
    var desk = const Text('Add ACB-IR Details', style: TextStyle(fontSize: 20));
    var mobV = const Text('Add VCB-IR Details', style: TextStyle(fontSize: 15));
    var deskV =
        const Text('Add VCB-IR Details', style: TextStyle(fontSize: 20));
    var mobO = const Text('Add OCB-IR Details', style: TextStyle(fontSize: 15));
    var deskO =
        const Text('Add OCB-IR Details', style: TextStyle(fontSize: 20));
    var mobS = const Text('Add SF6-IR Details', style: TextStyle(fontSize: 15));
    var deskS =
        const Text('Add SF6-IR Details', style: TextStyle(fontSize: 20));

    var acc_token = sl<GoogleSignInController>().ACCESS_TOKEN;
    var ref_token = sl<GoogleSignInController>().REFRESH_TOKEN;

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        // ignore: missing_return
        title: LayoutBuilder(builder: (context, constraints) {
          if (constraints.maxWidth > 400) {
            if (ntr.etype == 'acb') {
              return ntr.etype == 'acb' ? desk : mob;
            } else if (ntr.etype == 'vcb') {
              return ntr.etype == 'vcb' ? deskV : mobV;
            } else if (ntr.etype == 'ocb') {
              return ntr.etype == 'ocb' ? deskO : mobO;
            } else if (ntr.etype == 'sf6') {
              return ntr.etype == 'sf6' ? deskS : mobS;
            }
          } else {
            if (ntr.etype == 'acb') {
              return ntr.etype == 'acb' ? mob : desk;
            } else if (ntr.etype == 'vcb') {
              return ntr.etype == 'vcb' ? mobV : deskV;
            } else if (ntr.etype == 'ocb') {
              return ntr.etype == 'ocb' ? mobO : deskO;
            } else if (ntr.etype == 'sf6') {
              return ntr.etype == 'sf6' ? mobS : deskS;
            }
          }
        }),
        actions: [
          IconButton(
              onPressed: () async {
                if (!_formKey.currentState.validate()) {
                  print('Incomplete Validation');
                } else if (_formKey.currentState.validate()) {
                  print(
                      'Form Validation Success [No error validation found-OK]');

                  double get_cb;
                  double get_cr;
                  double get_cy;
                  double ry;
                  double yb;
                  double br;
                  double re;
                  double ye;
                  double be;
                  double rR;
                  double yY;
                  double bB;

                  double nN;
                  double ne;
                  double rn;
                  double yn;
                  double bn;

                  if (ntr.noOfPoles == 3) {
                    nN = 0.00;
                    ne = 0.00;
                    rn = 0.00;
                    yn = 0.00;
                    bn = 0.00;
                    _nncontroller.text = '0.0';
                    _necontroller.text = '0.0';
                    _rncontroller.text = '0.0';
                    _yncontroller.text = '0.0';
                    _bncontroller.text = '0.0';
                  }

                  if (nN != 0.00) {
                    nN = convertValue(double.parse(_nncontroller.text),
                        selectedGMTnnvalue.toString().split('.')[0]);
                  }

                  if (ne != 0.00) {
                    ne = convertValue(double.parse(_necontroller.text),
                        selectedGMTnEvalue.toString().split('.')[0]);
                  }
                  if (rn != 0.00) {
                    rn = convertValue(double.parse(_rncontroller.text),
                        selectedGMTrNvalue.toString().split('.')[0]);
                  }
                  if (yn != 0.00) {
                    yn = convertValue(double.parse(_yncontroller.text),
                        selectedGMTyNvalue.toString().split('.')[0]);
                  }
                  if (bn != 0.00) {
                    bn = convertValue(double.parse(_bncontroller.text),
                        selectedGMTbNvalue.toString().split('.')[0]);
                  }

                  ry = convertValue(double.parse(_rycontroller.text),
                      selectedGMTrYvalue.toString().split('.')[0]);
                  yb = convertValue(double.parse(_ybcontroller.text),
                      selectedGMTyBvalue.toString().split('.')[0]);
                  br = convertValue(double.parse(_brcontroller.text),
                      selectedGMTbRvalue.toString().split('.')[0]);

                  re = convertValue(double.parse(_recontroller.text),
                      selectedGMTrEvalue.toString().split('.')[0]);
                  ye = convertValue(double.parse(_yecontroller.text),
                      selectedGMTyEvalue.toString().split('.')[0]);
                  be = convertValue(double.parse(_becontroller.text),
                      selectedGMTbEvalue.toString().split('.')[0]);

                  rR = convertValue(double.parse(_rrcontroller.text),
                      selectedGMTrrvalue.toString().split('.')[0]);
                  yY = convertValue(double.parse(_yycontroller.text),
                      selectedGMTyyvalue.toString().split('.')[0]);
                  bB = convertValue(double.parse(_bbcontroller.text),
                      selectedGMTbbvalue.toString().split('.')[0]);

                  // //-----------------------------------------
                  if (selectedGMTcbvalue == Enum_EM_ir_17_mgt.ok) {
                    get_cb = 1.00;
                  }
                  if (selectedGMTcbvalue == Enum_EM_ir_17_mgt.notOk) {
                    get_cb = 0.00;
                  }

                  //-----------------------------------------
                  if (selectedGMTcrvalue == Enum_EM_ir_17_mgt.ok) {
                    get_cr = 1.00;
                  }
                  if (selectedGMTcrvalue == Enum_EM_ir_17_mgt.notOk) {
                    get_cr = 0.00;
                  }

                  //-----------------------------------------
                  if (selectedGMTcyvalue == Enum_EM_ir_17_mgt.ok) {
                    get_cy = 1.00;
                  }
                  if (selectedGMTcyvalue == Enum_EM_ir_17_mgt.notOk) {
                    get_cy = 0.00;
                  }

                  //add to local database
                  final AcbIrTestModel acbIrReportToLocal = AcbIrTestModel(
                    trNo: int.parse(_nOcontroller.text),
                    serialNo: _SerialNOcontroller.text,
                    ry: ry,
                    yb: yb,
                    br: br,
                    rn: rn,
                    yn: yn,
                    bn: bn,
                    re: re,
                    ye: ye,
                    be: be,
                    ne: ne,
                    rR: rR,
                    yY: yY,
                    bB: bB,
                    nN: nN,
                    cb: double.parse(get_cb.toString()),
                    cr: double.parse(get_cr.toString()),
                    cy: double.parse(get_cy.toString()),
                    EquipmentType: selectedValueForEquipmentUse.toString(),
                    databaseID: 0,
                    lastUpdated: DateTime.now(),
                  );

                  print(acbIrReportToLocal);
                  getX((AcbIrProvider x) => x.addACBIr(acbIrReportToLocal));
                  watchOnly((AcbIrProvider x) => {});
                  print("ACB IR added");
                  Navigator.popAndPushNamed(context, '/detail_ACB', arguments: {
                    'id': args['ACB_ID'],
                    'trDatabaseID': args['trDatabaseID']
                  });
                }
              },
              icon: const Icon(Icons.save)),
        ],
      ),
      body: ListView(
        children: [
          Center(
            child: Padding(
              padding: const EdgeInsets.all(5.0),
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    ConstrainedBox(
                        constraints: BoxConstraints(
                            minHeight: 0, minWidth: 0, maxWidth: 700),
                        child: build_body(context)),
                  ]),
            ),
          ),
        ],
      ),
    );
  }

  build_body(BuildContext context) {
    final AcbModel ntr = watchOnly((AcbProvider x) => x.acbModel);
    var ntrRSV = ntr.ratedSystemVoltage;
    return Form(
      key: _formKey,
      child: LayoutBuilder(builder: (context, constraints) {
        if (constraints.maxWidth > 400) {
          return Padding(
            padding: const EdgeInsets.all(5.0),
            child: Column(
              children: [
                Card(
                  elevation: 5,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
                        child: Text(
                          'Test Report No',
                          style: TextStyle(
                              fontSize: 13,
                              fontWeight: FontWeight.bold,
                              letterSpacing: 0.5),
                        ),
                      ),
                      TextFormField(
                        controller: _nOcontroller,
                        textAlign: TextAlign.center,
                        // label : const Text('Test Report No.'),
                        enabled: false,
                      ),
                      Divider(
                        height: 0,
                      ),
                      Padding(
                          padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
                          child: Text(
                            'Serial No',
                            style: TextStyle(
                                fontSize: 13,
                                fontWeight: FontWeight.bold,
                                letterSpacing: 0.5),
                          )),
                      TextFormField(
                        controller: _SerialNOcontroller,
                        textAlign: TextAlign.center,
                        enabled: false,
                      ),
                      Padding(
                        padding: EdgeInsets.fromLTRB(150, 10, 150, 10),
                        child: EquipmentTypeList(),
                      ),
                    ],
                  ),
                ),
                //--------------------------------------------------------------------------------------------------
                Divider(height: 10, color: Colors.grey[200]),
                Card(
                  elevation: 5,
                  child: Column(children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(150, 10, 150, 10),
                      child: Text(
                        ' Pole-Pole (open condition) ',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          letterSpacing: 1,
                        ),
                      ),
                    ),
                    // >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
                    Padding(
                      padding: EdgeInsets.fromLTRB(80, 0, 80, 0),
                      child: MGT_rR(),
                    ),
                    Padding(
                      padding: EdgeInsets.fromLTRB(150, 0, 150, 10),
                      child: Column(
                        children: [
                          CustomTextFormFieldForNumber(
                            controller: _rrcontroller,
                            hintText: 'rr',
                            validator: (val) {
                              if (!val.IsValueEmpty) {
                                return 'Field should not be empty';
                              }
                              if (ntr.etype == 'acb') {
                                if (double.parse(_rrcontroller.text) < 1 &&
                                    selectedGMTrrvalue ==
                                        Enum_EM_ir_17_mgt.mega) {
                                  return 'Acceptable Limits Above [1 MΩ]';
                                } else if (double.parse(_rrcontroller.text) <
                                        0.001 &&
                                    selectedGMTrrvalue ==
                                        Enum_EM_ir_17_mgt.giga) {
                                  return 'Acceptable Limits Above [0.001 MΩ]';
                                } else if (double.parse(_rrcontroller.text) <
                                        0.000001 &&
                                    selectedGMTrrvalue ==
                                        Enum_EM_ir_17_mgt.terra) {
                                  return 'Acceptable Limits Above [0.000001 MΩ]';
                                }
                              } else if (ntr.etype == 'vcb' ||
                                  ntr.etype == 'ocb' ||
                                  ntr.etype == 'sf6') {
                                if (ntr.ratedSystemVoltage == 11 &&
                                    double.parse(_rrcontroller.text) < 22 &&
                                    selectedGMTrrvalue ==
                                        Enum_EM_ir_17_mgt.mega) {
                                  return ' $ntrRSV KV [should be above 22MR]';
                                } else if (ntr.ratedSystemVoltage == 11 &&
                                    double.parse(_rrcontroller.text) < 0.022 &&
                                    selectedGMTrrvalue ==
                                        Enum_EM_ir_17_mgt.giga) {
                                  return ' $ntrRSV KV [should be above 0.022MR]';
                                } else if (ntr.ratedSystemVoltage == 11 &&
                                    double.parse(_rrcontroller.text) <
                                        0.000022 &&
                                    selectedGMTrrvalue ==
                                        Enum_EM_ir_17_mgt.terra) {
                                  return ' $ntrRSV KV [should be above 0.000022MR]';
                                }
                                //----------------------------------------------
                                if (ntr.ratedSystemVoltage == 33 &&
                                    double.parse(_rrcontroller.text) < 66 &&
                                    selectedGMTrrvalue ==
                                        Enum_EM_ir_17_mgt.mega) {
                                  return '$ntrRSV KV [should be above 66MR ]';
                                } else if (ntr.ratedSystemVoltage == 33 &&
                                    double.parse(_rrcontroller.text) < 0.066 &&
                                    selectedGMTrrvalue ==
                                        Enum_EM_ir_17_mgt.giga) {
                                  return '$ntrRSV KV [should be above 0.066MR]';
                                } else if (ntr.ratedSystemVoltage == 33 &&
                                    double.parse(_rrcontroller.text) <
                                        0.000066 &&
                                    selectedGMTrrvalue ==
                                        Enum_EM_ir_17_mgt.terra) {
                                  return '$ntrRSV KV [should be above 0.000066]';
                                }
                                //----------------------------------------------
                                if (ntr.ratedSystemVoltage == 66 &&
                                    double.parse(_rrcontroller.text) < 132 &&
                                    selectedGMTrrvalue ==
                                        Enum_EM_ir_17_mgt.mega) {
                                  return '$ntrRSV KV [should be above 132MR ]';
                                } else if (ntr.ratedSystemVoltage == 66 &&
                                    double.parse(_rrcontroller.text) < 0.132 &&
                                    selectedGMTrrvalue ==
                                        Enum_EM_ir_17_mgt.giga) {
                                  return '$ntrRSV KV [should be above 0.132MR ]';
                                } else if (ntr.ratedSystemVoltage == 66 &&
                                    double.parse(_rrcontroller.text) <
                                        0.000132 &&
                                    selectedGMTrrvalue ==
                                        Enum_EM_ir_17_mgt.terra) {
                                  return '$ntrRSV KV [should be above 0.000132MR ]';
                                }
                                //----------------------------------------------
                                if (ntr.ratedSystemVoltage == 110 &&
                                    double.parse(_rrcontroller.text) < 220 &&
                                    selectedGMTrrvalue ==
                                        Enum_EM_ir_17_mgt.mega) {
                                  return '$ntrRSV KV [should be above 220MR ]';
                                } else if (ntr.ratedSystemVoltage == 110 &&
                                    double.parse(_rrcontroller.text) < 0.220 &&
                                    selectedGMTrrvalue ==
                                        Enum_EM_ir_17_mgt.giga) {
                                  return '$ntrRSV KV [should be above 0.220MR ]';
                                } else if (ntr.ratedSystemVoltage == 110 &&
                                    double.parse(_rrcontroller.text) <
                                        0.000220 &&
                                    selectedGMTrrvalue ==
                                        Enum_EM_ir_17_mgt.terra) {
                                  return '$ntrRSV KV [should be above 0.000220MR ]';
                                }
                                //----------------------------------------------
                                if (ntr.ratedSystemVoltage == 132 &&
                                    double.parse(_rrcontroller.text) < 264 &&
                                    selectedGMTrrvalue ==
                                        Enum_EM_ir_17_mgt.mega) {
                                  return '$ntrRSV KV [should be above 264MR ]';
                                } else if (ntr.ratedSystemVoltage == 132 &&
                                    double.parse(_rrcontroller.text) < 0.264 &&
                                    selectedGMTrrvalue ==
                                        Enum_EM_ir_17_mgt.giga) {
                                  return '$ntrRSV KV [should be above 0.264MR ]';
                                } else if (ntr.ratedSystemVoltage == 132 &&
                                    double.parse(_rrcontroller.text) <
                                        0.000264 &&
                                    selectedGMTrrvalue ==
                                        Enum_EM_ir_17_mgt.terra) {
                                  return '$ntrRSV KV [should be above 0.000264MR ]';
                                }
                                //----------------------------------------------
                                if (ntr.ratedSystemVoltage == 220 &&
                                    double.parse(_rrcontroller.text) < 440 &&
                                    selectedGMTrrvalue ==
                                        Enum_EM_ir_17_mgt.mega) {
                                  return '$ntrRSV KV [should be above 440MR ]';
                                } else if (ntr.ratedSystemVoltage == 220 &&
                                    double.parse(_rrcontroller.text) < 0.440 &&
                                    selectedGMTrrvalue ==
                                        Enum_EM_ir_17_mgt.giga) {
                                  return '$ntrRSV KV [should be above 0.440MR ]';
                                } else if (ntr.ratedSystemVoltage == 220 &&
                                    double.parse(_rrcontroller.text) <
                                        0.000440 &&
                                    selectedGMTrrvalue ==
                                        Enum_EM_ir_17_mgt.terra) {
                                  return '$ntrRSV KV [should be above 0.000440MR ]';
                                }
                                //----------------------------------------------
                                if (ntr.ratedSystemVoltage == 400 &&
                                    double.parse(_rrcontroller.text) < 800 &&
                                    selectedGMTrrvalue ==
                                        Enum_EM_ir_17_mgt.mega) {
                                  return '$ntrRSV KV [should be above 800MR ]';
                                } else if (ntr.ratedSystemVoltage == 400 &&
                                    double.parse(_rrcontroller.text) < 0.800 &&
                                    selectedGMTrrvalue ==
                                        Enum_EM_ir_17_mgt.giga) {
                                  return '$ntrRSV KV [should be above 0.800MR ]';
                                } else if (ntr.ratedSystemVoltage == 400 &&
                                    double.parse(_rrcontroller.text) <
                                        0.000800 &&
                                    selectedGMTrrvalue ==
                                        Enum_EM_ir_17_mgt.terra) {
                                  return '$ntrRSV KV [should be above 0.000800MR ]';
                                }
                              }
                            },
                          ),
                        ],
                      ),
                    ),
                    // >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
                    Padding(
                      padding: EdgeInsets.fromLTRB(80, 0, 80, 0),
                      child: MGT_yY(),
                    ),
                    Padding(
                      padding: EdgeInsets.fromLTRB(150, 0, 150, 10),
                      child: CustomTextFormFieldForNumber(
                        controller: _yycontroller,
                        hintText: 'yy',
                        validator: (val) {
                          if (!val.IsValueEmpty) {
                            return 'Field should not be empty';
                          }
                          if (ntr.etype == 'acb') {
                            if (double.parse(_yycontroller.text) < 1 &&
                                selectedGMTyyvalue == Enum_EM_ir_17_mgt.mega) {
                              return 'Acceptable Limits Above [1 MΩ]';
                            } else if (double.parse(_yycontroller.text) <
                                    0.001 &&
                                selectedGMTyyvalue == Enum_EM_ir_17_mgt.giga) {
                              return 'Acceptable Limits Above [0.001 MΩ]';
                            } else if (double.parse(_yycontroller.text) <
                                    0.000001 &&
                                selectedGMTyyvalue == Enum_EM_ir_17_mgt.terra) {
                              return 'Acceptable Limits Above [0.000001 MΩ]';
                            }
                          } else if (ntr.etype == 'vcb' ||
                              ntr.etype == 'ocb' ||
                              ntr.etype == 'sf6') {
                            if (ntr.ratedSystemVoltage == 11 &&
                                double.parse(_yycontroller.text) < 22 &&
                                selectedGMTyyvalue == Enum_EM_ir_17_mgt.mega) {
                              return ' $ntrRSV KV [should be above 22MR ]';
                            } else if (ntr.ratedSystemVoltage == 11 &&
                                double.parse(_yycontroller.text) < 0.022 &&
                                selectedGMTyyvalue == Enum_EM_ir_17_mgt.giga) {
                              return ' $ntrRSV KV [should be above 0.022MR ]';
                            } else if (ntr.ratedSystemVoltage == 11 &&
                                double.parse(_yycontroller.text) < 0.000022 &&
                                selectedGMTyyvalue == Enum_EM_ir_17_mgt.terra) {
                              return ' $ntrRSV KV [should be above 0.000022MR ]';
                            }
                            // -------------------------------------------
                            if (ntr.ratedSystemVoltage == 33 &&
                                double.parse(_yycontroller.text) < 66 &&
                                selectedGMTyyvalue == Enum_EM_ir_17_mgt.mega) {
                              return '$ntrRSV KV [should be above 66MR ]';
                            } else if (ntr.ratedSystemVoltage == 33 &&
                                double.parse(_yycontroller.text) < 0.066 &&
                                selectedGMTyyvalue == Enum_EM_ir_17_mgt.giga) {
                              return '$ntrRSV KV [should be above 0.066MR ]';
                            } else if (ntr.ratedSystemVoltage == 33 &&
                                double.parse(_yycontroller.text) < 0.000066 &&
                                selectedGMTyyvalue == Enum_EM_ir_17_mgt.terra) {
                              return '$ntrRSV KV [should be above 0.000066MR ]';
                            }
                            // -------------------------------------------
                            if (ntr.ratedSystemVoltage == 66 &&
                                double.parse(_yycontroller.text) < 132 &&
                                selectedGMTyyvalue == Enum_EM_ir_17_mgt.mega) {
                              return '$ntrRSV KV [should be above 132MR ]';
                            } else if (ntr.ratedSystemVoltage == 66 &&
                                double.parse(_yycontroller.text) < 0.132 &&
                                selectedGMTyyvalue == Enum_EM_ir_17_mgt.giga) {
                              return '$ntrRSV KV [should be above 0.132MR ]';
                            } else if (ntr.ratedSystemVoltage == 66 &&
                                double.parse(_yycontroller.text) < 0.000132 &&
                                selectedGMTyyvalue == Enum_EM_ir_17_mgt.terra) {
                              return '$ntrRSV KV [should be above 0.000132MR ]';
                            }
                            // -------------------------------------------
                            if (ntr.ratedSystemVoltage == 110 &&
                                double.parse(_yycontroller.text) < 220 &&
                                selectedGMTyyvalue == Enum_EM_ir_17_mgt.mega) {
                              return '$ntrRSV KV [should be above 220MR ]';
                            } else if (ntr.ratedSystemVoltage == 110 &&
                                double.parse(_yycontroller.text) < 0.220 &&
                                selectedGMTyyvalue == Enum_EM_ir_17_mgt.giga) {
                              return '$ntrRSV KV [should be above 0.220MR ]';
                            } else if (ntr.ratedSystemVoltage == 110 &&
                                double.parse(_yycontroller.text) < 0.000220 &&
                                selectedGMTyyvalue == Enum_EM_ir_17_mgt.terra) {
                              return '$ntrRSV KV [should be above 0.000220MR ]';
                            }
                            // -------------------------------------------
                            if (ntr.ratedSystemVoltage == 132 &&
                                double.parse(_yycontroller.text) < 264 &&
                                selectedGMTyyvalue == Enum_EM_ir_17_mgt.mega) {
                              return '$ntrRSV KV [should be above 264MR ]';
                            } else if (ntr.ratedSystemVoltage == 132 &&
                                double.parse(_yycontroller.text) < 0.264 &&
                                selectedGMTyyvalue == Enum_EM_ir_17_mgt.giga) {
                              return '$ntrRSV KV [should be above 0.264MR ]';
                            } else if (ntr.ratedSystemVoltage == 132 &&
                                double.parse(_yycontroller.text) < 0.000264 &&
                                selectedGMTyyvalue == Enum_EM_ir_17_mgt.terra) {
                              return '$ntrRSV KV [should be above 0.000264MR ]';
                            }
                            // -------------------------------------------
                            if (ntr.ratedSystemVoltage == 220 &&
                                double.parse(_yycontroller.text) < 440 &&
                                selectedGMTyyvalue == Enum_EM_ir_17_mgt.mega) {
                              return '$ntrRSV KV [should be above 440MR ]';
                            } else if (ntr.ratedSystemVoltage == 220 &&
                                double.parse(_yycontroller.text) < 0.440 &&
                                selectedGMTyyvalue == Enum_EM_ir_17_mgt.giga) {
                              return '$ntrRSV KV [should be above 0.440MR ]';
                            } else if (ntr.ratedSystemVoltage == 220 &&
                                double.parse(_yycontroller.text) < 0.000440 &&
                                selectedGMTyyvalue == Enum_EM_ir_17_mgt.terra) {
                              return '$ntrRSV KV [should be above 0.000440MR ]';
                            }
                            // -------------------------------------------
                            if (ntr.ratedSystemVoltage == 400 &&
                                double.parse(_yycontroller.text) < 800 &&
                                selectedGMTyyvalue == Enum_EM_ir_17_mgt.mega) {
                              return '$ntrRSV KV [should be above 800MR ]';
                            } else if (ntr.ratedSystemVoltage == 400 &&
                                double.parse(_yycontroller.text) < 0.800 &&
                                selectedGMTyyvalue == Enum_EM_ir_17_mgt.giga) {
                              return '$ntrRSV KV [should be above 0.800MR ]';
                            } else if (ntr.ratedSystemVoltage == 400 &&
                                double.parse(_yycontroller.text) < 0.000800 &&
                                selectedGMTyyvalue == Enum_EM_ir_17_mgt.terra) {
                              return '$ntrRSV KV [should be above 0.000800MR ]';
                            }
                          }
                        },
                      ),
                    ),
                    // >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
                    Padding(
                      padding: EdgeInsets.fromLTRB(80, 0, 80, 0),
                      child: MGT_bB(),
                    ),
                    Padding(
                      padding: EdgeInsets.fromLTRB(150, 0, 150, 10),
                      child: CustomTextFormFieldForNumber(
                        controller: _bbcontroller,
                        hintText: 'bb',
                        validator: (val) {
                          if (!val.IsValueEmpty) {
                            return 'Field should not be empty';
                          }
                          if (ntr.etype == 'acb') {
                            if (double.parse(_bbcontroller.text) < 1 &&
                                selectedGMTbbvalue == Enum_EM_ir_17_mgt.mega) {
                              return 'Acceptable Limits Above [1 MΩ]';
                            } else if (double.parse(_bbcontroller.text) <
                                    0.001 &&
                                selectedGMTbbvalue == Enum_EM_ir_17_mgt.giga) {
                              return 'Acceptable Limits Above [0.001 MΩ]';
                            } else if (double.parse(_bbcontroller.text) <
                                    0.000001 &&
                                selectedGMTbbvalue == Enum_EM_ir_17_mgt.terra) {
                              return 'Acceptable Limits Above [0.000001 MΩ]';
                            }
                          } else if (ntr.etype == 'vcb' ||
                              ntr.etype == 'ocb' ||
                              ntr.etype == 'sf6') {
                            if (ntr.ratedSystemVoltage == 11 &&
                                double.parse(_bbcontroller.text) < 22 &&
                                selectedGMTbbvalue == Enum_EM_ir_17_mgt.mega) {
                              return ' $ntrRSV KV [should be above 22MR ]';
                            } else if (ntr.ratedSystemVoltage == 11 &&
                                double.parse(_bbcontroller.text) < 0.022 &&
                                selectedGMTbbvalue == Enum_EM_ir_17_mgt.giga) {
                              return ' $ntrRSV KV [should be above 0.022MR ]';
                            } else if (ntr.ratedSystemVoltage == 11 &&
                                double.parse(_bbcontroller.text) < 0.000022 &&
                                selectedGMTbbvalue == Enum_EM_ir_17_mgt.terra) {
                              return ' $ntrRSV KV [should be above 0.000022MR ]';
                            }
                            // -------------------------------------------
                            if (ntr.ratedSystemVoltage == 33 &&
                                double.parse(_bbcontroller.text) < 66 &&
                                selectedGMTbbvalue == Enum_EM_ir_17_mgt.mega) {
                              return '$ntrRSV KV [should be above 66MR ]';
                            } else if (ntr.ratedSystemVoltage == 33 &&
                                double.parse(_bbcontroller.text) < 0.066 &&
                                selectedGMTbbvalue == Enum_EM_ir_17_mgt.giga) {
                              return '$ntrRSV KV [should be above 0.066MR ]';
                            } else if (ntr.ratedSystemVoltage == 33 &&
                                double.parse(_bbcontroller.text) < 0.000066 &&
                                selectedGMTbbvalue == Enum_EM_ir_17_mgt.terra) {
                              return '$ntrRSV KV [should be above 0.000066MR ]';
                            }
                            // -------------------------------------------
                            if (ntr.ratedSystemVoltage == 66 &&
                                double.parse(_bbcontroller.text) < 132 &&
                                selectedGMTbbvalue == Enum_EM_ir_17_mgt.mega) {
                              return '$ntrRSV KV [should be above 132MR ]';
                            } else if (ntr.ratedSystemVoltage == 66 &&
                                double.parse(_bbcontroller.text) < 0.132 &&
                                selectedGMTbbvalue == Enum_EM_ir_17_mgt.giga) {
                              return '$ntrRSV KV [should be above 0.132MR ]';
                            } else if (ntr.ratedSystemVoltage == 66 &&
                                double.parse(_bbcontroller.text) < 0.000132 &&
                                selectedGMTbbvalue == Enum_EM_ir_17_mgt.terra) {
                              return '$ntrRSV KV [should be above 0.000132MR ]';
                            }
                            // -------------------------------------------
                            if (ntr.ratedSystemVoltage == 110 &&
                                double.parse(_bbcontroller.text) < 220 &&
                                selectedGMTbbvalue == Enum_EM_ir_17_mgt.mega) {
                              return '$ntrRSV KV [should be above 220MR ]';
                            } else if (ntr.ratedSystemVoltage == 110 &&
                                double.parse(_bbcontroller.text) < 0.220 &&
                                selectedGMTbbvalue == Enum_EM_ir_17_mgt.giga) {
                              return '$ntrRSV KV [should be above 0.220MR ]';
                            } else if (ntr.ratedSystemVoltage == 110 &&
                                double.parse(_bbcontroller.text) < 0.000220 &&
                                selectedGMTbbvalue == Enum_EM_ir_17_mgt.terra) {
                              return '$ntrRSV KV [should be above 0.000220MR ]';
                            }
                            // -------------------------------------------
                            if (ntr.ratedSystemVoltage == 132 &&
                                double.parse(_bbcontroller.text) < 264 &&
                                selectedGMTbbvalue == Enum_EM_ir_17_mgt.mega) {
                              return '$ntrRSV KV [should be above 264MR ]';
                            } else if (ntr.ratedSystemVoltage == 132 &&
                                double.parse(_bbcontroller.text) < 0.264 &&
                                selectedGMTbbvalue == Enum_EM_ir_17_mgt.giga) {
                              return '$ntrRSV KV [should be above 0.264MR ]';
                            } else if (ntr.ratedSystemVoltage == 132 &&
                                double.parse(_bbcontroller.text) < 0.000264 &&
                                selectedGMTbbvalue == Enum_EM_ir_17_mgt.terra) {
                              return '$ntrRSV KV [should be above 0.000264MR ]';
                            }
                            // -------------------------------------------
                            if (ntr.ratedSystemVoltage == 220 &&
                                double.parse(_bbcontroller.text) < 440 &&
                                selectedGMTbbvalue == Enum_EM_ir_17_mgt.mega) {
                              return '$ntrRSV KV [should be above 440MR ]';
                            } else if (ntr.ratedSystemVoltage == 220 &&
                                double.parse(_bbcontroller.text) < 0.440 &&
                                selectedGMTbbvalue == Enum_EM_ir_17_mgt.giga) {
                              return '$ntrRSV KV [should be above 0.440MR ]';
                            } else if (ntr.ratedSystemVoltage == 220 &&
                                double.parse(_bbcontroller.text) < 0.000440 &&
                                selectedGMTbbvalue == Enum_EM_ir_17_mgt.terra) {
                              return '$ntrRSV KV [should be above 0.000440MR ]';
                            }
                            // -------------------------------------------
                            if (ntr.ratedSystemVoltage == 400 &&
                                double.parse(_bbcontroller.text) < 800 &&
                                selectedGMTbbvalue == Enum_EM_ir_17_mgt.mega) {
                              return '$ntrRSV KV [should be above 800MR ]';
                            } else if (ntr.ratedSystemVoltage == 400 &&
                                double.parse(_bbcontroller.text) < 0.800 &&
                                selectedGMTbbvalue == Enum_EM_ir_17_mgt.giga) {
                              return '$ntrRSV KV [should be above 0.800MR ]';
                            } else if (ntr.ratedSystemVoltage == 400 &&
                                double.parse(_bbcontroller.text) < 0.000800 &&
                                selectedGMTbbvalue == Enum_EM_ir_17_mgt.terra) {
                              return '$ntrRSV KV [should be above 0.000800MR ]';
                            }
                          }
                        },
                      ),
                    ),
                    // >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
                    ntr.noOfPoles == 3
                        ? Container()
                        : Padding(
                            padding: EdgeInsets.fromLTRB(150, 0, 150, 10),
                            child: Column(
                              children: [
                                Padding(
                                  padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                                  child: MGT_nN(),
                                ),
                                CustomTextFormFieldForNumber(
                                  controller: _nncontroller,
                                  hintText: 'nn',
                                  validator: (val) {
                                    if (!val.IsValueEmpty) {
                                      return 'Field should not be empty';
                                    }
                                    if (ntr.etype == 'acb') {
                                      if (double.parse(_nncontroller.text) <
                                              1 &&
                                          selectedGMTnnvalue ==
                                              Enum_EM_ir_17_mgt.mega) {
                                        return 'Acceptable Limits Above [1 MΩ]';
                                      } else if (double.parse(
                                                  _nncontroller.text) <
                                              0.001 &&
                                          selectedGMTnnvalue ==
                                              Enum_EM_ir_17_mgt.giga) {
                                        return 'Acceptable Limits Above [0.001 MΩ]';
                                      } else if (double.parse(
                                                  _nncontroller.text) <
                                              0.000001 &&
                                          selectedGMTnnvalue ==
                                              Enum_EM_ir_17_mgt.terra) {
                                        return 'Acceptable Limits Above [0.000001 MΩ]';
                                      }
                                    } else if (ntr.etype == 'vcb' ||
                                        ntr.etype == 'ocb' ||
                                        ntr.etype == 'sf6') {
                                      if (ntr.ratedSystemVoltage == 11 &&
                                          double.parse(_nncontroller.text) <
                                              22 &&
                                          selectedGMTnnvalue ==
                                              Enum_EM_ir_17_mgt.mega) {
                                        return ' $ntrRSV KV [should be above 22MR ]';
                                      } else if (ntr.ratedSystemVoltage == 11 &&
                                          double.parse(_nncontroller.text) <
                                              0.022 &&
                                          selectedGMTnnvalue ==
                                              Enum_EM_ir_17_mgt.giga) {
                                        return ' $ntrRSV KV [should be above 0.022MR ]';
                                      } else if (ntr.ratedSystemVoltage == 11 &&
                                          double.parse(_nncontroller.text) <
                                              0.000022 &&
                                          selectedGMTnnvalue ==
                                              Enum_EM_ir_17_mgt.terra) {
                                        return ' $ntrRSV KV [should be above 0.000022MR ]';
                                      }
                                      // -------------------------------------------
                                      if (ntr.ratedSystemVoltage == 33 &&
                                          double.parse(_nncontroller.text) <
                                              66 &&
                                          selectedGMTnnvalue ==
                                              Enum_EM_ir_17_mgt.mega) {
                                        return '$ntrRSV KV [should be above 66MR ]';
                                      } else if (ntr.ratedSystemVoltage == 33 &&
                                          double.parse(_nncontroller.text) <
                                              0.066 &&
                                          selectedGMTnnvalue ==
                                              Enum_EM_ir_17_mgt.giga) {
                                        return '$ntrRSV KV [should be above 0.066MR ]';
                                      } else if (ntr.ratedSystemVoltage == 33 &&
                                          double.parse(_nncontroller.text) <
                                              0.000066 &&
                                          selectedGMTnnvalue ==
                                              Enum_EM_ir_17_mgt.terra) {
                                        return '$ntrRSV KV [should be above 0.000066MR ]';
                                      }
                                      // -------------------------------------------
                                      if (ntr.ratedSystemVoltage == 66 &&
                                          double.parse(_nncontroller.text) <
                                              132 &&
                                          selectedGMTnnvalue ==
                                              Enum_EM_ir_17_mgt.mega) {
                                        return '$ntrRSV KV [should be above 132MR ]';
                                      } else if (ntr.ratedSystemVoltage == 66 &&
                                          double.parse(_nncontroller.text) <
                                              0.132 &&
                                          selectedGMTnnvalue ==
                                              Enum_EM_ir_17_mgt.giga) {
                                        return '$ntrRSV KV [should be above 0.132MR ]';
                                      } else if (ntr.ratedSystemVoltage == 66 &&
                                          double.parse(_nncontroller.text) <
                                              0.000132 &&
                                          selectedGMTnnvalue ==
                                              Enum_EM_ir_17_mgt.terra) {
                                        return '$ntrRSV KV [should be above 0.000132MR ]';
                                      }
                                      // -------------------------------------------
                                      if (ntr.ratedSystemVoltage == 110 &&
                                          double.parse(_nncontroller.text) <
                                              220 &&
                                          selectedGMTnnvalue ==
                                              Enum_EM_ir_17_mgt.mega) {
                                        return '$ntrRSV KV [should be above 220MR ]';
                                      } else if (ntr.ratedSystemVoltage ==
                                              110 &&
                                          double.parse(_nncontroller.text) <
                                              0.220 &&
                                          selectedGMTnnvalue ==
                                              Enum_EM_ir_17_mgt.giga) {
                                        return '$ntrRSV KV [should be above 0.220MR ]';
                                      } else if (ntr.ratedSystemVoltage ==
                                              110 &&
                                          double.parse(_nncontroller.text) <
                                              0.000220 &&
                                          selectedGMTnnvalue ==
                                              Enum_EM_ir_17_mgt.terra) {
                                        return '$ntrRSV KV [should be above 0.000220MR ]';
                                      }
                                      // -------------------------------------------
                                      if (ntr.ratedSystemVoltage == 132 &&
                                          double.parse(_nncontroller.text) <
                                              264 &&
                                          selectedGMTnnvalue ==
                                              Enum_EM_ir_17_mgt.mega) {
                                        return '$ntrRSV KV [should be above 264MR ]';
                                      } else if (ntr.ratedSystemVoltage ==
                                              132 &&
                                          double.parse(_nncontroller.text) <
                                              0.264 &&
                                          selectedGMTnnvalue ==
                                              Enum_EM_ir_17_mgt.giga) {
                                        return '$ntrRSV KV [should be above 0.264MR ]';
                                      } else if (ntr.ratedSystemVoltage ==
                                              132 &&
                                          double.parse(_nncontroller.text) <
                                              0.000264 &&
                                          selectedGMTnnvalue ==
                                              Enum_EM_ir_17_mgt.terra) {
                                        return '$ntrRSV KV [should be above 0.000264MR ]';
                                      }
                                      // -------------------------------------------
                                      if (ntr.ratedSystemVoltage == 220 &&
                                          double.parse(_nncontroller.text) <
                                              440 &&
                                          selectedGMTnnvalue ==
                                              Enum_EM_ir_17_mgt.mega) {
                                        return '$ntrRSV KV [should be above 440MR ]';
                                      } else if (ntr.ratedSystemVoltage ==
                                              220 &&
                                          double.parse(_nncontroller.text) <
                                              0.440 &&
                                          selectedGMTnnvalue ==
                                              Enum_EM_ir_17_mgt.giga) {
                                        return '$ntrRSV KV [should be above 0.440MR ]';
                                      } else if (ntr.ratedSystemVoltage ==
                                              220 &&
                                          double.parse(_nncontroller.text) <
                                              0.000440 &&
                                          selectedGMTnnvalue ==
                                              Enum_EM_ir_17_mgt.terra) {
                                        return '$ntrRSV KV [should be above 0.000440MR ]';
                                      }
                                      // -------------------------------------------
                                      if (ntr.ratedSystemVoltage == 400 &&
                                          double.parse(_nncontroller.text) <
                                              800 &&
                                          selectedGMTnnvalue ==
                                              Enum_EM_ir_17_mgt.mega) {
                                        return '$ntrRSV KV [should be above 800MR ]';
                                      } else if (ntr.ratedSystemVoltage ==
                                              400 &&
                                          double.parse(_nncontroller.text) <
                                              0.800 &&
                                          selectedGMTnnvalue ==
                                              Enum_EM_ir_17_mgt.giga) {
                                        return '$ntrRSV KV [should be above 0.800MR ]';
                                      } else if (ntr.ratedSystemVoltage ==
                                              400 &&
                                          double.parse(_nncontroller.text) <
                                              0.000800 &&
                                          selectedGMTnnvalue ==
                                              Enum_EM_ir_17_mgt.terra) {
                                        return '$ntrRSV KV [should be above 0.000800MR ]';
                                      }
                                    }
                                  },
                                ),
                              ],
                            ),
                          ),
                  ]),
                ),
                // >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
                //-------------------------------------------------------------------------------------------------
                Divider(height: 10, color: Colors.grey[200]),
                Card(
                  elevation: 5,
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.fromLTRB(150, 10, 150, 0),
                        child: Text(
                          ' Pole-Earth (close condition) ',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            letterSpacing: 1,
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.fromLTRB(80, 0, 80, 0),
                        child: MGT_re(),
                      ),
                      Padding(
                        padding: EdgeInsets.fromLTRB(150, 10, 150, 10),
                        child: CustomTextFormFieldForNumber(
                          controller: _recontroller,
                          hintText: 're',
                          validator: (val) {
                            if (!val.IsValueEmpty) {
                              return 'Field should not be empty';
                            }
                            if (ntr.etype == 'acb') {
                              if (double.parse(_recontroller.text) < 1 &&
                                  selectedGMTrEvalue ==
                                      Enum_EM_ir_17_mgt.mega) {
                                return 'Acceptable Limits Above [1 MΩ]';
                              } else if (double.parse(_recontroller.text) <
                                      0.001 &&
                                  selectedGMTrEvalue ==
                                      Enum_EM_ir_17_mgt.giga) {
                                return 'Acceptable Limits Above [0.001 MΩ]';
                              } else if (double.parse(_recontroller.text) <
                                      0.000001 &&
                                  selectedGMTrEvalue ==
                                      Enum_EM_ir_17_mgt.terra) {
                                return 'Acceptable Limits Above [0.000001 MΩ]';
                              }
                            } else if (ntr.etype == 'vcb' ||
                                ntr.etype == 'ocb' ||
                                ntr.etype == 'sf6') {
                              if (ntr.ratedSystemVoltage == 11 &&
                                  double.parse(_recontroller.text) < 22 &&
                                  selectedGMTrEvalue ==
                                      Enum_EM_ir_17_mgt.mega) {
                                return ' $ntrRSV KV [should be above 22MR ]';
                              } else if (ntr.ratedSystemVoltage == 11 &&
                                  double.parse(_recontroller.text) < 0.022 &&
                                  selectedGMTrEvalue ==
                                      Enum_EM_ir_17_mgt.giga) {
                                return ' $ntrRSV KV [should be above 0.022MR ]';
                              } else if (ntr.ratedSystemVoltage == 11 &&
                                  double.parse(_recontroller.text) < 0.000022 &&
                                  selectedGMTrEvalue ==
                                      Enum_EM_ir_17_mgt.terra) {
                                return ' $ntrRSV KV [should be above 0.000022MR ]';
                              }
                              // -------------------------------------------
                              if (ntr.ratedSystemVoltage == 33 &&
                                  double.parse(_recontroller.text) < 66 &&
                                  selectedGMTrEvalue ==
                                      Enum_EM_ir_17_mgt.mega) {
                                return '$ntrRSV KV [should be above 66MR ]';
                              } else if (ntr.ratedSystemVoltage == 33 &&
                                  double.parse(_recontroller.text) < 0.066 &&
                                  selectedGMTrEvalue ==
                                      Enum_EM_ir_17_mgt.giga) {
                                return '$ntrRSV KV [should be above 0.066MR ]';
                              } else if (ntr.ratedSystemVoltage == 33 &&
                                  double.parse(_recontroller.text) < 0.000066 &&
                                  selectedGMTrEvalue ==
                                      Enum_EM_ir_17_mgt.terra) {
                                return '$ntrRSV KV [should be above 0.000066MR ]';
                              }
                              // -------------------------------------------
                              if (ntr.ratedSystemVoltage == 66 &&
                                  double.parse(_recontroller.text) < 132 &&
                                  selectedGMTrEvalue ==
                                      Enum_EM_ir_17_mgt.mega) {
                                return '$ntrRSV KV [should be above 132MR ]';
                              } else if (ntr.ratedSystemVoltage == 66 &&
                                  double.parse(_recontroller.text) < 0.132 &&
                                  selectedGMTrEvalue ==
                                      Enum_EM_ir_17_mgt.giga) {
                                return '$ntrRSV KV [should be above 0.132MR ]';
                              } else if (ntr.ratedSystemVoltage == 66 &&
                                  double.parse(_recontroller.text) < 0.000132 &&
                                  selectedGMTrEvalue ==
                                      Enum_EM_ir_17_mgt.terra) {
                                return '$ntrRSV KV [should be above 0.000132MR ]';
                              }
                              // -------------------------------------------
                              if (ntr.ratedSystemVoltage == 110 &&
                                  double.parse(_recontroller.text) < 220 &&
                                  selectedGMTrEvalue ==
                                      Enum_EM_ir_17_mgt.mega) {
                                return '$ntrRSV KV [should be above 220MR ]';
                              } else if (ntr.ratedSystemVoltage == 110 &&
                                  double.parse(_recontroller.text) < 0.220 &&
                                  selectedGMTrEvalue ==
                                      Enum_EM_ir_17_mgt.giga) {
                                return '$ntrRSV KV [should be above 0.220MR ]';
                              } else if (ntr.ratedSystemVoltage == 110 &&
                                  double.parse(_recontroller.text) < 0.000220 &&
                                  selectedGMTrEvalue ==
                                      Enum_EM_ir_17_mgt.terra) {
                                return '$ntrRSV KV [should be above 0.000220MR ]';
                              }
                              // -------------------------------------------
                              if (ntr.ratedSystemVoltage == 132 &&
                                  double.parse(_recontroller.text) < 264 &&
                                  selectedGMTrEvalue ==
                                      Enum_EM_ir_17_mgt.mega) {
                                return '$ntrRSV KV [should be above 264MR ]';
                              } else if (ntr.ratedSystemVoltage == 132 &&
                                  double.parse(_recontroller.text) < 0.264 &&
                                  selectedGMTrEvalue ==
                                      Enum_EM_ir_17_mgt.giga) {
                                return '$ntrRSV KV [should be above 0.264MR ]';
                              } else if (ntr.ratedSystemVoltage == 132 &&
                                  double.parse(_recontroller.text) < 0.000264 &&
                                  selectedGMTrEvalue ==
                                      Enum_EM_ir_17_mgt.terra) {
                                return '$ntrRSV KV [should be above 0.000264MR ]';
                              }
                              // -------------------------------------------
                              if (ntr.ratedSystemVoltage == 220 &&
                                  double.parse(_recontroller.text) < 440 &&
                                  selectedGMTrEvalue ==
                                      Enum_EM_ir_17_mgt.mega) {
                                return '$ntrRSV KV [should be above 440MR ]';
                              } else if (ntr.ratedSystemVoltage == 220 &&
                                  double.parse(_recontroller.text) < 0.440 &&
                                  selectedGMTrEvalue ==
                                      Enum_EM_ir_17_mgt.giga) {
                                return '$ntrRSV KV [should be above 0.440MR ]';
                              } else if (ntr.ratedSystemVoltage == 220 &&
                                  double.parse(_recontroller.text) < 0.000440 &&
                                  selectedGMTrEvalue ==
                                      Enum_EM_ir_17_mgt.terra) {
                                return '$ntrRSV KV [should be above 0.000440MR ]';
                              }
                              // -------------------------------------------
                              if (ntr.ratedSystemVoltage == 400 &&
                                  double.parse(_recontroller.text) < 800 &&
                                  selectedGMTrEvalue ==
                                      Enum_EM_ir_17_mgt.mega) {
                                return '$ntrRSV KV [should be above 800MR ]';
                              } else if (ntr.ratedSystemVoltage == 400 &&
                                  double.parse(_recontroller.text) < 0.800 &&
                                  selectedGMTrEvalue ==
                                      Enum_EM_ir_17_mgt.giga) {
                                return '$ntrRSV KV [should be above 0.800MR ]';
                              } else if (ntr.ratedSystemVoltage == 400 &&
                                  double.parse(_recontroller.text) < 0.000800 &&
                                  selectedGMTrEvalue ==
                                      Enum_EM_ir_17_mgt.terra) {
                                return '$ntrRSV KV [should be above 0.000800MR ]';
                              }
                            }
                          },
                        ),
                      ),
                      // >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
                      Padding(
                        padding: EdgeInsets.fromLTRB(80, 0, 80, 0),
                        child: MGT_ye(),
                      ),
                      Padding(
                        padding: EdgeInsets.fromLTRB(150, 0, 150, 10),
                        child: CustomTextFormFieldForNumber(
                          controller: _yecontroller,
                          hintText: 'ye',
                          validator: (val) {
                            if (!val.IsValueEmpty) {
                              return 'Field should not be empty';
                            }
                            if (ntr.etype == 'acb') {
                              if (double.parse(_yecontroller.text) < 1 &&
                                  selectedGMTyEvalue ==
                                      Enum_EM_ir_17_mgt.mega) {
                                return 'Acceptable Limits Above [1 MΩ]';
                              } else if (double.parse(_yecontroller.text) <
                                      0.001 &&
                                  selectedGMTyEvalue ==
                                      Enum_EM_ir_17_mgt.giga) {
                                return 'Acceptable Limits Above [0.001 MΩ]';
                              } else if (double.parse(_yecontroller.text) <
                                      0.000001 &&
                                  selectedGMTyEvalue ==
                                      Enum_EM_ir_17_mgt.terra) {
                                return 'Acceptable Limits Above [0.000001 MΩ]';
                              }
                            } else if (ntr.etype == 'vcb' ||
                                ntr.etype == 'ocb' ||
                                ntr.etype == 'sf6') {
                              if (ntr.ratedSystemVoltage == 11 &&
                                  double.parse(_yecontroller.text) < 22 &&
                                  selectedGMTyEvalue ==
                                      Enum_EM_ir_17_mgt.mega) {
                                return ' $ntrRSV KV [should be above 22MR ]';
                              } else if (ntr.ratedSystemVoltage == 11 &&
                                  double.parse(_yecontroller.text) < 0.022 &&
                                  selectedGMTyEvalue ==
                                      Enum_EM_ir_17_mgt.giga) {
                                return ' $ntrRSV KV [should be above 0.022MR ]';
                              } else if (ntr.ratedSystemVoltage == 11 &&
                                  double.parse(_yecontroller.text) < 0.000022 &&
                                  selectedGMTyEvalue ==
                                      Enum_EM_ir_17_mgt.terra) {
                                return ' $ntrRSV KV [should be above 0.000022MR ]';
                              }
                              // -------------------------------------------
                              if (ntr.ratedSystemVoltage == 33 &&
                                  double.parse(_yecontroller.text) < 66 &&
                                  selectedGMTyEvalue ==
                                      Enum_EM_ir_17_mgt.mega) {
                                return '$ntrRSV KV [should be above 66MR ]';
                              } else if (ntr.ratedSystemVoltage == 33 &&
                                  double.parse(_yecontroller.text) < 0.066 &&
                                  selectedGMTyEvalue ==
                                      Enum_EM_ir_17_mgt.giga) {
                                return '$ntrRSV KV [should be above 0.066MR ]';
                              } else if (ntr.ratedSystemVoltage == 33 &&
                                  double.parse(_yecontroller.text) < 0.000066 &&
                                  selectedGMTyEvalue ==
                                      Enum_EM_ir_17_mgt.terra) {
                                return '$ntrRSV KV [should be above 0.000066MR ]';
                              }
                              // -------------------------------------------
                              if (ntr.ratedSystemVoltage == 66 &&
                                  double.parse(_yecontroller.text) < 132 &&
                                  selectedGMTyEvalue ==
                                      Enum_EM_ir_17_mgt.mega) {
                                return '$ntrRSV KV [should be above 132MR ]';
                              } else if (ntr.ratedSystemVoltage == 66 &&
                                  double.parse(_yecontroller.text) < 0.132 &&
                                  selectedGMTyEvalue ==
                                      Enum_EM_ir_17_mgt.giga) {
                                return '$ntrRSV KV [should be above 0.132MR ]';
                              } else if (ntr.ratedSystemVoltage == 66 &&
                                  double.parse(_yecontroller.text) < 0.000132 &&
                                  selectedGMTyEvalue ==
                                      Enum_EM_ir_17_mgt.terra) {
                                return '$ntrRSV KV [should be above 0.000132MR ]';
                              }
                              // -------------------------------------------
                              if (ntr.ratedSystemVoltage == 110 &&
                                  double.parse(_yecontroller.text) < 220 &&
                                  selectedGMTyEvalue ==
                                      Enum_EM_ir_17_mgt.mega) {
                                return '$ntrRSV KV [should be above 220MR ]';
                              } else if (ntr.ratedSystemVoltage == 110 &&
                                  double.parse(_yecontroller.text) < 0.220 &&
                                  selectedGMTyEvalue ==
                                      Enum_EM_ir_17_mgt.giga) {
                                return '$ntrRSV KV [should be above 0.220MR ]';
                              } else if (ntr.ratedSystemVoltage == 110 &&
                                  double.parse(_yecontroller.text) < 0.000220 &&
                                  selectedGMTyEvalue ==
                                      Enum_EM_ir_17_mgt.terra) {
                                return '$ntrRSV KV [should be above 0.000220MR ]';
                              }
                              // -------------------------------------------
                              if (ntr.ratedSystemVoltage == 132 &&
                                  double.parse(_yecontroller.text) < 264 &&
                                  selectedGMTyEvalue ==
                                      Enum_EM_ir_17_mgt.mega) {
                                return '$ntrRSV KV [should be above 264MR ]';
                              } else if (ntr.ratedSystemVoltage == 132 &&
                                  double.parse(_yecontroller.text) < 0.264 &&
                                  selectedGMTyEvalue ==
                                      Enum_EM_ir_17_mgt.giga) {
                                return '$ntrRSV KV [should be above 0.264MR ]';
                              } else if (ntr.ratedSystemVoltage == 132 &&
                                  double.parse(_yecontroller.text) < 0.000264 &&
                                  selectedGMTyEvalue ==
                                      Enum_EM_ir_17_mgt.terra) {
                                return '$ntrRSV KV [should be above 0.000264MR ]';
                              }
                              // -------------------------------------------
                              if (ntr.ratedSystemVoltage == 220 &&
                                  double.parse(_yecontroller.text) < 440 &&
                                  selectedGMTyEvalue ==
                                      Enum_EM_ir_17_mgt.mega) {
                                return '$ntrRSV KV [should be above 440MR ]';
                              } else if (ntr.ratedSystemVoltage == 220 &&
                                  double.parse(_yecontroller.text) < 0.440 &&
                                  selectedGMTyEvalue ==
                                      Enum_EM_ir_17_mgt.giga) {
                                return '$ntrRSV KV [should be above 0.440MR ]';
                              } else if (ntr.ratedSystemVoltage == 220 &&
                                  double.parse(_yecontroller.text) < 0.000440 &&
                                  selectedGMTyEvalue ==
                                      Enum_EM_ir_17_mgt.terra) {
                                return '$ntrRSV KV [should be above 0.000440MR ]';
                              }
                              // -------------------------------------------
                              if (ntr.ratedSystemVoltage == 400 &&
                                  double.parse(_yecontroller.text) < 800 &&
                                  selectedGMTyEvalue ==
                                      Enum_EM_ir_17_mgt.mega) {
                                return '$ntrRSV KV [should be above 800MR ]';
                              } else if (ntr.ratedSystemVoltage == 400 &&
                                  double.parse(_yecontroller.text) < 0.800 &&
                                  selectedGMTyEvalue ==
                                      Enum_EM_ir_17_mgt.giga) {
                                return '$ntrRSV KV [should be above 0.800MR ]';
                              } else if (ntr.ratedSystemVoltage == 400 &&
                                  double.parse(_yecontroller.text) < 0.000800 &&
                                  selectedGMTyEvalue ==
                                      Enum_EM_ir_17_mgt.terra) {
                                return '$ntrRSV KV [should be above 0.000800MR ]';
                              }
                            }
                          },
                        ),
                      ),
                      // >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
                      Padding(
                        padding: EdgeInsets.fromLTRB(80, 0, 80, 0),
                        child: MGT_be(),
                      ),
                      Padding(
                        padding: EdgeInsets.fromLTRB(150, 0, 150, 10),
                        child: CustomTextFormFieldForNumber(
                          controller: _becontroller,
                          hintText: 'be',
                          validator: (val) {
                            if (!val.IsValueEmpty) {
                              return 'Field should not be empty';
                            }
                            if (ntr.etype == 'acb') {
                              if (double.parse(_becontroller.text) < 1 &&
                                  selectedGMTbEvalue ==
                                      Enum_EM_ir_17_mgt.mega) {
                                return 'Acceptable Limits Above [1 MΩ]';
                              } else if (double.parse(_becontroller.text) <
                                      0.001 &&
                                  selectedGMTbEvalue ==
                                      Enum_EM_ir_17_mgt.giga) {
                                return 'Acceptable Limits Above [0.001 MΩ]';
                              } else if (double.parse(_becontroller.text) <
                                      0.000001 &&
                                  selectedGMTbEvalue ==
                                      Enum_EM_ir_17_mgt.terra) {
                                return 'Acceptable Limits Above [0.000001 MΩ]';
                              }
                            } else if (ntr.etype == 'vcb' ||
                                ntr.etype == 'ocb' ||
                                ntr.etype == 'sf6') {
                              if (ntr.ratedSystemVoltage == 11 &&
                                  double.parse(_becontroller.text) < 22 &&
                                  selectedGMTbEvalue ==
                                      Enum_EM_ir_17_mgt.mega) {
                                return ' $ntrRSV KV [should be above 22MR ]';
                              } else if (ntr.ratedSystemVoltage == 11 &&
                                  double.parse(_becontroller.text) < 0.022 &&
                                  selectedGMTbEvalue ==
                                      Enum_EM_ir_17_mgt.giga) {
                                return ' $ntrRSV KV [should be above 0.022MR ]';
                              } else if (ntr.ratedSystemVoltage == 11 &&
                                  double.parse(_becontroller.text) < 0.000022 &&
                                  selectedGMTbEvalue ==
                                      Enum_EM_ir_17_mgt.terra) {
                                return ' $ntrRSV KV [should be above 0.000022MR ]';
                              }
                              // -------------------------------------------
                              if (ntr.ratedSystemVoltage == 33 &&
                                  double.parse(_becontroller.text) < 66 &&
                                  selectedGMTbEvalue ==
                                      Enum_EM_ir_17_mgt.mega) {
                                return '$ntrRSV KV [should be above 66MR ]';
                              } else if (ntr.ratedSystemVoltage == 33 &&
                                  double.parse(_becontroller.text) < 0.066 &&
                                  selectedGMTbEvalue ==
                                      Enum_EM_ir_17_mgt.giga) {
                                return '$ntrRSV KV [should be above 0.066MR ]';
                              } else if (ntr.ratedSystemVoltage == 33 &&
                                  double.parse(_becontroller.text) < 0.000066 &&
                                  selectedGMTbEvalue ==
                                      Enum_EM_ir_17_mgt.terra) {
                                return '$ntrRSV KV [should be above 0.000066MR ]';
                              }
                              // -------------------------------------------
                              if (ntr.ratedSystemVoltage == 66 &&
                                  double.parse(_becontroller.text) < 132 &&
                                  selectedGMTbEvalue ==
                                      Enum_EM_ir_17_mgt.mega) {
                                return '$ntrRSV KV [should be above 132MR ]';
                              } else if (ntr.ratedSystemVoltage == 66 &&
                                  double.parse(_becontroller.text) < 0.132 &&
                                  selectedGMTbEvalue ==
                                      Enum_EM_ir_17_mgt.giga) {
                                return '$ntrRSV KV [should be above 0.132MR ]';
                              } else if (ntr.ratedSystemVoltage == 66 &&
                                  double.parse(_becontroller.text) < 0.000132 &&
                                  selectedGMTbEvalue ==
                                      Enum_EM_ir_17_mgt.terra) {
                                return '$ntrRSV KV [should be above 0.000132MR ]';
                              }
                              // -------------------------------------------
                              if (ntr.ratedSystemVoltage == 110 &&
                                  double.parse(_becontroller.text) < 220 &&
                                  selectedGMTbEvalue ==
                                      Enum_EM_ir_17_mgt.mega) {
                                return '$ntrRSV KV [should be above 220MR ]';
                              } else if (ntr.ratedSystemVoltage == 110 &&
                                  double.parse(_becontroller.text) < 0.220 &&
                                  selectedGMTbEvalue ==
                                      Enum_EM_ir_17_mgt.giga) {
                                return '$ntrRSV KV [should be above 0.220MR ]';
                              } else if (ntr.ratedSystemVoltage == 110 &&
                                  double.parse(_becontroller.text) < 0.000220 &&
                                  selectedGMTbEvalue ==
                                      Enum_EM_ir_17_mgt.terra) {
                                return '$ntrRSV KV [should be above 0.000220MR ]';
                              }
                              // -------------------------------------------
                              if (ntr.ratedSystemVoltage == 132 &&
                                  double.parse(_becontroller.text) < 264 &&
                                  selectedGMTbEvalue ==
                                      Enum_EM_ir_17_mgt.mega) {
                                return '$ntrRSV KV [should be above 264MR ]';
                              } else if (ntr.ratedSystemVoltage == 132 &&
                                  double.parse(_becontroller.text) < 0.264 &&
                                  selectedGMTbEvalue ==
                                      Enum_EM_ir_17_mgt.giga) {
                                return '$ntrRSV KV [should be above 0.264MR ]';
                              } else if (ntr.ratedSystemVoltage == 132 &&
                                  double.parse(_becontroller.text) < 0.000264 &&
                                  selectedGMTbEvalue ==
                                      Enum_EM_ir_17_mgt.terra) {
                                return '$ntrRSV KV [should be above 0.000264MR ]';
                              }
                              // -------------------------------------------
                              if (ntr.ratedSystemVoltage == 220 &&
                                  double.parse(_becontroller.text) < 440 &&
                                  selectedGMTbEvalue ==
                                      Enum_EM_ir_17_mgt.mega) {
                                return '$ntrRSV KV [should be above 440MR ]';
                              } else if (ntr.ratedSystemVoltage == 220 &&
                                  double.parse(_becontroller.text) < 0.440 &&
                                  selectedGMTbEvalue ==
                                      Enum_EM_ir_17_mgt.giga) {
                                return '$ntrRSV KV [should be above 0.440MR ]';
                              } else if (ntr.ratedSystemVoltage == 220 &&
                                  double.parse(_becontroller.text) < 0.000440 &&
                                  selectedGMTbEvalue ==
                                      Enum_EM_ir_17_mgt.terra) {
                                return '$ntrRSV KV [should be above 0.000440MR ]';
                              }
                              // -------------------------------------------
                              if (ntr.ratedSystemVoltage == 400 &&
                                  double.parse(_becontroller.text) < 800 &&
                                  selectedGMTbEvalue ==
                                      Enum_EM_ir_17_mgt.mega) {
                                return '$ntrRSV KV [should be above 800MR ]';
                              } else if (ntr.ratedSystemVoltage == 400 &&
                                  double.parse(_becontroller.text) < 0.800 &&
                                  selectedGMTbEvalue ==
                                      Enum_EM_ir_17_mgt.giga) {
                                return '$ntrRSV KV [should be above 0.800MR ]';
                              } else if (ntr.ratedSystemVoltage == 400 &&
                                  double.parse(_becontroller.text) < 0.000800 &&
                                  selectedGMTbEvalue ==
                                      Enum_EM_ir_17_mgt.terra) {
                                return '$ntrRSV KV [should be above 0.000800MR ]';
                              }
                            }
                          },
                        ),
                      ),
                      // >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
                      ntr.noOfPoles == 3
                          ? Container()
                          : Padding(
                              padding: EdgeInsets.fromLTRB(150, 0, 150, 10),
                              child: Column(
                                children: [
                                  Padding(
                                    padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                                    child: MGT_ne(),
                                  ),
                                  CustomTextFormFieldForNumber(
                                    controller: _necontroller,
                                    hintText: 'ne',
                                    validator: (val) {
                                      if (!val.IsValueEmpty) {
                                        return 'Field should not be empty';
                                      }
                                      if (ntr.etype == 'acb') {
                                        if (double.parse(_necontroller.text) <
                                                1 &&
                                            selectedGMTnEvalue ==
                                                Enum_EM_ir_17_mgt.mega) {
                                          return 'Acceptable Limits Above [1 MΩ]';
                                        } else if (double.parse(
                                                    _necontroller.text) <
                                                0.001 &&
                                            selectedGMTnEvalue ==
                                                Enum_EM_ir_17_mgt.giga) {
                                          return 'Acceptable Limits Above [0.001 MΩ]';
                                        } else if (double.parse(
                                                    _necontroller.text) <
                                                0.000001 &&
                                            selectedGMTnEvalue ==
                                                Enum_EM_ir_17_mgt.terra) {
                                          return 'Acceptable Limits Above [0.000001 MΩ]';
                                        }
                                      } else if (ntr.etype == 'vcb' ||
                                          ntr.etype == 'ocb' ||
                                          ntr.etype == 'sf6') {
                                        if (ntr.ratedSystemVoltage == 11 &&
                                            double.parse(_necontroller.text) <
                                                22 &&
                                            selectedGMTnEvalue ==
                                                Enum_EM_ir_17_mgt.mega) {
                                          return ' $ntrRSV KV [should be above 22MR ]';
                                        } else if (ntr.ratedSystemVoltage ==
                                                11 &&
                                            double.parse(_necontroller.text) <
                                                0.022 &&
                                            selectedGMTnEvalue ==
                                                Enum_EM_ir_17_mgt.giga) {
                                          return ' $ntrRSV KV [should be above 0.022MR ]';
                                        } else if (ntr.ratedSystemVoltage ==
                                                11 &&
                                            double.parse(_necontroller.text) <
                                                0.000022 &&
                                            selectedGMTnEvalue ==
                                                Enum_EM_ir_17_mgt.terra) {
                                          return ' $ntrRSV KV [should be above 0.000022MR ]';
                                        }
                                        // -------------------------------------------
                                        if (ntr.ratedSystemVoltage == 33 &&
                                            double.parse(_necontroller.text) <
                                                66 &&
                                            selectedGMTnEvalue ==
                                                Enum_EM_ir_17_mgt.mega) {
                                          return '$ntrRSV KV [should be above 66MR ]';
                                        } else if (ntr.ratedSystemVoltage ==
                                                33 &&
                                            double.parse(_necontroller.text) <
                                                0.066 &&
                                            selectedGMTnEvalue ==
                                                Enum_EM_ir_17_mgt.giga) {
                                          return '$ntrRSV KV [should be above 0.066MR ]';
                                        } else if (ntr.ratedSystemVoltage ==
                                                33 &&
                                            double.parse(_necontroller.text) <
                                                0.000066 &&
                                            selectedGMTnEvalue ==
                                                Enum_EM_ir_17_mgt.terra) {
                                          return '$ntrRSV KV [should be above 0.000066MR ]';
                                        }
                                        // -------------------------------------------
                                        if (ntr.ratedSystemVoltage == 66 &&
                                            double.parse(_necontroller.text) <
                                                132 &&
                                            selectedGMTnEvalue ==
                                                Enum_EM_ir_17_mgt.mega) {
                                          return '$ntrRSV KV [should be above 132MR ]';
                                        } else if (ntr.ratedSystemVoltage ==
                                                66 &&
                                            double.parse(_necontroller.text) <
                                                0.132 &&
                                            selectedGMTnEvalue ==
                                                Enum_EM_ir_17_mgt.giga) {
                                          return '$ntrRSV KV [should be above 0.132MR ]';
                                        } else if (ntr.ratedSystemVoltage ==
                                                66 &&
                                            double.parse(_necontroller.text) <
                                                0.000132 &&
                                            selectedGMTnEvalue ==
                                                Enum_EM_ir_17_mgt.terra) {
                                          return '$ntrRSV KV [should be above 0.000132MR ]';
                                        }
                                        // -------------------------------------------
                                        if (ntr.ratedSystemVoltage == 110 &&
                                            double.parse(_necontroller.text) <
                                                220 &&
                                            selectedGMTnEvalue ==
                                                Enum_EM_ir_17_mgt.mega) {
                                          return '$ntrRSV KV [should be above 220MR ]';
                                        } else if (ntr.ratedSystemVoltage ==
                                                110 &&
                                            double.parse(_necontroller.text) <
                                                0.220 &&
                                            selectedGMTnEvalue ==
                                                Enum_EM_ir_17_mgt.giga) {
                                          return '$ntrRSV KV [should be above 0.220MR ]';
                                        } else if (ntr.ratedSystemVoltage ==
                                                110 &&
                                            double.parse(_necontroller.text) <
                                                0.000220 &&
                                            selectedGMTnEvalue ==
                                                Enum_EM_ir_17_mgt.terra) {
                                          return '$ntrRSV KV [should be above 0.000220MR ]';
                                        }
                                        // -------------------------------------------
                                        if (ntr.ratedSystemVoltage == 132 &&
                                            double.parse(_necontroller.text) <
                                                264 &&
                                            selectedGMTnEvalue ==
                                                Enum_EM_ir_17_mgt.mega) {
                                          return '$ntrRSV KV [should be above 264MR ]';
                                        } else if (ntr.ratedSystemVoltage ==
                                                132 &&
                                            double.parse(_necontroller.text) <
                                                0.264 &&
                                            selectedGMTnEvalue ==
                                                Enum_EM_ir_17_mgt.giga) {
                                          return '$ntrRSV KV [should be above 0.264MR ]';
                                        } else if (ntr.ratedSystemVoltage ==
                                                132 &&
                                            double.parse(_necontroller.text) <
                                                0.000264 &&
                                            selectedGMTnEvalue ==
                                                Enum_EM_ir_17_mgt.terra) {
                                          return '$ntrRSV KV [should be above 0.000264MR ]';
                                        }
                                        // -------------------------------------------
                                        if (ntr.ratedSystemVoltage == 220 &&
                                            double.parse(_necontroller.text) <
                                                440 &&
                                            selectedGMTnEvalue ==
                                                Enum_EM_ir_17_mgt.mega) {
                                          return '$ntrRSV KV [should be above 440MR ]';
                                        } else if (ntr.ratedSystemVoltage ==
                                                220 &&
                                            double.parse(_necontroller.text) <
                                                0.440 &&
                                            selectedGMTnEvalue ==
                                                Enum_EM_ir_17_mgt.giga) {
                                          return '$ntrRSV KV [should be above 0.440MR ]';
                                        } else if (ntr.ratedSystemVoltage ==
                                                220 &&
                                            double.parse(_necontroller.text) <
                                                0.000440 &&
                                            selectedGMTnEvalue ==
                                                Enum_EM_ir_17_mgt.terra) {
                                          return '$ntrRSV KV [should be above 0.000440MR ]';
                                        }
                                        // -------------------------------------------
                                        if (ntr.ratedSystemVoltage == 400 &&
                                            double.parse(_necontroller.text) <
                                                800 &&
                                            selectedGMTnEvalue ==
                                                Enum_EM_ir_17_mgt.mega) {
                                          return '$ntrRSV KV [should be above 800MR ]';
                                        } else if (ntr.ratedSystemVoltage ==
                                                400 &&
                                            double.parse(_necontroller.text) <
                                                0.800 &&
                                            selectedGMTnEvalue ==
                                                Enum_EM_ir_17_mgt.giga) {
                                          return '$ntrRSV KV [should be above 0.800MR ]';
                                        } else if (ntr.ratedSystemVoltage ==
                                                400 &&
                                            double.parse(_necontroller.text) <
                                                0.000800 &&
                                            selectedGMTnEvalue ==
                                                Enum_EM_ir_17_mgt.terra) {
                                          return '$ntrRSV KV [should be above 0.000800MR ]';
                                        }
                                      }
                                    },
                                  ),
                                ],
                              ),
                            ),
                    ],
                  ),
                ),
                // >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
                //--------------------------------------------------------------------------------------------
                Divider(height: 10, color: Colors.grey[200]),
                Card(
                  elevation: 5,
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.fromLTRB(150, 10, 150, 0),
                        child: Text(
                          ' Pole-Pole (close condition) ',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            letterSpacing: 1,
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.fromLTRB(80, 0, 80, 0),
                        child: MGT_ry(),
                      ),
                      Padding(
                        padding: EdgeInsets.fromLTRB(150, 10, 150, 10),
                        child: Column(
                          children: [
                            CustomTextFormFieldForNumber(
                              controller: _rycontroller,
                              hintText: 'ry',
                              validator: (val) {
                                if (!val.IsValueEmpty) {
                                  return 'Field should not be empty';
                                }
                                if (ntr.etype == 'acb') {
                                  if (double.parse(_rycontroller.text) < 1 &&
                                      selectedGMTrYvalue ==
                                          Enum_EM_ir_17_mgt.mega) {
                                    return 'Acceptable Limits Above [1 MΩ]';
                                  } else if (double.parse(_rycontroller.text) <
                                          0.001 &&
                                      selectedGMTrYvalue ==
                                          Enum_EM_ir_17_mgt.giga) {
                                    return 'Acceptable Limits Above [0.001 MΩ]';
                                  } else if (double.parse(_rycontroller.text) <
                                          0.000001 &&
                                      selectedGMTrYvalue ==
                                          Enum_EM_ir_17_mgt.terra) {
                                    return 'Acceptable Limits Above [0.000001 MΩ]';
                                  }
                                }
                                if (ntr.etype == 'vcb' ||
                                    ntr.etype == 'ocb' ||
                                    ntr.etype == 'sf6') {
                                  if (ntr.ratedSystemVoltage == 11 &&
                                      double.parse(_rycontroller.text) < 22 &&
                                      selectedGMTrYvalue ==
                                          Enum_EM_ir_17_mgt.mega) {
                                    return ' $ntrRSV KV [should be above 22MR ]';
                                  } else if (ntr.ratedSystemVoltage == 11 &&
                                      double.parse(_rycontroller.text) <
                                          0.022 &&
                                      selectedGMTrYvalue ==
                                          Enum_EM_ir_17_mgt.giga) {
                                    return ' $ntrRSV KV [should be above 0.022MR ]';
                                  } else if (ntr.ratedSystemVoltage == 11 &&
                                      double.parse(_rycontroller.text) <
                                          0.000022 &&
                                      selectedGMTrYvalue ==
                                          Enum_EM_ir_17_mgt.terra) {
                                    return ' $ntrRSV KV [should be above 0.000022MR ]';
                                  }
                                  // -------------------------------------------
                                  if (ntr.ratedSystemVoltage == 33 &&
                                      double.parse(_rycontroller.text) < 66 &&
                                      selectedGMTrYvalue ==
                                          Enum_EM_ir_17_mgt.mega) {
                                    return '$ntrRSV KV [should be above 66MR ]';
                                  } else if (ntr.ratedSystemVoltage == 33 &&
                                      double.parse(_rycontroller.text) <
                                          0.066 &&
                                      selectedGMTrYvalue ==
                                          Enum_EM_ir_17_mgt.giga) {
                                    return '$ntrRSV KV [should be above 0.066MR ]';
                                  } else if (ntr.ratedSystemVoltage == 33 &&
                                      double.parse(_rycontroller.text) <
                                          0.000066 &&
                                      selectedGMTrYvalue ==
                                          Enum_EM_ir_17_mgt.terra) {
                                    return '$ntrRSV KV [should be above 0.000066MR ]';
                                  }
                                  // -------------------------------------------
                                  if (ntr.ratedSystemVoltage == 66 &&
                                      double.parse(_rycontroller.text) < 132 &&
                                      selectedGMTrYvalue ==
                                          Enum_EM_ir_17_mgt.mega) {
                                    return '$ntrRSV KV [should be above 132MR ]';
                                  } else if (ntr.ratedSystemVoltage == 66 &&
                                      double.parse(_rycontroller.text) <
                                          0.132 &&
                                      selectedGMTrYvalue ==
                                          Enum_EM_ir_17_mgt.giga) {
                                    return '$ntrRSV KV [should be above 0.132MR ]';
                                  } else if (ntr.ratedSystemVoltage == 66 &&
                                      double.parse(_rycontroller.text) <
                                          0.000132 &&
                                      selectedGMTrYvalue ==
                                          Enum_EM_ir_17_mgt.terra) {
                                    return '$ntrRSV KV [should be above 0.000132MR ]';
                                  }
                                  // -------------------------------------------
                                  if (ntr.ratedSystemVoltage == 110 &&
                                      double.parse(_rycontroller.text) < 220 &&
                                      selectedGMTrYvalue ==
                                          Enum_EM_ir_17_mgt.mega) {
                                    return '$ntrRSV KV [should be above 220MR ]';
                                  } else if (ntr.ratedSystemVoltage == 110 &&
                                      double.parse(_rycontroller.text) <
                                          0.220 &&
                                      selectedGMTrYvalue ==
                                          Enum_EM_ir_17_mgt.giga) {
                                    return '$ntrRSV KV [should be above 0.220MR ]';
                                  } else if (ntr.ratedSystemVoltage == 110 &&
                                      double.parse(_rycontroller.text) <
                                          0.000220 &&
                                      selectedGMTrYvalue ==
                                          Enum_EM_ir_17_mgt.terra) {
                                    return '$ntrRSV KV [should be above 0.000220MR ]';
                                  }
                                  // -------------------------------------------
                                  if (ntr.ratedSystemVoltage == 132 &&
                                      double.parse(_rycontroller.text) < 264 &&
                                      selectedGMTrYvalue ==
                                          Enum_EM_ir_17_mgt.mega) {
                                    return '$ntrRSV KV [should be above 264MR ]';
                                  } else if (ntr.ratedSystemVoltage == 132 &&
                                      double.parse(_rycontroller.text) <
                                          0.264 &&
                                      selectedGMTrYvalue ==
                                          Enum_EM_ir_17_mgt.giga) {
                                    return '$ntrRSV KV [should be above 0.264MR ]';
                                  } else if (ntr.ratedSystemVoltage == 132 &&
                                      double.parse(_rycontroller.text) <
                                          0.000264 &&
                                      selectedGMTrYvalue ==
                                          Enum_EM_ir_17_mgt.terra) {
                                    return '$ntrRSV KV [should be above 0.000264MR ]';
                                  }
                                  // -------------------------------------------
                                  if (ntr.ratedSystemVoltage == 220 &&
                                      double.parse(_rycontroller.text) < 440 &&
                                      selectedGMTrYvalue ==
                                          Enum_EM_ir_17_mgt.mega) {
                                    return '$ntrRSV KV [should be above 440MR ]';
                                  } else if (ntr.ratedSystemVoltage == 220 &&
                                      double.parse(_rycontroller.text) <
                                          0.440 &&
                                      selectedGMTrYvalue ==
                                          Enum_EM_ir_17_mgt.giga) {
                                    return '$ntrRSV KV [should be above 0.440MR ]';
                                  } else if (ntr.ratedSystemVoltage == 220 &&
                                      double.parse(_rycontroller.text) <
                                          0.000440 &&
                                      selectedGMTrYvalue ==
                                          Enum_EM_ir_17_mgt.terra) {
                                    return '$ntrRSV KV [should be above 0.000440MR ]';
                                  }
                                  // -------------------------------------------
                                  if (ntr.ratedSystemVoltage == 400 &&
                                      double.parse(_rycontroller.text) < 800 &&
                                      selectedGMTrYvalue ==
                                          Enum_EM_ir_17_mgt.mega) {
                                    return '$ntrRSV KV [should be above 800MR ]';
                                  } else if (ntr.ratedSystemVoltage == 400 &&
                                      double.parse(_rycontroller.text) <
                                          0.800 &&
                                      selectedGMTrYvalue ==
                                          Enum_EM_ir_17_mgt.giga) {
                                    return '$ntrRSV KV [should be above 0.800MR ]';
                                  } else if (ntr.ratedSystemVoltage == 400 &&
                                      double.parse(_rycontroller.text) <
                                          0.000800 &&
                                      selectedGMTrYvalue ==
                                          Enum_EM_ir_17_mgt.terra) {
                                    return '$ntrRSV KV [should be above 0.000800MR ]';
                                  }
                                }
                              },
                            ),
                          ],
                        ),
                      ),
                      // >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
                      Padding(
                        padding: EdgeInsets.fromLTRB(80, 0, 80, 0),
                        child: MGT_yb(),
                      ),
                      Padding(
                        padding: EdgeInsets.fromLTRB(150, 0, 150, 10),
                        child: CustomTextFormFieldForNumber(
                          controller: _ybcontroller,
                          hintText: 'yb',
                          validator: (val) {
                            if (!val.IsValueEmpty) {
                              return 'Field should not be empty';
                            }
                            if (ntr.etype == 'acb') {
                              if (double.parse(_ybcontroller.text) < 1 &&
                                  selectedGMTyBvalue ==
                                      Enum_EM_ir_17_mgt.mega) {
                                return 'Acceptable Limits Above [1 MΩ]';
                              } else if (double.parse(_ybcontroller.text) <
                                      0.001 &&
                                  selectedGMTyBvalue ==
                                      Enum_EM_ir_17_mgt.giga) {
                                return 'Acceptable Limits Above [0.001 MΩ]';
                              } else if (double.parse(_ybcontroller.text) <
                                      0.000001 &&
                                  selectedGMTyBvalue ==
                                      Enum_EM_ir_17_mgt.terra) {
                                return 'Acceptable Limits Above [0.000001 MΩ]';
                              }
                            } else if (ntr.etype == 'vcb' ||
                                ntr.etype == 'ocb' ||
                                ntr.etype == 'sf6') {
                              if (ntr.ratedSystemVoltage == 11 &&
                                  double.parse(_ybcontroller.text) < 22 &&
                                  selectedGMTyBvalue ==
                                      Enum_EM_ir_17_mgt.mega) {
                                return ' $ntrRSV KV [should be above 22MR ]';
                              } else if (ntr.ratedSystemVoltage == 11 &&
                                  double.parse(_ybcontroller.text) < 0.022 &&
                                  selectedGMTyBvalue ==
                                      Enum_EM_ir_17_mgt.giga) {
                                return ' $ntrRSV KV [should be above 0.022MR ]';
                              } else if (ntr.ratedSystemVoltage == 11 &&
                                  double.parse(_ybcontroller.text) < 0.000022 &&
                                  selectedGMTyBvalue ==
                                      Enum_EM_ir_17_mgt.terra) {
                                return ' $ntrRSV KV [should be above 0.000022MR ]';
                              }
                              // -------------------------------------------
                              if (ntr.ratedSystemVoltage == 33 &&
                                  double.parse(_ybcontroller.text) < 66 &&
                                  selectedGMTyBvalue ==
                                      Enum_EM_ir_17_mgt.mega) {
                                return '$ntrRSV KV [should be above 66MR ]';
                              } else if (ntr.ratedSystemVoltage == 33 &&
                                  double.parse(_ybcontroller.text) < 0.066 &&
                                  selectedGMTyBvalue ==
                                      Enum_EM_ir_17_mgt.giga) {
                                return '$ntrRSV KV [should be above 0.066MR ]';
                              } else if (ntr.ratedSystemVoltage == 33 &&
                                  double.parse(_ybcontroller.text) < 0.000066 &&
                                  selectedGMTyBvalue ==
                                      Enum_EM_ir_17_mgt.terra) {
                                return '$ntrRSV KV [should be above 0.000066MR ]';
                              }
                              // -------------------------------------------
                              if (ntr.ratedSystemVoltage == 66 &&
                                  double.parse(_ybcontroller.text) < 132 &&
                                  selectedGMTyBvalue ==
                                      Enum_EM_ir_17_mgt.mega) {
                                return '$ntrRSV KV [should be above 132MR ]';
                              } else if (ntr.ratedSystemVoltage == 66 &&
                                  double.parse(_ybcontroller.text) < 0.132 &&
                                  selectedGMTyBvalue ==
                                      Enum_EM_ir_17_mgt.giga) {
                                return '$ntrRSV KV [should be above 0.132MR ]';
                              } else if (ntr.ratedSystemVoltage == 66 &&
                                  double.parse(_ybcontroller.text) < 0.000132 &&
                                  selectedGMTyBvalue ==
                                      Enum_EM_ir_17_mgt.terra) {
                                return '$ntrRSV KV [should be above 0.000132MR ]';
                              }
                              // -------------------------------------------
                              if (ntr.ratedSystemVoltage == 110 &&
                                  double.parse(_ybcontroller.text) < 220 &&
                                  selectedGMTyBvalue ==
                                      Enum_EM_ir_17_mgt.mega) {
                                return '$ntrRSV KV [should be above 220MR ]';
                              } else if (ntr.ratedSystemVoltage == 110 &&
                                  double.parse(_ybcontroller.text) < 0.220 &&
                                  selectedGMTyBvalue ==
                                      Enum_EM_ir_17_mgt.giga) {
                                return '$ntrRSV KV [should be above 0.220MR ]';
                              } else if (ntr.ratedSystemVoltage == 110 &&
                                  double.parse(_ybcontroller.text) < 0.000220 &&
                                  selectedGMTyBvalue ==
                                      Enum_EM_ir_17_mgt.terra) {
                                return '$ntrRSV KV [should be above 0.000220MR ]';
                              }
                              // -------------------------------------------
                              if (ntr.ratedSystemVoltage == 132 &&
                                  double.parse(_ybcontroller.text) < 264 &&
                                  selectedGMTyBvalue ==
                                      Enum_EM_ir_17_mgt.mega) {
                                return '$ntrRSV KV [should be above 264MR ]';
                              } else if (ntr.ratedSystemVoltage == 132 &&
                                  double.parse(_ybcontroller.text) < 0.264 &&
                                  selectedGMTyBvalue ==
                                      Enum_EM_ir_17_mgt.giga) {
                                return '$ntrRSV KV [should be above 0.264MR ]';
                              } else if (ntr.ratedSystemVoltage == 132 &&
                                  double.parse(_ybcontroller.text) < 0.000264 &&
                                  selectedGMTyBvalue ==
                                      Enum_EM_ir_17_mgt.terra) {
                                return '$ntrRSV KV [should be above 0.000264MR ]';
                              }
                              // -------------------------------------------
                              if (ntr.ratedSystemVoltage == 220 &&
                                  double.parse(_ybcontroller.text) < 440 &&
                                  selectedGMTyBvalue ==
                                      Enum_EM_ir_17_mgt.mega) {
                                return '$ntrRSV KV [should be above 440MR ]';
                              } else if (ntr.ratedSystemVoltage == 220 &&
                                  double.parse(_ybcontroller.text) < 0.440 &&
                                  selectedGMTyBvalue ==
                                      Enum_EM_ir_17_mgt.giga) {
                                return '$ntrRSV KV [should be above 0.440MR ]';
                              } else if (ntr.ratedSystemVoltage == 220 &&
                                  double.parse(_ybcontroller.text) < 0.000440 &&
                                  selectedGMTyBvalue ==
                                      Enum_EM_ir_17_mgt.terra) {
                                return '$ntrRSV KV [should be above 0.000440MR ]';
                              }
                              // -------------------------------------------
                              if (ntr.ratedSystemVoltage == 400 &&
                                  double.parse(_ybcontroller.text) < 800 &&
                                  selectedGMTyBvalue ==
                                      Enum_EM_ir_17_mgt.mega) {
                                return '$ntrRSV KV [should be above 800MR ]';
                              } else if (ntr.ratedSystemVoltage == 400 &&
                                  double.parse(_ybcontroller.text) < 0.800 &&
                                  selectedGMTyBvalue ==
                                      Enum_EM_ir_17_mgt.giga) {
                                return '$ntrRSV KV [should be above 0.800MR ]';
                              } else if (ntr.ratedSystemVoltage == 400 &&
                                  double.parse(_ybcontroller.text) < 0.000800 &&
                                  selectedGMTyBvalue ==
                                      Enum_EM_ir_17_mgt.terra) {
                                return '$ntrRSV KV [should be above 0.000800MR ]';
                              }
                            }
                          },
                        ),
                      ),
                      // >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
                      Padding(
                        padding: EdgeInsets.fromLTRB(80, 0, 80, 0),
                        child: MGT_br(),
                      ),
                      Padding(
                        padding: EdgeInsets.fromLTRB(150, 0, 150, 10),
                        child: CustomTextFormFieldForNumber(
                          controller: _brcontroller,
                          hintText: 'br',
                          validator: (val) {
                            if (!val.IsValueEmpty) {
                              return 'Field should not be empty';
                            }
                            if (ntr.etype == 'acb') {
                              if (double.parse(_brcontroller.text) < 1 &&
                                  selectedGMTbRvalue ==
                                      Enum_EM_ir_17_mgt.mega) {
                                return 'Acceptable Limits Above [1 MΩ]';
                              } else if (double.parse(_brcontroller.text) <
                                      0.001 &&
                                  selectedGMTbRvalue ==
                                      Enum_EM_ir_17_mgt.giga) {
                                return 'Acceptable Limits Above [0.001 MΩ]';
                              } else if (double.parse(_brcontroller.text) <
                                      0.000001 &&
                                  selectedGMTbRvalue ==
                                      Enum_EM_ir_17_mgt.terra) {
                                return 'Acceptable Limits Above [0.000001 MΩ]';
                              }
                            } else if (ntr.etype == 'vcb' ||
                                ntr.etype == 'ocb' ||
                                ntr.etype == 'sf6') {
                              if (ntr.ratedSystemVoltage == 11 &&
                                  double.parse(_brcontroller.text) < 22 &&
                                  selectedGMTbRvalue ==
                                      Enum_EM_ir_17_mgt.mega) {
                                return ' $ntrRSV KV [should be above 22MR ]';
                              } else if (ntr.ratedSystemVoltage == 11 &&
                                  double.parse(_brcontroller.text) < 0.022 &&
                                  selectedGMTbRvalue ==
                                      Enum_EM_ir_17_mgt.giga) {
                                return ' $ntrRSV KV [should be above 0.022MR ]';
                              } else if (ntr.ratedSystemVoltage == 11 &&
                                  double.parse(_brcontroller.text) < 0.000022 &&
                                  selectedGMTbRvalue ==
                                      Enum_EM_ir_17_mgt.terra) {
                                return ' $ntrRSV KV [should be above 0.000022MR ]';
                              }
                              // -------------------------------------------
                              if (ntr.ratedSystemVoltage == 33 &&
                                  double.parse(_brcontroller.text) < 66 &&
                                  selectedGMTbRvalue ==
                                      Enum_EM_ir_17_mgt.mega) {
                                return '$ntrRSV KV [should be above 66MR ]';
                              } else if (ntr.ratedSystemVoltage == 33 &&
                                  double.parse(_brcontroller.text) < 0.066 &&
                                  selectedGMTbRvalue ==
                                      Enum_EM_ir_17_mgt.giga) {
                                return '$ntrRSV KV [should be above 0.066MR ]';
                              } else if (ntr.ratedSystemVoltage == 33 &&
                                  double.parse(_brcontroller.text) < 0.000066 &&
                                  selectedGMTbRvalue ==
                                      Enum_EM_ir_17_mgt.terra) {
                                return '$ntrRSV KV [should be above 0.000066MR ]';
                              }
                              // -------------------------------------------
                              if (ntr.ratedSystemVoltage == 66 &&
                                  double.parse(_brcontroller.text) < 132 &&
                                  selectedGMTbRvalue ==
                                      Enum_EM_ir_17_mgt.mega) {
                                return '$ntrRSV KV [should be above 132MR ]';
                              } else if (ntr.ratedSystemVoltage == 66 &&
                                  double.parse(_brcontroller.text) < 0.132 &&
                                  selectedGMTbRvalue ==
                                      Enum_EM_ir_17_mgt.giga) {
                                return '$ntrRSV KV [should be above 0.132MR ]';
                              } else if (ntr.ratedSystemVoltage == 66 &&
                                  double.parse(_brcontroller.text) < 0.000132 &&
                                  selectedGMTbRvalue ==
                                      Enum_EM_ir_17_mgt.terra) {
                                return '$ntrRSV KV [should be above 0.000132MR ]';
                              }
                              // -------------------------------------------
                              if (ntr.ratedSystemVoltage == 110 &&
                                  double.parse(_brcontroller.text) < 220 &&
                                  selectedGMTbRvalue ==
                                      Enum_EM_ir_17_mgt.mega) {
                                return '$ntrRSV KV [should be above 220MR ]';
                              } else if (ntr.ratedSystemVoltage == 110 &&
                                  double.parse(_brcontroller.text) < 0.220 &&
                                  selectedGMTbRvalue ==
                                      Enum_EM_ir_17_mgt.giga) {
                                return '$ntrRSV KV [should be above 0.220MR ]';
                              } else if (ntr.ratedSystemVoltage == 110 &&
                                  double.parse(_brcontroller.text) < 0.000220 &&
                                  selectedGMTbRvalue ==
                                      Enum_EM_ir_17_mgt.terra) {
                                return '$ntrRSV KV [should be above 0.000220MR ]';
                              }
                              // -------------------------------------------
                              if (ntr.ratedSystemVoltage == 132 &&
                                  double.parse(_brcontroller.text) < 264 &&
                                  selectedGMTbRvalue ==
                                      Enum_EM_ir_17_mgt.mega) {
                                return '$ntrRSV KV [should be above 264MR ]';
                              } else if (ntr.ratedSystemVoltage == 132 &&
                                  double.parse(_brcontroller.text) < 0.264 &&
                                  selectedGMTbRvalue ==
                                      Enum_EM_ir_17_mgt.giga) {
                                return '$ntrRSV KV [should be above 0.264MR ]';
                              } else if (ntr.ratedSystemVoltage == 132 &&
                                  double.parse(_brcontroller.text) < 0.000264 &&
                                  selectedGMTbRvalue ==
                                      Enum_EM_ir_17_mgt.terra) {
                                return '$ntrRSV KV [should be above 0.000264MR ]';
                              }
                              // -------------------------------------------
                              if (ntr.ratedSystemVoltage == 220 &&
                                  double.parse(_brcontroller.text) < 440 &&
                                  selectedGMTbRvalue ==
                                      Enum_EM_ir_17_mgt.mega) {
                                return '$ntrRSV KV [should be above 440MR ]';
                              } else if (ntr.ratedSystemVoltage == 220 &&
                                  double.parse(_brcontroller.text) < 0.440 &&
                                  selectedGMTbRvalue ==
                                      Enum_EM_ir_17_mgt.giga) {
                                return '$ntrRSV KV [should be above 0.440MR ]';
                              } else if (ntr.ratedSystemVoltage == 220 &&
                                  double.parse(_brcontroller.text) < 0.000440 &&
                                  selectedGMTbRvalue ==
                                      Enum_EM_ir_17_mgt.terra) {
                                return '$ntrRSV KV [should be above 0.000440MR ]';
                              }
                              // -------------------------------------------
                              if (ntr.ratedSystemVoltage == 400 &&
                                  double.parse(_brcontroller.text) < 800 &&
                                  selectedGMTbRvalue ==
                                      Enum_EM_ir_17_mgt.mega) {
                                return '$ntrRSV KV [should be above 800MR ]';
                              } else if (ntr.ratedSystemVoltage == 400 &&
                                  double.parse(_brcontroller.text) < 0.800 &&
                                  selectedGMTbRvalue ==
                                      Enum_EM_ir_17_mgt.giga) {
                                return '$ntrRSV KV [should be above 0.800MR ]';
                              } else if (ntr.ratedSystemVoltage == 400 &&
                                  double.parse(_brcontroller.text) < 0.000800 &&
                                  selectedGMTbRvalue ==
                                      Enum_EM_ir_17_mgt.terra) {
                                return '$ntrRSV KV [should be above 0.000800MR ]';
                              }
                            }
                          },
                        ),
                      ),
                      // >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
                      ntr.noOfPoles == 3
                          ? Container()
                          : Padding(
                              padding: EdgeInsets.fromLTRB(150, 0, 150, 10),
                              child: Column(
                                children: [
                                  Padding(
                                    padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                                    child: MGT_rn(),
                                  ),
                                  CustomTextFormFieldForNumber(
                                    controller: _rncontroller,
                                    hintText: 'rn',
                                    validator: (val) {
                                      if (!val.IsValueEmpty) {
                                        return 'Field should not be empty';
                                      }
                                      if (ntr.etype == 'acb') {
                                        if (double.parse(_rncontroller.text) <
                                                1 &&
                                            selectedGMTrNvalue ==
                                                Enum_EM_ir_17_mgt.mega) {
                                          return 'Acceptable Limits Above [1 MΩ]';
                                        } else if (double.parse(
                                                    _rncontroller.text) <
                                                0.001 &&
                                            selectedGMTrNvalue ==
                                                Enum_EM_ir_17_mgt.giga) {
                                          return 'Acceptable Limits Above [0.001 MΩ]';
                                        } else if (double.parse(
                                                    _rncontroller.text) <
                                                0.000001 &&
                                            selectedGMTrNvalue ==
                                                Enum_EM_ir_17_mgt.terra) {
                                          return 'Acceptable Limits Above [0.000001 MΩ]';
                                        }
                                      } else if (ntr.etype == 'vcb' ||
                                          ntr.etype == 'ocb' ||
                                          ntr.etype == 'sf6') {
                                        if (ntr.ratedSystemVoltage == 11 &&
                                            double.parse(_rncontroller.text) <
                                                22 &&
                                            selectedGMTrNvalue ==
                                                Enum_EM_ir_17_mgt.mega) {
                                          return ' $ntrRSV KV [should be above 22MR ]';
                                        } else if (ntr.ratedSystemVoltage ==
                                                11 &&
                                            double.parse(_rncontroller.text) <
                                                0.022 &&
                                            selectedGMTrNvalue ==
                                                Enum_EM_ir_17_mgt.giga) {
                                          return ' $ntrRSV KV [should be above 0.022MR ]';
                                        } else if (ntr.ratedSystemVoltage ==
                                                11 &&
                                            double.parse(_rncontroller.text) <
                                                0.000022 &&
                                            selectedGMTrNvalue ==
                                                Enum_EM_ir_17_mgt.terra) {
                                          return ' $ntrRSV KV [should be above 0.000022MR ]';
                                        }
                                        // -------------------------------------------
                                        if (ntr.ratedSystemVoltage == 33 &&
                                            double.parse(_rncontroller.text) <
                                                66 &&
                                            selectedGMTrNvalue ==
                                                Enum_EM_ir_17_mgt.mega) {
                                          return '$ntrRSV KV [should be above 66MR ]';
                                        } else if (ntr.ratedSystemVoltage ==
                                                33 &&
                                            double.parse(_rncontroller.text) <
                                                0.066 &&
                                            selectedGMTrNvalue ==
                                                Enum_EM_ir_17_mgt.giga) {
                                          return '$ntrRSV KV [should be above 0.066MR ]';
                                        } else if (ntr.ratedSystemVoltage ==
                                                33 &&
                                            double.parse(_rncontroller.text) <
                                                0.000066 &&
                                            selectedGMTrNvalue ==
                                                Enum_EM_ir_17_mgt.terra) {
                                          return '$ntrRSV KV [should be above 0.000066MR ]';
                                        }
                                        // -------------------------------------------
                                        if (ntr.ratedSystemVoltage == 66 &&
                                            double.parse(_rncontroller.text) <
                                                132 &&
                                            selectedGMTrNvalue ==
                                                Enum_EM_ir_17_mgt.mega) {
                                          return '$ntrRSV KV [should be above 132MR ]';
                                        } else if (ntr.ratedSystemVoltage ==
                                                66 &&
                                            double.parse(_rncontroller.text) <
                                                0.132 &&
                                            selectedGMTrNvalue ==
                                                Enum_EM_ir_17_mgt.giga) {
                                          return '$ntrRSV KV [should be above 0.132MR ]';
                                        } else if (ntr.ratedSystemVoltage ==
                                                66 &&
                                            double.parse(_rncontroller.text) <
                                                0.000132 &&
                                            selectedGMTrNvalue ==
                                                Enum_EM_ir_17_mgt.terra) {
                                          return '$ntrRSV KV [should be above 0.000132MR ]';
                                        }
                                        // -------------------------------------------
                                        if (ntr.ratedSystemVoltage == 110 &&
                                            double.parse(_rncontroller.text) <
                                                220 &&
                                            selectedGMTrNvalue ==
                                                Enum_EM_ir_17_mgt.mega) {
                                          return '$ntrRSV KV [should be above 220MR ]';
                                        } else if (ntr.ratedSystemVoltage ==
                                                110 &&
                                            double.parse(_rncontroller.text) <
                                                0.220 &&
                                            selectedGMTrNvalue ==
                                                Enum_EM_ir_17_mgt.giga) {
                                          return '$ntrRSV KV [should be above 0.220MR ]';
                                        } else if (ntr.ratedSystemVoltage ==
                                                110 &&
                                            double.parse(_rncontroller.text) <
                                                0.000220 &&
                                            selectedGMTrNvalue ==
                                                Enum_EM_ir_17_mgt.terra) {
                                          return '$ntrRSV KV [should be above 0.000220MR ]';
                                        }
                                        // -------------------------------------------
                                        if (ntr.ratedSystemVoltage == 132 &&
                                            double.parse(_rncontroller.text) <
                                                264 &&
                                            selectedGMTrNvalue ==
                                                Enum_EM_ir_17_mgt.mega) {
                                          return '$ntrRSV KV [should be above 264MR ]';
                                        } else if (ntr.ratedSystemVoltage ==
                                                132 &&
                                            double.parse(_rncontroller.text) <
                                                0.264 &&
                                            selectedGMTrNvalue ==
                                                Enum_EM_ir_17_mgt.giga) {
                                          return '$ntrRSV KV [should be above 0.264MR ]';
                                        } else if (ntr.ratedSystemVoltage ==
                                                132 &&
                                            double.parse(_rncontroller.text) <
                                                0.000264 &&
                                            selectedGMTrNvalue ==
                                                Enum_EM_ir_17_mgt.terra) {
                                          return '$ntrRSV KV [should be above 0.000264MR ]';
                                        }
                                        // -------------------------------------------
                                        if (ntr.ratedSystemVoltage == 220 &&
                                            double.parse(_rncontroller.text) <
                                                440 &&
                                            selectedGMTrNvalue ==
                                                Enum_EM_ir_17_mgt.mega) {
                                          return '$ntrRSV KV [should be above 440MR ]';
                                        } else if (ntr.ratedSystemVoltage ==
                                                220 &&
                                            double.parse(_rncontroller.text) <
                                                0.440 &&
                                            selectedGMTrNvalue ==
                                                Enum_EM_ir_17_mgt.giga) {
                                          return '$ntrRSV KV [should be above 0.440MR ]';
                                        } else if (ntr.ratedSystemVoltage ==
                                                220 &&
                                            double.parse(_rncontroller.text) <
                                                0.000440 &&
                                            selectedGMTrNvalue ==
                                                Enum_EM_ir_17_mgt.terra) {
                                          return '$ntrRSV KV [should be above 0.000440MR ]';
                                        }
                                        // -------------------------------------------
                                        if (ntr.ratedSystemVoltage == 400 &&
                                            double.parse(_rncontroller.text) <
                                                800 &&
                                            selectedGMTrNvalue ==
                                                Enum_EM_ir_17_mgt.mega) {
                                          return '$ntrRSV KV [should be above 800MR ]';
                                        } else if (ntr.ratedSystemVoltage ==
                                                400 &&
                                            double.parse(_rncontroller.text) <
                                                0.800 &&
                                            selectedGMTrNvalue ==
                                                Enum_EM_ir_17_mgt.giga) {
                                          return '$ntrRSV KV [should be above 0.800MR ]';
                                        } else if (ntr.ratedSystemVoltage ==
                                                400 &&
                                            double.parse(_rncontroller.text) <
                                                0.000800 &&
                                            selectedGMTrNvalue ==
                                                Enum_EM_ir_17_mgt.terra) {
                                          return '$ntrRSV KV [should be above 0.000800MR ]';
                                        }
                                      }
                                    },
                                  ),
                                ],
                              ),
                            ),
                      // >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
                      ntr.noOfPoles == 3
                          ? Container()
                          : Padding(
                              padding: EdgeInsets.fromLTRB(150, 0, 150, 10),
                              child: Column(
                                children: [
                                  Padding(
                                    padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                                    child: MGT_yn(),
                                  ),
                                  CustomTextFormFieldForNumber(
                                    controller: _yncontroller,
                                    hintText: 'yn',
                                    validator: (val) {
                                      if (!val.IsValueEmpty) {
                                        return 'Field should not be empty';
                                      }
                                      if (ntr.etype == 'acb') {
                                        if (double.parse(_yncontroller.text) <
                                                1 &&
                                            selectedGMTyNvalue ==
                                                Enum_EM_ir_17_mgt.mega) {
                                          return 'Acceptable Limits Above [1 MΩ]';
                                        } else if (double.parse(
                                                    _yncontroller.text) <
                                                0.001 &&
                                            selectedGMTyNvalue ==
                                                Enum_EM_ir_17_mgt.giga) {
                                          return 'Acceptable Limits Above [0.001 MΩ]';
                                        } else if (double.parse(
                                                    _yncontroller.text) <
                                                0.000001 &&
                                            selectedGMTyNvalue ==
                                                Enum_EM_ir_17_mgt.terra) {
                                          return 'Acceptable Limits Above [0.000001 MΩ]';
                                        }
                                      } else if (ntr.etype == 'vcb' ||
                                          ntr.etype == 'ocb' ||
                                          ntr.etype == 'sf6') {
                                        if (ntr.ratedSystemVoltage == 11 &&
                                            double.parse(_yncontroller.text) <
                                                22 &&
                                            selectedGMTyNvalue ==
                                                Enum_EM_ir_17_mgt.mega) {
                                          return ' $ntrRSV KV [should be above 22MR ]';
                                        } else if (ntr.ratedSystemVoltage ==
                                                11 &&
                                            double.parse(_yncontroller.text) <
                                                0.022 &&
                                            selectedGMTyNvalue ==
                                                Enum_EM_ir_17_mgt.giga) {
                                          return ' $ntrRSV KV [should be above 0.022MR ]';
                                        } else if (ntr.ratedSystemVoltage ==
                                                11 &&
                                            double.parse(_yncontroller.text) <
                                                0.000022 &&
                                            selectedGMTyNvalue ==
                                                Enum_EM_ir_17_mgt.terra) {
                                          return ' $ntrRSV KV [should be above 0.000022MR ]';
                                        }
                                        // -------------------------------------------
                                        if (ntr.ratedSystemVoltage == 33 &&
                                            double.parse(_yncontroller.text) <
                                                66 &&
                                            selectedGMTyNvalue ==
                                                Enum_EM_ir_17_mgt.mega) {
                                          return '$ntrRSV KV [should be above 66MR ]';
                                        } else if (ntr.ratedSystemVoltage ==
                                                33 &&
                                            double.parse(_yncontroller.text) <
                                                0.066 &&
                                            selectedGMTyNvalue ==
                                                Enum_EM_ir_17_mgt.giga) {
                                          return '$ntrRSV KV [should be above 0.066MR ]';
                                        } else if (ntr.ratedSystemVoltage ==
                                                33 &&
                                            double.parse(_yncontroller.text) <
                                                0.000066 &&
                                            selectedGMTyNvalue ==
                                                Enum_EM_ir_17_mgt.terra) {
                                          return '$ntrRSV KV [should be above 0.000066MR ]';
                                        }
                                        // -------------------------------------------
                                        if (ntr.ratedSystemVoltage == 66 &&
                                            double.parse(_yncontroller.text) <
                                                132 &&
                                            selectedGMTyNvalue ==
                                                Enum_EM_ir_17_mgt.mega) {
                                          return '$ntrRSV KV [should be above 132MR ]';
                                        } else if (ntr.ratedSystemVoltage ==
                                                66 &&
                                            double.parse(_yncontroller.text) <
                                                0.132 &&
                                            selectedGMTyNvalue ==
                                                Enum_EM_ir_17_mgt.giga) {
                                          return '$ntrRSV KV [should be above 0.132MR ]';
                                        } else if (ntr.ratedSystemVoltage ==
                                                66 &&
                                            double.parse(_yncontroller.text) <
                                                0.000132 &&
                                            selectedGMTyNvalue ==
                                                Enum_EM_ir_17_mgt.terra) {
                                          return '$ntrRSV KV [should be above 0.000132MR ]';
                                        }
                                        // -------------------------------------------
                                        if (ntr.ratedSystemVoltage == 110 &&
                                            double.parse(_yncontroller.text) <
                                                220 &&
                                            selectedGMTyNvalue ==
                                                Enum_EM_ir_17_mgt.mega) {
                                          return '$ntrRSV KV [should be above 220MR ]';
                                        } else if (ntr.ratedSystemVoltage ==
                                                110 &&
                                            double.parse(_yncontroller.text) <
                                                0.220 &&
                                            selectedGMTyNvalue ==
                                                Enum_EM_ir_17_mgt.giga) {
                                          return '$ntrRSV KV [should be above 0.220MR ]';
                                        } else if (ntr.ratedSystemVoltage ==
                                                110 &&
                                            double.parse(_yncontroller.text) <
                                                0.000220 &&
                                            selectedGMTyNvalue ==
                                                Enum_EM_ir_17_mgt.terra) {
                                          return '$ntrRSV KV [should be above 0.000220MR ]';
                                        }
                                        // -------------------------------------------
                                        if (ntr.ratedSystemVoltage == 132 &&
                                            double.parse(_yncontroller.text) <
                                                264 &&
                                            selectedGMTyNvalue ==
                                                Enum_EM_ir_17_mgt.mega) {
                                          return '$ntrRSV KV [should be above 264MR ]';
                                        } else if (ntr.ratedSystemVoltage ==
                                                132 &&
                                            double.parse(_yncontroller.text) <
                                                0.264 &&
                                            selectedGMTyNvalue ==
                                                Enum_EM_ir_17_mgt.giga) {
                                          return '$ntrRSV KV [should be above 0.264MR ]';
                                        } else if (ntr.ratedSystemVoltage ==
                                                132 &&
                                            double.parse(_yncontroller.text) <
                                                0.000264 &&
                                            selectedGMTyNvalue ==
                                                Enum_EM_ir_17_mgt.terra) {
                                          return '$ntrRSV KV [should be above 0.000264MR ]';
                                        }
                                        // -------------------------------------------
                                        if (ntr.ratedSystemVoltage == 220 &&
                                            double.parse(_yncontroller.text) <
                                                440 &&
                                            selectedGMTyNvalue ==
                                                Enum_EM_ir_17_mgt.mega) {
                                          return '$ntrRSV KV [should be above 440MR ]';
                                        } else if (ntr.ratedSystemVoltage ==
                                                220 &&
                                            double.parse(_yncontroller.text) <
                                                0.440 &&
                                            selectedGMTyNvalue ==
                                                Enum_EM_ir_17_mgt.giga) {
                                          return '$ntrRSV KV [should be above 0.440MR ]';
                                        } else if (ntr.ratedSystemVoltage ==
                                                220 &&
                                            double.parse(_yncontroller.text) <
                                                0.000440 &&
                                            selectedGMTyNvalue ==
                                                Enum_EM_ir_17_mgt.terra) {
                                          return '$ntrRSV KV [should be above 0.000440MR ]';
                                        }
                                        // -------------------------------------------
                                        if (ntr.ratedSystemVoltage == 400 &&
                                            double.parse(_yncontroller.text) <
                                                800 &&
                                            selectedGMTyNvalue ==
                                                Enum_EM_ir_17_mgt.mega) {
                                          return '$ntrRSV KV [should be above 800MR ]';
                                        } else if (ntr.ratedSystemVoltage ==
                                                400 &&
                                            double.parse(_yncontroller.text) <
                                                0.800 &&
                                            selectedGMTyNvalue ==
                                                Enum_EM_ir_17_mgt.giga) {
                                          return '$ntrRSV KV [should be above 0.800MR ]';
                                        } else if (ntr.ratedSystemVoltage ==
                                                400 &&
                                            double.parse(_yncontroller.text) <
                                                0.000800 &&
                                            selectedGMTyNvalue ==
                                                Enum_EM_ir_17_mgt.terra) {
                                          return '$ntrRSV KV [should be above 0.000800MR ]';
                                        }
                                      }
                                    },
                                  ),
                                ],
                              ),
                            ),

                      // >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
                      ntr.noOfPoles == 3
                          ? Container()
                          : Padding(
                              padding: EdgeInsets.fromLTRB(150, 0, 150, 10),
                              child: Column(
                                children: [
                                  Padding(
                                    padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                                    child: MGT_bn(),
                                  ),
                                  CustomTextFormFieldForNumber(
                                    controller: _bncontroller,
                                    hintText: 'bn',
                                    validator: (val) {
                                      if (!val.IsValueEmpty) {
                                        return 'Field should not be empty';
                                      }
                                      if (ntr.etype == 'acb') {
                                        if (double.parse(_bncontroller.text) <
                                                1 &&
                                            selectedGMTbNvalue ==
                                                Enum_EM_ir_17_mgt.mega) {
                                          return 'Acceptable Limits Above [1 MΩ]';
                                        } else if (double.parse(
                                                    _bncontroller.text) <
                                                0.001 &&
                                            selectedGMTbNvalue ==
                                                Enum_EM_ir_17_mgt.giga) {
                                          return 'Acceptable Limits Above [0.001 MΩ]';
                                        } else if (double.parse(
                                                    _bncontroller.text) <
                                                0.000001 &&
                                            selectedGMTbNvalue ==
                                                Enum_EM_ir_17_mgt.terra) {
                                          return 'Acceptable Limits Above [0.000001 MΩ]';
                                        }
                                      } else if (ntr.etype == 'vcb' ||
                                          ntr.etype == 'ocb' ||
                                          ntr.etype == 'sf6') {
                                        if (ntr.ratedSystemVoltage == 11 &&
                                            double.parse(_bncontroller.text) <
                                                22 &&
                                            selectedGMTbNvalue ==
                                                Enum_EM_ir_17_mgt.mega) {
                                          return ' $ntrRSV KV [should be above 22MR ]';
                                        } else if (ntr.ratedSystemVoltage ==
                                                11 &&
                                            double.parse(_bncontroller.text) <
                                                0.022 &&
                                            selectedGMTbNvalue ==
                                                Enum_EM_ir_17_mgt.giga) {
                                          return ' $ntrRSV KV [should be above 0.022MR ]';
                                        } else if (ntr.ratedSystemVoltage ==
                                                11 &&
                                            double.parse(_bncontroller.text) <
                                                0.000022 &&
                                            selectedGMTbNvalue ==
                                                Enum_EM_ir_17_mgt.terra) {
                                          return ' $ntrRSV KV [should be above 0.000022MR ]';
                                        }
                                        // -------------------------------------------
                                        if (ntr.ratedSystemVoltage == 33 &&
                                            double.parse(_bncontroller.text) <
                                                66 &&
                                            selectedGMTbNvalue ==
                                                Enum_EM_ir_17_mgt.mega) {
                                          return '$ntrRSV KV [should be above 66MR ]';
                                        } else if (ntr.ratedSystemVoltage ==
                                                33 &&
                                            double.parse(_bncontroller.text) <
                                                0.066 &&
                                            selectedGMTbNvalue ==
                                                Enum_EM_ir_17_mgt.giga) {
                                          return '$ntrRSV KV [should be above 0.066MR ]';
                                        } else if (ntr.ratedSystemVoltage ==
                                                33 &&
                                            double.parse(_bncontroller.text) <
                                                0.000066 &&
                                            selectedGMTbNvalue ==
                                                Enum_EM_ir_17_mgt.terra) {
                                          return '$ntrRSV KV [should be above 0.000066MR ]';
                                        }
                                        // -------------------------------------------
                                        if (ntr.ratedSystemVoltage == 66 &&
                                            double.parse(_bncontroller.text) <
                                                132 &&
                                            selectedGMTbNvalue ==
                                                Enum_EM_ir_17_mgt.mega) {
                                          return '$ntrRSV KV [should be above 132MR ]';
                                        } else if (ntr.ratedSystemVoltage ==
                                                66 &&
                                            double.parse(_bncontroller.text) <
                                                0.132 &&
                                            selectedGMTbNvalue ==
                                                Enum_EM_ir_17_mgt.giga) {
                                          return '$ntrRSV KV [should be above 0.132MR ]';
                                        } else if (ntr.ratedSystemVoltage ==
                                                66 &&
                                            double.parse(_bncontroller.text) <
                                                0.000132 &&
                                            selectedGMTbNvalue ==
                                                Enum_EM_ir_17_mgt.terra) {
                                          return '$ntrRSV KV [should be above 0.000132MR ]';
                                        }
                                        // -------------------------------------------
                                        if (ntr.ratedSystemVoltage == 110 &&
                                            double.parse(_bncontroller.text) <
                                                220 &&
                                            selectedGMTbNvalue ==
                                                Enum_EM_ir_17_mgt.mega) {
                                          return '$ntrRSV KV [should be above 220MR ]';
                                        } else if (ntr.ratedSystemVoltage ==
                                                110 &&
                                            double.parse(_bncontroller.text) <
                                                0.220 &&
                                            selectedGMTbNvalue ==
                                                Enum_EM_ir_17_mgt.giga) {
                                          return '$ntrRSV KV [should be above 0.220MR ]';
                                        } else if (ntr.ratedSystemVoltage ==
                                                110 &&
                                            double.parse(_bncontroller.text) <
                                                0.000220 &&
                                            selectedGMTbNvalue ==
                                                Enum_EM_ir_17_mgt.terra) {
                                          return '$ntrRSV KV [should be above 0.000220MR ]';
                                        }
                                        // -------------------------------------------
                                        if (ntr.ratedSystemVoltage == 132 &&
                                            double.parse(_bncontroller.text) <
                                                264 &&
                                            selectedGMTbNvalue ==
                                                Enum_EM_ir_17_mgt.mega) {
                                          return '$ntrRSV KV [should be above 264MR ]';
                                        } else if (ntr.ratedSystemVoltage ==
                                                132 &&
                                            double.parse(_bncontroller.text) <
                                                0.264 &&
                                            selectedGMTbNvalue ==
                                                Enum_EM_ir_17_mgt.giga) {
                                          return '$ntrRSV KV [should be above 0.264MR ]';
                                        } else if (ntr.ratedSystemVoltage ==
                                                132 &&
                                            double.parse(_bncontroller.text) <
                                                0.000264 &&
                                            selectedGMTbNvalue ==
                                                Enum_EM_ir_17_mgt.terra) {
                                          return '$ntrRSV KV [should be above 0.000264MR ]';
                                        }
                                        // -------------------------------------------
                                        if (ntr.ratedSystemVoltage == 220 &&
                                            double.parse(_bncontroller.text) <
                                                440 &&
                                            selectedGMTbNvalue ==
                                                Enum_EM_ir_17_mgt.mega) {
                                          return '$ntrRSV KV [should be above 440MR ]';
                                        } else if (ntr.ratedSystemVoltage ==
                                                220 &&
                                            double.parse(_bncontroller.text) <
                                                0.440 &&
                                            selectedGMTbNvalue ==
                                                Enum_EM_ir_17_mgt.giga) {
                                          return '$ntrRSV KV [should be above 0.440MR ]';
                                        } else if (ntr.ratedSystemVoltage ==
                                                220 &&
                                            double.parse(_bncontroller.text) <
                                                0.000440 &&
                                            selectedGMTbNvalue ==
                                                Enum_EM_ir_17_mgt.terra) {
                                          return '$ntrRSV KV [should be above 0.000440MR ]';
                                        }
                                        // -------------------------------------------
                                        if (ntr.ratedSystemVoltage == 400 &&
                                            double.parse(_bncontroller.text) <
                                                800 &&
                                            selectedGMTbNvalue ==
                                                Enum_EM_ir_17_mgt.mega) {
                                          return '$ntrRSV KV [should be above 800MR ]';
                                        } else if (ntr.ratedSystemVoltage ==
                                                400 &&
                                            double.parse(_bncontroller.text) <
                                                0.800 &&
                                            selectedGMTbNvalue ==
                                                Enum_EM_ir_17_mgt.giga) {
                                          return '$ntrRSV KV [should be above 0.800MR ]';
                                        } else if (ntr.ratedSystemVoltage ==
                                                400 &&
                                            double.parse(_bncontroller.text) <
                                                0.000800 &&
                                            selectedGMTbNvalue ==
                                                Enum_EM_ir_17_mgt.terra) {
                                          return '$ntrRSV KV [should be above 0.000800MR ]';
                                        }
                                      }
                                    },
                                  ),
                                ],
                              ),
                            ),

                      // >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>  CB  CR   CY  starts Change this to OK or Not Okay  >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
                      Padding(
                        padding: EdgeInsets.fromLTRB(80, 0, 80, 0),
                        child: MGT_cb(),
                      ),

                      // >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
                      Padding(
                        padding: EdgeInsets.fromLTRB(80, 0, 80, 0),
                        child: MGT_cr(),
                      ),
                      // >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
                      Padding(
                        padding: EdgeInsets.fromLTRB(80, 0, 80, 10),
                        child: MGT_cy(),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
          //
          //
          //
          //
          //
          //
          //
          //
          //
          //
          //
        } else {
          return Padding(
            padding: EdgeInsets.all(5.0),
            child: Column(
              children: [
                Card(
                  elevation: 5,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Padding(
                        padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
                        child: Text(
                          'Test Report No',
                          style: TextStyle(
                              fontSize: 13,
                              fontWeight: FontWeight.bold,
                              letterSpacing: 0.5),
                        ),
                      ),
                      TextFormField(
                        controller: _nOcontroller,
                        textAlign: TextAlign.center,
                        // label :  Text('Test Report No.'),
                        enabled: false,
                      ),
                      Divider(height: 0),
                      Padding(
                        padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
                        child: Text(
                          'Serial No',
                          style: TextStyle(
                              fontSize: 13,
                              fontWeight: FontWeight.bold,
                              letterSpacing: 0.5),
                        ),
                      ),
                      TextFormField(
                        controller: _SerialNOcontroller,
                        textAlign: TextAlign.center,
                        enabled: false,
                        // hintText: 'Serial No',
                      ),
                      Padding(
                        padding: EdgeInsets.fromLTRB(10, 20, 10, 10),
                        child: EquipmentTypeList(),
                      ),
                    ],
                  ),
                ),
                //--------------------------------------------------------------------------------------------------
                Divider(height: 10, color: Colors.grey[200]),
                Card(
                  elevation: 5,
                  child: Column(children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
                      child: Text(
                        ' Pole-Pole (open condition) ',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          letterSpacing: 1,
                        ),
                      ),
                    ),

                    //------------------------------------------------------------------------------------
                    MGT_rR(),
                    // simplified_acb_vos_IR_test(
                    //     'rr', _rrcontroller, ntr, selectedGMTrrvalue),
                    Padding(
                      padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                      child: Column(
                        children: [
                          CustomTextFormFieldForNumber(
                            controller: _rrcontroller,
                            hintText: 'rr',
                            validator: (val) {
                              if (!val.IsValueEmpty) {
                                return 'Field should not be empty';
                              }
                              if (ntr.etype == 'acb') {
                                if (double.parse(_rrcontroller.text) < 1 &&
                                    selectedGMTrrvalue ==
                                        Enum_EM_ir_17_mgt.mega) {
                                  return 'Acceptable Limits Above [1 MΩ]';
                                } else if (double.parse(_rrcontroller.text) <
                                        0.001 &&
                                    selectedGMTrrvalue ==
                                        Enum_EM_ir_17_mgt.giga) {
                                  return 'Acceptable Limits Above [0.001 MΩ]';
                                } else if (double.parse(_rrcontroller.text) <
                                        0.000001 &&
                                    selectedGMTrrvalue ==
                                        Enum_EM_ir_17_mgt.terra) {
                                  return 'Acceptable Limits Above [0.000001 MΩ]';
                                }
                              } else if (ntr.etype == 'vcb' ||
                                  ntr.etype == 'ocb' ||
                                  ntr.etype == 'sf6') {
                                if (ntr.ratedSystemVoltage == 11 &&
                                    double.parse(_rrcontroller.text) < 22 &&
                                    selectedGMTrrvalue ==
                                        Enum_EM_ir_17_mgt.mega) {
                                  return ' $ntrRSV KV [should be above 22MR]';
                                } else if (ntr.ratedSystemVoltage == 11 &&
                                    double.parse(_rrcontroller.text) < 0.022 &&
                                    selectedGMTrrvalue ==
                                        Enum_EM_ir_17_mgt.giga) {
                                  return ' $ntrRSV KV [should be above 0.022MR]';
                                } else if (ntr.ratedSystemVoltage == 11 &&
                                    double.parse(_rrcontroller.text) <
                                        0.000022 &&
                                    selectedGMTrrvalue ==
                                        Enum_EM_ir_17_mgt.terra) {
                                  return ' $ntrRSV KV [should be above 0.000022MR]';
                                }
                                //----------------------------------------------
                                if (ntr.ratedSystemVoltage == 33 &&
                                    double.parse(_rrcontroller.text) < 66 &&
                                    selectedGMTrrvalue ==
                                        Enum_EM_ir_17_mgt.mega) {
                                  return '$ntrRSV KV [should be above 66MR ]';
                                } else if (ntr.ratedSystemVoltage == 33 &&
                                    double.parse(_rrcontroller.text) < 0.066 &&
                                    selectedGMTrrvalue ==
                                        Enum_EM_ir_17_mgt.giga) {
                                  return '$ntrRSV KV [should be above 0.066MR]';
                                } else if (ntr.ratedSystemVoltage == 33 &&
                                    double.parse(_rrcontroller.text) <
                                        0.000066 &&
                                    selectedGMTrrvalue ==
                                        Enum_EM_ir_17_mgt.terra) {
                                  return '$ntrRSV KV [should be above 0.000066]';
                                }
                                //----------------------------------------------
                                if (ntr.ratedSystemVoltage == 66 &&
                                    double.parse(_rrcontroller.text) < 132 &&
                                    selectedGMTrrvalue ==
                                        Enum_EM_ir_17_mgt.mega) {
                                  return '$ntrRSV KV [should be above 132MR ]';
                                } else if (ntr.ratedSystemVoltage == 66 &&
                                    double.parse(_rrcontroller.text) < 0.132 &&
                                    selectedGMTrrvalue ==
                                        Enum_EM_ir_17_mgt.giga) {
                                  return '$ntrRSV KV [should be above 0.132MR ]';
                                } else if (ntr.ratedSystemVoltage == 66 &&
                                    double.parse(_rrcontroller.text) <
                                        0.000132 &&
                                    selectedGMTrrvalue ==
                                        Enum_EM_ir_17_mgt.terra) {
                                  return '$ntrRSV KV [should be above 0.000132MR ]';
                                }
                                //----------------------------------------------
                                if (ntr.ratedSystemVoltage == 110 &&
                                    double.parse(_rrcontroller.text) < 220 &&
                                    selectedGMTrrvalue ==
                                        Enum_EM_ir_17_mgt.mega) {
                                  return '$ntrRSV KV [should be above 220MR ]';
                                } else if (ntr.ratedSystemVoltage == 110 &&
                                    double.parse(_rrcontroller.text) < 0.220 &&
                                    selectedGMTrrvalue ==
                                        Enum_EM_ir_17_mgt.giga) {
                                  return '$ntrRSV KV [should be above 0.220MR ]';
                                } else if (ntr.ratedSystemVoltage == 110 &&
                                    double.parse(_rrcontroller.text) <
                                        0.000220 &&
                                    selectedGMTrrvalue ==
                                        Enum_EM_ir_17_mgt.terra) {
                                  return '$ntrRSV KV [should be above 0.000220MR ]';
                                }
                                //----------------------------------------------
                                if (ntr.ratedSystemVoltage == 132 &&
                                    double.parse(_rrcontroller.text) < 264 &&
                                    selectedGMTrrvalue ==
                                        Enum_EM_ir_17_mgt.mega) {
                                  return '$ntrRSV KV [should be above 264MR ]';
                                } else if (ntr.ratedSystemVoltage == 132 &&
                                    double.parse(_rrcontroller.text) < 0.264 &&
                                    selectedGMTrrvalue ==
                                        Enum_EM_ir_17_mgt.giga) {
                                  return '$ntrRSV KV [should be above 0.264MR ]';
                                } else if (ntr.ratedSystemVoltage == 132 &&
                                    double.parse(_rrcontroller.text) <
                                        0.000264 &&
                                    selectedGMTrrvalue ==
                                        Enum_EM_ir_17_mgt.terra) {
                                  return '$ntrRSV KV [should be above 0.000264MR ]';
                                }
                                //----------------------------------------------
                                if (ntr.ratedSystemVoltage == 220 &&
                                    double.parse(_rrcontroller.text) < 440 &&
                                    selectedGMTrrvalue ==
                                        Enum_EM_ir_17_mgt.mega) {
                                  return '$ntrRSV KV [should be above 440MR ]';
                                } else if (ntr.ratedSystemVoltage == 220 &&
                                    double.parse(_rrcontroller.text) < 0.440 &&
                                    selectedGMTrrvalue ==
                                        Enum_EM_ir_17_mgt.giga) {
                                  return '$ntrRSV KV [should be above 0.440MR ]';
                                } else if (ntr.ratedSystemVoltage == 220 &&
                                    double.parse(_rrcontroller.text) <
                                        0.000440 &&
                                    selectedGMTrrvalue ==
                                        Enum_EM_ir_17_mgt.terra) {
                                  return '$ntrRSV KV [should be above 0.000440MR ]';
                                }
                                //----------------------------------------------
                                if (ntr.ratedSystemVoltage == 400 &&
                                    double.parse(_rrcontroller.text) < 800 &&
                                    selectedGMTrrvalue ==
                                        Enum_EM_ir_17_mgt.mega) {
                                  return '$ntrRSV KV [should be above 800MR ]';
                                } else if (ntr.ratedSystemVoltage == 400 &&
                                    double.parse(_rrcontroller.text) < 0.800 &&
                                    selectedGMTrrvalue ==
                                        Enum_EM_ir_17_mgt.giga) {
                                  return '$ntrRSV KV [should be above 0.800MR ]';
                                } else if (ntr.ratedSystemVoltage == 400 &&
                                    double.parse(_rrcontroller.text) <
                                        0.000800 &&
                                    selectedGMTrrvalue ==
                                        Enum_EM_ir_17_mgt.terra) {
                                  return '$ntrRSV KV [should be above 0.000800MR ]';
                                }
                              }
                            },
                          ),
                        ],
                      ),
                    ),

                    // >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
                    MGT_yY(),
                    Padding(
                      padding: EdgeInsets.fromLTRB(10, 0, 10, 10),
                      child: CustomTextFormFieldForNumber(
                        controller: _yycontroller,
                        hintText: 'yy',
                        validator: (val) {
                          if (!val.IsValueEmpty) {
                            return 'Field should not be empty';
                          }
                          if (ntr.etype == 'acb') {
                            if (double.parse(_yycontroller.text) < 1 &&
                                selectedGMTyyvalue == Enum_EM_ir_17_mgt.mega) {
                              return 'Acceptable Limits Above [1 MΩ]';
                            } else if (double.parse(_yycontroller.text) <
                                    0.001 &&
                                selectedGMTyyvalue == Enum_EM_ir_17_mgt.giga) {
                              return 'Acceptable Limits Above [0.001 MΩ]';
                            } else if (double.parse(_yycontroller.text) <
                                    0.000001 &&
                                selectedGMTyyvalue == Enum_EM_ir_17_mgt.terra) {
                              return 'Acceptable Limits Above [0.000001 MΩ]';
                            }
                          } else if (ntr.etype == 'vcb' ||
                              ntr.etype == 'ocb' ||
                              ntr.etype == 'sf6') {
                            if (ntr.ratedSystemVoltage == 11 &&
                                double.parse(_yycontroller.text) < 22 &&
                                selectedGMTyyvalue == Enum_EM_ir_17_mgt.mega) {
                              return ' $ntrRSV KV [should be above 22MR ]';
                            } else if (ntr.ratedSystemVoltage == 11 &&
                                double.parse(_yycontroller.text) < 0.022 &&
                                selectedGMTyyvalue == Enum_EM_ir_17_mgt.giga) {
                              return ' $ntrRSV KV [should be above 0.022MR ]';
                            } else if (ntr.ratedSystemVoltage == 11 &&
                                double.parse(_yycontroller.text) < 0.000022 &&
                                selectedGMTyyvalue == Enum_EM_ir_17_mgt.terra) {
                              return ' $ntrRSV KV [should be above 0.000022MR ]';
                            }
                            // -------------------------------------------
                            if (ntr.ratedSystemVoltage == 33 &&
                                double.parse(_yycontroller.text) < 66 &&
                                selectedGMTyyvalue == Enum_EM_ir_17_mgt.mega) {
                              return '$ntrRSV KV [should be above 66MR ]';
                            } else if (ntr.ratedSystemVoltage == 33 &&
                                double.parse(_yycontroller.text) < 0.066 &&
                                selectedGMTyyvalue == Enum_EM_ir_17_mgt.giga) {
                              return '$ntrRSV KV [should be above 0.066MR ]';
                            } else if (ntr.ratedSystemVoltage == 33 &&
                                double.parse(_yycontroller.text) < 0.000066 &&
                                selectedGMTyyvalue == Enum_EM_ir_17_mgt.terra) {
                              return '$ntrRSV KV [should be above 0.000066MR ]';
                            }
                            // -------------------------------------------
                            if (ntr.ratedSystemVoltage == 66 &&
                                double.parse(_yycontroller.text) < 132 &&
                                selectedGMTyyvalue == Enum_EM_ir_17_mgt.mega) {
                              return '$ntrRSV KV [should be above 132MR ]';
                            } else if (ntr.ratedSystemVoltage == 66 &&
                                double.parse(_yycontroller.text) < 0.132 &&
                                selectedGMTyyvalue == Enum_EM_ir_17_mgt.giga) {
                              return '$ntrRSV KV [should be above 0.132MR ]';
                            } else if (ntr.ratedSystemVoltage == 66 &&
                                double.parse(_yycontroller.text) < 0.000132 &&
                                selectedGMTyyvalue == Enum_EM_ir_17_mgt.terra) {
                              return '$ntrRSV KV [should be above 0.000132MR ]';
                            }
                            // -------------------------------------------
                            if (ntr.ratedSystemVoltage == 110 &&
                                double.parse(_yycontroller.text) < 220 &&
                                selectedGMTyyvalue == Enum_EM_ir_17_mgt.mega) {
                              return '$ntrRSV KV [should be above 220MR ]';
                            } else if (ntr.ratedSystemVoltage == 110 &&
                                double.parse(_yycontroller.text) < 0.220 &&
                                selectedGMTyyvalue == Enum_EM_ir_17_mgt.giga) {
                              return '$ntrRSV KV [should be above 0.220MR ]';
                            } else if (ntr.ratedSystemVoltage == 110 &&
                                double.parse(_yycontroller.text) < 0.000220 &&
                                selectedGMTyyvalue == Enum_EM_ir_17_mgt.terra) {
                              return '$ntrRSV KV [should be above 0.000220MR ]';
                            }
                            // -------------------------------------------
                            if (ntr.ratedSystemVoltage == 132 &&
                                double.parse(_yycontroller.text) < 264 &&
                                selectedGMTyyvalue == Enum_EM_ir_17_mgt.mega) {
                              return '$ntrRSV KV [should be above 264MR ]';
                            } else if (ntr.ratedSystemVoltage == 132 &&
                                double.parse(_yycontroller.text) < 0.264 &&
                                selectedGMTyyvalue == Enum_EM_ir_17_mgt.giga) {
                              return '$ntrRSV KV [should be above 0.264MR ]';
                            } else if (ntr.ratedSystemVoltage == 132 &&
                                double.parse(_yycontroller.text) < 0.000264 &&
                                selectedGMTyyvalue == Enum_EM_ir_17_mgt.terra) {
                              return '$ntrRSV KV [should be above 0.000264MR ]';
                            }
                            // -------------------------------------------
                            if (ntr.ratedSystemVoltage == 220 &&
                                double.parse(_yycontroller.text) < 440 &&
                                selectedGMTyyvalue == Enum_EM_ir_17_mgt.mega) {
                              return '$ntrRSV KV [should be above 440MR ]';
                            } else if (ntr.ratedSystemVoltage == 220 &&
                                double.parse(_yycontroller.text) < 0.440 &&
                                selectedGMTyyvalue == Enum_EM_ir_17_mgt.giga) {
                              return '$ntrRSV KV [should be above 0.440MR ]';
                            } else if (ntr.ratedSystemVoltage == 220 &&
                                double.parse(_yycontroller.text) < 0.000440 &&
                                selectedGMTyyvalue == Enum_EM_ir_17_mgt.terra) {
                              return '$ntrRSV KV [should be above 0.000440MR ]';
                            }
                            // -------------------------------------------
                            if (ntr.ratedSystemVoltage == 400 &&
                                double.parse(_yycontroller.text) < 800 &&
                                selectedGMTyyvalue == Enum_EM_ir_17_mgt.mega) {
                              return '$ntrRSV KV [should be above 800MR ]';
                            } else if (ntr.ratedSystemVoltage == 400 &&
                                double.parse(_yycontroller.text) < 0.800 &&
                                selectedGMTyyvalue == Enum_EM_ir_17_mgt.giga) {
                              return '$ntrRSV KV [should be above 0.800MR ]';
                            } else if (ntr.ratedSystemVoltage == 400 &&
                                double.parse(_yycontroller.text) < 0.000800 &&
                                selectedGMTyyvalue == Enum_EM_ir_17_mgt.terra) {
                              return '$ntrRSV KV [should be above 0.000800MR ]';
                            }
                          }
                        },
                      ),
                    ),
                    // >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
                    MGT_bB(),
                    Padding(
                      padding: EdgeInsets.fromLTRB(10, 0, 10, 10),
                      child: CustomTextFormFieldForNumber(
                        controller: _bbcontroller,
                        hintText: 'bb',
                        validator: (val) {
                          if (!val.IsValueEmpty) {
                            return 'Field should not be empty';
                          }
                          if (ntr.etype == 'acb') {
                            if (double.parse(_bbcontroller.text) < 1 &&
                                selectedGMTbbvalue == Enum_EM_ir_17_mgt.mega) {
                              return 'Acceptable Limits Above [1 MΩ]';
                            } else if (double.parse(_bbcontroller.text) <
                                    0.001 &&
                                selectedGMTbbvalue == Enum_EM_ir_17_mgt.giga) {
                              return 'Acceptable Limits Above [0.001 MΩ]';
                            } else if (double.parse(_bbcontroller.text) <
                                    0.000001 &&
                                selectedGMTbbvalue == Enum_EM_ir_17_mgt.terra) {
                              return 'Acceptable Limits Above [0.000001 MΩ]';
                            }
                          } else if (ntr.etype == 'vcb' ||
                              ntr.etype == 'ocb' ||
                              ntr.etype == 'sf6') {
                            if (ntr.ratedSystemVoltage == 11 &&
                                double.parse(_bbcontroller.text) < 22 &&
                                selectedGMTbbvalue == Enum_EM_ir_17_mgt.mega) {
                              return ' $ntrRSV KV [should be above 22MR ]';
                            } else if (ntr.ratedSystemVoltage == 11 &&
                                double.parse(_bbcontroller.text) < 0.022 &&
                                selectedGMTbbvalue == Enum_EM_ir_17_mgt.giga) {
                              return ' $ntrRSV KV [should be above 0.022MR ]';
                            } else if (ntr.ratedSystemVoltage == 11 &&
                                double.parse(_bbcontroller.text) < 0.000022 &&
                                selectedGMTbbvalue == Enum_EM_ir_17_mgt.terra) {
                              return ' $ntrRSV KV [should be above 0.000022MR ]';
                            }
                            // -------------------------------------------
                            if (ntr.ratedSystemVoltage == 33 &&
                                double.parse(_bbcontroller.text) < 66 &&
                                selectedGMTbbvalue == Enum_EM_ir_17_mgt.mega) {
                              return '$ntrRSV KV [should be above 66MR ]';
                            } else if (ntr.ratedSystemVoltage == 33 &&
                                double.parse(_bbcontroller.text) < 0.066 &&
                                selectedGMTbbvalue == Enum_EM_ir_17_mgt.giga) {
                              return '$ntrRSV KV [should be above 0.066MR ]';
                            } else if (ntr.ratedSystemVoltage == 33 &&
                                double.parse(_bbcontroller.text) < 0.000066 &&
                                selectedGMTbbvalue == Enum_EM_ir_17_mgt.terra) {
                              return '$ntrRSV KV [should be above 0.000066MR ]';
                            }
                            // -------------------------------------------
                            if (ntr.ratedSystemVoltage == 66 &&
                                double.parse(_bbcontroller.text) < 132 &&
                                selectedGMTbbvalue == Enum_EM_ir_17_mgt.mega) {
                              return '$ntrRSV KV [should be above 132MR ]';
                            } else if (ntr.ratedSystemVoltage == 66 &&
                                double.parse(_bbcontroller.text) < 0.132 &&
                                selectedGMTbbvalue == Enum_EM_ir_17_mgt.giga) {
                              return '$ntrRSV KV [should be above 0.132MR ]';
                            } else if (ntr.ratedSystemVoltage == 66 &&
                                double.parse(_bbcontroller.text) < 0.000132 &&
                                selectedGMTbbvalue == Enum_EM_ir_17_mgt.terra) {
                              return '$ntrRSV KV [should be above 0.000132MR ]';
                            }
                            // -------------------------------------------
                            if (ntr.ratedSystemVoltage == 110 &&
                                double.parse(_bbcontroller.text) < 220 &&
                                selectedGMTbbvalue == Enum_EM_ir_17_mgt.mega) {
                              return '$ntrRSV KV [should be above 220MR ]';
                            } else if (ntr.ratedSystemVoltage == 110 &&
                                double.parse(_bbcontroller.text) < 0.220 &&
                                selectedGMTbbvalue == Enum_EM_ir_17_mgt.giga) {
                              return '$ntrRSV KV [should be above 0.220MR ]';
                            } else if (ntr.ratedSystemVoltage == 110 &&
                                double.parse(_bbcontroller.text) < 0.000220 &&
                                selectedGMTbbvalue == Enum_EM_ir_17_mgt.terra) {
                              return '$ntrRSV KV [should be above 0.000220MR ]';
                            }
                            // -------------------------------------------
                            if (ntr.ratedSystemVoltage == 132 &&
                                double.parse(_bbcontroller.text) < 264 &&
                                selectedGMTbbvalue == Enum_EM_ir_17_mgt.mega) {
                              return '$ntrRSV KV [should be above 264MR ]';
                            } else if (ntr.ratedSystemVoltage == 132 &&
                                double.parse(_bbcontroller.text) < 0.264 &&
                                selectedGMTbbvalue == Enum_EM_ir_17_mgt.giga) {
                              return '$ntrRSV KV [should be above 0.264MR ]';
                            } else if (ntr.ratedSystemVoltage == 132 &&
                                double.parse(_bbcontroller.text) < 0.000264 &&
                                selectedGMTbbvalue == Enum_EM_ir_17_mgt.terra) {
                              return '$ntrRSV KV [should be above 0.000264MR ]';
                            }
                            // -------------------------------------------
                            if (ntr.ratedSystemVoltage == 220 &&
                                double.parse(_bbcontroller.text) < 440 &&
                                selectedGMTbbvalue == Enum_EM_ir_17_mgt.mega) {
                              return '$ntrRSV KV [should be above 440MR ]';
                            } else if (ntr.ratedSystemVoltage == 220 &&
                                double.parse(_bbcontroller.text) < 0.440 &&
                                selectedGMTbbvalue == Enum_EM_ir_17_mgt.giga) {
                              return '$ntrRSV KV [should be above 0.440MR ]';
                            } else if (ntr.ratedSystemVoltage == 220 &&
                                double.parse(_bbcontroller.text) < 0.000440 &&
                                selectedGMTbbvalue == Enum_EM_ir_17_mgt.terra) {
                              return '$ntrRSV KV [should be above 0.000440MR ]';
                            }
                            // -------------------------------------------
                            if (ntr.ratedSystemVoltage == 400 &&
                                double.parse(_bbcontroller.text) < 800 &&
                                selectedGMTbbvalue == Enum_EM_ir_17_mgt.mega) {
                              return '$ntrRSV KV [should be above 800MR ]';
                            } else if (ntr.ratedSystemVoltage == 400 &&
                                double.parse(_bbcontroller.text) < 0.800 &&
                                selectedGMTbbvalue == Enum_EM_ir_17_mgt.giga) {
                              return '$ntrRSV KV [should be above 0.800MR ]';
                            } else if (ntr.ratedSystemVoltage == 400 &&
                                double.parse(_bbcontroller.text) < 0.000800 &&
                                selectedGMTbbvalue == Enum_EM_ir_17_mgt.terra) {
                              return '$ntrRSV KV [should be above 0.000800MR ]';
                            }
                          }
                        },
                      ),
                    ),
                    // >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
                    ntr.noOfPoles == 3
                        ? Container()
                        : Padding(
                            padding: EdgeInsets.fromLTRB(10, 0, 10, 10),
                            child: Column(
                              children: [
                                MGT_nN(),
                                CustomTextFormFieldForNumber(
                                  controller: _nncontroller,
                                  hintText: 'nn',
                                  validator: (val) {
                                    if (!val.IsValueEmpty) {
                                      return 'Field should not be empty';
                                    }
                                    if (ntr.etype == 'acb') {
                                      if (double.parse(_nncontroller.text) <
                                              1 &&
                                          selectedGMTnnvalue ==
                                              Enum_EM_ir_17_mgt.mega) {
                                        return 'Acceptable Limits Above [1 MΩ]';
                                      } else if (double.parse(
                                                  _nncontroller.text) <
                                              0.001 &&
                                          selectedGMTnnvalue ==
                                              Enum_EM_ir_17_mgt.giga) {
                                        return 'Acceptable Limits Above [0.001 MΩ]';
                                      } else if (double.parse(
                                                  _nncontroller.text) <
                                              0.000001 &&
                                          selectedGMTnnvalue ==
                                              Enum_EM_ir_17_mgt.terra) {
                                        return 'Acceptable Limits Above [0.000001 MΩ]';
                                      }
                                    } else if (ntr.etype == 'vcb' ||
                                        ntr.etype == 'ocb' ||
                                        ntr.etype == 'sf6') {
                                      if (ntr.ratedSystemVoltage == 11 &&
                                          double.parse(_nncontroller.text) <
                                              22 &&
                                          selectedGMTnnvalue ==
                                              Enum_EM_ir_17_mgt.mega) {
                                        return ' $ntrRSV KV [should be above 22MR ]';
                                      } else if (ntr.ratedSystemVoltage == 11 &&
                                          double.parse(_nncontroller.text) <
                                              0.022 &&
                                          selectedGMTnnvalue ==
                                              Enum_EM_ir_17_mgt.giga) {
                                        return ' $ntrRSV KV [should be above 0.022MR ]';
                                      } else if (ntr.ratedSystemVoltage == 11 &&
                                          double.parse(_nncontroller.text) <
                                              0.000022 &&
                                          selectedGMTnnvalue ==
                                              Enum_EM_ir_17_mgt.terra) {
                                        return ' $ntrRSV KV [should be above 0.000022MR ]';
                                      }
                                      // -------------------------------------------
                                      if (ntr.ratedSystemVoltage == 33 &&
                                          double.parse(_nncontroller.text) <
                                              66 &&
                                          selectedGMTnnvalue ==
                                              Enum_EM_ir_17_mgt.mega) {
                                        return '$ntrRSV KV [should be above 66MR ]';
                                      } else if (ntr.ratedSystemVoltage == 33 &&
                                          double.parse(_nncontroller.text) <
                                              0.066 &&
                                          selectedGMTnnvalue ==
                                              Enum_EM_ir_17_mgt.giga) {
                                        return '$ntrRSV KV [should be above 0.066MR ]';
                                      } else if (ntr.ratedSystemVoltage == 33 &&
                                          double.parse(_nncontroller.text) <
                                              0.000066 &&
                                          selectedGMTnnvalue ==
                                              Enum_EM_ir_17_mgt.terra) {
                                        return '$ntrRSV KV [should be above 0.000066MR ]';
                                      }
                                      // -------------------------------------------
                                      if (ntr.ratedSystemVoltage == 66 &&
                                          double.parse(_nncontroller.text) <
                                              132 &&
                                          selectedGMTnnvalue ==
                                              Enum_EM_ir_17_mgt.mega) {
                                        return '$ntrRSV KV [should be above 132MR ]';
                                      } else if (ntr.ratedSystemVoltage == 66 &&
                                          double.parse(_nncontroller.text) <
                                              0.132 &&
                                          selectedGMTnnvalue ==
                                              Enum_EM_ir_17_mgt.giga) {
                                        return '$ntrRSV KV [should be above 0.132MR ]';
                                      } else if (ntr.ratedSystemVoltage == 66 &&
                                          double.parse(_nncontroller.text) <
                                              0.000132 &&
                                          selectedGMTnnvalue ==
                                              Enum_EM_ir_17_mgt.terra) {
                                        return '$ntrRSV KV [should be above 0.000132MR ]';
                                      }
                                      // -------------------------------------------
                                      if (ntr.ratedSystemVoltage == 110 &&
                                          double.parse(_nncontroller.text) <
                                              220 &&
                                          selectedGMTnnvalue ==
                                              Enum_EM_ir_17_mgt.mega) {
                                        return '$ntrRSV KV [should be above 220MR ]';
                                      } else if (ntr.ratedSystemVoltage ==
                                              110 &&
                                          double.parse(_nncontroller.text) <
                                              0.220 &&
                                          selectedGMTnnvalue ==
                                              Enum_EM_ir_17_mgt.giga) {
                                        return '$ntrRSV KV [should be above 0.220MR ]';
                                      } else if (ntr.ratedSystemVoltage ==
                                              110 &&
                                          double.parse(_nncontroller.text) <
                                              0.000220 &&
                                          selectedGMTnnvalue ==
                                              Enum_EM_ir_17_mgt.terra) {
                                        return '$ntrRSV KV [should be above 0.000220MR ]';
                                      }
                                      // -------------------------------------------
                                      if (ntr.ratedSystemVoltage == 132 &&
                                          double.parse(_nncontroller.text) <
                                              264 &&
                                          selectedGMTnnvalue ==
                                              Enum_EM_ir_17_mgt.mega) {
                                        return '$ntrRSV KV [should be above 264MR ]';
                                      } else if (ntr.ratedSystemVoltage ==
                                              132 &&
                                          double.parse(_nncontroller.text) <
                                              0.264 &&
                                          selectedGMTnnvalue ==
                                              Enum_EM_ir_17_mgt.giga) {
                                        return '$ntrRSV KV [should be above 0.264MR ]';
                                      } else if (ntr.ratedSystemVoltage ==
                                              132 &&
                                          double.parse(_nncontroller.text) <
                                              0.000264 &&
                                          selectedGMTnnvalue ==
                                              Enum_EM_ir_17_mgt.terra) {
                                        return '$ntrRSV KV [should be above 0.000264MR ]';
                                      }
                                      // -------------------------------------------
                                      if (ntr.ratedSystemVoltage == 220 &&
                                          double.parse(_nncontroller.text) <
                                              440 &&
                                          selectedGMTnnvalue ==
                                              Enum_EM_ir_17_mgt.mega) {
                                        return '$ntrRSV KV [should be above 440MR ]';
                                      } else if (ntr.ratedSystemVoltage ==
                                              220 &&
                                          double.parse(_nncontroller.text) <
                                              0.440 &&
                                          selectedGMTnnvalue ==
                                              Enum_EM_ir_17_mgt.giga) {
                                        return '$ntrRSV KV [should be above 0.440MR ]';
                                      } else if (ntr.ratedSystemVoltage ==
                                              220 &&
                                          double.parse(_nncontroller.text) <
                                              0.000440 &&
                                          selectedGMTnnvalue ==
                                              Enum_EM_ir_17_mgt.terra) {
                                        return '$ntrRSV KV [should be above 0.000440MR ]';
                                      }
                                      // -------------------------------------------
                                      if (ntr.ratedSystemVoltage == 400 &&
                                          double.parse(_nncontroller.text) <
                                              800 &&
                                          selectedGMTnnvalue ==
                                              Enum_EM_ir_17_mgt.mega) {
                                        return '$ntrRSV KV [should be above 800MR ]';
                                      } else if (ntr.ratedSystemVoltage ==
                                              400 &&
                                          double.parse(_nncontroller.text) <
                                              0.800 &&
                                          selectedGMTnnvalue ==
                                              Enum_EM_ir_17_mgt.giga) {
                                        return '$ntrRSV KV [should be above 0.800MR ]';
                                      } else if (ntr.ratedSystemVoltage ==
                                              400 &&
                                          double.parse(_nncontroller.text) <
                                              0.000800 &&
                                          selectedGMTnnvalue ==
                                              Enum_EM_ir_17_mgt.terra) {
                                        return '$ntrRSV KV [should be above 0.000800MR ]';
                                      }
                                    }
                                  },
                                ),
                              ],
                            ),
                          ),
                  ]),
                ),
                //-------------------------------------------------------------------------------------------------
                Divider(height: 10, color: Colors.grey[200]),
                Card(
                  elevation: 5,
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
                        child: Text(
                          ' Pole-Earth (close condition) ',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            letterSpacing: 1,
                          ),
                        ),
                      ),
                      MGT_re(),
                      Padding(
                        padding: EdgeInsets.fromLTRB(10, 0, 10, 10),
                        child: CustomTextFormFieldForNumber(
                          controller: _recontroller,
                          hintText: 're',
                          validator: (val) {
                            if (!val.IsValueEmpty) {
                              return 'Field should not be empty';
                            }
                            if (ntr.etype == 'acb') {
                              if (double.parse(_recontroller.text) < 1 &&
                                  selectedGMTrEvalue ==
                                      Enum_EM_ir_17_mgt.mega) {
                                return 'Acceptable Limits Above [1 MΩ]';
                              } else if (double.parse(_recontroller.text) <
                                      0.001 &&
                                  selectedGMTrEvalue ==
                                      Enum_EM_ir_17_mgt.giga) {
                                return 'Acceptable Limits Above [0.001 MΩ]';
                              } else if (double.parse(_recontroller.text) <
                                      0.000001 &&
                                  selectedGMTrEvalue ==
                                      Enum_EM_ir_17_mgt.terra) {
                                return 'Acceptable Limits Above [0.000001 MΩ]';
                              }
                            } else if (ntr.etype == 'vcb' ||
                                ntr.etype == 'ocb' ||
                                ntr.etype == 'sf6') {
                              if (ntr.ratedSystemVoltage == 11 &&
                                  double.parse(_recontroller.text) < 22 &&
                                  selectedGMTrEvalue ==
                                      Enum_EM_ir_17_mgt.mega) {
                                return ' $ntrRSV KV [should be above 22MR ]';
                              } else if (ntr.ratedSystemVoltage == 11 &&
                                  double.parse(_recontroller.text) < 0.022 &&
                                  selectedGMTrEvalue ==
                                      Enum_EM_ir_17_mgt.giga) {
                                return ' $ntrRSV KV [should be above 0.022MR ]';
                              } else if (ntr.ratedSystemVoltage == 11 &&
                                  double.parse(_recontroller.text) < 0.000022 &&
                                  selectedGMTrEvalue ==
                                      Enum_EM_ir_17_mgt.terra) {
                                return ' $ntrRSV KV [should be above 0.000022MR ]';
                              }
                              // -------------------------------------------
                              if (ntr.ratedSystemVoltage == 33 &&
                                  double.parse(_recontroller.text) < 66 &&
                                  selectedGMTrEvalue ==
                                      Enum_EM_ir_17_mgt.mega) {
                                return '$ntrRSV KV [should be above 66MR ]';
                              } else if (ntr.ratedSystemVoltage == 33 &&
                                  double.parse(_recontroller.text) < 0.066 &&
                                  selectedGMTrEvalue ==
                                      Enum_EM_ir_17_mgt.giga) {
                                return '$ntrRSV KV [should be above 0.066MR ]';
                              } else if (ntr.ratedSystemVoltage == 33 &&
                                  double.parse(_recontroller.text) < 0.000066 &&
                                  selectedGMTrEvalue ==
                                      Enum_EM_ir_17_mgt.terra) {
                                return '$ntrRSV KV [should be above 0.000066MR ]';
                              }
                              // -------------------------------------------
                              if (ntr.ratedSystemVoltage == 66 &&
                                  double.parse(_recontroller.text) < 132 &&
                                  selectedGMTrEvalue ==
                                      Enum_EM_ir_17_mgt.mega) {
                                return '$ntrRSV KV [should be above 132MR ]';
                              } else if (ntr.ratedSystemVoltage == 66 &&
                                  double.parse(_recontroller.text) < 0.132 &&
                                  selectedGMTrEvalue ==
                                      Enum_EM_ir_17_mgt.giga) {
                                return '$ntrRSV KV [should be above 0.132MR ]';
                              } else if (ntr.ratedSystemVoltage == 66 &&
                                  double.parse(_recontroller.text) < 0.000132 &&
                                  selectedGMTrEvalue ==
                                      Enum_EM_ir_17_mgt.terra) {
                                return '$ntrRSV KV [should be above 0.000132MR ]';
                              }
                              // -------------------------------------------
                              if (ntr.ratedSystemVoltage == 110 &&
                                  double.parse(_recontroller.text) < 220 &&
                                  selectedGMTrEvalue ==
                                      Enum_EM_ir_17_mgt.mega) {
                                return '$ntrRSV KV [should be above 220MR ]';
                              } else if (ntr.ratedSystemVoltage == 110 &&
                                  double.parse(_recontroller.text) < 0.220 &&
                                  selectedGMTrEvalue ==
                                      Enum_EM_ir_17_mgt.giga) {
                                return '$ntrRSV KV [should be above 0.220MR ]';
                              } else if (ntr.ratedSystemVoltage == 110 &&
                                  double.parse(_recontroller.text) < 0.000220 &&
                                  selectedGMTrEvalue ==
                                      Enum_EM_ir_17_mgt.terra) {
                                return '$ntrRSV KV [should be above 0.000220MR ]';
                              }
                              // -------------------------------------------
                              if (ntr.ratedSystemVoltage == 132 &&
                                  double.parse(_recontroller.text) < 264 &&
                                  selectedGMTrEvalue ==
                                      Enum_EM_ir_17_mgt.mega) {
                                return '$ntrRSV KV [should be above 264MR ]';
                              } else if (ntr.ratedSystemVoltage == 132 &&
                                  double.parse(_recontroller.text) < 0.264 &&
                                  selectedGMTrEvalue ==
                                      Enum_EM_ir_17_mgt.giga) {
                                return '$ntrRSV KV [should be above 0.264MR ]';
                              } else if (ntr.ratedSystemVoltage == 132 &&
                                  double.parse(_recontroller.text) < 0.000264 &&
                                  selectedGMTrEvalue ==
                                      Enum_EM_ir_17_mgt.terra) {
                                return '$ntrRSV KV [should be above 0.000264MR ]';
                              }
                              // -------------------------------------------
                              if (ntr.ratedSystemVoltage == 220 &&
                                  double.parse(_recontroller.text) < 440 &&
                                  selectedGMTrEvalue ==
                                      Enum_EM_ir_17_mgt.mega) {
                                return '$ntrRSV KV [should be above 440MR ]';
                              } else if (ntr.ratedSystemVoltage == 220 &&
                                  double.parse(_recontroller.text) < 0.440 &&
                                  selectedGMTrEvalue ==
                                      Enum_EM_ir_17_mgt.giga) {
                                return '$ntrRSV KV [should be above 0.440MR ]';
                              } else if (ntr.ratedSystemVoltage == 220 &&
                                  double.parse(_recontroller.text) < 0.000440 &&
                                  selectedGMTrEvalue ==
                                      Enum_EM_ir_17_mgt.terra) {
                                return '$ntrRSV KV [should be above 0.000440MR ]';
                              }
                              // -------------------------------------------
                              if (ntr.ratedSystemVoltage == 400 &&
                                  double.parse(_recontroller.text) < 800 &&
                                  selectedGMTrEvalue ==
                                      Enum_EM_ir_17_mgt.mega) {
                                return '$ntrRSV KV [should be above 800MR ]';
                              } else if (ntr.ratedSystemVoltage == 400 &&
                                  double.parse(_recontroller.text) < 0.800 &&
                                  selectedGMTrEvalue ==
                                      Enum_EM_ir_17_mgt.giga) {
                                return '$ntrRSV KV [should be above 0.800MR ]';
                              } else if (ntr.ratedSystemVoltage == 400 &&
                                  double.parse(_recontroller.text) < 0.000800 &&
                                  selectedGMTrEvalue ==
                                      Enum_EM_ir_17_mgt.terra) {
                                return '$ntrRSV KV [should be above 0.000800MR ]';
                              }
                            }
                          },
                        ),
                      ),
                      // >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
                      MGT_ye(),
                      Padding(
                        padding: EdgeInsets.fromLTRB(10, 0, 10, 10),
                        child: CustomTextFormFieldForNumber(
                          controller: _yecontroller,
                          hintText: 'ye',
                          validator: (val) {
                            if (!val.IsValueEmpty) {
                              return 'Field should not be empty';
                            }
                            if (ntr.etype == 'acb') {
                              if (double.parse(_yecontroller.text) < 1 &&
                                  selectedGMTyEvalue ==
                                      Enum_EM_ir_17_mgt.mega) {
                                return 'Acceptable Limits Above [1 MΩ]';
                              } else if (double.parse(_yecontroller.text) <
                                      0.001 &&
                                  selectedGMTyEvalue ==
                                      Enum_EM_ir_17_mgt.giga) {
                                return 'Acceptable Limits Above [0.001 MΩ]';
                              } else if (double.parse(_yecontroller.text) <
                                      0.000001 &&
                                  selectedGMTyEvalue ==
                                      Enum_EM_ir_17_mgt.terra) {
                                return 'Acceptable Limits Above [0.000001 MΩ]';
                              }
                            } else if (ntr.etype == 'vcb' ||
                                ntr.etype == 'ocb' ||
                                ntr.etype == 'sf6') {
                              if (ntr.ratedSystemVoltage == 11 &&
                                  double.parse(_yecontroller.text) < 22 &&
                                  selectedGMTyEvalue ==
                                      Enum_EM_ir_17_mgt.mega) {
                                return ' $ntrRSV KV [should be above 22MR ]';
                              } else if (ntr.ratedSystemVoltage == 11 &&
                                  double.parse(_yecontroller.text) < 0.022 &&
                                  selectedGMTyEvalue ==
                                      Enum_EM_ir_17_mgt.giga) {
                                return ' $ntrRSV KV [should be above 0.022MR ]';
                              } else if (ntr.ratedSystemVoltage == 11 &&
                                  double.parse(_yecontroller.text) < 0.000022 &&
                                  selectedGMTyEvalue ==
                                      Enum_EM_ir_17_mgt.terra) {
                                return ' $ntrRSV KV [should be above 0.000022MR ]';
                              }
                              // -------------------------------------------
                              if (ntr.ratedSystemVoltage == 33 &&
                                  double.parse(_yecontroller.text) < 66 &&
                                  selectedGMTyEvalue ==
                                      Enum_EM_ir_17_mgt.mega) {
                                return '$ntrRSV KV [should be above 66MR ]';
                              } else if (ntr.ratedSystemVoltage == 33 &&
                                  double.parse(_yecontroller.text) < 0.066 &&
                                  selectedGMTyEvalue ==
                                      Enum_EM_ir_17_mgt.giga) {
                                return '$ntrRSV KV [should be above 0.066MR ]';
                              } else if (ntr.ratedSystemVoltage == 33 &&
                                  double.parse(_yecontroller.text) < 0.000066 &&
                                  selectedGMTyEvalue ==
                                      Enum_EM_ir_17_mgt.terra) {
                                return '$ntrRSV KV [should be above 0.000066MR ]';
                              }
                              // -------------------------------------------
                              if (ntr.ratedSystemVoltage == 66 &&
                                  double.parse(_yecontroller.text) < 132 &&
                                  selectedGMTyEvalue ==
                                      Enum_EM_ir_17_mgt.mega) {
                                return '$ntrRSV KV [should be above 132MR ]';
                              } else if (ntr.ratedSystemVoltage == 66 &&
                                  double.parse(_yecontroller.text) < 0.132 &&
                                  selectedGMTyEvalue ==
                                      Enum_EM_ir_17_mgt.giga) {
                                return '$ntrRSV KV [should be above 0.132MR ]';
                              } else if (ntr.ratedSystemVoltage == 66 &&
                                  double.parse(_yecontroller.text) < 0.000132 &&
                                  selectedGMTyEvalue ==
                                      Enum_EM_ir_17_mgt.terra) {
                                return '$ntrRSV KV [should be above 0.000132MR ]';
                              }
                              // -------------------------------------------
                              if (ntr.ratedSystemVoltage == 110 &&
                                  double.parse(_yecontroller.text) < 220 &&
                                  selectedGMTyEvalue ==
                                      Enum_EM_ir_17_mgt.mega) {
                                return '$ntrRSV KV [should be above 220MR ]';
                              } else if (ntr.ratedSystemVoltage == 110 &&
                                  double.parse(_yecontroller.text) < 0.220 &&
                                  selectedGMTyEvalue ==
                                      Enum_EM_ir_17_mgt.giga) {
                                return '$ntrRSV KV [should be above 0.220MR ]';
                              } else if (ntr.ratedSystemVoltage == 110 &&
                                  double.parse(_yecontroller.text) < 0.000220 &&
                                  selectedGMTyEvalue ==
                                      Enum_EM_ir_17_mgt.terra) {
                                return '$ntrRSV KV [should be above 0.000220MR ]';
                              }
                              // -------------------------------------------
                              if (ntr.ratedSystemVoltage == 132 &&
                                  double.parse(_yecontroller.text) < 264 &&
                                  selectedGMTyEvalue ==
                                      Enum_EM_ir_17_mgt.mega) {
                                return '$ntrRSV KV [should be above 264MR ]';
                              } else if (ntr.ratedSystemVoltage == 132 &&
                                  double.parse(_yecontroller.text) < 0.264 &&
                                  selectedGMTyEvalue ==
                                      Enum_EM_ir_17_mgt.giga) {
                                return '$ntrRSV KV [should be above 0.264MR ]';
                              } else if (ntr.ratedSystemVoltage == 132 &&
                                  double.parse(_yecontroller.text) < 0.000264 &&
                                  selectedGMTyEvalue ==
                                      Enum_EM_ir_17_mgt.terra) {
                                return '$ntrRSV KV [should be above 0.000264MR ]';
                              }
                              // -------------------------------------------
                              if (ntr.ratedSystemVoltage == 220 &&
                                  double.parse(_yecontroller.text) < 440 &&
                                  selectedGMTyEvalue ==
                                      Enum_EM_ir_17_mgt.mega) {
                                return '$ntrRSV KV [should be above 440MR ]';
                              } else if (ntr.ratedSystemVoltage == 220 &&
                                  double.parse(_yecontroller.text) < 0.440 &&
                                  selectedGMTyEvalue ==
                                      Enum_EM_ir_17_mgt.giga) {
                                return '$ntrRSV KV [should be above 0.440MR ]';
                              } else if (ntr.ratedSystemVoltage == 220 &&
                                  double.parse(_yecontroller.text) < 0.000440 &&
                                  selectedGMTyEvalue ==
                                      Enum_EM_ir_17_mgt.terra) {
                                return '$ntrRSV KV [should be above 0.000440MR ]';
                              }
                              // -------------------------------------------
                              if (ntr.ratedSystemVoltage == 400 &&
                                  double.parse(_yecontroller.text) < 800 &&
                                  selectedGMTyEvalue ==
                                      Enum_EM_ir_17_mgt.mega) {
                                return '$ntrRSV KV [should be above 800MR ]';
                              } else if (ntr.ratedSystemVoltage == 400 &&
                                  double.parse(_yecontroller.text) < 0.800 &&
                                  selectedGMTyEvalue ==
                                      Enum_EM_ir_17_mgt.giga) {
                                return '$ntrRSV KV [should be above 0.800MR ]';
                              } else if (ntr.ratedSystemVoltage == 400 &&
                                  double.parse(_yecontroller.text) < 0.000800 &&
                                  selectedGMTyEvalue ==
                                      Enum_EM_ir_17_mgt.terra) {
                                return '$ntrRSV KV [should be above 0.000800MR ]';
                              }
                            }
                          },
                        ),
                      ),
                      // >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
                      MGT_be(),
                      Padding(
                        padding: EdgeInsets.fromLTRB(10, 0, 10, 10),
                        child: CustomTextFormFieldForNumber(
                          controller: _becontroller,
                          hintText: 'be',
                          validator: (val) {
                            if (!val.IsValueEmpty) {
                              return 'Field should not be empty';
                            }
                            if (ntr.etype == 'acb') {
                              if (double.parse(_becontroller.text) < 1 &&
                                  selectedGMTbEvalue ==
                                      Enum_EM_ir_17_mgt.mega) {
                                return 'Acceptable Limits Above [1 MΩ]';
                              } else if (double.parse(_becontroller.text) <
                                      0.001 &&
                                  selectedGMTbEvalue ==
                                      Enum_EM_ir_17_mgt.giga) {
                                return 'Acceptable Limits Above [0.001 MΩ]';
                              } else if (double.parse(_becontroller.text) <
                                      0.000001 &&
                                  selectedGMTbEvalue ==
                                      Enum_EM_ir_17_mgt.terra) {
                                return 'Acceptable Limits Above [0.000001 MΩ]';
                              }
                            } else if (ntr.etype == 'vcb' ||
                                ntr.etype == 'ocb' ||
                                ntr.etype == 'sf6') {
                              if (ntr.ratedSystemVoltage == 11 &&
                                  double.parse(_becontroller.text) < 22 &&
                                  selectedGMTbEvalue ==
                                      Enum_EM_ir_17_mgt.mega) {
                                return ' $ntrRSV KV [should be above 22MR ]';
                              } else if (ntr.ratedSystemVoltage == 11 &&
                                  double.parse(_becontroller.text) < 0.022 &&
                                  selectedGMTbEvalue ==
                                      Enum_EM_ir_17_mgt.giga) {
                                return ' $ntrRSV KV [should be above 0.022MR ]';
                              } else if (ntr.ratedSystemVoltage == 11 &&
                                  double.parse(_becontroller.text) < 0.000022 &&
                                  selectedGMTbEvalue ==
                                      Enum_EM_ir_17_mgt.terra) {
                                return ' $ntrRSV KV [should be above 0.000022MR ]';
                              }
                              // -------------------------------------------
                              if (ntr.ratedSystemVoltage == 33 &&
                                  double.parse(_becontroller.text) < 66 &&
                                  selectedGMTbEvalue ==
                                      Enum_EM_ir_17_mgt.mega) {
                                return '$ntrRSV KV [should be above 66MR ]';
                              } else if (ntr.ratedSystemVoltage == 33 &&
                                  double.parse(_becontroller.text) < 0.066 &&
                                  selectedGMTbEvalue ==
                                      Enum_EM_ir_17_mgt.giga) {
                                return '$ntrRSV KV [should be above 0.066MR ]';
                              } else if (ntr.ratedSystemVoltage == 33 &&
                                  double.parse(_becontroller.text) < 0.000066 &&
                                  selectedGMTbEvalue ==
                                      Enum_EM_ir_17_mgt.terra) {
                                return '$ntrRSV KV [should be above 0.000066MR ]';
                              }
                              // -------------------------------------------
                              if (ntr.ratedSystemVoltage == 66 &&
                                  double.parse(_becontroller.text) < 132 &&
                                  selectedGMTbEvalue ==
                                      Enum_EM_ir_17_mgt.mega) {
                                return '$ntrRSV KV [should be above 132MR ]';
                              } else if (ntr.ratedSystemVoltage == 66 &&
                                  double.parse(_becontroller.text) < 0.132 &&
                                  selectedGMTbEvalue ==
                                      Enum_EM_ir_17_mgt.giga) {
                                return '$ntrRSV KV [should be above 0.132MR ]';
                              } else if (ntr.ratedSystemVoltage == 66 &&
                                  double.parse(_becontroller.text) < 0.000132 &&
                                  selectedGMTbEvalue ==
                                      Enum_EM_ir_17_mgt.terra) {
                                return '$ntrRSV KV [should be above 0.000132MR ]';
                              }
                              // -------------------------------------------
                              if (ntr.ratedSystemVoltage == 110 &&
                                  double.parse(_becontroller.text) < 220 &&
                                  selectedGMTbEvalue ==
                                      Enum_EM_ir_17_mgt.mega) {
                                return '$ntrRSV KV [should be above 220MR ]';
                              } else if (ntr.ratedSystemVoltage == 110 &&
                                  double.parse(_becontroller.text) < 0.220 &&
                                  selectedGMTbEvalue ==
                                      Enum_EM_ir_17_mgt.giga) {
                                return '$ntrRSV KV [should be above 0.220MR ]';
                              } else if (ntr.ratedSystemVoltage == 110 &&
                                  double.parse(_becontroller.text) < 0.000220 &&
                                  selectedGMTbEvalue ==
                                      Enum_EM_ir_17_mgt.terra) {
                                return '$ntrRSV KV [should be above 0.000220MR ]';
                              }
                              // -------------------------------------------
                              if (ntr.ratedSystemVoltage == 132 &&
                                  double.parse(_becontroller.text) < 264 &&
                                  selectedGMTbEvalue ==
                                      Enum_EM_ir_17_mgt.mega) {
                                return '$ntrRSV KV [should be above 264MR ]';
                              } else if (ntr.ratedSystemVoltage == 132 &&
                                  double.parse(_becontroller.text) < 0.264 &&
                                  selectedGMTbEvalue ==
                                      Enum_EM_ir_17_mgt.giga) {
                                return '$ntrRSV KV [should be above 0.264MR ]';
                              } else if (ntr.ratedSystemVoltage == 132 &&
                                  double.parse(_becontroller.text) < 0.000264 &&
                                  selectedGMTbEvalue ==
                                      Enum_EM_ir_17_mgt.terra) {
                                return '$ntrRSV KV [should be above 0.000264MR ]';
                              }
                              // -------------------------------------------
                              if (ntr.ratedSystemVoltage == 220 &&
                                  double.parse(_becontroller.text) < 440 &&
                                  selectedGMTbEvalue ==
                                      Enum_EM_ir_17_mgt.mega) {
                                return '$ntrRSV KV [should be above 440MR ]';
                              } else if (ntr.ratedSystemVoltage == 220 &&
                                  double.parse(_becontroller.text) < 0.440 &&
                                  selectedGMTbEvalue ==
                                      Enum_EM_ir_17_mgt.giga) {
                                return '$ntrRSV KV [should be above 0.440MR ]';
                              } else if (ntr.ratedSystemVoltage == 220 &&
                                  double.parse(_becontroller.text) < 0.000440 &&
                                  selectedGMTbEvalue ==
                                      Enum_EM_ir_17_mgt.terra) {
                                return '$ntrRSV KV [should be above 0.000440MR ]';
                              }
                              // -------------------------------------------
                              if (ntr.ratedSystemVoltage == 400 &&
                                  double.parse(_becontroller.text) < 800 &&
                                  selectedGMTbEvalue ==
                                      Enum_EM_ir_17_mgt.mega) {
                                return '$ntrRSV KV [should be above 800MR ]';
                              } else if (ntr.ratedSystemVoltage == 400 &&
                                  double.parse(_becontroller.text) < 0.800 &&
                                  selectedGMTbEvalue ==
                                      Enum_EM_ir_17_mgt.giga) {
                                return '$ntrRSV KV [should be above 0.800MR ]';
                              } else if (ntr.ratedSystemVoltage == 400 &&
                                  double.parse(_becontroller.text) < 0.000800 &&
                                  selectedGMTbEvalue ==
                                      Enum_EM_ir_17_mgt.terra) {
                                return '$ntrRSV KV [should be above 0.000800MR ]';
                              }
                            }
                          },
                        ),
                      ),
                      // >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
                      ntr.noOfPoles == 3
                          ? Container()
                          : Padding(
                              padding: EdgeInsets.fromLTRB(10, 0, 10, 10),
                              child: Column(
                                children: [
                                  MGT_ne(),
                                  CustomTextFormFieldForNumber(
                                    controller: _necontroller,
                                    hintText: 'ne',
                                    validator: (val) {
                                      if (!val.IsValueEmpty) {
                                        return 'Field should not be empty';
                                      }
                                      if (ntr.etype == 'acb') {
                                        if (double.parse(_necontroller.text) <
                                                1 &&
                                            selectedGMTnEvalue ==
                                                Enum_EM_ir_17_mgt.mega) {
                                          return 'Acceptable Limits Above [1 MΩ]';
                                        } else if (double.parse(
                                                    _necontroller.text) <
                                                0.001 &&
                                            selectedGMTnEvalue ==
                                                Enum_EM_ir_17_mgt.giga) {
                                          return 'Acceptable Limits Above [0.001 MΩ]';
                                        } else if (double.parse(
                                                    _necontroller.text) <
                                                0.000001 &&
                                            selectedGMTnEvalue ==
                                                Enum_EM_ir_17_mgt.terra) {
                                          return 'Acceptable Limits Above [0.000001 MΩ]';
                                        }
                                      } else if (ntr.etype == 'vcb' ||
                                          ntr.etype == 'ocb' ||
                                          ntr.etype == 'sf6') {
                                        if (ntr.ratedSystemVoltage == 11 &&
                                            double.parse(_necontroller.text) <
                                                22 &&
                                            selectedGMTnEvalue ==
                                                Enum_EM_ir_17_mgt.mega) {
                                          return ' $ntrRSV KV [should be above 22MR ]';
                                        } else if (ntr.ratedSystemVoltage ==
                                                11 &&
                                            double.parse(_necontroller.text) <
                                                0.022 &&
                                            selectedGMTnEvalue ==
                                                Enum_EM_ir_17_mgt.giga) {
                                          return ' $ntrRSV KV [should be above 0.022MR ]';
                                        } else if (ntr.ratedSystemVoltage ==
                                                11 &&
                                            double.parse(_necontroller.text) <
                                                0.000022 &&
                                            selectedGMTnEvalue ==
                                                Enum_EM_ir_17_mgt.terra) {
                                          return ' $ntrRSV KV [should be above 0.000022MR ]';
                                        }
                                        // -------------------------------------------
                                        if (ntr.ratedSystemVoltage == 33 &&
                                            double.parse(_necontroller.text) <
                                                66 &&
                                            selectedGMTnEvalue ==
                                                Enum_EM_ir_17_mgt.mega) {
                                          return '$ntrRSV KV [should be above 66MR ]';
                                        } else if (ntr.ratedSystemVoltage ==
                                                33 &&
                                            double.parse(_necontroller.text) <
                                                0.066 &&
                                            selectedGMTnEvalue ==
                                                Enum_EM_ir_17_mgt.giga) {
                                          return '$ntrRSV KV [should be above 0.066MR ]';
                                        } else if (ntr.ratedSystemVoltage ==
                                                33 &&
                                            double.parse(_necontroller.text) <
                                                0.000066 &&
                                            selectedGMTnEvalue ==
                                                Enum_EM_ir_17_mgt.terra) {
                                          return '$ntrRSV KV [should be above 0.000066MR ]';
                                        }
                                        // -------------------------------------------
                                        if (ntr.ratedSystemVoltage == 66 &&
                                            double.parse(_necontroller.text) <
                                                132 &&
                                            selectedGMTnEvalue ==
                                                Enum_EM_ir_17_mgt.mega) {
                                          return '$ntrRSV KV [should be above 132MR ]';
                                        } else if (ntr.ratedSystemVoltage ==
                                                66 &&
                                            double.parse(_necontroller.text) <
                                                0.132 &&
                                            selectedGMTnEvalue ==
                                                Enum_EM_ir_17_mgt.giga) {
                                          return '$ntrRSV KV [should be above 0.132MR ]';
                                        } else if (ntr.ratedSystemVoltage ==
                                                66 &&
                                            double.parse(_necontroller.text) <
                                                0.000132 &&
                                            selectedGMTnEvalue ==
                                                Enum_EM_ir_17_mgt.terra) {
                                          return '$ntrRSV KV [should be above 0.000132MR ]';
                                        }
                                        // -------------------------------------------
                                        if (ntr.ratedSystemVoltage == 110 &&
                                            double.parse(_necontroller.text) <
                                                220 &&
                                            selectedGMTnEvalue ==
                                                Enum_EM_ir_17_mgt.mega) {
                                          return '$ntrRSV KV [should be above 220MR ]';
                                        } else if (ntr.ratedSystemVoltage ==
                                                110 &&
                                            double.parse(_necontroller.text) <
                                                0.220 &&
                                            selectedGMTnEvalue ==
                                                Enum_EM_ir_17_mgt.giga) {
                                          return '$ntrRSV KV [should be above 0.220MR ]';
                                        } else if (ntr.ratedSystemVoltage ==
                                                110 &&
                                            double.parse(_necontroller.text) <
                                                0.000220 &&
                                            selectedGMTnEvalue ==
                                                Enum_EM_ir_17_mgt.terra) {
                                          return '$ntrRSV KV [should be above 0.000220MR ]';
                                        }
                                        // -------------------------------------------
                                        if (ntr.ratedSystemVoltage == 132 &&
                                            double.parse(_necontroller.text) <
                                                264 &&
                                            selectedGMTnEvalue ==
                                                Enum_EM_ir_17_mgt.mega) {
                                          return '$ntrRSV KV [should be above 264MR ]';
                                        } else if (ntr.ratedSystemVoltage ==
                                                132 &&
                                            double.parse(_necontroller.text) <
                                                0.264 &&
                                            selectedGMTnEvalue ==
                                                Enum_EM_ir_17_mgt.giga) {
                                          return '$ntrRSV KV [should be above 0.264MR ]';
                                        } else if (ntr.ratedSystemVoltage ==
                                                132 &&
                                            double.parse(_necontroller.text) <
                                                0.000264 &&
                                            selectedGMTnEvalue ==
                                                Enum_EM_ir_17_mgt.terra) {
                                          return '$ntrRSV KV [should be above 0.000264MR ]';
                                        }
                                        // -------------------------------------------
                                        if (ntr.ratedSystemVoltage == 220 &&
                                            double.parse(_necontroller.text) <
                                                440 &&
                                            selectedGMTnEvalue ==
                                                Enum_EM_ir_17_mgt.mega) {
                                          return '$ntrRSV KV [should be above 440MR ]';
                                        } else if (ntr.ratedSystemVoltage ==
                                                220 &&
                                            double.parse(_necontroller.text) <
                                                0.440 &&
                                            selectedGMTnEvalue ==
                                                Enum_EM_ir_17_mgt.giga) {
                                          return '$ntrRSV KV [should be above 0.440MR ]';
                                        } else if (ntr.ratedSystemVoltage ==
                                                220 &&
                                            double.parse(_necontroller.text) <
                                                0.000440 &&
                                            selectedGMTnEvalue ==
                                                Enum_EM_ir_17_mgt.terra) {
                                          return '$ntrRSV KV [should be above 0.000440MR ]';
                                        }
                                        // -------------------------------------------
                                        if (ntr.ratedSystemVoltage == 400 &&
                                            double.parse(_necontroller.text) <
                                                800 &&
                                            selectedGMTnEvalue ==
                                                Enum_EM_ir_17_mgt.mega) {
                                          return '$ntrRSV KV [should be above 800MR ]';
                                        } else if (ntr.ratedSystemVoltage ==
                                                400 &&
                                            double.parse(_necontroller.text) <
                                                0.800 &&
                                            selectedGMTnEvalue ==
                                                Enum_EM_ir_17_mgt.giga) {
                                          return '$ntrRSV KV [should be above 0.800MR ]';
                                        } else if (ntr.ratedSystemVoltage ==
                                                400 &&
                                            double.parse(_necontroller.text) <
                                                0.000800 &&
                                            selectedGMTnEvalue ==
                                                Enum_EM_ir_17_mgt.terra) {
                                          return '$ntrRSV KV [should be above 0.000800MR ]';
                                        }
                                      }
                                    },
                                  ),
                                ],
                              ),
                            ),
                    ],
                  ),
                ),
                //--------------------------------------------------------------------------------------------
                Divider(height: 10, color: Colors.grey[200]),
                Card(
                  elevation: 5,
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
                        child: Text(
                          ' Pole-Pole (close condition) ',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            letterSpacing: 1,
                          ),
                        ),
                      ),
                      MGT_ry(),
                      Padding(
                        padding: EdgeInsets.fromLTRB(10, 0, 10, 10),
                        child: Column(
                          children: [
                            CustomTextFormFieldForNumber(
                              controller: _rycontroller,
                              hintText: 'ry',
                              validator: (val) {
                                if (!val.IsValueEmpty) {
                                  return 'Field should not be empty';
                                }
                                if (ntr.etype == 'acb') {
                                  if (double.parse(_rycontroller.text) < 1 &&
                                      selectedGMTrYvalue ==
                                          Enum_EM_ir_17_mgt.mega) {
                                    return 'Acceptable Limits Above [1 MΩ]';
                                  } else if (double.parse(_rycontroller.text) <
                                          0.001 &&
                                      selectedGMTrYvalue ==
                                          Enum_EM_ir_17_mgt.giga) {
                                    return 'Acceptable Limits Above [0.001 MΩ]';
                                  } else if (double.parse(_rycontroller.text) <
                                          0.000001 &&
                                      selectedGMTrYvalue ==
                                          Enum_EM_ir_17_mgt.terra) {
                                    return 'Acceptable Limits Above [0.000001 MΩ]';
                                  }
                                }
                                if (ntr.etype == 'vcb' ||
                                    ntr.etype == 'ocb' ||
                                    ntr.etype == 'sf6') {
                                  if (ntr.ratedSystemVoltage == 11 &&
                                      double.parse(_rycontroller.text) < 22 &&
                                      selectedGMTrYvalue ==
                                          Enum_EM_ir_17_mgt.mega) {
                                    return ' $ntrRSV KV [should be above 22MR ]';
                                  } else if (ntr.ratedSystemVoltage == 11 &&
                                      double.parse(_rycontroller.text) <
                                          0.022 &&
                                      selectedGMTrYvalue ==
                                          Enum_EM_ir_17_mgt.giga) {
                                    return ' $ntrRSV KV [should be above 0.022MR ]';
                                  } else if (ntr.ratedSystemVoltage == 11 &&
                                      double.parse(_rycontroller.text) <
                                          0.000022 &&
                                      selectedGMTrYvalue ==
                                          Enum_EM_ir_17_mgt.terra) {
                                    return ' $ntrRSV KV [should be above 0.000022MR ]';
                                  }
                                  // -------------------------------------------
                                  if (ntr.ratedSystemVoltage == 33 &&
                                      double.parse(_rycontroller.text) < 66 &&
                                      selectedGMTrYvalue ==
                                          Enum_EM_ir_17_mgt.mega) {
                                    return '$ntrRSV KV [should be above 66MR ]';
                                  } else if (ntr.ratedSystemVoltage == 33 &&
                                      double.parse(_rycontroller.text) <
                                          0.066 &&
                                      selectedGMTrYvalue ==
                                          Enum_EM_ir_17_mgt.giga) {
                                    return '$ntrRSV KV [should be above 0.066MR ]';
                                  } else if (ntr.ratedSystemVoltage == 33 &&
                                      double.parse(_rycontroller.text) <
                                          0.000066 &&
                                      selectedGMTrYvalue ==
                                          Enum_EM_ir_17_mgt.terra) {
                                    return '$ntrRSV KV [should be above 0.000066MR ]';
                                  }
                                  // -------------------------------------------
                                  if (ntr.ratedSystemVoltage == 66 &&
                                      double.parse(_rycontroller.text) < 132 &&
                                      selectedGMTrYvalue ==
                                          Enum_EM_ir_17_mgt.mega) {
                                    return '$ntrRSV KV [should be above 132MR ]';
                                  } else if (ntr.ratedSystemVoltage == 66 &&
                                      double.parse(_rycontroller.text) <
                                          0.132 &&
                                      selectedGMTrYvalue ==
                                          Enum_EM_ir_17_mgt.giga) {
                                    return '$ntrRSV KV [should be above 0.132MR ]';
                                  } else if (ntr.ratedSystemVoltage == 66 &&
                                      double.parse(_rycontroller.text) <
                                          0.000132 &&
                                      selectedGMTrYvalue ==
                                          Enum_EM_ir_17_mgt.terra) {
                                    return '$ntrRSV KV [should be above 0.000132MR ]';
                                  }
                                  // -------------------------------------------
                                  if (ntr.ratedSystemVoltage == 110 &&
                                      double.parse(_rycontroller.text) < 220 &&
                                      selectedGMTrYvalue ==
                                          Enum_EM_ir_17_mgt.mega) {
                                    return '$ntrRSV KV [should be above 220MR ]';
                                  } else if (ntr.ratedSystemVoltage == 110 &&
                                      double.parse(_rycontroller.text) <
                                          0.220 &&
                                      selectedGMTrYvalue ==
                                          Enum_EM_ir_17_mgt.giga) {
                                    return '$ntrRSV KV [should be above 0.220MR ]';
                                  } else if (ntr.ratedSystemVoltage == 110 &&
                                      double.parse(_rycontroller.text) <
                                          0.000220 &&
                                      selectedGMTrYvalue ==
                                          Enum_EM_ir_17_mgt.terra) {
                                    return '$ntrRSV KV [should be above 0.000220MR ]';
                                  }
                                  // -------------------------------------------
                                  if (ntr.ratedSystemVoltage == 132 &&
                                      double.parse(_rycontroller.text) < 264 &&
                                      selectedGMTrYvalue ==
                                          Enum_EM_ir_17_mgt.mega) {
                                    return '$ntrRSV KV [should be above 264MR ]';
                                  } else if (ntr.ratedSystemVoltage == 132 &&
                                      double.parse(_rycontroller.text) <
                                          0.264 &&
                                      selectedGMTrYvalue ==
                                          Enum_EM_ir_17_mgt.giga) {
                                    return '$ntrRSV KV [should be above 0.264MR ]';
                                  } else if (ntr.ratedSystemVoltage == 132 &&
                                      double.parse(_rycontroller.text) <
                                          0.000264 &&
                                      selectedGMTrYvalue ==
                                          Enum_EM_ir_17_mgt.terra) {
                                    return '$ntrRSV KV [should be above 0.000264MR ]';
                                  }
                                  // -------------------------------------------
                                  if (ntr.ratedSystemVoltage == 220 &&
                                      double.parse(_rycontroller.text) < 440 &&
                                      selectedGMTrYvalue ==
                                          Enum_EM_ir_17_mgt.mega) {
                                    return '$ntrRSV KV [should be above 440MR ]';
                                  } else if (ntr.ratedSystemVoltage == 220 &&
                                      double.parse(_rycontroller.text) <
                                          0.440 &&
                                      selectedGMTrYvalue ==
                                          Enum_EM_ir_17_mgt.giga) {
                                    return '$ntrRSV KV [should be above 0.440MR ]';
                                  } else if (ntr.ratedSystemVoltage == 220 &&
                                      double.parse(_rycontroller.text) <
                                          0.000440 &&
                                      selectedGMTrYvalue ==
                                          Enum_EM_ir_17_mgt.terra) {
                                    return '$ntrRSV KV [should be above 0.000440MR ]';
                                  }
                                  // -------------------------------------------
                                  if (ntr.ratedSystemVoltage == 400 &&
                                      double.parse(_rycontroller.text) < 800 &&
                                      selectedGMTrYvalue ==
                                          Enum_EM_ir_17_mgt.mega) {
                                    return '$ntrRSV KV [should be above 800MR ]';
                                  } else if (ntr.ratedSystemVoltage == 400 &&
                                      double.parse(_rycontroller.text) <
                                          0.800 &&
                                      selectedGMTrYvalue ==
                                          Enum_EM_ir_17_mgt.giga) {
                                    return '$ntrRSV KV [should be above 0.800MR ]';
                                  } else if (ntr.ratedSystemVoltage == 400 &&
                                      double.parse(_rycontroller.text) <
                                          0.000800 &&
                                      selectedGMTrYvalue ==
                                          Enum_EM_ir_17_mgt.terra) {
                                    return '$ntrRSV KV [should be above 0.000800MR ]';
                                  }
                                }
                              },
                            ),
                          ],
                        ),
                      ),
                      // >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
                      MGT_yb(),
                      Padding(
                        padding: EdgeInsets.fromLTRB(10, 0, 10, 10),
                        child: CustomTextFormFieldForNumber(
                          controller: _ybcontroller,
                          hintText: 'yb',
                          validator: (val) {
                            if (!val.IsValueEmpty) {
                              return 'Field should not be empty';
                            }
                            if (ntr.etype == 'acb') {
                              if (double.parse(_ybcontroller.text) < 1 &&
                                  selectedGMTyBvalue ==
                                      Enum_EM_ir_17_mgt.mega) {
                                return 'Acceptable Limits Above [1 MΩ]';
                              } else if (double.parse(_ybcontroller.text) <
                                      0.001 &&
                                  selectedGMTyBvalue ==
                                      Enum_EM_ir_17_mgt.giga) {
                                return 'Acceptable Limits Above [0.001 MΩ]';
                              } else if (double.parse(_ybcontroller.text) <
                                      0.000001 &&
                                  selectedGMTyBvalue ==
                                      Enum_EM_ir_17_mgt.terra) {
                                return 'Acceptable Limits Above [0.000001 MΩ]';
                              }
                            } else if (ntr.etype == 'vcb' ||
                                ntr.etype == 'ocb' ||
                                ntr.etype == 'sf6') {
                              if (ntr.ratedSystemVoltage == 11 &&
                                  double.parse(_ybcontroller.text) < 22 &&
                                  selectedGMTyBvalue ==
                                      Enum_EM_ir_17_mgt.mega) {
                                return ' $ntrRSV KV [should be above 22MR ]';
                              } else if (ntr.ratedSystemVoltage == 11 &&
                                  double.parse(_ybcontroller.text) < 0.022 &&
                                  selectedGMTyBvalue ==
                                      Enum_EM_ir_17_mgt.giga) {
                                return ' $ntrRSV KV [should be above 0.022MR ]';
                              } else if (ntr.ratedSystemVoltage == 11 &&
                                  double.parse(_ybcontroller.text) < 0.000022 &&
                                  selectedGMTyBvalue ==
                                      Enum_EM_ir_17_mgt.terra) {
                                return ' $ntrRSV KV [should be above 0.000022MR ]';
                              }
                              // -------------------------------------------
                              if (ntr.ratedSystemVoltage == 33 &&
                                  double.parse(_ybcontroller.text) < 66 &&
                                  selectedGMTyBvalue ==
                                      Enum_EM_ir_17_mgt.mega) {
                                return '$ntrRSV KV [should be above 66MR ]';
                              } else if (ntr.ratedSystemVoltage == 33 &&
                                  double.parse(_ybcontroller.text) < 0.066 &&
                                  selectedGMTyBvalue ==
                                      Enum_EM_ir_17_mgt.giga) {
                                return '$ntrRSV KV [should be above 0.066MR ]';
                              } else if (ntr.ratedSystemVoltage == 33 &&
                                  double.parse(_ybcontroller.text) < 0.000066 &&
                                  selectedGMTyBvalue ==
                                      Enum_EM_ir_17_mgt.terra) {
                                return '$ntrRSV KV [should be above 0.000066MR ]';
                              }
                              // -------------------------------------------
                              if (ntr.ratedSystemVoltage == 66 &&
                                  double.parse(_ybcontroller.text) < 132 &&
                                  selectedGMTyBvalue ==
                                      Enum_EM_ir_17_mgt.mega) {
                                return '$ntrRSV KV [should be above 132MR ]';
                              } else if (ntr.ratedSystemVoltage == 66 &&
                                  double.parse(_ybcontroller.text) < 0.132 &&
                                  selectedGMTyBvalue ==
                                      Enum_EM_ir_17_mgt.giga) {
                                return '$ntrRSV KV [should be above 0.132MR ]';
                              } else if (ntr.ratedSystemVoltage == 66 &&
                                  double.parse(_ybcontroller.text) < 0.000132 &&
                                  selectedGMTyBvalue ==
                                      Enum_EM_ir_17_mgt.terra) {
                                return '$ntrRSV KV [should be above 0.000132MR ]';
                              }
                              // -------------------------------------------
                              if (ntr.ratedSystemVoltage == 110 &&
                                  double.parse(_ybcontroller.text) < 220 &&
                                  selectedGMTyBvalue ==
                                      Enum_EM_ir_17_mgt.mega) {
                                return '$ntrRSV KV [should be above 220MR ]';
                              } else if (ntr.ratedSystemVoltage == 110 &&
                                  double.parse(_ybcontroller.text) < 0.220 &&
                                  selectedGMTyBvalue ==
                                      Enum_EM_ir_17_mgt.giga) {
                                return '$ntrRSV KV [should be above 0.220MR ]';
                              } else if (ntr.ratedSystemVoltage == 110 &&
                                  double.parse(_ybcontroller.text) < 0.000220 &&
                                  selectedGMTyBvalue ==
                                      Enum_EM_ir_17_mgt.terra) {
                                return '$ntrRSV KV [should be above 0.000220MR ]';
                              }
                              // -------------------------------------------
                              if (ntr.ratedSystemVoltage == 132 &&
                                  double.parse(_ybcontroller.text) < 264 &&
                                  selectedGMTyBvalue ==
                                      Enum_EM_ir_17_mgt.mega) {
                                return '$ntrRSV KV [should be above 264MR ]';
                              } else if (ntr.ratedSystemVoltage == 132 &&
                                  double.parse(_ybcontroller.text) < 0.264 &&
                                  selectedGMTyBvalue ==
                                      Enum_EM_ir_17_mgt.giga) {
                                return '$ntrRSV KV [should be above 0.264MR ]';
                              } else if (ntr.ratedSystemVoltage == 132 &&
                                  double.parse(_ybcontroller.text) < 0.000264 &&
                                  selectedGMTyBvalue ==
                                      Enum_EM_ir_17_mgt.terra) {
                                return '$ntrRSV KV [should be above 0.000264MR ]';
                              }
                              // -------------------------------------------
                              if (ntr.ratedSystemVoltage == 220 &&
                                  double.parse(_ybcontroller.text) < 440 &&
                                  selectedGMTyBvalue ==
                                      Enum_EM_ir_17_mgt.mega) {
                                return '$ntrRSV KV [should be above 440MR ]';
                              } else if (ntr.ratedSystemVoltage == 220 &&
                                  double.parse(_ybcontroller.text) < 0.440 &&
                                  selectedGMTyBvalue ==
                                      Enum_EM_ir_17_mgt.giga) {
                                return '$ntrRSV KV [should be above 0.440MR ]';
                              } else if (ntr.ratedSystemVoltage == 220 &&
                                  double.parse(_ybcontroller.text) < 0.000440 &&
                                  selectedGMTyBvalue ==
                                      Enum_EM_ir_17_mgt.terra) {
                                return '$ntrRSV KV [should be above 0.000440MR ]';
                              }
                              // -------------------------------------------
                              if (ntr.ratedSystemVoltage == 400 &&
                                  double.parse(_ybcontroller.text) < 800 &&
                                  selectedGMTyBvalue ==
                                      Enum_EM_ir_17_mgt.mega) {
                                return '$ntrRSV KV [should be above 800MR ]';
                              } else if (ntr.ratedSystemVoltage == 400 &&
                                  double.parse(_ybcontroller.text) < 0.800 &&
                                  selectedGMTyBvalue ==
                                      Enum_EM_ir_17_mgt.giga) {
                                return '$ntrRSV KV [should be above 0.800MR ]';
                              } else if (ntr.ratedSystemVoltage == 400 &&
                                  double.parse(_ybcontroller.text) < 0.000800 &&
                                  selectedGMTyBvalue ==
                                      Enum_EM_ir_17_mgt.terra) {
                                return '$ntrRSV KV [should be above 0.000800MR ]';
                              }
                            }
                          },
                        ),
                      ),
                      // >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
                      MGT_br(),
                      Padding(
                        padding: EdgeInsets.fromLTRB(10, 0, 10, 10),
                        child: CustomTextFormFieldForNumber(
                          controller: _brcontroller,
                          hintText: 'br',
                          validator: (val) {
                            if (!val.IsValueEmpty) {
                              return 'Field should not be empty';
                            }
                            if (ntr.etype == 'acb') {
                              if (double.parse(_brcontroller.text) < 1 &&
                                  selectedGMTbRvalue ==
                                      Enum_EM_ir_17_mgt.mega) {
                                return 'Acceptable Limits Above [1 MΩ]';
                              } else if (double.parse(_brcontroller.text) <
                                      0.001 &&
                                  selectedGMTbRvalue ==
                                      Enum_EM_ir_17_mgt.giga) {
                                return 'Acceptable Limits Above [0.001 MΩ]';
                              } else if (double.parse(_brcontroller.text) <
                                      0.000001 &&
                                  selectedGMTbRvalue ==
                                      Enum_EM_ir_17_mgt.terra) {
                                return 'Acceptable Limits Above [0.000001 MΩ]';
                              }
                            } else if (ntr.etype == 'vcb' ||
                                ntr.etype == 'ocb' ||
                                ntr.etype == 'sf6') {
                              if (ntr.ratedSystemVoltage == 11 &&
                                  double.parse(_brcontroller.text) < 22 &&
                                  selectedGMTbRvalue ==
                                      Enum_EM_ir_17_mgt.mega) {
                                return ' $ntrRSV KV [should be above 22MR ]';
                              } else if (ntr.ratedSystemVoltage == 11 &&
                                  double.parse(_brcontroller.text) < 0.022 &&
                                  selectedGMTbRvalue ==
                                      Enum_EM_ir_17_mgt.giga) {
                                return ' $ntrRSV KV [should be above 0.022MR ]';
                              } else if (ntr.ratedSystemVoltage == 11 &&
                                  double.parse(_brcontroller.text) < 0.000022 &&
                                  selectedGMTbRvalue ==
                                      Enum_EM_ir_17_mgt.terra) {
                                return ' $ntrRSV KV [should be above 0.000022MR ]';
                              }
                              // -------------------------------------------
                              if (ntr.ratedSystemVoltage == 33 &&
                                  double.parse(_brcontroller.text) < 66 &&
                                  selectedGMTbRvalue ==
                                      Enum_EM_ir_17_mgt.mega) {
                                return '$ntrRSV KV [should be above 66MR ]';
                              } else if (ntr.ratedSystemVoltage == 33 &&
                                  double.parse(_brcontroller.text) < 0.066 &&
                                  selectedGMTbRvalue ==
                                      Enum_EM_ir_17_mgt.giga) {
                                return '$ntrRSV KV [should be above 0.066MR ]';
                              } else if (ntr.ratedSystemVoltage == 33 &&
                                  double.parse(_brcontroller.text) < 0.000066 &&
                                  selectedGMTbRvalue ==
                                      Enum_EM_ir_17_mgt.terra) {
                                return '$ntrRSV KV [should be above 0.000066MR ]';
                              }
                              // -------------------------------------------
                              if (ntr.ratedSystemVoltage == 66 &&
                                  double.parse(_brcontroller.text) < 132 &&
                                  selectedGMTbRvalue ==
                                      Enum_EM_ir_17_mgt.mega) {
                                return '$ntrRSV KV [should be above 132MR ]';
                              } else if (ntr.ratedSystemVoltage == 66 &&
                                  double.parse(_brcontroller.text) < 0.132 &&
                                  selectedGMTbRvalue ==
                                      Enum_EM_ir_17_mgt.giga) {
                                return '$ntrRSV KV [should be above 0.132MR ]';
                              } else if (ntr.ratedSystemVoltage == 66 &&
                                  double.parse(_brcontroller.text) < 0.000132 &&
                                  selectedGMTbRvalue ==
                                      Enum_EM_ir_17_mgt.terra) {
                                return '$ntrRSV KV [should be above 0.000132MR ]';
                              }
                              // -------------------------------------------
                              if (ntr.ratedSystemVoltage == 110 &&
                                  double.parse(_brcontroller.text) < 220 &&
                                  selectedGMTbRvalue ==
                                      Enum_EM_ir_17_mgt.mega) {
                                return '$ntrRSV KV [should be above 220MR ]';
                              } else if (ntr.ratedSystemVoltage == 110 &&
                                  double.parse(_brcontroller.text) < 0.220 &&
                                  selectedGMTbRvalue ==
                                      Enum_EM_ir_17_mgt.giga) {
                                return '$ntrRSV KV [should be above 0.220MR ]';
                              } else if (ntr.ratedSystemVoltage == 110 &&
                                  double.parse(_brcontroller.text) < 0.000220 &&
                                  selectedGMTbRvalue ==
                                      Enum_EM_ir_17_mgt.terra) {
                                return '$ntrRSV KV [should be above 0.000220MR ]';
                              }
                              // -------------------------------------------
                              if (ntr.ratedSystemVoltage == 132 &&
                                  double.parse(_brcontroller.text) < 264 &&
                                  selectedGMTbRvalue ==
                                      Enum_EM_ir_17_mgt.mega) {
                                return '$ntrRSV KV [should be above 264MR ]';
                              } else if (ntr.ratedSystemVoltage == 132 &&
                                  double.parse(_brcontroller.text) < 0.264 &&
                                  selectedGMTbRvalue ==
                                      Enum_EM_ir_17_mgt.giga) {
                                return '$ntrRSV KV [should be above 0.264MR ]';
                              } else if (ntr.ratedSystemVoltage == 132 &&
                                  double.parse(_brcontroller.text) < 0.000264 &&
                                  selectedGMTbRvalue ==
                                      Enum_EM_ir_17_mgt.terra) {
                                return '$ntrRSV KV [should be above 0.000264MR ]';
                              }
                              // -------------------------------------------
                              if (ntr.ratedSystemVoltage == 220 &&
                                  double.parse(_brcontroller.text) < 440 &&
                                  selectedGMTbRvalue ==
                                      Enum_EM_ir_17_mgt.mega) {
                                return '$ntrRSV KV [should be above 440MR ]';
                              } else if (ntr.ratedSystemVoltage == 220 &&
                                  double.parse(_brcontroller.text) < 0.440 &&
                                  selectedGMTbRvalue ==
                                      Enum_EM_ir_17_mgt.giga) {
                                return '$ntrRSV KV [should be above 0.440MR ]';
                              } else if (ntr.ratedSystemVoltage == 220 &&
                                  double.parse(_brcontroller.text) < 0.000440 &&
                                  selectedGMTbRvalue ==
                                      Enum_EM_ir_17_mgt.terra) {
                                return '$ntrRSV KV [should be above 0.000440MR ]';
                              }
                              // -------------------------------------------
                              if (ntr.ratedSystemVoltage == 400 &&
                                  double.parse(_brcontroller.text) < 800 &&
                                  selectedGMTbRvalue ==
                                      Enum_EM_ir_17_mgt.mega) {
                                return '$ntrRSV KV [should be above 800MR ]';
                              } else if (ntr.ratedSystemVoltage == 400 &&
                                  double.parse(_brcontroller.text) < 0.800 &&
                                  selectedGMTbRvalue ==
                                      Enum_EM_ir_17_mgt.giga) {
                                return '$ntrRSV KV [should be above 0.800MR ]';
                              } else if (ntr.ratedSystemVoltage == 400 &&
                                  double.parse(_brcontroller.text) < 0.000800 &&
                                  selectedGMTbRvalue ==
                                      Enum_EM_ir_17_mgt.terra) {
                                return '$ntrRSV KV [should be above 0.000800MR ]';
                              }
                            }
                          },
                        ),
                      ),
                      // >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
                      ntr.noOfPoles == 3
                          ? Container()
                          : Padding(
                              padding: EdgeInsets.fromLTRB(10, 0, 10, 10),
                              child: Column(
                                children: [
                                  MGT_rn(),
                                  CustomTextFormFieldForNumber(
                                    controller: _rncontroller,
                                    hintText: 'rn',
                                    validator: (val) {
                                      if (!val.IsValueEmpty) {
                                        return 'Field should not be empty';
                                      }
                                      if (ntr.etype == 'acb') {
                                        if (double.parse(_rncontroller.text) <
                                                1 &&
                                            selectedGMTrNvalue ==
                                                Enum_EM_ir_17_mgt.mega) {
                                          return 'Acceptable Limits Above [1 MΩ]';
                                        } else if (double.parse(
                                                    _rncontroller.text) <
                                                0.001 &&
                                            selectedGMTrNvalue ==
                                                Enum_EM_ir_17_mgt.giga) {
                                          return 'Acceptable Limits Above [0.001 MΩ]';
                                        } else if (double.parse(
                                                    _rncontroller.text) <
                                                0.000001 &&
                                            selectedGMTrNvalue ==
                                                Enum_EM_ir_17_mgt.terra) {
                                          return 'Acceptable Limits Above [0.000001 MΩ]';
                                        }
                                      } else if (ntr.etype == 'vcb' ||
                                          ntr.etype == 'ocb' ||
                                          ntr.etype == 'sf6') {
                                        if (ntr.ratedSystemVoltage == 11 &&
                                            double.parse(_rncontroller.text) <
                                                22 &&
                                            selectedGMTrNvalue ==
                                                Enum_EM_ir_17_mgt.mega) {
                                          return ' $ntrRSV KV [should be above 22MR ]';
                                        } else if (ntr.ratedSystemVoltage ==
                                                11 &&
                                            double.parse(_rncontroller.text) <
                                                0.022 &&
                                            selectedGMTrNvalue ==
                                                Enum_EM_ir_17_mgt.giga) {
                                          return ' $ntrRSV KV [should be above 0.022MR ]';
                                        } else if (ntr.ratedSystemVoltage ==
                                                11 &&
                                            double.parse(_rncontroller.text) <
                                                0.000022 &&
                                            selectedGMTrNvalue ==
                                                Enum_EM_ir_17_mgt.terra) {
                                          return ' $ntrRSV KV [should be above 0.000022MR ]';
                                        }
                                        // -------------------------------------------
                                        if (ntr.ratedSystemVoltage == 33 &&
                                            double.parse(_rncontroller.text) <
                                                66 &&
                                            selectedGMTrNvalue ==
                                                Enum_EM_ir_17_mgt.mega) {
                                          return '$ntrRSV KV [should be above 66MR ]';
                                        } else if (ntr.ratedSystemVoltage ==
                                                33 &&
                                            double.parse(_rncontroller.text) <
                                                0.066 &&
                                            selectedGMTrNvalue ==
                                                Enum_EM_ir_17_mgt.giga) {
                                          return '$ntrRSV KV [should be above 0.066MR ]';
                                        } else if (ntr.ratedSystemVoltage ==
                                                33 &&
                                            double.parse(_rncontroller.text) <
                                                0.000066 &&
                                            selectedGMTrNvalue ==
                                                Enum_EM_ir_17_mgt.terra) {
                                          return '$ntrRSV KV [should be above 0.000066MR ]';
                                        }
                                        // -------------------------------------------
                                        if (ntr.ratedSystemVoltage == 66 &&
                                            double.parse(_rncontroller.text) <
                                                132 &&
                                            selectedGMTrNvalue ==
                                                Enum_EM_ir_17_mgt.mega) {
                                          return '$ntrRSV KV [should be above 132MR ]';
                                        } else if (ntr.ratedSystemVoltage ==
                                                66 &&
                                            double.parse(_rncontroller.text) <
                                                0.132 &&
                                            selectedGMTrNvalue ==
                                                Enum_EM_ir_17_mgt.giga) {
                                          return '$ntrRSV KV [should be above 0.132MR ]';
                                        } else if (ntr.ratedSystemVoltage ==
                                                66 &&
                                            double.parse(_rncontroller.text) <
                                                0.000132 &&
                                            selectedGMTrNvalue ==
                                                Enum_EM_ir_17_mgt.terra) {
                                          return '$ntrRSV KV [should be above 0.000132MR ]';
                                        }
                                        // -------------------------------------------
                                        if (ntr.ratedSystemVoltage == 110 &&
                                            double.parse(_rncontroller.text) <
                                                220 &&
                                            selectedGMTrNvalue ==
                                                Enum_EM_ir_17_mgt.mega) {
                                          return '$ntrRSV KV [should be above 220MR ]';
                                        } else if (ntr.ratedSystemVoltage ==
                                                110 &&
                                            double.parse(_rncontroller.text) <
                                                0.220 &&
                                            selectedGMTrNvalue ==
                                                Enum_EM_ir_17_mgt.giga) {
                                          return '$ntrRSV KV [should be above 0.220MR ]';
                                        } else if (ntr.ratedSystemVoltage ==
                                                110 &&
                                            double.parse(_rncontroller.text) <
                                                0.000220 &&
                                            selectedGMTrNvalue ==
                                                Enum_EM_ir_17_mgt.terra) {
                                          return '$ntrRSV KV [should be above 0.000220MR ]';
                                        }
                                        // -------------------------------------------
                                        if (ntr.ratedSystemVoltage == 132 &&
                                            double.parse(_rncontroller.text) <
                                                264 &&
                                            selectedGMTrNvalue ==
                                                Enum_EM_ir_17_mgt.mega) {
                                          return '$ntrRSV KV [should be above 264MR ]';
                                        } else if (ntr.ratedSystemVoltage ==
                                                132 &&
                                            double.parse(_rncontroller.text) <
                                                0.264 &&
                                            selectedGMTrNvalue ==
                                                Enum_EM_ir_17_mgt.giga) {
                                          return '$ntrRSV KV [should be above 0.264MR ]';
                                        } else if (ntr.ratedSystemVoltage ==
                                                132 &&
                                            double.parse(_rncontroller.text) <
                                                0.000264 &&
                                            selectedGMTrNvalue ==
                                                Enum_EM_ir_17_mgt.terra) {
                                          return '$ntrRSV KV [should be above 0.000264MR ]';
                                        }
                                        // -------------------------------------------
                                        if (ntr.ratedSystemVoltage == 220 &&
                                            double.parse(_rncontroller.text) <
                                                440 &&
                                            selectedGMTrNvalue ==
                                                Enum_EM_ir_17_mgt.mega) {
                                          return '$ntrRSV KV [should be above 440MR ]';
                                        } else if (ntr.ratedSystemVoltage ==
                                                220 &&
                                            double.parse(_rncontroller.text) <
                                                0.440 &&
                                            selectedGMTrNvalue ==
                                                Enum_EM_ir_17_mgt.giga) {
                                          return '$ntrRSV KV [should be above 0.440MR ]';
                                        } else if (ntr.ratedSystemVoltage ==
                                                220 &&
                                            double.parse(_rncontroller.text) <
                                                0.000440 &&
                                            selectedGMTrNvalue ==
                                                Enum_EM_ir_17_mgt.terra) {
                                          return '$ntrRSV KV [should be above 0.000440MR ]';
                                        }
                                        // -------------------------------------------
                                        if (ntr.ratedSystemVoltage == 400 &&
                                            double.parse(_rncontroller.text) <
                                                800 &&
                                            selectedGMTrNvalue ==
                                                Enum_EM_ir_17_mgt.mega) {
                                          return '$ntrRSV KV [should be above 800MR ]';
                                        } else if (ntr.ratedSystemVoltage ==
                                                400 &&
                                            double.parse(_rncontroller.text) <
                                                0.800 &&
                                            selectedGMTrNvalue ==
                                                Enum_EM_ir_17_mgt.giga) {
                                          return '$ntrRSV KV [should be above 0.800MR ]';
                                        } else if (ntr.ratedSystemVoltage ==
                                                400 &&
                                            double.parse(_rncontroller.text) <
                                                0.000800 &&
                                            selectedGMTrNvalue ==
                                                Enum_EM_ir_17_mgt.terra) {
                                          return '$ntrRSV KV [should be above 0.000800MR ]';
                                        }
                                      }
                                    },
                                  ),
                                ],
                              ),
                            ),

                      // >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
                      ntr.noOfPoles == 3
                          ? Container()
                          : Padding(
                              padding: EdgeInsets.fromLTRB(10, 0, 10, 10),
                              child: Column(
                                children: [
                                  MGT_yn(),
                                  CustomTextFormFieldForNumber(
                                    controller: _yncontroller,
                                    hintText: 'yn',
                                    validator: (val) {
                                      if (!val.IsValueEmpty) {
                                        return 'Field should not be empty';
                                      }
                                      if (ntr.etype == 'acb') {
                                        if (double.parse(_yncontroller.text) <
                                                1 &&
                                            selectedGMTyNvalue ==
                                                Enum_EM_ir_17_mgt.mega) {
                                          return 'Acceptable Limits Above [1 MΩ]';
                                        } else if (double.parse(
                                                    _yncontroller.text) <
                                                0.001 &&
                                            selectedGMTyNvalue ==
                                                Enum_EM_ir_17_mgt.giga) {
                                          return 'Acceptable Limits Above [0.001 MΩ]';
                                        } else if (double.parse(
                                                    _yncontroller.text) <
                                                0.000001 &&
                                            selectedGMTyNvalue ==
                                                Enum_EM_ir_17_mgt.terra) {
                                          return 'Acceptable Limits Above [0.000001 MΩ]';
                                        }
                                      } else if (ntr.etype == 'vcb' ||
                                          ntr.etype == 'ocb' ||
                                          ntr.etype == 'sf6') {
                                        if (ntr.ratedSystemVoltage == 11 &&
                                            double.parse(_yncontroller.text) <
                                                22 &&
                                            selectedGMTyNvalue ==
                                                Enum_EM_ir_17_mgt.mega) {
                                          return ' $ntrRSV KV [should be above 22MR ]';
                                        } else if (ntr.ratedSystemVoltage ==
                                                11 &&
                                            double.parse(_yncontroller.text) <
                                                0.022 &&
                                            selectedGMTyNvalue ==
                                                Enum_EM_ir_17_mgt.giga) {
                                          return ' $ntrRSV KV [should be above 0.022MR ]';
                                        } else if (ntr.ratedSystemVoltage ==
                                                11 &&
                                            double.parse(_yncontroller.text) <
                                                0.000022 &&
                                            selectedGMTyNvalue ==
                                                Enum_EM_ir_17_mgt.terra) {
                                          return ' $ntrRSV KV [should be above 0.000022MR ]';
                                        }
                                        // -------------------------------------------
                                        if (ntr.ratedSystemVoltage == 33 &&
                                            double.parse(_yncontroller.text) <
                                                66 &&
                                            selectedGMTyNvalue ==
                                                Enum_EM_ir_17_mgt.mega) {
                                          return '$ntrRSV KV [should be above 66MR ]';
                                        } else if (ntr.ratedSystemVoltage ==
                                                33 &&
                                            double.parse(_yncontroller.text) <
                                                0.066 &&
                                            selectedGMTyNvalue ==
                                                Enum_EM_ir_17_mgt.giga) {
                                          return '$ntrRSV KV [should be above 0.066MR ]';
                                        } else if (ntr.ratedSystemVoltage ==
                                                33 &&
                                            double.parse(_yncontroller.text) <
                                                0.000066 &&
                                            selectedGMTyNvalue ==
                                                Enum_EM_ir_17_mgt.terra) {
                                          return '$ntrRSV KV [should be above 0.000066MR ]';
                                        }
                                        // -------------------------------------------
                                        if (ntr.ratedSystemVoltage == 66 &&
                                            double.parse(_yncontroller.text) <
                                                132 &&
                                            selectedGMTyNvalue ==
                                                Enum_EM_ir_17_mgt.mega) {
                                          return '$ntrRSV KV [should be above 132MR ]';
                                        } else if (ntr.ratedSystemVoltage ==
                                                66 &&
                                            double.parse(_yncontroller.text) <
                                                0.132 &&
                                            selectedGMTyNvalue ==
                                                Enum_EM_ir_17_mgt.giga) {
                                          return '$ntrRSV KV [should be above 0.132MR ]';
                                        } else if (ntr.ratedSystemVoltage ==
                                                66 &&
                                            double.parse(_yncontroller.text) <
                                                0.000132 &&
                                            selectedGMTyNvalue ==
                                                Enum_EM_ir_17_mgt.terra) {
                                          return '$ntrRSV KV [should be above 0.000132MR ]';
                                        }
                                        // -------------------------------------------
                                        if (ntr.ratedSystemVoltage == 110 &&
                                            double.parse(_yncontroller.text) <
                                                220 &&
                                            selectedGMTyNvalue ==
                                                Enum_EM_ir_17_mgt.mega) {
                                          return '$ntrRSV KV [should be above 220MR ]';
                                        } else if (ntr.ratedSystemVoltage ==
                                                110 &&
                                            double.parse(_yncontroller.text) <
                                                0.220 &&
                                            selectedGMTyNvalue ==
                                                Enum_EM_ir_17_mgt.giga) {
                                          return '$ntrRSV KV [should be above 0.220MR ]';
                                        } else if (ntr.ratedSystemVoltage ==
                                                110 &&
                                            double.parse(_yncontroller.text) <
                                                0.000220 &&
                                            selectedGMTyNvalue ==
                                                Enum_EM_ir_17_mgt.terra) {
                                          return '$ntrRSV KV [should be above 0.000220MR ]';
                                        }
                                        // -------------------------------------------
                                        if (ntr.ratedSystemVoltage == 132 &&
                                            double.parse(_yncontroller.text) <
                                                264 &&
                                            selectedGMTyNvalue ==
                                                Enum_EM_ir_17_mgt.mega) {
                                          return '$ntrRSV KV [should be above 264MR ]';
                                        } else if (ntr.ratedSystemVoltage ==
                                                132 &&
                                            double.parse(_yncontroller.text) <
                                                0.264 &&
                                            selectedGMTyNvalue ==
                                                Enum_EM_ir_17_mgt.giga) {
                                          return '$ntrRSV KV [should be above 0.264MR ]';
                                        } else if (ntr.ratedSystemVoltage ==
                                                132 &&
                                            double.parse(_yncontroller.text) <
                                                0.000264 &&
                                            selectedGMTyNvalue ==
                                                Enum_EM_ir_17_mgt.terra) {
                                          return '$ntrRSV KV [should be above 0.000264MR ]';
                                        }
                                        // -------------------------------------------
                                        if (ntr.ratedSystemVoltage == 220 &&
                                            double.parse(_yncontroller.text) <
                                                440 &&
                                            selectedGMTyNvalue ==
                                                Enum_EM_ir_17_mgt.mega) {
                                          return '$ntrRSV KV [should be above 440MR ]';
                                        } else if (ntr.ratedSystemVoltage ==
                                                220 &&
                                            double.parse(_yncontroller.text) <
                                                0.440 &&
                                            selectedGMTyNvalue ==
                                                Enum_EM_ir_17_mgt.giga) {
                                          return '$ntrRSV KV [should be above 0.440MR ]';
                                        } else if (ntr.ratedSystemVoltage ==
                                                220 &&
                                            double.parse(_yncontroller.text) <
                                                0.000440 &&
                                            selectedGMTyNvalue ==
                                                Enum_EM_ir_17_mgt.terra) {
                                          return '$ntrRSV KV [should be above 0.000440MR ]';
                                        }
                                        // -------------------------------------------
                                        if (ntr.ratedSystemVoltage == 400 &&
                                            double.parse(_yncontroller.text) <
                                                800 &&
                                            selectedGMTyNvalue ==
                                                Enum_EM_ir_17_mgt.mega) {
                                          return '$ntrRSV KV [should be above 800MR ]';
                                        } else if (ntr.ratedSystemVoltage ==
                                                400 &&
                                            double.parse(_yncontroller.text) <
                                                0.800 &&
                                            selectedGMTyNvalue ==
                                                Enum_EM_ir_17_mgt.giga) {
                                          return '$ntrRSV KV [should be above 0.800MR ]';
                                        } else if (ntr.ratedSystemVoltage ==
                                                400 &&
                                            double.parse(_yncontroller.text) <
                                                0.000800 &&
                                            selectedGMTyNvalue ==
                                                Enum_EM_ir_17_mgt.terra) {
                                          return '$ntrRSV KV [should be above 0.000800MR ]';
                                        }
                                      }
                                    },
                                  ),
                                ],
                              ),
                            ),

                      // >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
                      ntr.noOfPoles == 3
                          ? Container()
                          : Padding(
                              padding: EdgeInsets.fromLTRB(10, 0, 10, 10),
                              child: Column(
                                children: [
                                  MGT_bn(),
                                  CustomTextFormFieldForNumber(
                                    controller: _bncontroller,
                                    hintText: 'bn',
                                    validator: (val) {
                                      if (!val.IsValueEmpty) {
                                        return 'Field should not be empty';
                                      }
                                      if (ntr.etype == 'acb') {
                                        if (double.parse(_bncontroller.text) <
                                                1 &&
                                            selectedGMTbNvalue ==
                                                Enum_EM_ir_17_mgt.mega) {
                                          return 'Acceptable Limits Above [1 MΩ]';
                                        } else if (double.parse(
                                                    _bncontroller.text) <
                                                0.001 &&
                                            selectedGMTbNvalue ==
                                                Enum_EM_ir_17_mgt.giga) {
                                          return 'Acceptable Limits Above [0.001 MΩ]';
                                        } else if (double.parse(
                                                    _bncontroller.text) <
                                                0.000001 &&
                                            selectedGMTbNvalue ==
                                                Enum_EM_ir_17_mgt.terra) {
                                          return 'Acceptable Limits Above [0.000001 MΩ]';
                                        }
                                      } else if (ntr.etype == 'vcb' ||
                                          ntr.etype == 'ocb' ||
                                          ntr.etype == 'sf6') {
                                        if (ntr.ratedSystemVoltage == 11 &&
                                            double.parse(_bncontroller.text) <
                                                22 &&
                                            selectedGMTbNvalue ==
                                                Enum_EM_ir_17_mgt.mega) {
                                          return ' $ntrRSV KV [should be above 22MR ]';
                                        } else if (ntr.ratedSystemVoltage ==
                                                11 &&
                                            double.parse(_bncontroller.text) <
                                                0.022 &&
                                            selectedGMTbNvalue ==
                                                Enum_EM_ir_17_mgt.giga) {
                                          return ' $ntrRSV KV [should be above 0.022MR ]';
                                        } else if (ntr.ratedSystemVoltage ==
                                                11 &&
                                            double.parse(_bncontroller.text) <
                                                0.000022 &&
                                            selectedGMTbNvalue ==
                                                Enum_EM_ir_17_mgt.terra) {
                                          return ' $ntrRSV KV [should be above 0.000022MR ]';
                                        }
                                        // -------------------------------------------
                                        if (ntr.ratedSystemVoltage == 33 &&
                                            double.parse(_bncontroller.text) <
                                                66 &&
                                            selectedGMTbNvalue ==
                                                Enum_EM_ir_17_mgt.mega) {
                                          return '$ntrRSV KV [should be above 66MR ]';
                                        } else if (ntr.ratedSystemVoltage ==
                                                33 &&
                                            double.parse(_bncontroller.text) <
                                                0.066 &&
                                            selectedGMTbNvalue ==
                                                Enum_EM_ir_17_mgt.giga) {
                                          return '$ntrRSV KV [should be above 0.066MR ]';
                                        } else if (ntr.ratedSystemVoltage ==
                                                33 &&
                                            double.parse(_bncontroller.text) <
                                                0.000066 &&
                                            selectedGMTbNvalue ==
                                                Enum_EM_ir_17_mgt.terra) {
                                          return '$ntrRSV KV [should be above 0.000066MR ]';
                                        }
                                        // -------------------------------------------
                                        if (ntr.ratedSystemVoltage == 66 &&
                                            double.parse(_bncontroller.text) <
                                                132 &&
                                            selectedGMTbNvalue ==
                                                Enum_EM_ir_17_mgt.mega) {
                                          return '$ntrRSV KV [should be above 132MR ]';
                                        } else if (ntr.ratedSystemVoltage ==
                                                66 &&
                                            double.parse(_bncontroller.text) <
                                                0.132 &&
                                            selectedGMTbNvalue ==
                                                Enum_EM_ir_17_mgt.giga) {
                                          return '$ntrRSV KV [should be above 0.132MR ]';
                                        } else if (ntr.ratedSystemVoltage ==
                                                66 &&
                                            double.parse(_bncontroller.text) <
                                                0.000132 &&
                                            selectedGMTbNvalue ==
                                                Enum_EM_ir_17_mgt.terra) {
                                          return '$ntrRSV KV [should be above 0.000132MR ]';
                                        }
                                        // -------------------------------------------
                                        if (ntr.ratedSystemVoltage == 110 &&
                                            double.parse(_bncontroller.text) <
                                                220 &&
                                            selectedGMTbNvalue ==
                                                Enum_EM_ir_17_mgt.mega) {
                                          return '$ntrRSV KV [should be above 220MR ]';
                                        } else if (ntr.ratedSystemVoltage ==
                                                110 &&
                                            double.parse(_bncontroller.text) <
                                                0.220 &&
                                            selectedGMTbNvalue ==
                                                Enum_EM_ir_17_mgt.giga) {
                                          return '$ntrRSV KV [should be above 0.220MR ]';
                                        } else if (ntr.ratedSystemVoltage ==
                                                110 &&
                                            double.parse(_bncontroller.text) <
                                                0.000220 &&
                                            selectedGMTbNvalue ==
                                                Enum_EM_ir_17_mgt.terra) {
                                          return '$ntrRSV KV [should be above 0.000220MR ]';
                                        }
                                        // -------------------------------------------
                                        if (ntr.ratedSystemVoltage == 132 &&
                                            double.parse(_bncontroller.text) <
                                                264 &&
                                            selectedGMTbNvalue ==
                                                Enum_EM_ir_17_mgt.mega) {
                                          return '$ntrRSV KV [should be above 264MR ]';
                                        } else if (ntr.ratedSystemVoltage ==
                                                132 &&
                                            double.parse(_bncontroller.text) <
                                                0.264 &&
                                            selectedGMTbNvalue ==
                                                Enum_EM_ir_17_mgt.giga) {
                                          return '$ntrRSV KV [should be above 0.264MR ]';
                                        } else if (ntr.ratedSystemVoltage ==
                                                132 &&
                                            double.parse(_bncontroller.text) <
                                                0.000264 &&
                                            selectedGMTbNvalue ==
                                                Enum_EM_ir_17_mgt.terra) {
                                          return '$ntrRSV KV [should be above 0.000264MR ]';
                                        }
                                        // -------------------------------------------
                                        if (ntr.ratedSystemVoltage == 220 &&
                                            double.parse(_bncontroller.text) <
                                                440 &&
                                            selectedGMTbNvalue ==
                                                Enum_EM_ir_17_mgt.mega) {
                                          return '$ntrRSV KV [should be above 440MR ]';
                                        } else if (ntr.ratedSystemVoltage ==
                                                220 &&
                                            double.parse(_bncontroller.text) <
                                                0.440 &&
                                            selectedGMTbNvalue ==
                                                Enum_EM_ir_17_mgt.giga) {
                                          return '$ntrRSV KV [should be above 0.440MR ]';
                                        } else if (ntr.ratedSystemVoltage ==
                                                220 &&
                                            double.parse(_bncontroller.text) <
                                                0.000440 &&
                                            selectedGMTbNvalue ==
                                                Enum_EM_ir_17_mgt.terra) {
                                          return '$ntrRSV KV [should be above 0.000440MR ]';
                                        }
                                        // -------------------------------------------
                                        if (ntr.ratedSystemVoltage == 400 &&
                                            double.parse(_bncontroller.text) <
                                                800 &&
                                            selectedGMTbNvalue ==
                                                Enum_EM_ir_17_mgt.mega) {
                                          return '$ntrRSV KV [should be above 800MR ]';
                                        } else if (ntr.ratedSystemVoltage ==
                                                400 &&
                                            double.parse(_bncontroller.text) <
                                                0.800 &&
                                            selectedGMTbNvalue ==
                                                Enum_EM_ir_17_mgt.giga) {
                                          return '$ntrRSV KV [should be above 0.800MR ]';
                                        } else if (ntr.ratedSystemVoltage ==
                                                400 &&
                                            double.parse(_bncontroller.text) <
                                                0.000800 &&
                                            selectedGMTbNvalue ==
                                                Enum_EM_ir_17_mgt.terra) {
                                          return '$ntrRSV KV [should be above 0.000800MR ]';
                                        }
                                      }
                                    },
                                  ),
                                ],
                              ),
                            ),

                      // >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> CB CR CY starts from here >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
                      MGT_cb(),
                      MGT_cr(),
                      MGT_cy(),
                    ],
                  ),
                ),
              ],
            ),
          );
        }
      }),
    );
  }
}
