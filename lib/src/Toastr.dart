part of flutter_utils;

class Toastr {
  /// Success
  static void success({required String message, Duration duration = const Duration(seconds: 3)}) {
    Get.snackbar(
      "Success!",
      message.ucFirst(),
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: Colors.green,
      colorText: Colors.grey[900],
      icon: const Icon(Icons.info_outline),
      margin: const EdgeInsets.only(left: 8.0, bottom: 12.0, right: 8.0),
      borderRadius: 0.0,
      duration: duration,
    );
  }

  /// Error
  static void error({required String message, Duration duration = const Duration(seconds: 3)}) {
    Get.snackbar(
      "Error!",
      message.ucFirst(),
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: Colors.red,
      colorText: Colors.white,
      icon: const Icon(Icons.error),
      margin: const EdgeInsets.only(left: 8.0, bottom: 12.0, right: 8.0),
      borderRadius: 0.0,
      duration: duration,
    );
  }

  /// Info
  static void info({required String message, Duration duration = const Duration(seconds: 3)}) {
    Get.snackbar(
      "Info!",
      message.ucFirst(),
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: Colors.blueAccent,
      colorText: Colors.white,
      icon: const Icon(Icons.info),
      margin: const EdgeInsets.only(left: 8.0, bottom: 12.0, right: 8.0),
      borderRadius: 0.0,
      duration: duration,
    );
  }

  /// Warning
  static void warning({required String message, Duration duration = const Duration(seconds: 3)}) {
    Get.snackbar(
      "Warning!",
      message.ucFirst(),
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: Colors.amber[700],
      colorText: Colors.grey[900],
      icon: const Icon(Icons.warning),
      margin: const EdgeInsets.only(left: 8.0, bottom: 12.0, right: 8.0),
      borderRadius: 0.0,
      duration: duration,
    );
  }

  /// Toast
  static void show({required String message, Duration duration = const Duration(seconds: 3), SnackPosition position = SnackPosition.BOTTOM}) {
    Get.snackbar(
      "",
      "",
      snackPosition: position,
      titleText: const SizedBox.shrink(),
      backgroundColor: Colors.black.withOpacity(0.95),
      messageText: Text(
        message.ucFirst(),
        style: const TextStyle(color: Colors.white, fontSize: 14),
      ),
      margin: const EdgeInsets.all(0.0),
      borderRadius: 0.0,
      duration: duration,
    );
  }
}
