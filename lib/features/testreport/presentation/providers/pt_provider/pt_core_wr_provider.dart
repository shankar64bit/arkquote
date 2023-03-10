// ignore_for_file: missing_return

import 'package:flutter/foundation.dart';
import 'package:flutter_testreports/injection_container.dart';
import '../../../data/datasources/equipment/Potential_Tranformer/pt_core_wr_local_datasource.dart';
import '../../../data/models/equipment/PT/pt_core_wr_model.dart';

class PTcoreWRProvider extends ChangeNotifier {
  List<PTcoreWRModel> _ptcoreWR_serialNoList = [];
  List<PTcoreWRModel> get ptcoreWR_serialNoList => _ptcoreWR_serialNoList;

  List<PTcoreWRModel> _ptcoreWR_localdataList = [];
  List<PTcoreWRModel> get ptcoreWR_localdataList => _ptcoreWR_localdataList;

  PTcoreWRModel _ptcoreWR_Model;
  PTcoreWRModel get ptcoreWR_Model => _ptcoreWR_Model;

  String _error = 'ErroR';
  String get error => _error;

  void getPTcoreWR_ById(int id) async {
    _ptcoreWR_Model = await sl<PTcoreWRLocalDatasourceImpl>()
        .getPTcoreWR_ById(id)
        .onError((error, stackTrace) {
      error = error.toString();
    });
    notifyListeners();
  }

  void getPTcoreWR_BySerialNo(String serialNo) async {
    _ptcoreWR_serialNoList = await sl<PTcoreWRLocalDatasourceImpl>()
        .getPTcoreWR_SerialNo(serialNo)
        .onError((error, stackTrace) {
      error = error.toString();
    });
    notifyListeners();
  }

  void addPTcoreWR(PTcoreWRModel ptwrtolocal) async {
    await sl<PTcoreWRLocalDatasourceImpl>()
        .localPTcoreWR(ptwrtolocal)
        .onError((error, stackTrace) {
      error = error.toString();
    });
    notifyListeners();
  }

  void deletePTcoreWR(int id) async {
    await sl<PTcoreWRLocalDatasourceImpl>()
        .deletePTcoreWRById(id)
        .onError((error, stackTrace) {
      error = error.toString();
    });
    notifyListeners();
  }

  void updatePTcoreWR(PTcoreWRModel ptwrtoupdate, int id) async {
    await sl<PTcoreWRLocalDatasourceImpl>()
        .updatePTcoreWR(ptwrtoupdate, id)
        .onError((error, stackTrace) {
      error = error.toString();
    });
    notifyListeners();
  }

  void getPTWREquipmentList() async {
    _ptcoreWR_localdataList = await sl<PTcoreWRLocalDatasourceImpl>()
        .getPTwrEquipmentLists()
        .onError((error, stackTrace) {
      error = error.toString();
    });
    notifyListeners();
  }
}
