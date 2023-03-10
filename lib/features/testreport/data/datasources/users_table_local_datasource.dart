import 'package:drift/drift.dart';
import '../../../../injection_container.dart';
import '../models/user_table_model.dart';
import 'test_report_local_datasource.dart';

abstract class UserLocalDatasource {
  // Future<int> deleteUserById(int id);
  Future<UserModel> getUserByDatabaseID(int databaseID);
  Future<UserModel> getUserById(int empNo);
  Future<List<UserModel>> getUserLocalDataList();
  Future<void> localUser(UserModel userToLocal);
}

@DataClassName('UserLocalData')
class UserLocalDatasourceImpl extends Table implements UserLocalDatasource {
  @required
  DateTimeColumn get lastUpdated =>
      dateTime().withDefault(Constant(DateTime.now()))();

  @required
  IntColumn get databaseID => integer()();
  @required
  IntColumn get id => integer().autoIncrement()();
  @required
  TextColumn get name => text().withLength(min: 1, max: 50)();
  @required
  TextColumn get designation => text().withLength(min: 1, max: 50)();
  @required
  IntColumn get contact => integer()();
  @required
  TextColumn get empGender => text().withLength(min: 1, max: 50)();
  @required
  TextColumn get empEmail => text().withLength(min: 1, max: 50)();
  @required
  TextColumn get empMangerName => text().withLength(min: 1, max: 50)();
  @required
  IntColumn get empNo => integer()();

  @required
  IntColumn get empMangerEmpNo => integer()();
  @required
  IntColumn get empPfNo => integer()();
  @required
  IntColumn get empEsic => integer()();
  @required
  IntColumn get empGIP => integer()();

  @required
  DateTimeColumn get empDOJ =>
      dateTime().withDefault(Constant(DateTime.now()))();
  @required
  DateTimeColumn get empDOB =>
      dateTime().withDefault(Constant(DateTime.now()))();

//////////////////////////////////// ( Call By Functions )////////////////////////
  @override
  Future<UserModel> getUserByDatabaseID(int databaseID) async {
    UserLocalData tUserData =
        await sl<AppDatabase>().getUserLocalDataWithDBID(databaseID);

    UserModel tUserModel = UserModel(
      id: tUserData.id,
      databaseID: tUserData.databaseID,
      contact: tUserData.contact,
      designation: tUserData.designation,
      empDOB: tUserData.empDOB,
      empDOJ: tUserData.empDOJ,
      empEmail: tUserData.empEmail,
      empEsic: tUserData.empEsic,
      empGIP: tUserData.empGIP,
      empGender: tUserData.empGender,
      empMangerEmpNo: tUserData.empMangerEmpNo,
      empMangerName: tUserData.empMangerName,
      empNo: tUserData.empNo,
      empPfNo: tUserData.empPfNo,
      name: tUserData.name,
      lastUpdated: tUserData.lastUpdated,
    );
    return tUserModel;
  }

  @override
  Future<UserModel> getUserById(int empNo) async {
    UserLocalData tUserData =
        await sl<AppDatabase>().getUserLocalDataWithId(empNo);

    UserModel tUserModel = UserModel(
      id: tUserData.id,
      databaseID: tUserData.databaseID,
      contact: tUserData.contact,
      designation: tUserData.designation,
      empDOB: tUserData.empDOB,
      empDOJ: tUserData.empDOJ,
      empEmail: tUserData.empEmail,
      empEsic: tUserData.empEsic,
      empGIP: tUserData.empGIP,
      empGender: tUserData.empGender,
      empMangerEmpNo: tUserData.empMangerEmpNo,
      empMangerName: tUserData.empMangerName,
      empNo: tUserData.empNo,
      empPfNo: tUserData.empPfNo,
      name: tUserData.name,
      lastUpdated: tUserData.lastUpdated,
    );
    return tUserModel;
  }

  @override
  Future<List<UserModel>> getUserLocalDataList() async {
    final tUserDataList = await sl<AppDatabase>().getUserLocalDataList();
    List<UserModel> tUserListModel = List<UserModel>.empty(growable: true);

    for (var listElement in tUserDataList) {
      tUserListModel.add(UserModel(
        id: listElement.id,
        databaseID: listElement.databaseID,
        name: listElement.name,
        designation: listElement.designation,
        contact: listElement.contact,
        empGender: listElement.empGender,
        empEmail: listElement.empEmail,
        empMangerName: listElement.empMangerName,
        empNo: listElement.empNo,
        empDOJ: listElement.empDOJ,
        empDOB: listElement.empDOB,
        empMangerEmpNo: listElement.empMangerEmpNo,
        empEsic: listElement.empEsic,
        empPfNo: listElement.empPfNo,
        empGIP: listElement.empGIP,
        lastUpdated: listElement.lastUpdated,
      ));
    }
    return tUserListModel;
  }

  @override
  Future<int> localUser(UserModel userToLocal) {
    return (sl<AppDatabase>().createUser(userToLocal));
  }

  // @override
  // Future<int> deleteUserById(int id) {
  //   return (sl<AppDatabase>().deleteUserById(id));
  // }
}
////////////////////////////////////// ( Call By Functions )//////////////////////////////////////////
