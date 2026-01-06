class ExpertModel {
  final String id;
  final String name;
  final String photoUrl;
  final String specialty; // e.g., "Grapes Expert"

  ExpertModel({required this.id, required this.name, required this.photoUrl, required this.specialty});

  factory ExpertModel.fromJson(Map<String, dynamic> json) {
    return ExpertModel(
      id: json['id'],
      name: json['name'],
      photoUrl: json['photoUrl'],
      specialty: json['specialty'],
    );
  }
}