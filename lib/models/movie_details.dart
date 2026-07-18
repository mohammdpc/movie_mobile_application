import 'package:flutter/cupertino.dart';

/// id : 15
/// url : "https://yts.bz/movies/16-blocks-2006"
/// imdb_code : "tt0450232"
/// title : "16 Blocks"
/// title_english : "16 Blocks"
/// title_long : "16 Blocks (2006)"
/// slug : "16-blocks-2006"
/// year : 2006
/// rating : 6.6
/// runtime : 102
/// genres : ["Action","Crime","Drama","Thriller"]
/// like_count : 55
/// description_intro : "An aging alcoholic cop is assigned the task of escorting a witness from police custody to a courthouse 16 blocks away. There are, however, chaotic forces at work that prevent them from making it in one piece."
/// description_full : "An aging alcoholic cop is assigned the task of escorting a witness from police custody to a courthouse 16 blocks away. There are, however, chaotic forces at work that prevent them from making it in one piece."
/// yt_trailer_code : "55nKvGV0APA"
/// language : "en"
/// mpa_rating : "PG-13"
/// background_image : "https://yts.bz/assets/images/movies/16_Blocks_2006/background.jpg"
/// background_image_original : "https://yts.bz/assets/images/movies/16_Blocks_2006/background.jpg"
/// small_cover_image : "https://yts.bz/assets/images/movies/16_Blocks_2006/small-cover.jpg"
/// medium_cover_image : "https://yts.bz/assets/images/movies/16_Blocks_2006/medium-cover.jpg"
/// large_cover_image : "https://yts.bz/assets/images/movies/16_Blocks_2006/large-cover.jpg"
/// medium_screenshot_image1 : "https://yts.bz/assets/images/movies/16_Blocks_2006/medium-screenshot1.jpg"
/// medium_screenshot_image2 : "https://yts.bz/assets/images/movies/16_Blocks_2006/medium-screenshot2.jpg"
/// medium_screenshot_image3 : "https://yts.bz/assets/images/movies/16_Blocks_2006/medium-screenshot3.jpg"
/// large_screenshot_image1 : "https://yts.bz/assets/images/movies/16_Blocks_2006/large-screenshot1.jpg"
/// large_screenshot_image2 : "https://yts.bz/assets/images/movies/16_Blocks_2006/large-screenshot2.jpg"
/// large_screenshot_image3 : "https://yts.bz/assets/images/movies/16_Blocks_2006/large-screenshot3.jpg"
/// cast : [{"name":"Bruce Willis","character_name":"Det. Jack Mosley","url_small_image":"https://yts.bz/assets/images/actors/thumb/nm0000246.jpg","imdb_code":"0000246"},{"name":"Spencer Kayden","character_name":"Juror","url_small_image":"https://yts.bz/assets/images/actors/thumb/nm0443248.jpg","imdb_code":"0443248"},{"name":"Tig Fong","character_name":"Briggs","url_small_image":"https://yts.bz/assets/images/actors/thumb/nm0284609.jpg","imdb_code":"0284609"},{"name":"Tom Wlaschiha","character_name":"Bus Passenger","url_small_image":"https://yts.bz/assets/images/actors/thumb/nm0937239.jpg","imdb_code":"0937239"}]
/// torrents : [{"url":"https://yts.bz/torrent/download/8619B57A3F39F1B49A1A698EA5400A883928C0A2","hash":"8619B57A3F39F1B49A1A698EA5400A883928C0A2","quality":"720p","type":"bluray","is_repack":"0","video_codec":"x264","bit_depth":"8","audio_channels":"2.0","seeds":4,"peers":0,"size":"702.04 MB","size_bytes":736142295,"date_uploaded":"2015-10-31 20:47:35","date_uploaded_unix":1446320855},{"url":"https://yts.bz/torrent/download/2A4B9A41C92A20A06C8846E66AD9B5BC4B669BC6","hash":"2A4B9A41C92A20A06C8846E66AD9B5BC4B669BC6","quality":"1080p","type":"bluray","is_repack":"0","video_codec":"x264","bit_depth":"8","audio_channels":"2.0","seeds":23,"peers":1,"size":"1.40 GB","size_bytes":1503238554,"date_uploaded":"2015-10-31 20:47:38","date_uploaded_unix":1446320858}]
/// date_uploaded : "2015-10-31 20:47:35"
/// date_uploaded_unix : 1446320855

