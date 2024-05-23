import Cocoa
import FlutterMacOS
import AVFoundation

public class CameraUsbPlugin: NSObject, FlutterPlugin {
  var captureSession: AVCaptureSession?

  public static func register(with registrar: FlutterPluginRegistrar) {
    let channel = FlutterMethodChannel(name: "camera_usb", binaryMessenger: registrar.messenger)
    let instance = CameraUsbPlugin()
    registrar.addMethodCallDelegate(instance, channel: channel)
  }

  public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
    switch call.method {
    case "initWebcam":
      initWebcam(result: result)
    default:
      result(FlutterMethodNotImplemented)
    }
  }

  private func initWebcam(result: FlutterResult) {
    captureSession = AVCaptureSession()
    guard let device = AVCaptureDevice.default(for: .video),
          let input = try? AVCaptureDeviceInput(device: device) else {
      result(FlutterError(code: "UNAVAILABLE", message: "Webcam not available", details: nil))
      return
    }
    captureSession?.addInput(input)
    captureSession?.startRunning()

    result("Webcam initialized")
  }
}
