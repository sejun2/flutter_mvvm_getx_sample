class Result {
  final int? postId;
  final int? id;
  final String? name;
  final String? email;
  final String? body;

  Result({this.postId, this.id, this.name, this.email, this.body});

  @override
  @override
  String toString() {
    return '###$postId, $id, $name, $email, $body###\n';
  }

  factory Result.fromJson(Map<String, dynamic> json) {
    return Result(
      id: json['id'] as int,
      postId: json['postId'] as int,
      name: json['name'] as String,
      email: json['email'] as String,
      body: json['body'] as String,
    );
  }
}