class MovieDetails {
  MovieDetails({
      this.id, 
      this.url, 
      this.imdbCode, 
      this.title, 
      this.titleEnglish, 
      this.titleLong, 
      this.slug, 
      this.year, 
      this.rating, 
      this.runtime, 
      this.genres, 
      this.likeCount, 
      this.descriptionIntro, 
      this.descriptionFull, 
      this.ytTrailerCode, 
      this.language, 
      this.mpaRating, 
      this.backgroundImage, 
      this.backgroundImageOriginal, 
      this.smallCoverImage, 
      this.mediumCoverImage, 
      this.largeCoverImage, 
      this.mediumScreenshotImage1, 
      this.mediumScreenshotImage2, 
      this.mediumScreenshotImage3, 
      this.largeScreenshotImage1, 
      this.largeScreenshotImage2, 
      this.largeScreenshotImage3, 
      this.cast, 
      this.torrents, 
      this.dateUploaded, 
      this.dateUploadedUnix,});

  MovieDetails.fromJson(dynamic json) {
    id = json["data"]["movie"]['id'];
    url = json["data"]["movie"]['url'];
    imdbCode = json["data"]["movie"]['imdb_code'];
    title = json["data"]["movie"]['title'];
    titleEnglish = json["data"]["movie"]['title_english'];
    titleLong = json["data"]["movie"]['title_long'];
    slug = json["data"]["movie"]['slug'];
    year = json["data"]["movie"]['year'];
    rating = json["data"]["movie"]['rating'].toDouble();
    runtime = json["data"]["movie"]['runtime'];
    genres = json["data"]["movie"]['genres'] != null ? json["data"]["movie"]['genres'].cast<String>() : [];
    likeCount = json["data"]["movie"]['like_count'];
    descriptionIntro = json["data"]["movie"]['description_intro'];
    descriptionFull = json["data"]["movie"]['description_full'];
    ytTrailerCode = json["data"]["movie"]['yt_trailer_code'];
    language = json["data"]["movie"]['language'];
    mpaRating = json["data"]["movie"]['mpa_rating'];
    backgroundImage = json["data"]["movie"]['background_image'];
    backgroundImageOriginal = json["data"]["movie"]['background_image_original'];
    smallCoverImage = json["data"]["movie"]['small_cover_image'];
    mediumCoverImage = json["data"]["movie"]['medium_cover_image'];
    largeCoverImage = json["data"]["movie"]['large_cover_image'];
    mediumScreenshotImage1 = json["data"]["movie"]['medium_screenshot_image1'];
    mediumScreenshotImage2 = json["data"]["movie"]['medium_screenshot_image2'];
    mediumScreenshotImage3 = json["data"]["movie"]['medium_screenshot_image3'];
    largeScreenshotImage1 = json["data"]["movie"]['large_screenshot_image1'];
    largeScreenshotImage2 = json["data"]["movie"]['large_screenshot_image2'];
    largeScreenshotImage3 = json["data"]["movie"]['large_screenshot_image3'];
    if (json["data"]["movie"]['cast'] != null) {
      cast = [];
      json["data"]["movie"]['cast'].forEach((v) {
        cast?.add(Cast.fromJson(v));
      });
    }
    if (json["data"]["movie"]['torrents'] != null) {
      torrents = [];
      json["data"]["movie"]['torrents'].forEach((v) {
        torrents?.add(Torrents.fromJson(v));
      });
    }
    dateUploaded = json["data"]["movie"]['date_uploaded'];
    dateUploadedUnix = json["data"]["movie"]['date_uploaded_unix'];
  }
  int? id;
  String? url;
  String? imdbCode;
  String? title;
  String? titleEnglish;
  String? titleLong;
  String? slug;
  int? year;
  double? rating;
  int? runtime;
  List<String>? genres;
  int? likeCount;
  String? descriptionIntro;
  String? descriptionFull;
  String? ytTrailerCode;
  String? language;
  String? mpaRating;
  String? backgroundImage;
  String? backgroundImageOriginal;
  String? smallCoverImage;
  String? mediumCoverImage;
  String? largeCoverImage;
  String? mediumScreenshotImage1;
  String? mediumScreenshotImage2;
  String? mediumScreenshotImage3;
  String? largeScreenshotImage1;
  String? largeScreenshotImage2;
  String? largeScreenshotImage3;
  List<Cast>? cast;
  List<Torrents>? torrents;
  String? dateUploaded;
  int? dateUploadedUnix;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['url'] = url;
    map['imdb_code'] = imdbCode;
    map['title'] = title;
    map['title_english'] = titleEnglish;
    map['title_long'] = titleLong;
    map['slug'] = slug;
    map['year'] = year;
    map['rating'] = rating;
    map['runtime'] = runtime;
    map['genres'] = genres;
    map['like_count'] = likeCount;
    map['description_intro'] = descriptionIntro;
    map['description_full'] = descriptionFull;
    map['yt_trailer_code'] = ytTrailerCode;
    map['language'] = language;
    map['mpa_rating'] = mpaRating;
    map['background_image'] = backgroundImage;
    map['background_image_original'] = backgroundImageOriginal;
    map['small_cover_image'] = smallCoverImage;
    map['medium_cover_image'] = mediumCoverImage;
    map['large_cover_image'] = largeCoverImage;
    map['medium_screenshot_image1'] = mediumScreenshotImage1;
    map['medium_screenshot_image2'] = mediumScreenshotImage2;
    map['medium_screenshot_image3'] = mediumScreenshotImage3;
    map['large_screenshot_image1'] = largeScreenshotImage1;
    map['large_screenshot_image2'] = largeScreenshotImage2;
    map['large_screenshot_image3'] = largeScreenshotImage3;
    if (cast != null) {
      map['cast'] = cast?.map((v) => v.toJson()).toList();
    }
    if (torrents != null) {
      map['torrents'] = torrents?.map((v) => v.toJson()).toList();
    }
    map['date_uploaded'] = dateUploaded;
    map['date_uploaded_unix'] = dateUploadedUnix;
    return map;
  }

}

