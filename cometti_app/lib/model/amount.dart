class AmountModel {
  String? uid;
  String? groupid;
  String? groupName;
  String? email;
  String? amount;

  AmountModel({ this.uid, this.groupid, this.groupName, this.email, this.amount
  });

  //receiving data from  server
  factory AmountModel.fromMap(map)
  {
    return AmountModel(
      uid: map['uid'],
      groupid: map['groupid'],
      groupName: map['groupName'],
      email: map['email'],
      amount: map['amount'],

    );
  }

// sending data to our server
  Map<String, dynamic> toMap() {
    return {
      'uid': uid,
      'groupid': groupid,
      'groupName': groupName,
      'email': email,
      'amountName': amount,

    };
  }
}
