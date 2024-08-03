part of ns_components;

class NSException {
  final String code;
  final String message;

  NSException({required this.code, required this.message});

  factory NSException.fromJson(Map<String, dynamic> json) {
    return NSException(
      code: json['code'] ?? NSExceptionCodes.unparsableException,
      message: json['message'] ?? json.toString(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'code': code,
      'message': message,
    };
  }
}

abstract final class NSExceptionCodes {
  static const unparsableException = 'NSUnparsable';
}
