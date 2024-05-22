import 'package:equatable/equatable.dart';

class OTPResponse extends Equatable {
  final String resetToken;

  OTPResponse({required this.resetToken});

  @override
  List<Object?> get props => [resetToken];

  Map<String, dynamic> toJson() => {'passwordResetToken': resetToken};

  factory OTPResponse.fromJson(Map<String, dynamic> json) {
    return OTPResponse(resetToken: json['passwordResetToken']);
  }
}
