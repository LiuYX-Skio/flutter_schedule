class HomeVariety {
  List<Data>? data;
  String? msg;
  String? statusCode;

  HomeVariety({this.data, this.msg, this.statusCode});

  HomeVariety.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(new Data.fromJson(v));
      });
    }
    msg = json['msg'];
    statusCode = json['status_code'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    data['msg'] = this.msg;
    data['status_code'] = this.statusCode;
    return data;
  }
}

class Data {
  String? name;
  String? topicsListCode;
  List<TopicsList>? topicsList;

  Data({this.name, this.topicsListCode, this.topicsList});

  Data.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    topicsListCode = json['topicsList_code'];
    if (json['topics_list'] != null) {
      topicsList = <TopicsList>[];
      json['topics_list'].forEach((v) {
        topicsList!.add(new TopicsList.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['topicsList_code'] = this.topicsListCode;
    if (this.topicsList != null) {
      data['topics_list'] = this.topicsList!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class TopicsList {
  String? category;
  String? content;
  int? currentPage;
  int? id;
  int? lastPage;
  String? name;
  int? perPage;
  List<TopicsListDetails>? topicsListDetails;
  int? total;
  String? type;

  TopicsList(
      {this.category,
        this.content,
        this.currentPage,
        this.id,
        this.lastPage,
        this.name,
        this.perPage,
        this.topicsListDetails,
        this.total,
        this.type});

  TopicsList.fromJson(Map<String, dynamic> json) {
    category = json['category'];
    content = json['content'];
    currentPage = json['current_page'];
    id = json['id'];
    lastPage = json['last_page'];
    name = json['name'];
    perPage = json['per_page'];
    if (json['topics_list_details'] != null) {
      topicsListDetails = <TopicsListDetails>[];
      json['topics_list_details'].forEach((v) {
        topicsListDetails!.add(new TopicsListDetails.fromJson(v));
      });
    }
    total = json['total'];
    type = json['type'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['category'] = this.category;
    data['content'] = this.content;
    data['current_page'] = this.currentPage;
    data['id'] = this.id;
    data['last_page'] = this.lastPage;
    data['name'] = this.name;
    data['per_page'] = this.perPage;
    if (this.topicsListDetails != null) {
      data['topics_list_details'] =
          this.topicsListDetails!.map((v) => v.toJson()).toList();
    }
    data['total'] = this.total;
    data['type'] = this.type;
    return data;
  }
}

class TopicsListDetails {
  String? detailImg;
  int? id;
  String? link;
  String? name;
  Null? newTreeTopicsId;
  String? productCode;
  String? songCode;
  Null? topicsIndexId;
  String? treeTopicsCode;
  String? treeTopicsType;
  int? type;

  TopicsListDetails(
      {this.detailImg,
        this.id,
        this.link,
        this.name,
        this.newTreeTopicsId,
        this.productCode,
        this.songCode,
        this.topicsIndexId,
        this.treeTopicsCode,
        this.treeTopicsType,
        this.type});

  TopicsListDetails.fromJson(Map<String, dynamic> json) {
    detailImg = json['detailImg'];
    id = json['id'];
    link = json['link'];
    name = json['name'];
    newTreeTopicsId = json['newTreeTopics_id'];
    productCode = json['product_code'];
    songCode = json['song_code'];
    topicsIndexId = json['topicsIndex_id'];
    treeTopicsCode = json['treeTopics_code'];
    treeTopicsType = json['treeTopics_type'];
    type = json['type'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['detailImg'] = this.detailImg;
    data['id'] = this.id;
    data['link'] = this.link;
    data['name'] = this.name;
    data['newTreeTopics_id'] = this.newTreeTopicsId;
    data['product_code'] = this.productCode;
    data['song_code'] = this.songCode;
    data['topicsIndex_id'] = this.topicsIndexId;
    data['treeTopics_code'] = this.treeTopicsCode;
    data['treeTopics_type'] = this.treeTopicsType;
    data['type'] = this.type;
    return data;
  }
}
