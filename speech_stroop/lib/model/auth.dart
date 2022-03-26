class Auth {
  String _id;
  String token;

  Auth(this._id, this.token);
  factory Auth.fromJson(dynamic json) {
    return Auth(json['_id'] as String, json['token'] as String);
  }

  Map<String, dynamic> toJson() {
    return {
      "_id": _id,
      "token": token,
    };
  }
}
