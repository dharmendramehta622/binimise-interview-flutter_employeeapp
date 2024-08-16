part of global;


class AttendanceModel {
    final String? id;
    final String? user;
    final String? imageUrl;
    final DateTime? date;
    final int? v;

    AttendanceModel({
        this.id,
        this.user,
        this.imageUrl,
        this.date,
        this.v,
    });

    AttendanceModel copyWith({
        String? id,
        String? user,
        String? imageUrl,
        DateTime? date,
        int? v,
    }) => 
        AttendanceModel(
            id: id ?? this.id,
            user: user ?? this.user,
            imageUrl: imageUrl ?? this.imageUrl,
            date: date ?? this.date,
            v: v ?? this.v,
        );

    factory AttendanceModel.fromMap(Map<String, dynamic> json) => AttendanceModel(
        id: json["_id"],
        user: json["user"],
        imageUrl: json["imageUrl"],
        date: json["date"] == null ? null : DateTime.parse(json["date"]),
        v: json["__v"],
    );

    Map<String, dynamic> toMap() => {
        "_id": id,
        "user": user,
        "imageUrl": imageUrl,
        "date": date?.toIso8601String(),
        "__v": v,
    };
}
