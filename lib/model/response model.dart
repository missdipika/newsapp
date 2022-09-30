class ResponseModel {
  String? status;
  int? totalHits;
  int? page;
  int? totalPages;
  int? pageSize;
  List<Articles>? articles;
  // UserInput? userInput;

  ResponseModel(
      {this.status,
      this.totalHits,
      this.page,
      this.totalPages,
      this.pageSize,
      this.articles,
      // this.userInput
      });

  ResponseModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    totalHits = json['total_hits'];
    page = json['page'];
    totalPages = json['total_pages'];
    pageSize = json['page_size'];
    if (json['articles'] != null) {
      articles = <Articles>[];
      json['articles'].forEach((v) {
        articles!.add( Articles.fromJson(v));
      });
    }
    // userInput = json['user_input'] != null
    //     ?  UserInput.fromJson(json['user_input'])
    //     : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  <String, dynamic>{};
    data['status'] = status;
    data['total_hits'] = totalHits;
    data['page'] = page;
    data['total_pages'] = totalPages;
    data['page_size'] = pageSize;
    if (articles != null) {
      data['articles'] = articles!.map((v) => v.toJson()).toList();
    }
    // if (userInput != null) {
    //   data['user_input'] = userInput!.toJson();
    // }
    return data;
  }
}

class Articles {
  String? title;
  String? author;
  String? publishedDate;
  String? publishedDatePrecision;
  String? link;
  String? cleanUrl;
  String? excerpt;
  String? summary;
  String? rights;
  int? rank;
  String? topic;
  String? country;
  String? language;
  String? authors;
  String? media;
  bool? isOpinion;
  String? twitterAccount;
  double? dScore;
  String? sId;

  Articles(
      {this.title,
      this.author,
      this.publishedDate,
      this.publishedDatePrecision,
      this.link,
      this.cleanUrl,
      this.excerpt,
      this.summary,
      this.rights,
      this.rank,
      this.topic,
      this.country,
      this.language,
      this.authors,
      this.media,
      this.isOpinion,
      this.twitterAccount,
      this.dScore,
      this.sId});

  Articles.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    author = json['author'];
    publishedDate = json['published_date'];
    publishedDatePrecision = json['published_date_precision'];
    link = json['link'];
    cleanUrl = json['clean_url'];
    excerpt = json['excerpt'];
    summary = json['summary'];
    rights = json['rights'];
    rank = json['rank'];
    topic = json['topic'];
    country = json['country'];
    language = json['language'];
    authors = json['authors'];
    media = json['media'];
    isOpinion = json['is_opinion'];
    twitterAccount = json['twitter_account'];
    dScore = json['_score'];
    sId = json['_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  <String, dynamic>{};
    data['title'] = title;
    data['author'] = author;
    data['published_date'] = publishedDate;
    data['published_date_precision'] = publishedDatePrecision;
    data['link'] = link;
    data['clean_url'] = cleanUrl;
    data['excerpt'] = excerpt;
    data['summary'] = summary;
    data['rights'] = rights;
    data['rank'] = rank;
    data['topic'] = topic;
    data['country'] = country;
    data['language'] = language;
    data['authors'] = authors;
    data['media'] = media;
    data['is_opinion'] = isOpinion;
    data['twitter_account'] = twitterAccount;
    data['_score'] = dScore;
    data['_id'] = sId;
    return data;
  }
}

class UserInput {
  String? q;
  List<String>? searchIn;
  String? lang;
  String? notLang;
  List<String>? countries;
  String? notCountries;
  String? from;
  String? to;
  String? rankedOnly;
  String? fromRank;
  String? toRank;
  String? sortBy;
  String? page;
  String? size;
  String? sources;
  String? notSources;
  String? topic;
  String? publishedDatePrecision;

  UserInput(
      {this.q,
      this.searchIn,
      this.lang,
      this.notLang,
      this.countries,
      this.notCountries,
      this.from,
      this.to,
      this.rankedOnly,
      this.fromRank,
      this.toRank,
      this.sortBy,
      this.page,
      this.size,
      this.sources,
      this.notSources,
      this.topic,
      this.publishedDatePrecision});

  UserInput.fromJson(Map<String, dynamic> json) {
    q = json['q'];
    searchIn = json['search_in'].cast<String>();
    lang = json['lang'];
    notLang = json['not_lang'];
    countries = json['countries'].cast<String>();
    notCountries = json['not_countries'];
    from = json['from'];
    to = json['to'];
    rankedOnly = json['ranked_only'];
    fromRank = json['from_rank'];
    toRank = json['to_rank'];
    sortBy = json['sort_by'];
    page = json['page'];
    size = json['size'];
    sources = json['sources'];
    notSources = json['not_sources'];
    topic = json['topic'];
    publishedDatePrecision = json['published_date_precision'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  <String, dynamic>{};
    data['q'] = q;
    data['search_in'] = searchIn;
    data['lang'] = lang;
    data['not_lang'] = notLang;
    data['countries'] = countries;
    data['not_countries'] = notCountries;
    data['from'] = from;
    data['to'] = to;
    data['ranked_only'] = rankedOnly;
    data['from_rank'] = fromRank;
    data['to_rank'] = toRank;
    data['sort_by'] = sortBy;
    data['page'] = page;
    data['size'] = size;
    data['sources'] = sources;
    data['not_sources'] = notSources;
    data['topic'] = topic;
    data['published_date_precision'] = publishedDatePrecision;
    return data;
  }
}