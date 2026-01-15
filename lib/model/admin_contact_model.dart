class AdminContactModel {
  String? message;
  Data? data;

  AdminContactModel({this.message, this.data});

  AdminContactModel.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  int? id;
  int? alternateNumber;
  int? whatsappNumber;
  String? email;
  String? address;
  String? updated;

  Data(
      {this.id,
        this.alternateNumber,
        this.whatsappNumber,
        this.email,
        this.address,
        this.updated});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    alternateNumber = json['alternate_number'];
    whatsappNumber = json['whatsapp_number'];
    email = json['email'];
    address = json['address'];
    updated = json['updated'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['alternate_number'] = this.alternateNumber;
    data['whatsapp_number'] = this.whatsappNumber;
    data['email'] = this.email;
    data['address'] = this.address;
    data['updated'] = this.updated;
    return data;
  }
}
