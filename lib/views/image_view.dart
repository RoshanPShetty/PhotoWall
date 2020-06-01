import 'dart:io';
import 'dart:typed_data';
import 'dart:ui';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'package:permission_handler/permission_handler.dart';

class ImageView extends StatefulWidget {
  final String imageUrl;
  ImageView({@required this.imageUrl});

  @override
  _ImageViewState createState() => _ImageViewState();
}

class _ImageViewState extends State<ImageView> {
  var filePath;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Hero(
            tag: widget.imageUrl,
            child: Container(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                child: Image.network(widget.imageUrl, fit: BoxFit.cover,)),
          ),
          Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            alignment: Alignment.bottomCenter,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                GestureDetector(
                  onTap: () {
                    _save();
                  },
                  child: Stack(
                    children: <Widget>[
                      Container(
                        height: 50,
                        width: MediaQuery.of(context).size.width/2,
                        decoration: BoxDecoration(
                          color: Color(0xff1C1B1B).withOpacity(0.8),
                          borderRadius: BorderRadius.circular(30),
                        ),
                      ),
                      Container(
                        height: 51,
                        width: MediaQuery.of(context).size.width/2,
                        padding: EdgeInsets.symmetric(horizontal: 12, vertical: 12),
                        decoration: BoxDecoration(
                            border: Border.all(
                                color: Colors.white, width: 2
                            ),
                            borderRadius: BorderRadius.circular(30),
                            gradient: LinearGradient(
                                colors: [
                                  Color(0x36FFFFFF),
                                  Color(0x0FFFFFFF)
                                ]
                            )
                        ),
                        child: Column(
                          children: <Widget>[
                            Text("Save Image", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18, color: Colors.white70)),
                          ],
                        ),
                      ),
                    ],

                  ),
                ),
                SizedBox(height: 10,),
                GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Text('Cancel', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 15),)),
                SizedBox(height: 50,)
              ],
            ),
          )
        ],
      ),
    );
  }

  _save() async {
//    if(Platform.isAndroid) {
//      await _askPermission();
//    }
    await _askPermission();

    var response = await Dio().get(
        widget.imageUrl,
        options: Options(responseType: ResponseType.bytes));
    final result =
    await ImageGallerySaver.saveImage(Uint8List.fromList(response.data));
    print(result);
    Navigator.pop(context);
  }

  _askPermission() async {
//    if (Platform.isIOS) {
//      Map<PermissionGroup, PermissionStatus> permissions =
//      await PermissionHandler()
//          .requestPermissions([PermissionGroup.photos]);
//    } else {
//      PermissionStatus permission = await PermissionHandler()
//          .checkPermissionStatus(PermissionGroup.storage);
//    }
    if (Platform.isAndroid) {
      PermissionStatus permissionStorage =
      await PermissionHandler().checkPermissionStatus(PermissionGroup.storage);
      if (permissionStorage != PermissionStatus.granted) {
        Map<PermissionGroup, PermissionStatus> permissionStatus =
        await PermissionHandler().requestPermissions([PermissionGroup.storage]);
        permissionStorage = permissionStatus[PermissionGroup.storage] ?? PermissionStatus.unknown;

        if (permissionStorage != PermissionStatus.granted) {
          print("❌----------has no Permission");
          return;
        }
      }
    }
  }
}
