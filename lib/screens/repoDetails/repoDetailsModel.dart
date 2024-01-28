class BranchCommitsModel {
  String name;
  InnerCommit commit;

  BranchCommitsModel({required this.name, required this.commit});

  factory BranchCommitsModel.fromJson(Map<String, dynamic> json) {
    return BranchCommitsModel(
      name: json['name'],
      commit: InnerCommit.fromJson(json['commit']['commit']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'commit': commit.toJson(),
    };
  }
}

class InnerCommit {
  Committer committer;
  String message;

  InnerCommit({required this.committer, required this.message});

  factory InnerCommit.fromJson(Map<String, dynamic> json) {
    return InnerCommit(
      committer: Committer.fromJson(json['committer']),
      message: json['message'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'committer': committer.toJson(),
      'message': message,
    };
  }
}

class Committer {
  String name;
  String email;
  String date;

  Committer({required this.name, required this.email, required this.date});

  factory Committer.fromJson(Map<String, dynamic> json) {
    return Committer(
      name: json['name'],
      email: json['email'],
      date: json['date'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'email': email,
      'date': date,
    };
  }
}
