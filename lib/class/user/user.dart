import 'package:freezed_annotation/freezed_annotation.dart';

part 'user.freezed.dart';
part 'user.g.dart';

/// User itself.
@freezed
class User with _$User {
  const User._();

  /// User constructor
  const factory User({
    /// Username
    required String username,

    /// Password
    required String password,
  }) = _User;

  /// From json function
  factory User.fromJson(Map<String, Object?> json) => _$UserFromJson(json);
}
