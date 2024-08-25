import 'dart:io';

import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';

Future<String?> pickImage() async {
  try {
    File? image;
    final FirebaseStorage storage = FirebaseStorage.instance;

    final pickedFile =
        await ImagePicker().pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      image = File(pickedFile.path);

      String fileName = DateTime.now().microsecondsSinceEpoch.toString();
      Reference storageRef = storage.ref().child('location_images/$fileName');

      UploadTask uploadTask = storageRef.putFile(image);
      TaskSnapshot taskSnapshot = await uploadTask;

      String downloadUrl = await taskSnapshot.ref.getDownloadURL();
      return downloadUrl;
    }
  } catch (error) {
    rethrow;
  }

  return null;
}
