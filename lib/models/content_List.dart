class ContentLi {
  final String id;
  final String title;
  final String contentListTitle;
  final String categories;
  final String description;
  final String image;
  final bool isBookmarked;

  ContentLi({
    required this.id,
    required this.title,
    required this.categories,
    required this.contentListTitle,
    required this.image,
    required this.description,
    required this.isBookmarked,
  });

  ContentLi copyWith({
    String? id,
    String? title,
    String? contentListTitle,
    String? categories,
    String? description,
    String? image,
    bool? isBookmarked,
  }) {
    return ContentLi(
      id: id ?? this.id,
      title: title ?? this.title,
      contentListTitle: contentListTitle ?? this.contentListTitle,
      categories: categories ?? this.categories,
      description: description ?? this.description,
      image: image ?? this.image,
      isBookmarked: isBookmarked ?? this.isBookmarked,
    );
  }

  factory ContentLi.fromJson(Map<String, dynamic> pJson) {
    return ContentLi(
      id: pJson['id'],
      title: pJson['title'],
      categories: pJson['categories'],
      contentListTitle: pJson['contentListTitle'],
      image: pJson['image'],
      description: pJson['description'],
      isBookmarked: pJson['isBookmarked'],
    );
  }

  Map<String, dynamic> toJson() => <String, dynamic>{
        'id': id,
        'title': title,
        'categories': categories,
        'contentListTitle': contentListTitle,
        'image': image,
        'description': description,
        'isBookmarked': isBookmarked,
      };
}
