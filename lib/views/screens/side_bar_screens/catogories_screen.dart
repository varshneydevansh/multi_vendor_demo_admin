import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:multi_vendor_demo_admin/views/screens/side_bar_screens/widgets/category_widget.dart';

class CategoriesScreen extends StatefulWidget {
  static const String routeName = '/categories-screen';

  @override
  State<CategoriesScreen> createState() => _CategoriesScreenState();
}

class _CategoriesScreenState extends State<CategoriesScreen> {
  final FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;
  final FirebaseStorage _firebaseCategoryStorage = FirebaseStorage.instance;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  dynamic _imagePicked;

  String _imagePickedName = '';
  String categoryName='';
  uploadCatgoryBannerToStorage(dynamic imageUpload) async {
    // Creating a folder on firebase storage to store the image picked by the user
    Reference ref = _firebaseCategoryStorage
        .ref()
        .child('CategoryImages')
        .child(_imagePickedName);
    // Uploading the image to firebase storage
    UploadTask uploadTask = ref.putData(imageUpload);
    // taking the snapshot of the image uploaded
    TaskSnapshot snapshot = await uploadTask;
    // Getting the download url of the image
    String downloadURL = await snapshot.ref.getDownloadURL();
    // uploading the image to firebase firestore with the download url
    return downloadURL;
  }
  // variables to store the image picked by the user

  _pickImage() async {
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

  uploadCategoryToFireStore() async {
    EasyLoading.show(status: 'Uploading...');
    if (_formKey.currentState!.validate()) {
      String imageUrl = await uploadCatgoryBannerToStorage(_imagePicked);
      await _firebaseFirestore.collection('Categories').doc(categoryName).set({
        'image': imageUrl,
        'categoryName': categoryName,
      }).whenComplete(() {
        EasyLoading.dismiss();
        setState(() {
          _imagePicked = null;
          _imagePickedName = '';
          _formKey.currentState!.reset();
        });
      });
    } else {
      print('not validated');
    }
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: Form(
      key: _formKey,
      child: Column(
        children: [
          Container(
            alignment: Alignment.topLeft,
            padding: const EdgeInsets.all(10),
            child: const Text(
              'Categories',
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
                                'Uplaod Category Image',
                                style: TextStyle(
                                  fontSize: 20,
                                ),
                              ),
                            ),
                    ),
                  ),
                  Flexible(
                    child: SizedBox(
                      child: TextFormField(
                        onChanged: (value) {
                          categoryName = value;
                        },
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Please enter some text';
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                            labelText: 'Enter Category Name',
                            hintText: 'Type the Name here'),
                      ),
                      width: 250,
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      uploadCategoryToFireStore();
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
                    _pickImage();
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
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Divider(
              color: Colors.grey,
            ),
          ),
          Container(
            child: Text(
              'Categories List',
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.w700),
            ),
          ),
          CategoryWidget()
        ],
      ),
    ));
  }
}
