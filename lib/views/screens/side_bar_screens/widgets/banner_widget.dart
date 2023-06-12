import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class BannerWidget extends StatelessWidget {
  BannerWidget({super.key});
  //This is the stream that is used to get the data from the firebase
  // why query snapshot? because snapshot is a collection of documents and query snapshot is a collection of query documents
  final Stream<QuerySnapshot> _categoriesStream =
      FirebaseFirestore.instance.collection('Banners').snapshots();
  @override
  Widget build(BuildContext context) {
    // StreamBuilder is used to get the data from the firebase and display it in the Categories page
    //think of it as a widget that is used to get the data just like message stream in the chat app
    return StreamBuilder<QuerySnapshot>(
      stream: _categoriesStream,
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (snapshot.hasError) {
          return const Text('Something went wrong');
        }

        if (snapshot.connectionState == ConnectionState.waiting) {
          //if it's trying to get the data from the firebase then show the circular progress indicator
          return Center(
              child: CircularProgressIndicator(color: Colors.deepPurple));
        }

        return GridView.builder(
          
          //SliverGridDelegateWithFixedCrossAxisCount is used to make the grid view responsive
          //crossAxisCount is the number of columns in the grid view
          //mainAxisSpacing is the space between the rows
          //crossAxisSpacing is the space between the columns
          //childAspectRatio is the ratio of the width to the height of the grid view
          //padding is the padding of the grid view
          //itemCount is the number of items in the grid view
          //itemBuilder is used to build the grid view
          //itemBuilder takes two parameters context and index
          //context is the context of the app
          //index is the index of the item in the grid view
          //itemCount is the number of items in the grid view
          //itemBuilder is used to build the grid view
          //itemBuilder takes two parameters context and index
          shrinkWrap: true,
          
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 6, mainAxisSpacing: 8, crossAxisSpacing: 8),
          itemBuilder: (context, index) {
            final bannerData = snapshot.data!.docs[index];
            return Column(
              children: [
                SizedBox(
                  child: Image.network(
                    bannerData['image'],
                    
                    fit: BoxFit.cover,
                  ),
                ),
                Text(bannerData.id),
              ]
            );
          },
          itemCount: snapshot.data!.docs.length,
          padding: EdgeInsets.all(10),
        );
      },
    );
  }
}
