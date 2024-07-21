class Report {
  final String url;
  final int id;
  final String created_at;

  Report({required this.url, required this.id, required this.created_at});
  factory Report.fromJson(Map<String, dynamic> json) {
    return Report(
      url: json['url'] as String,
      id: json['id'] as int,
      created_at: json['created_at'] as String,
    );
  }
}
