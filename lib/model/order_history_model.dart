class OrderHistoryModel {
  bool? success;
  String? message;
  List<Data>? data;

  OrderHistoryModel({this.success, this.message, this.data});

  OrderHistoryModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    message = json['message'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) { data!.add(new Data.fromJson(v)); });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  int? id;
  String? randomOrderid;
  String? fullName;
  String? diseaseCategory;
  String? deliveryAddress;
  String? whatsappNumber;
  String? alternateNumber;
  String? medicineDuration;
  String? prescriptionFile;
  String? specialInstructions;
  int? status;
  Null? estimatedDeliveryDate;
  String? createdAt;
  String? updatedAt;
  List<Medicines>? medicines;
  Summary? summary;

  Data({this.id, this.randomOrderid, this.fullName, this.diseaseCategory, this.deliveryAddress, this.whatsappNumber, this.alternateNumber, this.medicineDuration, this.prescriptionFile, this.specialInstructions, this.status, this.estimatedDeliveryDate, this.createdAt, this.updatedAt, this.medicines, this.summary});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    randomOrderid = json['random_orderid'];
    fullName = json['full_name'];
    diseaseCategory = json['disease_category'];
    deliveryAddress = json['delivery_address'];
    whatsappNumber = json['whatsapp_number'];
    alternateNumber = json['alternate_number'];
    medicineDuration = json['medicine_duration'];
    prescriptionFile = json['prescription_file'];
    specialInstructions = json['special_instructions'];
    status = json['status'];
    estimatedDeliveryDate = json['estimated_delivery_date'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    if (json['medicines'] != null) {
      medicines = <Medicines>[];
      json['medicines'].forEach((v) { medicines!.add(new Medicines.fromJson(v)); });
    }
    summary = json['summary'] != null ? new Summary.fromJson(json['summary']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['random_orderid'] = this.randomOrderid;
    data['full_name'] = this.fullName;
    data['disease_category'] = this.diseaseCategory;
    data['delivery_address'] = this.deliveryAddress;
    data['whatsapp_number'] = this.whatsappNumber;
    data['alternate_number'] = this.alternateNumber;
    data['medicine_duration'] = this.medicineDuration;
    data['prescription_file'] = this.prescriptionFile;
    data['special_instructions'] = this.specialInstructions;
    data['status'] = this.status;
    data['estimated_delivery_date'] = this.estimatedDeliveryDate;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    if (this.medicines != null) {
      data['medicines'] = this.medicines!.map((v) => v.toJson()).toList();
    }
    if (this.summary != null) {
      data['summary'] = this.summary!.toJson();
    }
    return data;
  }
}

class Medicines {
  String? medicineName;
  int? quantity;
  String? price;
  String? discountPrice;
  String? totalPrice;

  Medicines({this.medicineName, this.quantity, this.price, this.discountPrice, this.totalPrice});

  Medicines.fromJson(Map<String, dynamic> json) {
    medicineName = json['medicine_name'];
    quantity = json['quantity'];
    price = json['price'];
    discountPrice = json['discount_price'];
    totalPrice = json['total_price'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['medicine_name'] = this.medicineName;
    data['quantity'] = this.quantity;
    data['price'] = this.price;
    data['discount_price'] = this.discountPrice;
    data['total_price'] = this.totalPrice;
    return data;
  }
}

class Summary {
  String? original;
  String? discount;
  String? finalAmount; // rename variable

  Summary({this.original, this.discount, this.finalAmount});

  Summary.fromJson(Map<String, dynamic> json) {
    original = json['Original'];
    discount = json['Discount'];
    finalAmount = json['Final']; // map JSON 'Final' to finalAmount
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['Original'] = original;
    data['Discount'] = discount;
    data['Final'] = finalAmount; // map finalAmount back to 'Final'
    return data;
  }
}

