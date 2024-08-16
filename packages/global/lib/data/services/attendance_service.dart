part of global;



class Attendance {
  deleteUrl(String id) => '/users/$id';
  getAttendanceUrl(String id) => '/attendance/$id/';

  
  Future<Iterable<AttendanceModel>> getAttendance(UsersModel model) async {
    final res = await ApiModel.instance.get(
      url: getAttendanceUrl(model.id ?? ''),
    );
    if (res.status) {
      return (res.msg!.data as List).map((e) => AttendanceModel.fromMap(e)).toList();
    } else {
      return [];
    }
  }


  Future<ApiResponse> takeAttendance(UsersModel model,File image) async {
     var formData = FormData();
    final file = await MultipartFile.fromFile(image.path);
     formData.files.add(MapEntry('image', file));
    formData.fields.add(MapEntry('userId', model.id ?? ""));
  

    
    final res = await ApiModel.instance.post(url: '/attendance/', formData:formData  ,variables: {});

    return res;
  }

 
}
