// import 'package:firebase/firebase.dart';
// import 'package:firebase/firestore.dart' as fs;

// void main() {
//   initializeApp(
//       apiKey: "YourApiKey",
//       authDomain: "YourAuthDomain",
//       databaseURL: "YourDatabaseUrl",
//       projectId: "YourProjectId",
//       appId: "YourAppId",
//       storageBucket: "YourStorageBucket");

//   fs.Firestore store = firestore();
//   fs.CollectionReference ref = store.collection('messages');

//   ref.onSnapshot.listen((querySnapshot) {
//     querySnapshot.docChanges().forEach((change) {
//       if (change.type == "added") {
//         // Do something with change.doc
//       }
//     });
//   });
// }
