import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:speech_stroop/utils/logger.dart';

class Badge {
  String id;
  String name;
  String type;
  String condition;
  String imgPath;

  Badge(this.name, this.type, this.condition, this.imgPath, [this.id]);

  factory Badge.fromJson(dynamic json) {
    return Badge(
      json['name'] as String,
      json['type'] as String,
      json['condition'] as String,
      json['imgPath'] as String,
      json['_id'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "name": name,
      "type": type,
      "condition": condition,
      "imgPath": imgPath,
      "_id": id,
    };
  }
}

Map<String, Badge> badgesMap = {};

getBadge() async {
  if (badgesMap.isEmpty) {
    var res = await http.get(
      Uri.parse("http://localhost:3000/badge/all"),
    );
    print("/badge/all ${res.statusCode}");

    if (res.statusCode == 200) {
      Iterable l = json.decode(res.body);
      List<Badge> badges =
          List<Badge>.from(l.map((data) => Badge.fromJson(data)));
      for (var b in badges) {
        badgesMap[b.id] = b;
      }
    } else {
      logger.e("getBadges failed");
      //TODO: handle
    }
  }
}
