import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:multi_vendor_demo_admin/views/screens/side_bar_screens/widgets/banner_widget.dart';

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
    Reference ref = _firebaseBannerStorage
        .ref()
        .child('Banners')
        .child(_imagePickedName); // creating a folder on firebase storage
    UploadTask uploadTask = ref.putData(imageUpload);
    TaskSnapshot snapshot = await uploadTask;

    String downloadURL = await snapshot.ref
        .getDownloadURL(); //ater uploading the image we are getting the download url to uplod to firebase firestore
    return downloadURL;
  }

  uplaod_Image_to_Firestore() async {
    EasyLoading.show(status: 'Uploading...');
    if (_imagePicked != null) {
      String imageUrl = await _uploadBannersToStorage(_imagePicked);
      await _firebaseFirestore.collection('Banners').doc(_imagePickedName).set({
        'image': imageUrl,
        'createdAt' : Timestamp.now(),
      }).whenComplete(() {
        EasyLoading.dismiss();
        setState(() {
          _imagePicked = null;
          _imagePickedName = '';
        });
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
            'Upload Promotional Banner',
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
                  onPressed: () {
                    uplaod_Image_to_Firestore();
                  },
                  child: Text('SAVE and UPLOAD'),
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
                child: Text('Select IMAGE'),
                style: ElevatedButton.styleFrom(
                  primary: Colors.yellow[900],
                  onPrimary: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
            ),
            Divider(
              color: Colors.black,
              thickness: 1,
              indent: 10,
              endIndent: 10,
            ),
          ],
        ),
        Container(
          alignment: Alignment.topLeft,
          padding: const EdgeInsets.all(10),
          child: const Text(
            'Promotional Banners List',
            style: TextStyle(
              fontWeight: FontWeight.w700,
              fontSize: 36,
            ),
          ),
        ),
        BannerWidget(),
      ],
    ));
  }
}
