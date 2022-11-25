class UserModel {
  final String username;
  final String uid;
  final String profileImageUrl;
  final bool active;
  final int lastSeen;
  final String phoneNumber;
  final List<String> groupId;

  UserModel({
    required this.username,
    required this.uid,
    required this.profileImageUrl,
    required this.active,
    required this.lastSeen,
    required this.phoneNumber,
    required this.groupId,
  });

  Map<String, dynamic> toMap() {
    return {
      'username': username,
      'uid': uid,
      'profileImageUrl': profileImageUrl,
      'active': active,
      'lastSeen': lastSeen,
      'phoneNumber': phoneNumber,
      'groupId': groupId,
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      username: map['username'] ?? '',
      uid: map['uid'] ?? '',
      profileImageUrl: map['profileImageUrl'] ?? '',
      active: map['active'] ?? false,
      lastSeen: map['lastSeen'] ?? 0,
      phoneNumber: map['phoneNumber'] ?? '',
      groupId: List<String>.from(map['groupId']),
    );
  }
}
