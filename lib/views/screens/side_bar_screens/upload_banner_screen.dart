import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';

class UploadBannerScreen extends StatefulWidget {
  static const String routeName = '/upload-banner-screen';

  @override
  State<UploadBannerScreen> createState() => _UploadBannerScreenState();
}

class _UploadBannerScreenState extends State<UploadBannerScreen> {
  final FirebaseStorage _firebaseBannerStorage = FirebaseStorage.instance;
  final FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;
  dynamic _imagePicked;
  String _imagePickedName = '';
  pickImage() async {
    FilePickerResult? imageSelection = await FilePicker.platform.pickFiles(
      type: FileType.image,
      allowMultiple: false,
    );
    if (imageSelection != null) {
      setState(() {
        _imagePicked = imageSelection.files.first.bytes;
        _imagePickedName = imageSelection.files.first.name;
      });
    } else {
      print('No image selected');
    }
  }

  _uploadBannersToStorage(dynamic imageUpload) async {
    Reference ref =
        _firebaseBannerStorage.ref().child('banners').child(_imagePickedName);
    UploadTask uploadTask = ref.putData(imageUpload);
    TaskSnapshot snapshot = await uploadTask;

    String downloadURL = await snapshot.ref.getDownloadURL();
    return downloadURL;
  }

  uplaodToFirebase() {
    if (_imagePicked != null) {
      _uploadBannersToStorage(_imagePicked).then((downloadUrl) {
        _firebaseFirestore.collection('banners').add({
          'image': downloadUrl,
        }).then((value) => Navigator.of(context).pop());
      });
    } else {
      print('No image selected');
    }
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: Column(
      children: [
        Container(
          alignment: Alignment.topLeft,
          padding: const EdgeInsets.all(10),
          child: const Text(
            'Promotional Banner',
            style: TextStyle(
              fontWeight: FontWeight.w700,
              fontSize: 36,
            ),
          ),
        ),
        Divider(
          color: Colors.black,
          thickness: 1,
          indent: 10,
          endIndent: 10,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    width: 300,
                    height: 300,
                    decoration: BoxDecoration(
                      color: Colors.grey[300],
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(
                        color: Colors.black,
                        width: 1,
                      ),
                    ),
                    child: _imagePicked != null
                        ? Image.memory(_imagePicked, fit: BoxFit.cover)
                        : Center(
                            child: Text(
                              'Uplaod Banner',
                              style: TextStyle(
                                fontSize: 20,
                              ),
                            ),
                          ),
                  ),
                ),
                ElevatedButton(
                  onPressed: () {},
                  child: Text('SAVE'),
                  style: ElevatedButton.styleFrom(
                    primary: Color.fromARGB(255, 149, 201, 151),
                    onPrimary: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                )
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton(
                onPressed: () {
                  pickImage();
                },
                child: Text('UPLOAD IMAGE'),
                style: ElevatedButton.styleFrom(
                  primary: Colors.yellow[900],
                  onPrimary: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    ));
  }
}
