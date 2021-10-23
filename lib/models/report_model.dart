class ReportModel {
  String customerGroupName;
  String customerGroupId;
  String rainmakerName;
  String rainmakerId;
  var status;
  bool isFavorite;

  ReportModel({
    required this.customerGroupName,
    required this.customerGroupId,
    required this.rainmakerName,
    required this.rainmakerId,
    required this.status,
    required this.isFavorite,
  });
}
