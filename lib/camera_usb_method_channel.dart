import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'camera_usb_platform_interface.dart';

/// An implementation of [CameraUsbPlatform] that uses method channels.
class MethodChannelCameraUsb extends CameraUsbPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('camera_usb');

  @override
  Future<String?> getPlatformVersion() async {
    final version = await methodChannel.invokeMethod<String>('getPlatformVersion');
    return version;
  }
}
