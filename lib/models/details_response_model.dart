// // To parse this JSON data, do
// //
// //     final detailsResponseModel = detailsResponseModelFromJson(jsonString);
//
// import 'dart:convert';
//
// DetailsResponseModel detailsResponseModelFromJson(String str) =>
//     DetailsResponseModel.fromJson(json.decode(str));
//
// String detailsResponseModelToJson(DetailsResponseModel data) =>
//     json.encode(data.toJson());
//
// class DetailsResponseModel {
//   DetailsResponseModel({
//     this.status,
//     this.error,
//     this.data,
//   });
//
//   bool status;
//   dynamic error;
//   Data data;
//
//   factory DetailsResponseModel.fromJson(Map<String, dynamic> json) =>
//       DetailsResponseModel(
//         status: json["status"],
//         error: json["error"],
//         data: Data.fromJson(json["data"]),
//       );
//
//   Map<String, dynamic> toJson() => {
//         "status": status,
//         "error": error,
//         "data": data.toJson(),
//       };
// }
//
// class Data {
//   Data({
//     this.iTotalRecords,
//     this.aaData,
//   });
//
//   int iTotalRecords;
//   List<AaDatum> aaData;
//
//   factory Data.fromJson(Map<String, dynamic> json) => Data(
//         iTotalRecords: json["iTotalRecords"],
//         aaData:
//             List<AaDatum>.from(json["aaData"].map((x) => AaDatum.fromJson(x))),
//       );
//
//   Map<String, dynamic> toJson() => {
//         "iTotalRecords": iTotalRecords,
//         "aaData": List<dynamic>.from(aaData.map((x) => x.toJson())),
//       };
// }
//
// class AaDatum {
//   AaDatum({
//     this.id,
//     this.eventId,
//     this.eventSubId,
//     this.guestId,
//     this.date,
//     this.rate,
//     this.quantity,
//     this.finalrate,
//     this.total,
//     this.transactionId,
//     this.status,
//     this.createdAt,
//     this.uid,
//     this.bookingUid,
//     this.updatedAt,
//     this.bookedBy,
//     this.paymentMethod,
//     this.notes,
//     this.minSpend,
//     this.arrivedAt,
//     this.checkinStatus,
//     this.firstName,
//     this.lastName,
//     this.nationality,
//     this.email,
//     this.staff,
//     this.gId,
//     this.addon,
//     this.events,
//   });
//
//   String id;
//   String eventId;
//   String eventSubId;
//   String guestId;
//   DateTime date;
//   String rate;
//   String quantity;
//   String finalrate;
//   String total;
//   String transactionId;
//   String status;
//   DateTime createdAt;
//   String uid;
//   String bookingUid;
//   DateTime updatedAt;
//   dynamic bookedBy;
//   dynamic paymentMethod;
//   dynamic notes;
//   dynamic minSpend;
//   DateTime arrivedAt;
//   String checkinStatus;
//   String firstName;
//   dynamic lastName;
//   dynamic nationality;
//   String email;
//   String staff;
//   String gId;
//   List<Addon> addon;
//   List<Event> events;
//
//   factory AaDatum.fromJson(Map<String, dynamic> json) => AaDatum(
//         id: json["id"],
//         eventId: json["event_id"],
//         eventSubId: json["event_sub_id"],
//         guestId: json["guest_id"],
//         date: json["date"] == null ? null : DateTime.parse(json["date"]),
//         rate: json["rate"],
//         quantity: json["quantity"],
//         finalrate: json["final_rate"],
//         total: json["total"],
//         transactionId: json["transaction_id"],
//         status: json["status"],
//         createdAt: json["created_at"] == null
//             ? null
//             : DateTime.parse(json["created_at"]),
//         uid: json["uid"],
//         bookingUid: json["booking_uid"],
//         updatedAt: json["updated_at"] == null
//             ? null
//             : DateTime.parse(json["updated_at"]),
//         bookedBy: json["booked_by"],
//         paymentMethod: json["payment_method"],
//         notes: json["notes"],
//         minSpend: json["min_spend"],
//         arrivedAt: json["arrived_at"] == null
//             ? null
//             : DateTime.parse(json["arrived_at"]),
//         checkinStatus: json["checkin_status"],
//         firstName: json["first_name"],
//         lastName: json["last_name"],
//         nationality: json["nationality"],
//         email: json["email"],
//         staff: json["staff"],
//         gId: json["g_id"],
//         addon: List<Addon>.from(json["addon"].map((x) => Addon.fromJson(x))),
//         events: List<Event>.from(json["events"].map((x) => Event.fromJson(x))),
//       );
//
//   Map<String, dynamic> toJson() => {
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
//         "arrived_at": arrivedAt == null ? null : arrivedAt.toIso8601String(),
//         "checkin_status": checkinStatus,
//         "first_name": firstName,
//         "last_name": lastName,
//         "nationality": nationality,
//         "email": email,
//         "staff": staff,
//         "g_id": gId,
//         "addon": List<dynamic>.from(addon.map((x) => x.toJson())),
//         // "events": List<dynamic>.from(events.map((x) => Map.from(x).map((k, v) => MapEntry<String, dynamic>(k, v == null ? null : v)))),
//       };
// }
//
// class Addon {
//   Addon({
//     this.total,
//     this.rate,
//     this.quantity,
//     this.name,
//     this.id,
//     this.baseRate,
//     this.description,
//     this.thumbnail,
//     this.status,
//     this.createdAt,
//     this.updatedAt,
//     this.currency,
//     this.priority,
//     this.type,
//   });
//
//   String total;
//   String rate;
//   String quantity;
//   String name;
//   String id;
//   String baseRate;
//   String description;
//   String thumbnail;
//   String status;
//   DateTime createdAt;
//   DateTime updatedAt;
//   String currency;
//   String priority;
//   String type;
//
//   factory Addon.fromJson(Map<String, dynamic> json) => Addon(
//         total: json["total"],
//         rate: json["rate"],
//         quantity: json["quantity"],
//         name: json["name"],
//         id: json["id"],
//         baseRate: json["base_rate"],
//         description: json["description"],
//         thumbnail: json["thumbnail"],
//         status: json["status"],
//         createdAt: DateTime.parse(json["created_at"]),
//         updatedAt: DateTime.parse(json["updated_at"]),
//         currency: json["currency"],
//         priority: json["priority"],
//         type: json["type"],
//       );
//
//   Map<String, dynamic> toJson() => {
//         "total": total,
//         "rate": rate,
//         "quantity": quantity,
//         "name": name,
//         "id": id,
//         "base_rate": baseRate,
//         "description": description,
//         "thumbnail": thumbnail,
//         "status": status,
//         "created_at": createdAt.toIso8601String(),
//         "updated_at": updatedAt.toIso8601String(),
//         "currency": currency,
//         "priority": priority,
//         "type": type,
//       };
// }
//
//
// class Event {
//   Event({
//     this.id,
//     this.type,
//     this.name,
//     this.description,
//     this.startDate,
//     this.deadline,
//     this.capacity,
//     this.thumbnail,
//     this.status,
//     this.updatedAt,
//     this.special,
//     this.dates,
//     this.banner,
//     this.slug,
//     this.endDate,
//     this.images,
//     this.eventId,
//     this.subName,
//     this.subRate,
//     this.subCurrency,
//     this.subDescription,
//     this.subCapacity,
//     this.remaining,
//     this.createdAt,
//     this.isFree,
//     this.eventSubId,
//     this.guestId,
//     this.date,
//     this.rate,
//     this.quantity,
//     this.total,
//     this.transactionId,
//     this.uid,
//     this.bookingUid,
//     this.bookedBy,
//     this.paymentMethod,
//     this.notes,
//     this.minSpend,
//     this.arrivedAt,
//     this.checkinStatus,
//   });
//
//   String id;
//   String type;
//   String name;
//   String description;
//   DateTime startDate;
//   DateTime deadline;
//   String capacity;
//   String thumbnail;
//   String status;
//   DateTime updatedAt;
//   String special;
//   dynamic dates;
//   String banner;
//   String slug;
//   dynamic endDate;
//   String images;
//   String eventId;
//   String subName;
//   String subRate;
//   String subCurrency;
//   String subDescription;
//   String subCapacity;
//   String remaining;
//   DateTime createdAt;
//   String isFree;
//   String eventSubId;
//   String guestId;
//   DateTime date;
//   String rate;
//   String quantity;
//   String total;
//   String transactionId;
//   String uid;
//   String bookingUid;
//   dynamic bookedBy;
//   dynamic paymentMethod;
//   dynamic notes;
//   dynamic minSpend;
//   dynamic arrivedAt;
//   String checkinStatus;
//
//   factory Event.fromJson(Map<String, dynamic> json) => Event(
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
//       );
// }
//
