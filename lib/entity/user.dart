import 'package:twitter_login/src/utils.dart';

/// https://developer.twitter.com/en/docs/twitter-api/data-dictionary/object-model/user
class User {
  /// The unique identifier of this user.
  ///
  /// Use this to programmatically retrieve information about a specific Twitter user.
  final int _id;

  /// user email address
  final String? _email;

  /// user profile image
  final String _thumbnailImage;

  /// user name
  final String _name;

  /// user name
  final String _screenName;

  /// other information
  final String _createdAt;
  final bool _defaultProfile;
  final bool _defaultProfileImage;
  final String? _description;
  final int _favouritesCount;
  final int _followersCount;
  final int _friendsCount;
  final String _idStr;
  final int _listedCount;
  final String? _location;
  final bool _protected;
  final int _statusesCount;
  final String? _url;
  final bool _verified;

  /// The unique identifier of this user.
  ///
  /// Use this to programmatically retrieve information about a specific Twitter user.
  int get id => _id;

  /// user email address
  ///
  /// If your Twitter account does not have an email address,
  /// or if the API is not configured to retrieve email addresses,
  /// you may not be able to retrieve email addresses.
  String? get email => _email;

  /// thumbnailImage
  String get thumbnailImage => _thumbnailImage;

  /// Twitter account name
  String get name => _name;

  /// Twitter account id
  String get screenName => _screenName;

  /// The UTC datetime that the user account was created on Twitter. Not ISO 8601. e.g.
  /// ```
  /// "Sat May 09 17:58:22 +0000 2009"
  /// ```
  String get createdAt => _createdAt;

  /// When true, indicates that the user has not altered the theme or background of their user profile.
  bool get defaultProfile => _defaultProfile;

  /// When true, indicates that the user has not uploaded their own profile image and a default image is used instead.
  bool get defaultProfileImage => _defaultProfileImage;

  /// The user-defined UTF-8 string describing their account.
  String? get description => _description;

  /// The number of Tweets this user has liked in the account’s lifetime. British spelling used in the field name for historical reasons.
  int get favouritesCount => _favouritesCount;

  /// The number of followers this account currently has. Under certain conditions of duress, this field will temporarily indicate “0”.
  int get followersCount => _followersCount;

  /// The number of users this account is following (AKA their “followings”). Under certain conditions of duress, this field will temporarily indicate “0”.
  int get friendsCount => _friendsCount;

  /// The string representation of the unique identifier for this User. Implementations should use this rather than the large, possibly un-consumable integer in id.
  String get idStr => _idStr;

  /// The number of public lists that this user is a member of.
  int get listedCount => _listedCount;

  /// The user-defined location for this account’s profile. Not necessarily a location, nor machine-parseable. This field will occasionally be fuzzily interpreted by the Search service.
  String? get location => _location;

  /// When true, indicates that this user has chosen to protect their Tweets.
  bool get protected => _protected;

  /// The number of Tweets (including retweets) issued by the user.
  int get statusesCount => _statusesCount;

  /// A URL provided by the user in association with their profile.
  String? get url => _url;

  /// When true, indicates that the user has a verified account. See [Verified Accounts](https://support.twitter.com/articles/119135-faqs-about-verified-accounts).
  bool get verified => _verified;

  /// constructor
  User(Map<String, dynamic> params)
      : this._id = params['id'],
        this._email = params['email'],
        this._thumbnailImage = params['profile_image_url_https'],
        this._name = params['name'],
        this._screenName = params['screen_name'],
        this._createdAt = params['created_at'],
        this._defaultProfile = params['default_profile'],
        this._defaultProfileImage = params['default_profile_image'],
        this._description = params['description'],
        this._favouritesCount = params['favourites_count'],
        this._followersCount = params['followers_count'],
        this._friendsCount = params['friends_count'],
        this._idStr = params['id_str'],
        this._listedCount = params['listed_count'],
        this._location = params['location'],
        this._protected = params['protected'],
        this._statusesCount = params['statuses_count'],
        this._url = params['url'],
        this._verified = params['verified'];

  /// get user info
  static Future<User> getUserData(
    String apiKey,
    String apiSecretKey,
    String accessToken,
    String accessTokenSecret,
  ) async {
    try {
      final authParams = requestHeader(
        apiKey: apiKey,
        oauthToken: accessToken,
      );
      final params = await httpGet(
        ACCOUNT_VERIFY_URI,
        authParams,
        apiKey,
        apiSecretKey,
        accessTokenSecret,
      );
      return User(params);
    } on Exception catch (error) {
      throw Exception(error);
    }
  }
}
