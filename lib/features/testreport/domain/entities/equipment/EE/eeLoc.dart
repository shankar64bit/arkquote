import 'dart:ffi';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

class eeLoc extends Equatable {
  final String location;
  final int id;
  final int databaseID;
  final int eeRef;
  final DateTime updateDate;

  const eeLoc({
    @required this.location,
    @required this.eeRef,
    @required this.id,
    @required this.databaseID,
    @required this.updateDate,
  });

  @override
  List<Object> get props => [
        location,
        id,
        databaseID,
        eeRef,
        updateDate,
      ];
}
