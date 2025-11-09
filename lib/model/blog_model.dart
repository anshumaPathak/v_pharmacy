// // class BlogModel {
// //   bool? status;
// //   String? language;
// //   List<Data>? data;
// //
// //   BlogModel({this.status, this.language, this.data});
// //
// //   BlogModel.fromJson(Map<String, dynamic> json) {
// //     status = json['status'];
// //     language = json['language'];
// //     if (json['data'] != null) {
// //       data = <Data>[];
// //       json['data'].forEach((v) {
// //         data!.add(new Data.fromJson(v));
// //       });
// //     }
// //   }
// //
// //   Map<String, dynamic> toJson() {
// //     final Map<String, dynamic> data = new Map<String, dynamic>();
// //     data['status'] = this.status;
// //     data['language'] = this.language;
// //     if (this.data != null) {
// //       data['data'] = this.data!.map((v) => v.toJson()).toList();
// //     }
// //     return data;
// //   }
// // }
// //
// // class Data {
// //   int? id;
// //   String? title;
// //   String? description;
// //   String? image;
// //   String? language;
// //   String? createdAt;
// //   String? updatedAt;
// //
// //   Data(
// //       {this.id,
// //         this.title,
// //         this.description,
// //         this.image,
// //         this.language,
// //         this.createdAt,
// //         this.updatedAt});
// //
// //   Data.fromJson(Map<String, dynamic> json) {
// //     id = json['id'];
// //     title = json['title'];
// //     description = json['description'];
// //     image = json['image'];
// //     language = json['language'];
// //     createdAt = json['created_at'];
// //     updatedAt = json['updated_at'];
// //   }
// //
// //   Map<String, dynamic> toJson() {
// //     final Map<String, dynamic> data = <String, dynamic>{};
// //     data['id'] = this.id;
// //     data['title'] = this.title;
// //     data['description'] = this.description;
// //     data['image'] = this.image;
// //     data['language'] = this.language;
// //     data['created_at'] = this.createdAt;
// //     data['updated_at'] = this.updatedAt;
// //     return data;
// //   }
// // }
// class BlogModel {
//   bool? status;
//   String? language;
//   List<Data>? data;
//
//   BlogModel({this.status, this.language, this.data});
//
//   BlogModel.fromJson(Map<String, dynamic> json) {
//     status = json['status'];
//     language = json['language'];
//     if (json['data'] != null) {
//       data = <Data>[];
//       json['data'].forEach((v) {
//         data!.add(new Data.fromJson(v));
//       });
//     }
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['status'] = this.status;
//     data['language'] = this.language;
//     if (this.data != null) {
//       data['data'] = this.data!.map((v) => v.toJson()).toList();
//     }
//     return data;
//   }
// }
//
// class Data {
//   int? id;
//   String? title;
//   String? description;
//   String? image;
//   String? language;
//   String? seoTittel;
//   String? seoDiscription;
//   String? seoTag;
//   String? createdAt;
//   String? updatedAt;
//
//   Data(
//       {this.id,
//         this.title,
//         this.description,
//         this.image,
//         this.language,
//         this.seoTittel,
//         this.seoDiscription,
//         this.seoTag,
//         this.createdAt,
//         this.updatedAt});
//
//   Data.fromJson(Map<String, dynamic> json) {
//     id = json['id'];
//     title = json['title'];
//     description = json['description'];
//     image = json['image'];
//     language = json['language'];
//     seoTittel = json['seo_tittel'];
//     seoDiscription = json['seo_discription'];
//     seoTag = json['seo_tag'];
//     createdAt = json['created_at'];
//     updatedAt = json['updated_at'];
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['id'] = this.id;
//     data['title'] = this.title;
//     data['description'] = this.description;
//     data['image'] = this.image;
//     data['language'] = this.language;
//     data['seo_tittel'] = this.seoTittel;
//     data['seo_discription'] = this.seoDiscription;
//     data['seo_tag'] = this.seoTag;
//     data['created_at'] = this.createdAt;
//     data['updated_at'] = this.updatedAt;
//     return data;
//   }
// }
class BlogModel {
  String? message;
  String? language;
  List<BlogData>? data;

  BlogModel({this.message, this.language, this.data});

  BlogModel.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    language = json['language'];
    if (json['data'] != null) {
      data = <BlogData>[];
      json['data'].forEach((v) {
        data!.add(BlogData.fromJson(v));
      });
    }
  }
}

class BlogData {
  int? id;
  String? title;
  String? description;
  String? image;
  String? language;
  String? seoTittel;
  String? seoDiscription;
  String? seoTag;
  String? slug;
  String? createdAt;
  String? updatedAt;

  BlogData(
      {this.id,
        this.title,
        this.description,
        this.image,
        this.language,
        this.seoTittel,
        this.seoDiscription,
        this.seoTag,
        this.slug,
        this.createdAt,
        this.updatedAt});

  BlogData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    description = json['description'];
    image = json['image'];
    language = json['language'];
    seoTittel = json['seo_tittel'];
    seoDiscription = json['seo_discription'];
    seoTag = json['seo_tag'];
    slug = json['slug'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }
}
