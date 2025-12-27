import 'dart:async';
import 'package:http/http.dart' as http;

/// A custom MultipartRequest that supports upload progress tracking.
///
/// This is a solution for uploading files with progress because the http library
/// doesn't support it by default.
///
/// Reference: https://itecnote.com/tecnote/flutter-how-to-get-progress-event-while-uploading-file-on-http-multipartrequest-request-in-flutter/
///
/// Usage: Use this MultipartRequest instead of http.MultipartRequest in ApiClient class.
class MultipartRequest extends http.MultipartRequest {
  MultipartRequest(
    super.method,
    super.url, {
    required this.onProgress,
  });

  /// Callback function that receives upload progress updates.
  /// Parameters: [bytes] - bytes uploaded so far, [totalBytes] - total bytes to upload
  final void Function(int bytes, int totalBytes) onProgress;

  @override
  http.ByteStream finalize() {
    final byteStream = super.finalize();
    final total = contentLength;
    int bytes = 0;

    final t = StreamTransformer<List<int>, List<int>>.fromHandlers(
      handleData: (data, sink) {
        bytes += data.length;
        onProgress(bytes, total);
        sink.add(data);
      },
    );

    final stream = byteStream.transform(t);
    return http.ByteStream(stream);
  }
}
