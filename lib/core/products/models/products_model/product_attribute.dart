class ProductAttribute {
  final String? code;
  final dynamic value;

  ProductAttribute({this.code, this.value});
  factory ProductAttribute.fromMap(Map<String, dynamic> map) {
    return ProductAttribute(
      code: map["attribute_code"] as String?,
      value: map["value"] as dynamic,
    );
  }
}
