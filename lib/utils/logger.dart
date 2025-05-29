import 'dart:io';

enum LogLevel {
  debug,
  info,
  warning,
  error,
}

class FileLogger {
  final String _filePath;
  late File _logFile;
  
  FileLogger(this._filePath) {
    _logFile = File(_filePath);
    _ensureLogFileExists();
  }
  
  void _ensureLogFileExists() {
    if (!_logFile.existsSync()) {
      _logFile.createSync(recursive: true);
    }
  }
  
  String _formatTimestamp() {
    final now = DateTime.now();
    return now.toIso8601String();
  }
  
  String _formatLogEntry(LogLevel level, String message) {
    final timestamp = _formatTimestamp();
    final levelStr = level.toString().split('.').last.toUpperCase();
    return '[$timestamp] [$levelStr] $message';
  }
  
  Future<void> _writeToFile(String formattedMessage) async {
    try {
      await _logFile.writeAsString('$formattedMessage\n', mode: FileMode.append);
    } catch (e) {
      print('Failed to write to log file: $e');
    }
  }
  
  Future<void> debug(String message) async {
    final formatted = _formatLogEntry(LogLevel.debug, message);
    await _writeToFile(formatted);
  }
  
  Future<void> info(String message) async {
    final formatted = _formatLogEntry(LogLevel.info, message);
    await _writeToFile(formatted);
  }
  
  Future<void> warning(String message) async {
    final formatted = _formatLogEntry(LogLevel.warning, message);
    await _writeToFile(formatted);
  }
  
  Future<void> error(String message) async {
    final formatted = _formatLogEntry(LogLevel.error, message);
    await _writeToFile(formatted);
  }
  
  Future<void> log(LogLevel level, String message) async {
    final formatted = _formatLogEntry(level, message);
    await _writeToFile(formatted);
  }
  
  Future<void> clearLog() async {
    try {
      await _logFile.writeAsString('');
    } catch (e) {
      print('Failed to clear log file: $e');
    }
  }
  
  Future<String> readLog() async {
    try {
      return await _logFile.readAsString();
    } catch (e) {
      print('Failed to read log file: $e');
      return '';
    }
  }
}

class Logger {
  static FileLogger? _instance;
  
  static FileLogger get instance {
    _instance ??= FileLogger('logs/app.log');
    return _instance!;
  }
  
  static Future<void> debug(String message) => instance.debug(message);
  static Future<void> info(String message) => instance.info(message);
  static Future<void> warning(String message) => instance.warning(message);
  static Future<void> error(String message) => instance.error(message);
}
