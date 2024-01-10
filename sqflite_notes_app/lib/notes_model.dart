class Notes {
  int? id;
  String name;
  String NotesNo;
  String description;
  String? image; // Add image property

  Notes({
    required this.id,
    required this.name,
    required this.NotesNo,
    required this.description,
    this.image,
  });

  factory Notes.fromMap(Map<String, dynamic> map) {
    return Notes(
      id: map['id'],
      name: map['name'],
      NotesNo: map['NotesNo'],
      description: map['description'],
      image: map['image'], // Include image in the factory method
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'NotesNo': NotesNo,
      'description': description,
      'image': image, // Include image in the toMap method
    };
  }
}
