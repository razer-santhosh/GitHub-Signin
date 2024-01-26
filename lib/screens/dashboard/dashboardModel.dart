class DashboardModel {
  String? login;
  int? id;
  String? avatarurl;
  String? organizationsurl;
  String? reposurl;
  String? name;
  String? companyname;

  DashboardModel(
      {this.login,
      this.id,
      this.avatarurl,
      this.organizationsurl,
      this.reposurl,
      this.name,
      this.companyname});

  DashboardModel.fromJson(Map<String, dynamic> json) {
    login = json['login'];
    id = json['id'];
    avatarurl = json['avatar_url'];
    organizationsurl = json['organizations_url'];
    reposurl = json['repos_url'];
    name = json['name'];
    companyname = json['company'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['login'] = login;
    data['id'] = id;
    data['avatar_url'] = avatarurl;
    data['organizations_url'] = organizationsurl;
    data['repos_url'] = reposurl;
    data['name'] = name;
    data['company'] = companyname;
    return data;
  }
}
