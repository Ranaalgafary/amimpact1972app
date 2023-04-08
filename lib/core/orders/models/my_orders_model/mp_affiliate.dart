import 'dart:convert';

class MpAffiliate {
  dynamic affiliateCommission;
  dynamic affiliateDiscountAmount;
  dynamic baseAffiliateDiscountAmount;

  MpAffiliate({
    this.affiliateCommission,
    this.affiliateDiscountAmount,
    this.baseAffiliateDiscountAmount,
  });

  factory MpAffiliate.fromMap(Map<String, dynamic> data) => MpAffiliate(
        affiliateCommission: data['affiliate_commission'] as dynamic,
        affiliateDiscountAmount: data['affiliate_discount_amount'] as dynamic,
        baseAffiliateDiscountAmount:
            data['base_affiliate_discount_amount'] as dynamic,
      );

  Map<String, dynamic> toMap() => {
        'affiliate_commission': affiliateCommission,
        'affiliate_discount_amount': affiliateDiscountAmount,
        'base_affiliate_discount_amount': baseAffiliateDiscountAmount,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [MpAffiliate].
  factory MpAffiliate.fromJson(String data) {
    return MpAffiliate.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [MpAffiliate] to a JSON string.
  String toJson() => json.encode(toMap());
}
