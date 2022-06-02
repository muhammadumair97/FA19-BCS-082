class GroupModel
{
  String? uid;
  String? groupid;
  String? groupName;
  String? amount;

  GroupModel({ this.uid, this.groupid, this.groupName,this.amount
  });
  //receiving data from  server
  factory GroupModel.fromMap(map)
  {
    return GroupModel(
      uid: map['uid'],
      groupid: map['groupid'],
      groupName: map['groupName'],
      amount: map['amount'],

    );
  }

// sending data to our server
  Map<String, dynamic> toMap(){
    return{
      'uid': uid,
      'groupid': groupid,
      'groupName': groupName,
      'amountName': amount,

    };
  }

}