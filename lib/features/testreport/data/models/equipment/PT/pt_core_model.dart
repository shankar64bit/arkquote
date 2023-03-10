import '../../../../domain/entities/equipment/PT/PT_core.dart';

class PT_core_Model extends PT_core {
  const PT_core_Model({
    final int id,
    final int databaseID,
    final int coreNo,
    final String coreName,
    final int ratio,
    final String coreClass,
    final int burden,
    final int ptNo,
    final DateTime updateDate,
  }) : super(
          databaseID: databaseID,
          id: id,
          burden: burden,
          coreName: coreName,
          ratio: ratio,
          coreClass: coreClass,
          coreNo: coreNo,
          ptNo: ptNo,
          updateDate: updateDate,
        );

  @override
  List<Object> get props => [
        databaseID,
        id,
        coreNo,
        coreName,
        ratio,
        coreClass,
        burden,
        ptNo,
        updateDate,
      ];

  @override
  bool get stringify => true;

  Map<String, dynamic> toJson() {
    return {
      'coreNo': coreNo,
      'coreClass': coreClass,
      'coreName': coreName,
      'ratio': ratio,
      'burden': burden,
      'ptNo': ptNo,
      'updateDate': updateDate,
      'id': id,
      'databaseID': databaseID,
    };
  }

  factory PT_core_Model.fromJson(Map<String, dynamic> json) {
    return PT_core_Model(
        id: json['id'],
        databaseID: json['databaseID'],
        burden: json['burden'],
        coreClass: json['coreClass'],
        coreName: json['coreName'],
        ratio: json['ratio'],
        coreNo: json['coreNo'],
        ptNo: json['ptNo'],
        updateDate: json['updateDate']);
  }
}
