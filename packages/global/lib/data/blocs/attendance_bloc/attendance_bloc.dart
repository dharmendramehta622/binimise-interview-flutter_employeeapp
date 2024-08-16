part of global;

class AttendanceBloc extends Bloc<AttendanceEvent, AttendanceState> {
  

  Attendance services = Attendance();
  AttendanceBloc() : super(AttendanceInitial()) {
    on<LoadAttendance>((event, emit) async {
      try {
        emit(AttendanceLoading());
        final Attendance = await services.getAttendance(event.model);
        add(RefreshAttendance(Attendance.toList()));
      } catch (e) {
        emit(const AttendanceFailed('Failed to load Attendance.'));
      }
    });
  
    on<AddAttendance>((event, emit) async {
      try {
        emit(AttendanceLoading());
        final res = await services.takeAttendance(event.model,event.image);
        if (res.status) {
          clear();
          emit(const AddAttendanceuccess("User added successfully"));
        } else {
          emit(const AttendanceFailed('Failed to load Attendance.'));
        }
      } catch (e) {
        emit(const AttendanceFailed("failed"));
      }
    });
 
    
    on<RefreshAttendance>((event, emit) async {
      emit(AttendanceLoadedState(event.Attendance));
    });
  }
  void clear() {
    
  }
}
