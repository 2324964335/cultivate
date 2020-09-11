import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import '../../utils/perm_utils.dart';
import 'scan_dialog.dart';
import '../../utils/util.dart';
import 'dart:ui';
import 'package:r_scan/src/r_scan_camera.dart';

List<RScanCameraDescription> rScanCameras;

class RScanCameraDialog extends StatefulWidget {
  @override
  _RScanCameraDialogState createState() => _RScanCameraDialogState();
}

class _RScanCameraDialogState extends State<RScanCameraDialog> {
  RScanCameraController _controller;
  bool isFirst = true;

  void initCamera() async {
    if (rScanCameras == null || rScanCameras.length == 0) {
      PermissionStatus status = await Permission.camera.status;
      if (status == PermissionStatus.granted) {
        final statuses = await [Permission.camera].request(); // 请求权限
        statuses[Permission.camera] == PermissionStatus.granted;
        rScanCameras = await availableRScanCameras();
      }else{
        PermissionStatus status = await Permission.camera.status;

        if (status == PermissionStatus.granted) {
          rScanCameras = await availableRScanCameras();
        } else {
          print('相机权限被拒绝，无法使用');
        }
      }
    }
    if (rScanCameras != null && rScanCameras.length > 0) {
      _controller = RScanCameraController(
          rScanCameras[0], RScanCameraResolutionPreset.high)
        ..addListener(() {
          final result = _controller.result;
          if (result != null) {
            if (isFirst) {
              Navigator.of(context).pop(result);
              isFirst = false;
            }
          }
        })
        ..initialize().then((_) {
          if (!mounted) {
            return;
          }
          setState(() {});
        });
    }
  }

  @override
  void initState() {
    super.initState();
    initCamera();
  }

  @override
  void dispose() {
    _controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (rScanCameras == null || rScanCameras.length == 0) {
      return Scaffold(
        body: Container(
          alignment: Alignment.center,
          child: Text('not have available camera'),
        ),
      );
    }
    if (!_controller.value.isInitialized) {
      return Container();
    }
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(title: Text('签到',style: TextStyle(color: Colors.black54),),),
      body: Stack(
        children: <Widget>[
          ScanImageView(
            child: AspectRatio(
              //_controller.value.aspectRatio
//              aspectRatio: 0.64,
              aspectRatio: ScreenAdaper.screenWidth()/(ScreenAdaper.screenHeight() - 4* kToolbarHeight - MediaQueryData.fromWindow(window).padding.top),
              child: RScanCamera(_controller),
            ),
          ),
          Align(
              alignment: Alignment.bottomCenter,
              child: FutureBuilder(
                future: getFlashMode(),
                builder: _buildFlashBtn,
              ))
        ],
      ),
    );
  }

  Future<bool> getFlashMode() async {
    bool isOpen = false;
    try {
      isOpen = await _controller.getFlashMode();
    } catch (_) {}
    return isOpen;
  }

  Widget _buildFlashBtn(BuildContext context, AsyncSnapshot<bool> snapshot) {
    return snapshot.hasData
        ? Padding(
            padding: EdgeInsets.only(
                bottom: 24 + MediaQuery.of(context).padding.bottom),
            child: IconButton(
                icon: Icon(snapshot.data ? Icons.flash_on : Icons.flash_off),
                color: Colors.white,
                iconSize: 46,
                onPressed: () {
                  if (snapshot.data) {
                    _controller.setFlashMode(false);
                  } else {
                    _controller.setFlashMode(true);
                  }
                  setState(() {});
                }),
          )
        : Container();
  }
}
