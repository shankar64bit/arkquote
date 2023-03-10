import '../../../../domain/entities/equipment/CT/CT_core.dart';

class CT_core_Model extends CT_core {
  const CT_core_Model({
    final int id,
    final int databaseID,
    final int coreNo,
    final String coreClass,
    final int burden,
    final int ctNo,
    final DateTime updateDate,
  }) : super(
          databaseID: databaseID,
          id: id,
          burden: burden,
          coreClass: coreClass,
          coreNo: coreNo,
          ctNo: ctNo,
          updateDate: updateDate,
        );

  @override
  List<Object> get props => [
        databaseID,
        id,
        coreNo,
        coreClass,
        burden,
        ctNo,
        updateDate,
      ];

  @override
  bool get stringify => true;

  Map<String, dynamic> toJson() {
    return {
      'coreNo': coreNo,
      'coreClass': coreClass,
      'burden': burden,
      'ctNo': ctNo,
      'updateDate': updateDate,
      'id': id,
      'databaseID': databaseID,
    };
  }

  factory CT_core_Model.fromJson(Map<String, dynamic> json) {
    return CT_core_Model(
        id: json['id'],
        databaseID: json['databaseID'],
        burden: json['burden'],
        coreClass: json['coreClass'],
        coreNo: json['coreNo'],
        ctNo: json['ctNo'],
        updateDate: json['updateDate']);
  }
}
