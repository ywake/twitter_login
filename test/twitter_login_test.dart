import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:twitter_login/entity/user.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  /// If your Twitter account does not have an email address,
  /// or if the API is not configured to retrieve email addresses,
  /// you may not be able to retrieve email addresses.
  group('user response json parse test', () {
    test('parse', () {
      final resString = """
      {
        "contributors_enabled": true,
        "created_at": "Sat May 09 17:58:22 +0000 2009",
        "default_profile": false,
        "default_profile_image": false,
        "description": "I taught your phone that thing you like.  The Mobile Partner Engineer @Twitter. ",
        "favourites_count": 588,
        "follow_request_sent": null,
        "followers_count": 10625,
        "following": null,
        "friends_count": 1181,
        "geo_enabled": true,
        "id": 38895958,
        "id_str": "38895958",
        "is_translator": false,
        "lang": "en",
        "listed_count": 190,
        "location": "San Francisco",
        "name": "Sean Cook",
        "notifications": null,
        "profile_background_color": "1A1B1F",
        "profile_background_image_url": "http://a0.twimg.com/profile_background_images/495742332/purty_wood.png",
        "profile_background_image_url_https": "https://si0.twimg.com/profile_background_images/495742332/purty_wood.png",
        "profile_background_tile": true,
        "profile_image_url": "http://a0.twimg.com/profile_images/1751506047/dead_sexy_normal.JPG",
        "profile_image_url_https": "https://si0.twimg.com/profile_images/1751506047/dead_sexy_normal.JPG",
        "profile_link_color": "2FC2EF",
        "profile_sidebar_border_color": "181A1E",
        "profile_sidebar_fill_color": "252429",
        "profile_text_color": "666666",
        "profile_use_background_image": true,
        "protected": false,
        "screen_name": "theSeanCook",
        "show_all_inline_media": true,
        "status": {
          "contributors": null,
          "coordinates": {
            "coordinates": [
              -122.45037293,
              37.76484123
            ],
            "type": "Point"
          },
          "created_at": "Tue Aug 28 05:44:24 +0000 2012",
          "favorited": false,
          "geo": {
            "coordinates": [
              37.76484123,
              -122.45037293
            ],
            "type": "Point"
          },
          "id": 240323931419062272,
          "id_str": "240323931419062272",
          "in_reply_to_screen_name": "messl",
          "in_reply_to_status_id": 240316959173009410,
          "in_reply_to_status_id_str": "240316959173009410",
          "in_reply_to_user_id": 18707866,
          "in_reply_to_user_id_str": "18707866",
          "place": {
            "attributes": {},
            "bounding_box": {
              "coordinates": [
                  [
                    [
                      -122.45778216,
                      37.75932999
                    ],
                    [
                      -122.44248216,
                      37.75932999
                    ],
                    [
                      -122.44248216,
                      37.76752899
                    ],
                    [
                      -122.45778216,
                      37.76752899
                    ]
                  ]
                ],
                "type": "Polygon"
              },
              "country": "United States",
              "country_code": "US",
              "full_name": "Ashbury Heights, San Francisco",
              "id": "866269c983527d5a",
              "name": "Ashbury Heights",
              "place_type": "neighborhood",
              "url": "http://api.twitter.com/1/geo/id/866269c983527d5a.json"
          },
          "retweet_count": 0,
          "retweeted": false,
          "source": "Twitter for  iPhone",
          "text": "@messl congrats! So happy for all 3 of you.",
          "truncated": false
        },
        "statuses_count": 2609,
        "time_zone": "Pacific Time (US & Canada)",
        "url": null,
        "utc_offset": -28800,
        "verified": false,
        "email": "test_email@test.com"
      }
      """;
      final json = jsonDecode(resString);

      final user = User(json);
      expect(user is User, isTrue);
      expect(user.id, 38895958);
      expect(user.email, 'test_email@test.com');
      expect(user.thumbnailImage,
          'https://si0.twimg.com/profile_images/1751506047/dead_sexy_normal.JPG');
      expect(user.name, 'Sean Cook');
      expect(user.screenName, 'theSeanCook');
      expect(user.createdAt, 'Sat May 09 17:58:22 +0000 2009');
      expect(user.defaultProfile, isFalse);
      expect(user.defaultProfileImage, isFalse);
      expect(user.description,
          'I taught your phone that thing you like.  The Mobile Partner Engineer @Twitter. ');
      expect(user.favouritesCount, 588);
      expect(user.followersCount, 10625);
      expect(user.friendsCount, 1181);
      expect(user.idStr, '38895958');
      expect(user.listedCount, 190);
      expect(user.location, 'San Francisco');
      expect(user.protected, isFalse);
      expect(user.statusesCount, 2609);
      expect(user.url, isNull);
      expect(user.verified, isFalse);
    });

    test('email is null', () {
      final resString = """
      {
        "contributors_enabled": true,
        "created_at": "Sat May 09 17:58:22 +0000 2009",
        "default_profile": false,
        "default_profile_image": false,
        "description": "I taught your phone that thing you like.  The Mobile Partner Engineer @Twitter. ",
        "favourites_count": 588,
        "followers_count": 10625,
        "following": null,
        "friends_count": 1181,
        "id": 38895958,
        "id_str": "38895958",
        "listed_count": 190,
        "location": "San Francisco",
        "name": "Sean Cook",
        "profile_image_url_https": "https://si0.twimg.com/profile_images/1751506047/dead_sexy_normal.JPG",
        "protected": false,
        "screen_name": "theSeanCook",
        "statuses_count": 2609,
        "url": null,
        "verified": false
      }
      """;
      final json = jsonDecode(resString);

      final user = User(json);
      expect(user is User, isTrue);
      expect(user.email, isNull);
    });

    test('description is null', () {
      final resString = """
      {
        "contributors_enabled": true,
        "created_at": "Sat May 09 17:58:22 +0000 2009",
        "default_profile": false,
        "default_profile_image": false,
        "description": null,
        "favourites_count": 588,
        "followers_count": 10625,
        "following": null,
        "friends_count": 1181,
        "id": 38895958,
        "id_str": "38895958",
        "listed_count": 190,
        "location": "San Francisco",
        "name": "Sean Cook",
        "profile_image_url_https": "https://si0.twimg.com/profile_images/1751506047/dead_sexy_normal.JPG",
        "protected": false,
        "screen_name": "theSeanCook",
        "statuses_count": 2609,
        "url": null,
        "verified": false
      }
      """;
      final json = jsonDecode(resString);

      final user = User(json);
      expect(user is User, isTrue);
      expect(user.description, isNull);
    });

    test('location is null', () {
      final resString = """
      {
        "contributors_enabled": true,
        "created_at": "Sat May 09 17:58:22 +0000 2009",
        "default_profile": false,
        "default_profile_image": false,
        "description": null,
        "favourites_count": 588,
        "followers_count": 10625,
        "following": null,
        "friends_count": 1181,
        "id": 38895958,
        "id_str": "38895958",
        "listed_count": 190,
        "location": null,
        "name": "Sean Cook",
        "profile_image_url_https": "https://si0.twimg.com/profile_images/1751506047/dead_sexy_normal.JPG",
        "protected": false,
        "screen_name": "theSeanCook",
        "statuses_count": 2609,
        "url": null,
        "verified": false
      }
      """;
      final json = jsonDecode(resString);

      final user = User(json);
      expect(user is User, isTrue);
      expect(user.location, isNull);
    });

    test('url is null', () {
      final resString = """
      {
        "contributors_enabled": true,
        "created_at": "Sat May 09 17:58:22 +0000 2009",
        "default_profile": false,
        "default_profile_image": false,
        "description": null,
        "favourites_count": 588,
        "followers_count": 10625,
        "following": null,
        "friends_count": 1181,
        "id": 38895958,
        "id_str": "38895958",
        "listed_count": 190,
        "location": null,
        "name": "Sean Cook",
        "profile_image_url_https": "https://si0.twimg.com/profile_images/1751506047/dead_sexy_normal.JPG",
        "protected": false,
        "screen_name": "theSeanCook",
        "statuses_count": 2609,
        "url": null,
        "verified": false
      }
      """;
      final json = jsonDecode(resString);

      final user = User(json);
      expect(user is User, isTrue);
      expect(user.url, isNull);
    });
  });
}
