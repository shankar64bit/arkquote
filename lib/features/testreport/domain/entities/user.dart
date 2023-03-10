import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

class User extends Equatable {
  final int id, contact, empNo, empMangerEmpNo, empPfNo, empEsic, empGIP;
  final int databaseID;
  final String name, designation, empGender, empEmail, empMangerName;
  final DateTime empDOJ;
  final DateTime empDOB;
  final DateTime lastUpdated;

  const User({
    @required this.id,
    @required this.name,
    @required this.designation,
    @required this.contact,
    @required this.empNo,
    @required this.empDOJ,
    @required this.empDOB,
    @required this.empMangerEmpNo,
    @required this.empPfNo,
    @required this.empEsic,
    @required this.empGIP,
    @required this.empGender,
    @required this.empEmail,
    @required this.empMangerName,
    @required this.databaseID,
    @required this.lastUpdated,
  });

  @override
  List<Object> get props => [
        id,
        name,
        designation,
        contact,
        empNo,
        empDOJ,
        empDOB,
        empMangerEmpNo,
        empPfNo,
        empEsic,
        empGIP,
        empGender,
        empEmail,
        empMangerName,
        databaseID,
        lastUpdated,
      ];
}
