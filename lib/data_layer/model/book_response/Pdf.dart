/// isAvailable : false

class Pdf {
  Pdf({
      this.isAvailable,});

  Pdf.fromJson(dynamic json) {
    isAvailable = json['isAvailable'];
  }
  bool? isAvailable;
Pdf copyWith({  bool? isAvailable,
}) => Pdf(  isAvailable: isAvailable ?? this.isAvailable,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['isAvailable'] = isAvailable;
    return map;
  }

}