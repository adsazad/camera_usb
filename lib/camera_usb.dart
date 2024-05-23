
import 'package:flutter/services.dart';

import 'camera_usb_platform_interface.dart';

class CameraUsb {
  static const MethodChannel _channel = MethodChannel('camera_usb');

  static Future<void> initWebcam() async {
    try {
      final String result = await _channel.invokeMethod('initWebcam');
      print(result);
    } on PlatformException catch (e) {
      print("Failed to initialize webcam: '${e.message}'.");
    }
  }

  Future<String?> getPlatformVersion() {
    return CameraUsbPlatform.instance.getPlatformVersion();
  }
}
