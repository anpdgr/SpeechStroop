import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:speech_stroop/utils/logger.dart';

final storageRef = FirebaseStorage.instance.ref();

const audioFolder = "audio";

Future<String> uploadFile(String userId, String filePath) async {
  String fileName = filePath.split('/').last;
  String dstPath = "$audioFolder/$userId/$fileName";

  logger.i({
    filePath: filePath,
    fileName: fileName,
    dstPath: dstPath,
  });

  File file = File(filePath);
  // Create the file metadata
  final metadata = SettableMetadata(cacheControl: 'public, max-age=31536000');

  // Upload file and metadata to the path 'images/mountains.jpg'
  storageRef.child(dstPath).putFile(file, metadata);

  String url = await storageRef.child(dstPath).getDownloadURL();
  return url;
}

Future<List<String>> uploadStroopAudioFile(
    String date, String dir, String userId) async {
  List<String> urls = [];
  List<File> toRemoveFile = [];

  for (int i = 0; i < 3; i++) {
    String fileName = "${date}_section-${i + 1}";

    String fileNameWAV = "$fileName.wav";
    String fileNamePCM = "$fileName.pcm";

    String filePathWAV = "$dir/$fileNameWAV";
    String filePathPCM = "$dir/$fileNamePCM";

    String url = await uploadFile(userId, filePathWAV);
    urls.add(url);

    toRemoveFile.add(File(filePathWAV));
    toRemoveFile.add(File(filePathPCM));
  }
  await removeAudioFiles(toRemoveFile);

  return urls;
}

removeAudioFiles(List<File> files) async {
  for (var f in files) {
    await f.delete();
  }
}
