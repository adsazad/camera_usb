#ifndef FLUTTER_PLUGIN_CAMERA_USB_PLUGIN_H_
#define FLUTTER_PLUGIN_CAMERA_USB_PLUGIN_H_

#include <flutter/method_channel.h>
#include <flutter/plugin_registrar_windows.h>

#include <memory>

#ifdef CAMERA_USB_PLUGIN_IMPL
#define CAMERA_USB_PLUGIN_EXPORT __declspec(dllexport)
#else
#define CAMERA_USB_PLUGIN_EXPORT __declspec(dllimport)
#endif

#if defined(__cplusplus)
extern "C" {
#endif

CAMERA_USB_PLUGIN_EXPORT void CameraUsbPluginRegisterWithRegistrar(
        FlutterDesktopPluginRegistrarRef registrar);

#if defined(__cplusplus)
}  // extern "C"
#endif

#endif  // FLUTTER_PLUGIN_CAMERA_USB_PLUGIN_H_

namespace camera_usb {

class CameraUsbPlugin : public flutter::Plugin {
 public:
  static void RegisterWithRegistrar(flutter::PluginRegistrarWindows *registrar);

  CameraUsbPlugin();

  virtual ~CameraUsbPlugin();

  // Disallow copy and assign.
  CameraUsbPlugin(const CameraUsbPlugin&) = delete;
  CameraUsbPlugin& operator=(const CameraUsbPlugin&) = delete;

  // Called when a method is called on this plugin's channel from Dart.
  void HandleMethodCall(
      const flutter::MethodCall<flutter::EncodableValue> &method_call,
      std::unique_ptr<flutter::MethodResult<flutter::EncodableValue>> result);
};

}  // namespace camera_usb

#endif  // FLUTTER_PLUGIN_CAMERA_USB_PLUGIN_H_
