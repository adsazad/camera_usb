import 'package:flutter_test/flutter_test.dart';
import 'package:camera_usb/camera_usb.dart';
import 'package:camera_usb/camera_usb_platform_interface.dart';
import 'package:camera_usb/camera_usb_method_channel.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockCameraUsbPlatform
    with MockPlatformInterfaceMixin
    implements CameraUsbPlatform {

  @override
  Future<String?> getPlatformVersion() => Future.value('42');
}

void main() {
  final CameraUsbPlatform initialPlatform = CameraUsbPlatform.instance;

  test('$MethodChannelCameraUsb is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelCameraUsb>());
  });

  test('getPlatformVersion', () async {
    CameraUsb cameraUsbPlugin = CameraUsb();
    MockCameraUsbPlatform fakePlatform = MockCameraUsbPlatform();
    CameraUsbPlatform.instance = fakePlatform;

    expect(await cameraUsbPlugin.getPlatformVersion(), '42');
  });
}
