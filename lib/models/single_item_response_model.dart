// // To parse this JSON data, do
// //
// //     final singleItemResponseModel = singleItemResponseModelFromJson(jsonString);
//
// import 'dart:convert';
//
// SingleItemResponseModel singleItemResponseModelFromJson(String str) => SingleItemResponseModel.fromJson(json.decode(str));
//
// String singleItemResponseModelToJson(SingleItemResponseModel data) => json.encode(data.toJson());
//
// class SingleItemResponseModel {
//     SingleItemResponseModel({
//         this.status,
//         this.error,
//         this.data,
//     });
//
//     bool status;
//     dynamic error;
//     Data data;
//
//     factory SingleItemResponseModel.fromJson(Map<String, dynamic> json) => SingleItemResponseModel(
//         status: json["status"],
//         error: json["error"],
//         data: Data.fromJson(json["data"]),
//     );
//
//     Map<String, dynamic> toJson() => {
//         "status": status,
//         "error": error,
//         "data": data.toJson(),
//     };
// }
//
// class Data {
//     Data({
//         this.iTotalRecords,
//         this.aaData,
//     });
//
//     int iTotalRecords;
//     List<AaDatumSM> aaData;
//
//     factory Data.fromJson(Map<String, dynamic> json) => Data(
//         iTotalRecords: json["iTotalRecords"],
//         aaData: List<AaDatumSM>.from(json["aaData"].map((x) => AaDatumSM.fromJson(x))),
//     );
//
//     Map<String, dynamic> toJson() => {
//         "iTotalRecords": iTotalRecords,
//         "aaData": List<dynamic>.from(aaData.map((x) => x.toJson())),
//     };
// }
//
// class AaDatumSM {
//     AaDatumSM({
//         this.id,
//         this.eventId,
//         this.eventSubId,
//         this.guestId,
//         this.date,
//         this.rate,
//         this.quantity,
//         this.total,
//         this.transactionId,
//         this.status,
//         this.createdAt,
//         this.uid,
//         this.bookingUid,
//         this.updatedAt,
//         this.bookedBy,
//         this.paymentMethod,
//         this.notes,
//         this.minSpend,
//         this.arrivedAt,
//         this.checkinStatus,
//         this.firstName,
//         this.lastName,
//         this.nationality,
//         this.email,
//         this.staff,
//         this.gId,
//         this.addon,
//         this.events,
//     });
//
//     String id;
//     String eventId;
//     String eventSubId;
//     String guestId;
//     DateTime date;
//     String rate;
//     String quantity;
//     String total;
//     String transactionId;
//     String status;
//     DateTime createdAt;
//     String uid;
//     String bookingUid;
//     DateTime updatedAt;
//     dynamic bookedBy;
//     dynamic paymentMethod;
//     dynamic notes;
//     dynamic minSpend;
//     dynamic arrivedAt;
//     String checkinStatus;
//     String firstName;
//     dynamic lastName;
//     dynamic nationality;
//     String email;
//     String staff;
//     String gId;
//     List<dynamic> addon;
//     List<EventSM> events;
//
//     factory AaDatumSM.fromJson(Map<String, dynamic> json) => AaDatumSM(
//         id: json["id"],
//         eventId: json["event_id"],
//         eventSubId: json["event_sub_id"],
//         guestId: json["guest_id"],
//         date: DateTime.parse(json["date"]),
//         rate: json["rate"],
//         quantity: json["quantity"],
//         total: json["total"],
//         transactionId: json["transaction_id"],
//         status: json["status"],
//         createdAt: DateTime.parse(json["created_at"]),
//         uid: json["uid"],
//         bookingUid: json["booking_uid"],
//         updatedAt: DateTime.parse(json["updated_at"]),
//         bookedBy: json["booked_by"],
//         paymentMethod: json["payment_method"],
//         notes: json["notes"],
//         minSpend: json["min_spend"],
//         arrivedAt: json["arrived_at"],
//         checkinStatus: json["checkin_status"],
//         firstName: json["first_name"],
//         lastName: json["last_name"],
//         nationality: json["nationality"],
//         email: json["email"],
//         staff: json["staff"],
//         gId: json["g_id"],
//         addon: List<dynamic>.from(json["addon"].map((x) => x)),
//         events: List<EventSM>.from(json["events"].map((x) => EventSM.fromJson(x))),
//     );
//
//     Map<String, dynamic> toJson() => {
//         "id": id,
//         "event_id": eventId,
//         "event_sub_id": eventSubId,
//         "guest_id": guestId,
//         "date": date.toIso8601String(),
//         "rate": rate,
//         "quantity": quantity,
//         "total": total,
//         "transaction_id": transactionId,
//         "status": status,
//         "created_at": createdAt.toIso8601String(),
//         "uid": uid,
//         "booking_uid": bookingUid,
//         "updated_at": updatedAt.toIso8601String(),
//         "booked_by": bookedBy,
//         "payment_method": paymentMethod,
//         "notes": notes,
//         "min_spend": minSpend,
//         "arrived_at": arrivedAt,
//         "checkin_status": checkinStatus,
//         "first_name": firstName,
//         "last_name": lastName,
//         "nationality": nationality,
//         "email": email,
//         "staff": staff,
//         "g_id": gId,
//         "addon": List<dynamic>.from(addon.map((x) => x)),
//         "events": List<dynamic>.from(events.map((x) => x.toJson())),
//     };
// }
//
// class EventSM {
//     EventSM({
//         this.id,
//         this.type,
//         this.name,
//         this.description,
//         this.startDate,
//         this.deadline,
//         this.capacity,
//         this.thumbnail,
//         this.status,
//         this.updatedAt,
//         this.special,
//         this.dates,
//         this.banner,
//         this.slug,
//         this.endDate,
//         this.images,
//         this.eventId,
//         this.subName,
//         this.subRate,
//         this.subCurrency,
//         this.subDescription,
//         this.subCapacity,
//         this.remaining,
//         this.createdAt,
//         this.isFree,
//         this.eventSubId,
//         this.guestId,
//         this.date,
//         this.rate,
//         this.quantity,
//         this.total,
//         this.transactionId,
//         this.uid,
//         this.bookingUid,
//         this.bookedBy,
//         this.paymentMethod,
//         this.notes,
//         this.minSpend,
//         this.arrivedAt,
//         this.checkinStatus,
//     });
//
//     String id;
//     String type;
//     String name;
//     String description;
//     DateTime startDate;
//     DateTime deadline;
//     String capacity;
//     String thumbnail;
//     String status;
//     DateTime updatedAt;
//     String special;
//     dynamic dates;
//     String banner;
//     String slug;
//     dynamic endDate;
//     String images;
//     String eventId;
//     String subName;
//     String subRate;
//     String subCurrency;
//     String subDescription;
//     String subCapacity;
//     String remaining;
//     DateTime createdAt;
//     String isFree;
//     String eventSubId;
//     String guestId;
//     DateTime date;
//     String rate;
//     String quantity;
//     String total;
//     String transactionId;
//     String uid;
//     String bookingUid;
//     dynamic bookedBy;
//     dynamic paymentMethod;
//     dynamic notes;
//     dynamic minSpend;
//     dynamic arrivedAt;
//     String checkinStatus;
//
//     factory EventSM.fromJson(Map<String, dynamic> json) => EventSM(
//         id: json["id"],
//         type: json["type"],
//         name: json["name"],
//         description: json["description"],
//         startDate: DateTime.parse(json["start_date"]),
//         deadline: DateTime.parse(json["deadline"]),
//         capacity: json["capacity"],
//         thumbnail: json["thumbnail"],
//         status: json["status"],
//         updatedAt: DateTime.parse(json["updated_at"]),
//         special: json["special"],
//         dates: json["dates"],
//         banner: json["banner"],
//         slug: json["slug"],
//         endDate: json["end_date"],
//         images: json["images"],
//         eventId: json["event_id"],
//         subName: json["sub_name"],
//         subRate: json["sub_rate"],
//         subCurrency: json["sub_currency"],
//         subDescription: json["sub_description"],
//         subCapacity: json["sub_capacity"],
//         remaining: json["remaining"],
//         createdAt: DateTime.parse(json["created_at"]),
//         isFree: json["is_free"],
//         eventSubId: json["event_sub_id"],
//         guestId: json["guest_id"],
//         date: DateTime.parse(json["date"]),
//         rate: json["rate"],
//         quantity: json["quantity"],
//         total: json["total"],
//         transactionId: json["transaction_id"],
//         uid: json["uid"],
//         bookingUid: json["booking_uid"],
//         bookedBy: json["booked_by"],
//         paymentMethod: json["payment_method"],
//         notes: json["notes"],
//         minSpend: json["min_spend"],
//         arrivedAt: json["arrived_at"],
//         checkinStatus: json["checkin_status"],
//     );
//
//     Map<String, dynamic> toJson() => {
//         "id": id,
//         "type": type,
//         "name": name,
//         "description": description,
//         "start_date": startDate.toIso8601String(),
//         "deadline": deadline.toIso8601String(),
//         "capacity": capacity,
//         "thumbnail": thumbnail,
//         "status": status,
//         "updated_at": updatedAt.toIso8601String(),
//         "special": special,
//         "dates": dates,
//         "banner": banner,
//         "slug": slug,
//         "end_date": endDate,
//         "images": images,
//         "event_id": eventId,
//         "sub_name": subName,
//         "sub_rate": subRate,
//         "sub_currency": subCurrency,
//         "sub_description": subDescription,
//         "sub_capacity": subCapacity,
//         "remaining": remaining,
//         "created_at": createdAt.toIso8601String(),
//         "is_free": isFree,
//         "event_sub_id": eventSubId,
//         "guest_id": guestId,
//         "date": date.toIso8601String(),
//         "rate": rate,
//         "quantity": quantity,
//         "total": total,
//         "transaction_id": transactionId,
//         "uid": uid,
//         "booking_uid": bookingUid,
//         "booked_by": bookedBy,
//         "payment_method": paymentMethod,
//         "notes": notes,
//         "min_spend": minSpend,
//         "arrived_at": arrivedAt,
//         "checkin_status": checkinStatus,
//     };
// }
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
// // // // To parse this JSON data, do
// // // //
// // // //     final singleItemResponseModel = singleItemResponseModelFromJson(jsonString);
//
// // // import 'dart:convert';
//
// // // SingleItemResponseModel singleItemResponseModelFromJson(String str) => SingleItemResponseModel.fromJson(json.decode(str));
//
// // // String singleItemResponseModelToJson(SingleItemResponseModel data) => json.encode(data.toJson());
//
// // // class SingleItemResponseModel {
// // //     SingleItemResponseModel({
// // //         this.status,
// // //         this.error,
// // //         this.data,
// // //     });
//
// // //     bool status;
// // //     dynamic error;
// // //     Data data;
//
// // //     factory SingleItemResponseModel.fromJson(Map<String, dynamic> json) => SingleItemResponseModel(
// // //         status: json["status"],
// // //         error: json["error"],
// // //         data: Data.fromJson(json["data"]),
// // //     );
//
// // //     Map<String, dynamic> toJson() => {
// // //         "status": status,
// // //         "error": error,
// // //         "data": data.toJson(),
// // //     };
// // // }
//
// // // class Data {
// // //     Data({
// // //         this.iTotalRecords,
// // //         this.aaData,
// // //     });
//
// // //     String iTotalRecords;
// // //     List<AaDatum> aaData;
//
// // //     factory Data.fromJson(Map<String, dynamic> json) => Data(
// // //         iTotalRecords: json["iTotalRecords"],
// // //         aaData: List<AaDatum>.from(json["aaData"].map((x) => AaDatum.fromJson(x))),
// // //     );
//
// // //     Map<String, dynamic> toJson() => {
// // //         "iTotalRecords": iTotalRecords,
// // //         "aaData": List<dynamic>.from(aaData.map((x) => x.toJson())),
// // //     };
// // // }
//
// // // class AaDatum {
// // //     AaDatum({
// // //         this.events,
// // //     });
//
// // //     List<Event> events;
//
// // //     factory AaDatum.fromJson(Map<String, dynamic> json) => AaDatum(
// // //         events: List<Event>.from(json["events"].map((x) => Event.fromJson(x))),
// // //     );
//
// // //     Map<String, dynamic> toJson() => {
// // //         "events": List<dynamic>.from(events.map((x) => x.toJson())),
// // //     };
// // // }
//
// // // class Event {
// // //     Event({
// // //         this.id,
// // //         this.type,
// // //         this.name,
// // //         this.description,
// // //         this.startDate,
// // //         this.deadline,
// // //         this.capacity,
// // //         this.thumbnail,
// // //         this.status,
// // //         this.updatedAt,
// // //         this.special,
// // //         this.dates,
// // //         this.banner,
// // //         this.slug,
// // //         this.endDate,
// // //         this.images,
// // //         this.eventId,
// // //         this.subName,
// // //         this.subRate,
// // //         this.subCurrency,
// // //         this.subDescription,
// // //         this.subCapacity,
// // //         this.remaining,
// // //         this.createdAt,
// // //         this.isFree,
// // //         this.eventSubId,
// // //         this.guestId,
// // //         this.date,
// // //         this.rate,
// // //         this.quantity,
// // //         this.total,
// // //         this.transactionId,
// // //         this.uid,
// // //         this.bookingUid,
// // //         this.bookedBy,
// // //         this.paymentMethod,
// // //         this.notes,
// // //         this.minSpend,
// // //         this.arrivedAt,
// // //         this.checkinStatus,
// // //     });
//
// // //     String id;
// // //     String type;
// // //     String name;
// // //     String description;
// // //     DateTime startDate;
// // //     DateTime deadline;
// // //     String capacity;
// // //     String thumbnail;
// // //     String status;
// // //     DateTime updatedAt;
// // //     String special;
// // //     dynamic dates;
// // //     String banner;
// // //     String slug;
// // //     dynamic endDate;
// // //     String images;
// // //     String eventId;
// // //     String subName;
// // //     String subRate;
// // //     String subCurrency;
// // //     String subDescription;
// // //     String subCapacity;
// // //     String remaining;
// // //     DateTime createdAt;
// // //     String isFree;
// // //     String eventSubId;
// // //     String guestId;
// // //     DateTime date;
// // //     String rate;
// // //     String quantity;
// // //     String total;
// // //     String transactionId;
// // //     String uid;
// // //     String bookingUid;
// // //     dynamic bookedBy;
// // //     dynamic paymentMethod;
// // //     dynamic notes;
// // //     dynamic minSpend;
// // //     dynamic arrivedAt;
// // //     String checkinStatus;
//
// // //     factory Event.fromJson(Map<String, dynamic> json) => Event(
// // //         id: json["id"],
// // //         type: json["type"],
// // //         name: json["name"],
// // //         description: json["description"],
// // //         startDate: DateTime.parse(json["start_date"]),
// // //         deadline: DateTime.parse(json["deadline"]),
// // //         capacity: json["capacity"],
// // //         thumbnail: json["thumbnail"],
// // //         status: json["status"],
// // //         updatedAt: DateTime.parse(json["updated_at"]),
// // //         special: json["special"],
// // //         dates: json["dates"],
// // //         banner: json["banner"],
// // //         slug: json["slug"],
// // //         endDate: json["end_date"],
// // //         images: json["images"],
// // //         eventId: json["event_id"],
// // //         subName: json["sub_name"],
// // //         subRate: json["sub_rate"],
// // //         subCurrency: json["sub_currency"],
// // //         subDescription: json["sub_description"],
// // //         subCapacity: json["sub_capacity"],
// // //         remaining: json["remaining"],
// // //         createdAt: DateTime.parse(json["created_at"]),
// // //         isFree: json["is_free"],
// // //         eventSubId: json["event_sub_id"],
// // //         guestId: json["guest_id"],
// // //         date: DateTime.parse(json["date"]),
// // //         rate: json["rate"],
// // //         quantity: json["quantity"],
// // //         total: json["total"],
// // //         transactionId: json["transaction_id"],
// // //         uid: json["uid"],
// // //         bookingUid: json["booking_uid"],
// // //         bookedBy: json["booked_by"],
// // //         paymentMethod: json["payment_method"],
// // //         notes: json["notes"],
// // //         minSpend: json["min_spend"],
// // //         arrivedAt: json["arrived_at"],
// // //         checkinStatus: json["checkin_status"],
// // //     );
//
// // //     Map<String, dynamic> toJson() => {
// // //         "id": id,
// // //         "type": type,
// // //         "name": name,
// // //         "description": description,
// // //         "start_date": startDate.toIso8601String(),
// // //         "deadline": deadline.toIso8601String(),
// // //         "capacity": capacity,
// // //         "thumbnail": thumbnail,
// // //         "status": status,
// // //         "updated_at": updatedAt.toIso8601String(),
// // //         "special": special,
// // //         "dates": dates,
// // //         "banner": banner,
// // //         "slug": slug,
// // //         "end_date": endDate,
// // //         "images": images,
// // //         "event_id": eventId,
// // //         "sub_name": subName,
// // //         "sub_rate": subRate,
// // //         "sub_currency": subCurrency,
// // //         "sub_description": subDescription,
// // //         "sub_capacity": subCapacity,
// // //         "remaining": remaining,
// // //         "created_at": createdAt.toIso8601String(),
// // //         "is_free": isFree,
// // //         "event_sub_id": eventSubId,
// // //         "guest_id": guestId,
// // //         "date": date.toIso8601String(),
// // //         "rate": rate,
// // //         "quantity": quantity,
// // //         "total": total,
// // //         "transaction_id": transactionId,
// // //         "uid": uid,
// // //         "booking_uid": bookingUid,
// // //         "booked_by": bookedBy,
// // //         "payment_method": paymentMethod,
// // //         "notes": notes,
// // //         "min_spend": minSpend,
// // //         "arrived_at": arrivedAt,
// // //         "checkin_status": checkinStatus,
// // //     };
// // // }
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
// // // To parse this JSON data, do
// // //
// // //     final singleItemResponseModel = singleItemResponseModelFromJson(jsonString);
//
// // import 'dart:convert';
//
// // SingleItemResponseModel singleItemResponseModelFromJson(String str) =>
// //     SingleItemResponseModel.fromJson(json.decode(str));
//
// // String singleItemResponseModelToJson(SingleItemResponseModel data) =>
// //     json.encode(data.toJson());
//
// // class SingleItemResponseModel {
// //   SingleItemResponseModel({
// //     this.status,
// //     this.error,
// //     this.data,
// //   });
//
// //   bool status;
// //   dynamic error;
// //   DataSM data;
//
// //   factory SingleItemResponseModel.fromJson(Map<String, dynamic> json) =>
// //       SingleItemResponseModel(
// //         status: json["status"],
// //         error: json["error"],
// //         data: DataSM.fromJson(json["data"]),
// //       );
//
// //   Map<String, dynamic> toJson() => {
// //         "status": status,
// //         "error": error,
// //         "data": data.toJson(),
// //       };
// // }
//
// // class DataSM {
// //   DataSM({
// //     this.iTotalRecords,
// //     this.aaData,
// //   });
//
// //   String iTotalRecords;
// //   List<AaDatumSM> aaData;
//
// //   factory DataSM.fromJson(Map<String, dynamic> json) => DataSM(
// //         iTotalRecords: json["iTotalRecords"],
// //         aaData: List<AaDatumSM>.from(
// //             json["aaData"].map((x) => AaDatumSM.fromJson(x))),
// //       );
//
// //   Map<String, dynamic> toJson() => {
// //         "iTotalRecords": iTotalRecords,
// //         "aaData": List<dynamic>.from(aaData.map((x) => x.toJson())),
// //       };
// // }
//
// // class AaDatumSM {
// //   AaDatumSM({
// //     this.id,
// //     this.guestId,
// //     this.adults,
// //     this.unitId,
// //     this.categoriesId,
// //     this.date,
// //     this.rate,
// //     this.finalRate,
// //     this.isPaid,
// //     this.paymentId,
// //     this.createdAt,
// //     this.updatedAt,
// //     this.isActive,
// //     this.paymentMethod,
// //     this.expectedArrival,
// //     this.uid,
// //     this.bookingUid,
// //     this.arrivedAt,
// //     this.checkinStatus,
// //     this.category,
// //     this.unit,
// //     this.firstName,
// //     this.lastName,
// //     this.status,
// //     this.nationality,
// //     this.email,
// //     this.staff,
// //     this.gId,
// //     this.addon,
// //     this.events,
// //   });
//
// //   String id;
// //   String guestId;
// //   dynamic adults;
// //   String unitId;
// //   String categoriesId;
// //   String date;
// //   String rate;
// //   String finalRate;
// //   String isPaid;
// //   String paymentId;
// //   String createdAt;
// //   String updatedAt;
// //   String isActive;
// //   String paymentMethod;
// //   String expectedArrival;
// //   String uid;
// //   String bookingUid;
// //   String arrivedAt;
// //   String checkinStatus;
// //   String category;
// //   String unit;
// //   String firstName;
// //   String lastName;
// //   String status;
// //   String nationality;
// //   String email;
// //   String staff;
// //   String gId;
// //   List<dynamic> addon;
// //   List<dynamic> events;
//
// //   factory AaDatumSM.fromJson(Map<String, dynamic> json) => AaDatumSM(
// //         id: json["id"],
// //         guestId: json["guest_id"],
// //         adults: json["adults"],
// //         unitId: json["unit_id"],
// //         categoriesId: json["categories_id"],
// //         date: json["date"],
// //         rate: json["rate"],
// //         finalRate: json["final_rate"],
// //         isPaid: json["is_paid"],
// //         paymentId: json["payment_id"],
// //         createdAt: json["created_at"],
// //         updatedAt: json["updated_at"],
// //         isActive: json["is_active"],
// //         paymentMethod: json["payment_method"],
// //         expectedArrival: json["expected_arrival"],
// //         uid: json["uid"],
// //         bookingUid: json["booking_uid"],
// //         arrivedAt: json["arrived_at"],
// //         checkinStatus: json["checkin_status"],
// //         category: json["category"],
// //         unit: json["unit"],
// //         firstName: json["first_name"],
// //         lastName: json["last_name"],
// //         status: json["status"],
// //         nationality: json["nationality"],
// //         email: json["email"],
// //         staff: json["staff"],
// //         gId: json["g_id"],
// //         addon: List<dynamic>.from(json["addon"].map((x) => x)),
// //         events: List<dynamic>.from(json["events"].map((x) => x)),
// //       );
//
// //   Map<String, dynamic> toJson() => {
// //         "id": id,
// //         "guest_id": guestId,
// //         "adults": adults,
// //         "unit_id": unitId,
// //         "categories_id": categoriesId,
// //         "date": date,
// //         "rate": rate,
// //         "final_rate": finalRate,
// //         "is_paid": isPaid,
// //         "payment_id": paymentId,
// //         "created_at": createdAt,
// //         "updated_at": updatedAt,
// //         "is_active": isActive,
// //         "payment_method": paymentMethod,
// //         "expected_arrival": expectedArrival,
// //         "uid": uid,
// //         "booking_uid": bookingUid,
// //         "arrived_at": arrivedAt,
// //         "checkin_status": checkinStatus,
// //         "category": category,
// //         "unit": unit,
// //         "first_name": firstName,
// //         "last_name": lastName,
// //         "status": status,
// //         "nationality": nationality,
// //         "email": email,
// //         "staff": staff,
// //         "g_id": gId,
// //         "addon": List<dynamic>.from(addon.map((x) => x)),
// //         "events": List<dynamic>.from(events.map((x) => x)),
// //       };
// // }
