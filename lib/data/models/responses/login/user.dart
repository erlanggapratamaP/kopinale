import 'dart:convert';

class User {
  int? id;
  String? name;
  String? email;
  String? phone;
  String? roles;
  dynamic emailVerifiedAt;
  dynamic twoFactorSecret;
  dynamic twoFactorRecoveryCodes;
  dynamic twoFactorConfirmedAt;
  DateTime? createdAt;
  DateTime? updatedAt;

  User({
    this.id,
    this.name,
    this.email,
    this.phone,
    this.roles,
    this.emailVerifiedAt,
    this.twoFactorSecret,
    this.twoFactorRecoveryCodes,
    this.twoFactorConfirmedAt,
    this.createdAt,
    this.updatedAt,
  });

  @override
  String toString() {
    return 'User(id: $id, name: $name, email: $email, phone: $phone, roles: $roles, emailVerifiedAt: $emailVerifiedAt, twoFactorSecret: $twoFactorSecret, twoFactorRecoveryCodes: $twoFactorRecoveryCodes, twoFactorConfirmedAt: $twoFactorConfirmedAt, createdAt: $createdAt, updatedAt: $updatedAt)';
  }

  factory User.fromJson(String str) => User.fromMap(json.decode(str));
  factory User.fromMap(Map<String, dynamic> json) => User(
        id: json["id"],
        name: json["name"],
        email: json["email"],
        phone: json["phone"],
        roles: json["roles"],
        emailVerifiedAt: json["email_verified_at"],
        twoFactorSecret: json["two_factor_secret"],
        twoFactorRecoveryCodes: json["two_factor_recovery_codes"],
        twoFactorConfirmedAt: json["two_factor_confirmed_at"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
      );
  String toJson() => json.encode(toMap());
  Map<String, dynamic> toMap() => {
        "id": id,
        "name": name,
        "email": email,
        "phone": phone,
        "roles": roles,
        "email_verified_at": emailVerifiedAt,
        "two_factor_secret": twoFactorSecret,
        "two_factor_recovery_codes": twoFactorRecoveryCodes,
        "two_factor_confirmed_at": twoFactorConfirmedAt,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
      };

  User copyWith({
    int? id,
    String? name,
    String? email,
    String? phone,
    String? roles,
    dynamic emailVerifiedAt,
    dynamic twoFactorSecret,
    dynamic twoFactorRecoveryCodes,
    dynamic twoFactorConfirmedAt,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) {
    return User(
      id: id ?? this.id,
      name: name ?? this.name,
      email: email ?? this.email,
      phone: phone ?? this.phone,
      roles: roles ?? this.roles,
      emailVerifiedAt: emailVerifiedAt ?? this.emailVerifiedAt,
      twoFactorSecret: twoFactorSecret ?? this.twoFactorSecret,
      twoFactorRecoveryCodes:
          twoFactorRecoveryCodes ?? this.twoFactorRecoveryCodes,
      twoFactorConfirmedAt: twoFactorConfirmedAt ?? this.twoFactorConfirmedAt,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }
}
