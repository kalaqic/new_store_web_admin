import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';

class UploadBannerScreen extends StatefulWidget {
  const UploadBannerScreen({super.key});
  static const String routeName = '/UploadBannerScreen';

  @override
  State<UploadBannerScreen> createState() => _UploadBannerScreenState();
}

final FirebaseStorage _storage = FirebaseStorage.instance;
final FirebaseFirestore _firestore = FirebaseFirestore.instance;
dynamic _image;
String? fileName;

class _UploadBannerScreenState extends State<UploadBannerScreen> {
  void pickImage() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      allowMultiple: false,
    );
    if (result != null) {
      setState(() {
        _image = result.files.first.bytes;
        fileName = result.files.first.name;
      });
    }
  }

  _uploadBannersToStorage(dynamic image) async {
    Reference ref = _storage.ref().child('banners').child(fileName!);
    UploadTask uploadTask = ref.putData(image);
    TaskSnapshot snapshot = await uploadTask;
    String downloadURL = await snapshot.ref.getDownloadURL();
    return downloadURL;
  }

  _uploadToFireStore() async {
    if (_image != null) {
      String imageURL = await _uploadBannersToStorage(_image);
      await _firestore
          .collection('banners')
          .doc(fileName)
          .set({'image': imageURL});
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            alignment: Alignment.topLeft,
            child: const Text(
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 30,
                ),
                'Upload Banners'),
          ),
        ),
        Divider(
          color: Colors.grey[900],
          thickness: 1,
        ),
        Column(
          children: [
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    height: 100,
                    width: 100,
                    decoration: BoxDecoration(
                      color: Colors.grey[600],
                      border: Border.all(),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: _image != null
                        ? Image.memory(
                            _image,
                            fit: BoxFit.contain,
                          )
                        : const Center(
                            child: Text(
                                style: TextStyle(
                                  fontSize: 10,
                                ),
                                'Upload Banner! 👇'),
                          ),
                  ),
                ),
                ElevatedButton(
                    onPressed: () {
                      _uploadToFireStore();
                    },
                    child: const Text('Save!'))
              ],
            ),
            ElevatedButton(
                onPressed: () {
                  pickImage();
                },
                child: const Text('Upload!'))
          ],
        ),
      ],
    );
  }
}
