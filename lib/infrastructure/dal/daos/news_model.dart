import 'package:getx_clean/domain/core/model/base_model.dart';

import '../../../domain/entities/article.dart';

class NewsModel implements BaseModel {
  String? status;
  int? totalResults;
  List<Articles>? articles;
  NewsModel({this.articles, this.status, this.totalResults});

  @override
  NewsModel fromJson(Map<String, dynamic> data) {
    final articles = <Articles>[];
    if (data['articles'] != null) {
      data['articles'].forEach((v) {
        articles.add(Articles.fromJson(v));
      });
    }
    return NewsModel(
      articles: articles,
      status: data['status'],
      totalResults: data['totalResults'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    data['totalResults'] = totalResults;
    if (articles != null) {
      data['articles'] = articles!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Articles extends ArticleBase {
  Articles.fromJson(Map<String, dynamic> json) {
    author = json['author'];
    title = json['title'];
    description = json['description'];
    url = json['url'];
    urlToImage = json['urlToImage'];
    publishedAt = json['publishedAt'];
    content = json['content'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};

    data['author'] = author;
    data['title'] = title;
    data['description'] = description;
    data['url'] = url;
    data['urlToImage'] = urlToImage;
    data['publishedAt'] = publishedAt;
    data['content'] = content;
    return data;
  }
}

class Source {
  String? id;
  String? name;

  Source({this.id, this.name});

  Source.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    return data;
  }
}
