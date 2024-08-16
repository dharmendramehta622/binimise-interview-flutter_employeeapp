// ignore_for_file: public_member_api_docs, sort_constructors_first
part of global;

abstract class AttendanceEvent extends Equatable {
  const AttendanceEvent();

  @override
  List<Object> get props => [];
}

class LoadAttendance extends AttendanceEvent {
  final UsersModel model;
  const LoadAttendance(
     this.model,
  );
  @override
  List<Object> get props => [model];
}
class AttendanceRefreshed extends AttendanceEvent {
 
}

class RefreshAttendance extends AttendanceEvent {
 final List<AttendanceModel> Attendance;
  const RefreshAttendance(
     this.Attendance,
  );
  @override
  List<Object> get props => [Attendance];
}

class AddAttendance extends AttendanceEvent {
 final UsersModel model;
 final File image;
  const AddAttendance(
     this.model,
     this.image,
  );
  @override
  List<Object> get props => [model,image];
}

