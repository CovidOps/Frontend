import 'dart:convert';
import 'dart:io';
import 'dart:math';

import 'package:covigenix/helper.dart';
import 'package:covigenix/ui/custom_widgets/button.dart';
import 'package:covigenix/ui/custom_widgets/progress.dart';
import 'package:covigenix/ui/model/prediction_response.dart';
import 'package:flutter/material.dart';
import 'package:http_parser/http_parser.dart';
import 'package:image_picker/image_picker.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:image/image.dart' as img;

class ImagePage extends StatefulWidget {
  @override
  _ImagePageState createState() => _ImagePageState();
}

class _ImagePageState extends State<ImagePage> {
  PickedFile? _image = null;
  final picker = ImagePicker();
  bool isLoading = false;

  void showInstructions() async {
    await showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Instructions"),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text(
                    "1. Please ensure high image quality.\n2. Have a plain background behind the image.\n3. Upload photo without flashlight"),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: Text('OK'),
              onPressed: () async {
                Navigator.of(context).pop();
                _pickImage();
              },
            ),
          ],
        );
      },
    );
  }

  void _pickImage() async {
    final pickedFile = await picker.getImage(source: ImageSource.gallery);
    if (pickedFile == null) {
      return;
    }
    setState(() {
      _image = pickedFile;
    });
    _upload();
  }

  void _upload() async {
    setState(() {
      isLoading = true;
    });

    File f = File(_image!.path);

    //var bytes = await _image!.readAsBytes();
    img.Image image_temp = img.decodeImage(f.readAsBytesSync())!;
    img.Image resized_img = img.copyResize(image_temp, width:224, height:224);
    print("Resizing done");
    //Uri uri = Uri.https(Helper.MODEL_BASE_URL, "image");
    Uri uri = Uri.http(Helper.MODEL_BASE_URL, "image");
    /*final request = http.MultipartRequest('POST', uri)
      ..files.add(await http.MultipartFile.fromPath(
          'file', _image!.path, filename: "${Helper.getId()}.$ext"));*/
    Future.delayed(Duration(milliseconds: 2000)).then((value) async {
    String fileName = "${Helper.getId()}-${Random().nextInt(100)+1}.jpg";
    print(fileName);
      final request = http.MultipartRequest('POST', uri)
        ..files.add(http.MultipartFile.fromBytes('file', img.encodeJpg(resized_img),
            filename: fileName,
          contentType: MediaType("image", "jpeg")
        ));

      http.StreamedResponse res = await request.send();
      print("Got res");
      http.Response response = await http.Response.fromStream(res);
      print("response code ${response.statusCode}");

      setState(() {
        isLoading = false;
      });

      try {
        print(response.body);
        PredictionResponse res =
            PredictionResponse.fromJson(jsonDecode(response.body));
        if (res.status == 500) {
          Helper.goodToast(
              'There was some error in prediction. Please try again later.');
        } else {
          Helper.goodToast('Your prediction: ${res.prediction}');
        }
      } catch (Exception) {
        Helper.goodToast('There was an error');
      } finally {
        print("Completed");
      }
    });
    return;
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/images/imagepred.jpg"),
              fit: BoxFit.fill,
              colorFilter: ColorFilter.mode(
                  Colors.black.withOpacity(0.3), BlendMode.dstATop),
            ),
          ),
          child: Column(
            children: [
              Expanded(
                  child: _image == null
                      ? Container()
                      : (kIsWeb)
                          ? Image.network(_image!.path)
                          : Image.file(File(_image!.path))),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: CustomButton('Select Image', showInstructions),
              ),
            ],
          ),
        ),
        (isLoading ? CustomProgressIndicator() : Container()),
      ],
    );
  }
}
