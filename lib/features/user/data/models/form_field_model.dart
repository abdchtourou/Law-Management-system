class FormFieldModel {
  final String key;
  final String? value;
  final String description;
  final String type; // 'text' or 'file'
  final String uuid;
  final bool enabled;
  final List<String>? fileValues; // For file type fields

  FormFieldModel({
    required this.key,
    this.value,
    required this.description,
    required this.type,
    required this.uuid,
    required this.enabled,
    this.fileValues,
  });

  factory FormFieldModel.fromJson(Map<String, dynamic> json) {
    return FormFieldModel(
      key: json['key'] as String,
      value: json['value'] as String?,
      description: json['description'] as String? ?? '',
      type: json['type'] as String,
      uuid: json['uuid'] as String,
      enabled: json['enabled'] as bool? ?? true,
      fileValues: json['value'] is List
          ? (json['value'] as List).map((e) => e.toString()).toList()
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'key': key,
      'value': value ?? (fileValues ?? []),
      'description': description,
      'type': type,
      'uuid': uuid,
      'enabled': enabled,
    };
  }

  bool get isRequired => description.toLowerCase().contains('required');
  bool get isFile => type == 'file';
  bool get isText => type == 'text';
}
