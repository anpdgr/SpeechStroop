import 'package:mongo_dart/mongo_dart.dart';

// String MONGO_CONN_URL =
//     "mongodb+srv://dbUser:dbUserPassword@stroop.4ahnr.mongodb.net/SpeechStroop";
var db, userCollection;

class MongoDatabase {
  static Future<List<Map<dynamic, dynamic>>> connect() async {
    try {
      db = await Db.create(
          "mongodb+srv://dbUser:dbUserPassword@stroop.4ahnr.mongodb.net/SpeechStroop");
      // "mongodb+srv://dbUser:dbUserPassword@stroop.4ahnr.mongodb.net/SpeechStroop?retryWrites=true&w=majority");
      await db.open();
    } catch (err) {
      print("err in connect");
      print(err);
    }
    userCollection = db.collection('User');
    return await userCollection.find().toList();
    // return db;
  }

  closeConnection() {
    db.close();
  }
}
