import '../../domain/entities/user.dart';

class UserModel extends User {
  UserModel({
    final int id,
    contact,
    empNo,
    empMangerEmpNo,
    empPfNo,
    empEsic,
    empGIP,
    final String name,
    final DateTime empDOJ,
    final DateTime empDOB,
    designation,
    empGender,
    empEmail,
    empMangerName,
    final int databaseID,
    final DateTime lastUpdated,
  }) : super(
          id: id,
          name: name,
          designation: designation,
          contact: contact,
          empGender: empGender,
          empEmail: empEmail,
          empMangerName: empMangerName,
          empNo: empNo,
          empDOJ: empDOJ,
          empDOB: empDOB,
          empMangerEmpNo: empMangerEmpNo,
          empPfNo: empPfNo,
          empEsic: empEsic,
          empGIP: empGIP,
          databaseID: databaseID,
          lastUpdated: lastUpdated,
        );

  @override
  List<Object> get props => [
        id,
        name,
        designation,
        contact,
        empGender,
        empEmail,
        empMangerName,
        empNo,
        empDOJ,
        empDOB,
        empMangerEmpNo,
        empPfNo,
        empEsic,
        empGIP,
        databaseID,
        lastUpdated,
      ];

  @override
  bool get stringify => true;

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'employeeName': name,
      'designation': designation,
      'mobileNo': contact,
      'gender': empGender,
      'email': empEmail,
      'managerName': empMangerName,
      'employeeNo': empNo,
      'dataOfJoining': empDOJ,
      'dateOfBirth': empDOB,
      'managerEmpNO': empMangerEmpNo,
      'PF_UAN_Number': empPfNo,
      'ESIC_Number': empEsic,
      'Group_Insurance_Policy_Number': empGIP,
      'databaseID': databaseID,
      'updateDate': lastUpdated,
    };
  }

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id'],
      name: json['employeeName'],
      designation: json['designation'],
      contact: json['mobileNo'],
      empGender: json['gender'],
      empEmail: json['email'],
      empMangerName: json['managerName'],
      empNo: json['employeeNo'],
      empDOJ: json['dataOfJoining'],
      empDOB: json['dateOfBirth'],
      empMangerEmpNo: json['managerEmpNO'],
      empPfNo: json['PF_UAN_Number'],
      empEsic: json['ESIC_Number'],
      empGIP: json['Group_Insurance_Policy_Number'],
      databaseID: json['databaseID'],
      lastUpdated: json['updateDate'],
    );
  }
}
