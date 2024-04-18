class Room {
  int? id;
  String name;
  int? width;
  int? height;
  int? positionX;
  int? positionY;
  String? color;
  double legacyLinkSpeed;
  double legacyLinkStrength;
  double linkSpeed;
  double linkStrength;
  double interference;

  Room({
    this.id,
    required this.name,
    this.width,
    this.height,
    this.positionX,
    this.positionY,
    this.color,
    required this.legacyLinkSpeed,
    required this.legacyLinkStrength,
    required this.linkSpeed,
    required this.linkStrength,
    required this.interference,
  });

  factory Room.fromJson(Map<String, dynamic> json) => Room(
      id: json["id"],
      name: json["name"],
      width: json["width"],
      height: json["height"],
      positionX: json["position_x"],
      positionY: json["position_y"],
      color: json["color"],
      legacyLinkSpeed: json["legacy_link_speed"],
      legacyLinkStrength: json["legacy_link_strength"],
      linkSpeed: json["link_speed"],
      linkStrength: json["link_strength"],
      interference: json["interference"]);

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "name": name,
      "width": width,
      "height": height,
      "position_x": positionX,
      "position_y": positionY,
      "color": color,
      "legacy_link_speed": legacyLinkSpeed,
      "legacy_link_strength": legacyLinkStrength,
      "link_speed": linkSpeed,
      "link_strength": linkStrength,
      "interference": interference
    };
  }
}
