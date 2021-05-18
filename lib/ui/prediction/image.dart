import 'dart:convert';
import 'dart:io';

import 'package:covigenix/helper.dart';
import 'package:covigenix/ui/custom_widgets/progress.dart';
import 'package:covigenix/ui/model/prediction_response.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/foundation.dart' show kIsWeb;

class ImagePage extends StatefulWidget {
  @override
  _ImagePageState createState() => _ImagePageState();
}

class _ImagePageState extends State<ImagePage> {
  PickedFile? _image = null;
  final picker = ImagePicker();
  bool isLoading = false;

  Future _pickImage() async {
    final pickedFile = await picker.getImage(source: ImageSource.gallery);
    print("Picked a file!");
    setState(() {
      if (pickedFile != null) {
        _image = pickedFile;

        _upload();
      } else {
        print('No image selected.');
      }
    });
  }


  void _upload() async {
    setState(() {
      isLoading = true;
    });

    Uri uri = Uri.https(Helper.MODEL_BASE_URL, "image");
    final request = http.MultipartRequest('POST', uri)
      ..files.add(await http.MultipartFile.fromPath(
          'file', _image!.path, filename: "${Helper.getId()}.png"));

    http.Response response = await http.Response.fromStream(await request.send());
    print("response code ${response.statusCode}");

    setState(() {
      isLoading = false;
    });

    try{
      print(response.body);
      PredictionResponse res = PredictionResponse.fromJson(jsonDecode(response.body));
      if(res.status == 500){
        Helper.goodToast('There was some error in prediction. Please try again later.');
      }else{
        Helper.goodToast('Your prediction: ${res.prediction}');
      }
    }catch(Exception){
      Helper.goodToast('There was an error');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/images/xray.jpg"),
                fit: BoxFit.cover,
                colorFilter: ColorFilter.mode(
                    Colors.black.withOpacity(0.6), BlendMode.dstATop),
              ),

            ),
            child: Column(
              children: [
                Expanded(
                    child: _image == null
                        ? Container()
                        : (kIsWeb) ? Image.network(_image!.path)
                        : Image.file(File(_image!.path))
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: ElevatedButton(
                    onPressed: _pickImage,
                    child: Text('Select Image'),
                    style: ElevatedButton.styleFrom(
                      primary: Theme
                          .of(context)
                          .primaryColor,
                      padding: EdgeInsets.all(16),
                    ),
                  ),
                ),
              ],
            ),
         ),
        (isLoading?CustomProgressIndicator():Container()),
      ],
    );
  }
}

