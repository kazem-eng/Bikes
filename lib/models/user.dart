import 'package:equatable/equatable.dart';

class User extends Equatable {
  const User({
    required this.id,
    required this.email,
    this.name,
    this.profileImageUrl,
  });

  final String id;
  final String? name;
  final String email;
  final String? profileImageUrl;

  @override
  List<Object?> get props => [
        id,
        name,
        email,
        profileImageUrl,
      ];
}
