class MemberModel {
  String? uid;
  String? groupid;
  String? groupName;
  String? email;
  String? phone;

  MemberModel({ this.uid, this.groupid, this.groupName, this.email, this.phone
  });

  //receiving data from  server
  factory MemberModel.fromMap(map)
  {
    return MemberModel(
      uid: map['uid'],
      groupid: map['groupid'],
      groupName: map['groupName'],
      email: map['email'],
      phone: map['phone'],

    );
  }

// sending data to our server
  Map<String, dynamic> toMap() {
    return {
      'uid': uid,
      'groupid': groupid,
      'groupName': groupName,
      'email': email,
      'phone': phone,

    };
  }
}