/// url : "https://yts.bz/torrent/download/8619B57A3F39F1B49A1A698EA5400A883928C0A2"
/// hash : "8619B57A3F39F1B49A1A698EA5400A883928C0A2"
/// quality : "720p"
/// type : "bluray"
/// is_repack : "0"
/// video_codec : "x264"
/// bit_depth : "8"
/// audio_channels : "2.0"
/// seeds : 4
/// peers : 0
/// size : "702.04 MB"
/// size_bytes : 736142295
/// date_uploaded : "2015-10-31 20:47:35"
/// date_uploaded_unix : 1446320855

class Torrents {
  Torrents({
      this.url, 
      this.hash, 
      this.quality, 
      this.type, 
      this.isRepack, 
      this.videoCodec, 
      this.bitDepth, 
      this.audioChannels, 
      this.seeds, 
      this.peers, 
      this.size, 
      this.sizeBytes, 
      this.dateUploaded, 
      this.dateUploadedUnix,});

  Torrents.fromJson(dynamic json) {
    url = json['url'];
    hash = json['hash'];
    quality = json['quality'];
    type = json['type'];
    isRepack = json['is_repack'];
    videoCodec = json['video_codec'];
    bitDepth = json['bit_depth'];
    audioChannels = json['audio_channels'];
    seeds = json['seeds'];
    peers = json['peers'];
    size = json['size'];
    sizeBytes = json['size_bytes'];
    dateUploaded = json['date_uploaded'];
    dateUploadedUnix = json['date_uploaded_unix'];
  }
  String? url;
  String? hash;
  String? quality;
  String? type;
  String? isRepack;
  String? videoCodec;
  String? bitDepth;
  String? audioChannels;
  int? seeds;
  int? peers;
  String? size;
  int? sizeBytes;
  String? dateUploaded;
  int? dateUploadedUnix;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['url'] = url;
    map['hash'] = hash;
    map['quality'] = quality;
    map['type'] = type;
    map['is_repack'] = isRepack;
    map['video_codec'] = videoCodec;
    map['bit_depth'] = bitDepth;
    map['audio_channels'] = audioChannels;
    map['seeds'] = seeds;
    map['peers'] = peers;
    map['size'] = size;
    map['size_bytes'] = sizeBytes;
    map['date_uploaded'] = dateUploaded;
    map['date_uploaded_unix'] = dateUploadedUnix;
    return map;
  }

}

/// name : "Bruce Willis"
/// character_name : "Det. Jack Mosley"
/// url_small_image : "https://yts.bz/assets/images/actors/thumb/nm0000246.jpg"
/// imdb_code : "0000246"

class Cast {
  Cast({
      this.name, 
      this.characterName, 
      this.urlSmallImage, 
      this.imdbCode,});

  Cast.fromJson(dynamic json) {
    name = json['name'];
    characterName = json['character_name'];
    urlSmallImage = json['url_small_image'];
    imdbCode = json['imdb_code'];
  }
  String? name;
  String? characterName;
  String? urlSmallImage;
  String? imdbCode;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['name'] = name;
    map['character_name'] = characterName;
    map['url_small_image'] = urlSmallImage;
    map['imdb_code'] = imdbCode;
    return map;
  }

}