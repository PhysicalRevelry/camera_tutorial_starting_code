import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class LandingScreen extends StatefulWidget {
  @override
  _LandingScreenState createState() => _LandingScreenState();
}

class _LandingScreenState extends State<LandingScreen> {
  Future<void> _showChoiceDialog(BuildContext context) {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Make a Choice'),
            content: SingleChildScrollView(
              child: ListBody(
                children: [
                  GestureDetector(
                    child: Text('Gallery'),
                    onTap: () {
                      _openGallery(context);
                    },
                  ),
                  Padding(
                    padding: EdgeInsets.all(8.0),
                  ),
                  GestureDetector(
                    child: Text("Camera"),
                    onTap: () {
                      _openCamera(context);
                    },
                  )
                ],
              ),
            ),
          );
        });
  }

  Widget _decideImageView() {
    if (imageFile == null) {
      return Text("No selected Image");
    } else {
      return Image.asset(imageFile.path);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Main Screen'),
      ),
      body: Container(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _decideImageView(),
              RaisedButton(
                onPressed: () {
                  _showChoiceDialog(context);
                },
                child: Text("Select Image!"),
              ),
            ],
          ),
        ),
      ),
    );
  }

  PickedFile imageFile;

  void _openGallery(BuildContext context) async {
    // ignore: deprecated_member_use
    imageFile = await ImagePicker().getImage(source: ImageSource.gallery);
    this.setState(() {});
    Navigator.of(context).pop();
  }

  void _openCamera(BuildContext context) async {
    // ignore: deprecated_member_use
    imageFile = await ImagePicker().getImage(source: ImageSource.camera);
    this.setState(() {});
    Navigator.of(context).pop();
  }
}
