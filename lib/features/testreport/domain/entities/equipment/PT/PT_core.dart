// ignore_for_file: non_constant_identifier_names
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

class PT_core extends Equatable {
  final int id;
  final int databaseID;
  final int coreNo;
  final String coreName;
  final int ratio;
  final String coreClass;
  final int burden;
  final int ptNo;
  final DateTime updateDate;

  const PT_core({
    @required this.id,
    @required this.databaseID,
    @required this.coreNo,
    @required this.coreName,
    @required this.ratio,
    @required this.coreClass,
    @required this.burden,
    @required this.ptNo,
    @required this.updateDate,
  });

  @override
  List<Object> get props => [
        id,
        databaseID,
        coreNo,
        coreName,
        ratio,
        coreClass,
        burden,
        ptNo,
        updateDate,
      ];
}
