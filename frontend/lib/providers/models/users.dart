// import 'package:mongo_dart/mongo_dart.dart';
// // import 'package:speech_stroop/main.dart';
import 'package:speech_stroop/providers/models/connectdb.dart';

import 'package:mongo_dart/mongo_dart.dart';

class User {
  // final ObjectId id;
  // final String email;
  // final String password;
  // final String name;
  // final String? tel;
  // final String lastFourId;
  // final List<ObjectId> historyId;
  // final List<ObjectId> badge;
  // final ObjectId preconditionId;
  // final Map<String, int> healthScoresRegister;

  // const User(this.id, [this.tel]);

  static insertUser() async {
    //  = await MongoDatabase.connect();
    return await db.collection('User').insert({'name': 'Kaew'});
  }

  static getUser() async {
    // Db db = await MongoDatabase.connect();
    return await db.collection('User').find({'name': 'Kaew'}).toList();
    // return await db.collection('User').find({'name': 'Proy'}).toList();
  }
}

// // void main() async {
// //   await User.insertUser();
// //   print(await User.getUser());
// // }
