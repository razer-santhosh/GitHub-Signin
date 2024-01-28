class DashboardDataModel {
  String? login;
  int? id;
  String? avatarurl;
  String? organizationsurl;
  String? reposurl;
  String? branchesurl;
  String? name;
  String? companyname;

  DashboardDataModel(
      {this.login,
      this.id,
      this.avatarurl,
      this.organizationsurl,
      this.reposurl,
      this.branchesurl,
      this.name,
      this.companyname});

  DashboardDataModel.fromJson(Map<String, dynamic> json) {
    login = json['login'];
    id = json['id'];
    avatarurl = json['avatar_url'];
    organizationsurl = json['organizations_url'];
    reposurl = json['repos_url'];
    branchesurl = json['branches_url'];
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
    data['branches_url'] = branchesurl;
    data['name'] = name;
    data['company'] = companyname;
    return data;
  }
}

class GitRepoModel {
  int? id;
  String? nodeid;
  String? name;
  String? fullname;
  String? htmlurl;
  String? description;
  String? url;
  String? teamsurl;
  String? branchesurl;
  String? commitsurl;
  String? gitcommitsurl;
  String? pullsurl;

  GitRepoModel(
      {this.id,
      this.nodeid,
      this.name,
      this.fullname,
      this.htmlurl,
      this.description,
      this.url,
      this.teamsurl,
      this.branchesurl,
      this.commitsurl,
      this.gitcommitsurl,
      this.pullsurl});

  GitRepoModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    nodeid = json['node_id'];
    name = json['name'];
    fullname = json['full_name'];
    htmlurl = json['html_url'];
    description = json['description'];
    url = json['url'];
    teamsurl = json['teams_url'];
    branchesurl = json['branches_url'];
    commitsurl = json['commits_url'];
    gitcommitsurl = json['git_commits_url'];
    pullsurl = json['pulls_url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['id'] = id;
    data['node_id'] = nodeid;
    data['name'] = name;
    data['full_name'] = fullname;
    data['html_url'] = htmlurl;
    data['description'] = description;
    data['url'] = url;
    data['teams_url'] = teamsurl;
    data['branches_url'] = branchesurl;
    data['commits_url'] = commitsurl;
    data['git_commits_url'] = gitcommitsurl;
    data['pulls_url'] = pullsurl;
    return data;
  }
}
