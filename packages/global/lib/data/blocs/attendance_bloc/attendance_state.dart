part of global;

abstract class AttendanceState extends Equatable {
  const AttendanceState();

  @override
  List<Object> get props => [];
}

class AttendanceInitial extends AttendanceState {}

class AttendanceLoading extends AttendanceState {}

class AttendanceLoadedState extends AttendanceState {
  final List<AttendanceModel> patients;
  const AttendanceLoadedState(
    this.patients,
  );
  @override
  List<Object> get props => [patients];
}

class AttendanceFailed extends AttendanceState {
  final String message;
  const AttendanceFailed(
    this.message,
  );
  @override
  List<Object> get props => [message];
}

class AddAttendanceuccess extends AttendanceState {
  final String message;
  const AddAttendanceuccess(
    this.message,
  );
  @override
  List<Object> get props => [message];
}


