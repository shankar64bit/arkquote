// ignore_for_file: non_constant_identifier_names
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

class CT_core extends Equatable {
  final int id;
  final int databaseID;
  final int coreNo;
  final String coreClass;
  final int burden;
  final int ctNo;
  final DateTime updateDate;

  const CT_core({
    @required this.id,
    @required this.databaseID,
    @required this.coreNo,
    @required this.coreClass,
    @required this.burden,
    @required this.ctNo,
    @required this.updateDate,
  });

  @override
  List<Object> get props => [
        id,
        databaseID,
        coreNo,
        coreClass,
        burden,
        ctNo,
        updateDate,
      ];
}
