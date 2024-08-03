part of ns_components;

class NSException {
  final String code;
  final String message;

  NSException({required this.code, required this.message});

  factory NSException.fromJson(Map<String, dynamic> json) {
    return NSException(
      code: json['code'] as String,
      message: json['message'] as String,
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
