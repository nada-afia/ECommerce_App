import 'package:json_annotation/json_annotation.dart';
part 'user_response_dto.g.dart';
@JsonSerializable()
class UserResponseDto {
  @JsonKey(name: "name")
  final String? name;
  @JsonKey(name: "email")
  final String? email;
  @JsonKey(name: "role")
  final String? role;

  UserResponseDto ({
    this.name,
    this.email,
    this.role,
  });

  factory UserResponseDto.fromJson(Map<String, dynamic> json) {
    return _$UserResponseDtoFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$UserResponseDtoToJson(this);
  }
}