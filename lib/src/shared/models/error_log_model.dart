class ErrorLogModel {
  String? createdAt;
  List<ErrorData>? errorData;

  ErrorLogModel({this.createdAt, this.errorData});

  ErrorLogModel.fromJson(final Map<String, dynamic> json) {
    createdAt = json['created_at'];
    if (json['error_data'] != null) {
      errorData = <ErrorData>[];
      json['error_data'].forEach((final v) {
        errorData!.add(ErrorData.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['created_at'] = createdAt;
    if (errorData != null) {
      data['error_data'] = errorData!.map((final v) => v.toJson()).toList();
    }
    return data;
  }
}

class ErrorData {
  String? errorDescription;
  String? errorTimestamp;

  ErrorData({this.errorDescription, this.errorTimestamp});

  ErrorData.fromJson(final Map<String, dynamic> json) {
    errorDescription = json['error_description'];
    errorTimestamp = json['error_timestamp'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['error_description'] = errorDescription;
    data['error_timestamp'] = errorTimestamp;
    return data;
  }
}
