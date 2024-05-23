import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'camera_usb_method_channel.dart';

abstract class CameraUsbPlatform extends PlatformInterface {
  /// Constructs a CameraUsbPlatform.
  CameraUsbPlatform() : super(token: _token);

  static final Object _token = Object();

  static CameraUsbPlatform _instance = MethodChannelCameraUsb();

  /// The default instance of [CameraUsbPlatform] to use.
  ///
  /// Defaults to [MethodChannelCameraUsb].
  static CameraUsbPlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [CameraUsbPlatform] when
  /// they register themselves.
  static set instance(CameraUsbPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<String?> getPlatformVersion() {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }
}
