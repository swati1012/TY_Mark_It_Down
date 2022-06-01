final String tableAddCategory = 'category';

class category_field {
  static final List<String> values = [
    //add all fields
    cat_id, description, category,
  ];

  static final String cat_id = '_id';
  static final String description = 'description';
  static final String category = 'category';
}

class Category {
  int cat_id;
  String description;
  String category;
  Category({
    this.cat_id,
    this.description,
    this.category,
  });

  Map<String, Object> toJson() => {
        category_field.cat_id: cat_id,
        category_field.description: description,
        category_field.category: category,
      };

  Category copy({
    int cat_id,
    String description,
    String category,
  }) =>
      Category(
        cat_id: cat_id ?? this.cat_id,
        description: description ?? this.description,
        category: category ?? this.category,
      );

  static Category fromJson(Map<String, Object> json) => Category(
        cat_id: json[category_field.cat_id] as int,
        description: json[category_field.description] as String,
        category: json[category_field.category] as String,
      );
}
