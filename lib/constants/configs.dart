import 'package:flutter/animation.dart';

import 'constants.dart';

class Configs {
  Configs._();

  static const int databaseVersion = 1;
  static const String databaseVersionKey = "dbVersionKey";

  /// keys
  static const Duration maxCacheAge = Duration(minutes: 30);

  static const String dioCacheForceRefreshKey = 'dio_cache_force_refresh_key';
  // Theme key to store and retrieve user preferred theme
  static const String themeModeKey = "theme";
  // Provider key to store and retrieve user preferred provider
  static const String providerKey = "provider";
  // Appcolor key to store and retrieve user preferred appcolor
  static const String appColorKey = "appColor";

  /// API domain url
  static const String domainUrl = "https://api.consumet.org/";
  static const String metaUrl = "meta/anilist/";
  static const String serverUrl = "https://www.cartoon-go.com/go/api_2/";
  static const String searchUrl = "content.php";

  static const String baseUrl = serverUrl;
  static const String trendingUrl = "trending";
  static const String popularUrl = "popular";
  static const String infoUrl = "info";
  static const String watchUrl = "watch";

  /// app colors
  static const List<Map<String, Color>> appColors = [
    {"Aniggo": AppThemeData.primaryColor},
    {"Anilist": Color(0xff3577ff)},
    {"Zoro": Color(0xFFcae962)},
    {"9anime": Color(0xFF5a2e98)},
    {"Animepahe": Color(0xFFd5015b)},
    {"Animefox": Color(0xFFf8af3f)},
    {"PIck": Color(0xffff687c)},
    {"PIck": Color(0xffb43c3c)},
  ];

  /// Anime providers
  static const String siteGogo = "gogoanime";
  static const String siteZoro = "zoro";
  static const String siteAnimePahe = "animePahe";
  static const String siteNineAnime = "9anime";
  static const String siteAnimeFox = "animefox";
  static const String siteAniMixPlay = "animixplay";
  static const String siteEnime = "enime";

  /// List of anime providers
  static const List<String> providerSites = [
    siteZoro,
    siteAnimePahe,
    siteGogo,
  ];

}
