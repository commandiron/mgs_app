import '../model/game_platform.dart';

class GamePlatforms {
  final playstation = GamePlatform(
    id: 0,
    title: "PlayStation",
    logoUrl: "https://upload.wikimedia.org/wikipedia/commons/thumb/4/4e/Playstation_logo_colour.svg/1200px-Playstation_logo_colour.svg.png"
  );
  final playstation2 = GamePlatform(
    id: 1,
    title: "PlayStation 2",
    logoUrl: "https://upload.wikimedia.org/wikipedia/commons/thumb/4/4e/Playstation_logo_colour.svg/1200px-Playstation_logo_colour.svg.png"
  );
  final playstation3 = GamePlatform(
    id: 2,
    title: "PlayStation 3",
    logoUrl: "https://upload.wikimedia.org/wikipedia/commons/thumb/0/05/PlayStation_3_logo_%282009%29.svg/2560px-PlayStation_3_logo_%282009%29.svg.png"
  );
  final playstation4 = GamePlatform(
    id: 3,
    title: "PlayStation 4",
    logoUrl: "https://upload.wikimedia.org/wikipedia/commons/thumb/4/4e/Playstation_logo_colour.svg/1200px-Playstation_logo_colour.svg.png"
  );
  final playstation5 = GamePlatform(
    id: 4,
    title: "PlayStation 5",
    logoUrl: "https://upload.wikimedia.org/wikipedia/commons/thumb/4/4e/Playstation_logo_colour.svg/1200px-Playstation_logo_colour.svg.png"
  );
  final playstationVita = GamePlatform(
    id: 5,
    title: "PlayStation Vita",
    logoUrl: "https://upload.wikimedia.org/wikipedia/commons/thumb/3/3d/PlayStation_Vita_logo.svg/2560px-PlayStation_Vita_logo.svg.png"
  );
  final xBox360 = GamePlatform(
    id: 6,
    title: "XBOX 360",
    logoUrl: "https://static.wikia.nocookie.net/logopedia/images/7/7b/Xbox_360_logo.png/"
  );
  final mobilePhone= GamePlatform(
    id: 7,
    title: "Mobile Phone",
    logoUrl: "https://cdn-icons-png.flaticon.com/512/0/191.png"
  );
  final virtualConsole = GamePlatform(
    id: 8,
    title: "Virtual Console",
    logoUrl: "https://upload.wikimedia.org/wikipedia/commons/b/ba/Wii_Virtual_console_Logo.png"
  );
  final mSX2 = GamePlatform(
    id: 9,
    title: "MSX 2",
    logoUrl: "https://www.msx.org/wiki/images/3/37/MSX2_logo.png"
  );

  GamePlatform fromString(String string) {
    if(string == "PlayStation") {
      return GamePlatforms().playstation;
    }
    if(string == "PlayStation 2") {
      return GamePlatforms().playstation2;
    }
    if(string == "PlayStation 3") {
      return GamePlatforms().playstation3;
    }
    if(string == "PlayStation 4") {
      return GamePlatforms().playstation4;
    }
    if(string == "PlayStation 5") {
      return GamePlatforms().playstation5;
    }
    if(string == "PlayStation Vita") {
      return GamePlatforms().playstationVita;
    }
    if(string == "XBOX 360") {
      return GamePlatforms().xBox360;
    }
    if(string == "Mobile Phone") {
      return GamePlatforms().mobilePhone;
    }
    if(string == "Virtual Console") {
      return GamePlatforms().virtualConsole;
    }
    if(string == "MSX 2") {
      return GamePlatforms().mSX2;
    }
    return GamePlatforms().playstation;
  }
}