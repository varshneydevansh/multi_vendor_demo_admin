import 'package:flutter/material.dart';

class UploadBannerScreen extends StatelessWidget {
  static const String routeName = '/upload-banner-screen';

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
                    width: 200,
                    height: 200,
                    decoration: BoxDecoration(
                      color: Colors.grey[300],
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(
                        color: Colors.black,
                        width: 1,
                      ),
                    ),
                    child: Center(
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
                onPressed: () {},
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
