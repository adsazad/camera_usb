#include "include/camera_usb/camera_usb_plugin_c_api.h"

#include <flutter/plugin_registrar_windows.h>

#include "camera_usb_plugin.h"
#include <opencv2/opencv.hpp>
#include <windows.h>
#include <iostream>

void StartWebcam() {
    cv::VideoCapture cap(0);
    if (!cap.isOpened()) {
        std::cerr << "Error opening webcam" << std::endl;
        return;
    }

    cv::Mat frame;
    while (cap.read(frame)) {
        // Process frame and send to Dart if needed
    }
}

void InitWebcam(flutter::MethodCall<flutter::EncodableValue> call,
                std::unique_ptr<flutter::MethodResult<flutter::EncodableValue>> result) {
    StartWebcam();
    result->Success(flutter::EncodableValue("Webcam initialized"));
}

void CameraUsbPluginCApiRegisterWithRegistrar(
    FlutterDesktopPluginRegistrarRef registrar) {
    auto channel = std::make_unique<flutter::MethodChannel>(
        registrar, "camera_usb",
        &flutter::StandardMethodCodec::GetInstance());

    channel->SetMethodCallHandler(
            [](const flutter::MethodCall<flutter::EncodableValue>& call,
               std::unique_ptr<flutter::MethodResult<flutter::EncodableValue>> result) {
                if (call.method_name().compare("initWebcam") == 0) {
                    InitWebcam(call, std::move(result));
                } else {
                    result->NotImplemented();
                }
            });
}
