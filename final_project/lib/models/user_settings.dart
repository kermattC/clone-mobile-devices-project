// a class for some user settings

class UserSettings {
  UserSettings() {}
  //  map of all settings
  static Map<String, dynamic> _settings;

  Map<String, dynamic> get settings {
    if (_settings == null) {
      _settings = {
        // option to select if the main feed would be mixed or seperate
        'mix_feeds': false,
        // option to show most interacted topics as fav topics
        'automatic_topics': true,
        // option to allow app to use the user's location
        'allow_location': false,
        // name to display for user
        // temp until we get a login page
        'username': '',
        // immutable keypair that is generated upon initalization of app
        // keys are Ed25519 long-term key pair
        // but we'll make it a simple string for now
        'private_key': '1234567890',
        'public_key': '2233445566',
      };
    }
    return _settings;
  }

  static String getValAsString(String key) {
    if (UserSettings().settings.keys.contains(key)) {
      var returnData = UserSettings().settings[key].toString();
      return returnData;
    }
  }

  static setOption(String key, dynamic val) {
    if (_settings.keys.contains(key)) {
      _settings[key] = val;
    } else {
      print('key is not valid');
    }
  }

  // converts settings map to text objects
  static Map<String, String> toStringMap() {
    return {
      'mix_feeds': _settings['mix_feeds'] ? 'true' : 'false',
      'automatic_topics': _settings['automatic_topics'] ? 'true' : 'false',
      'allow_location': _settings['allow_location'] ? 'true' : 'false',
      'username': _settings['username'],
      'private_key': _settings['private_key'],
      'public_key': _settings['public_key'],
    };
  }

  // translates <str,str> map from db into user settings
  UserSettings.fromMap(Map<String, dynamic> map) {
    map.forEach((key, value) {
      if (_settings.keys.contains(key)) {
        if (value == 'true' || value == 'false') {
          _settings[key] = value == 'true' ? true : false;
        } else {
          _settings[key] = value;
        }
      }
    });
  }
}