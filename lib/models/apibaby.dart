import 'package:flutter/cupertino.dart';

class Apibaby {
  final String? babyfn;
  final String? babyls;
  final int? idBaby;
  final int? idDoctor;
  final int? idNurse;
  final int? entry;
  final int? birth;
  final int? phoneNumber;
  final String? theReason;
  final String? medical;

  Apibaby({
    @required this.babyfn,
    @required this.babyls,
    @required this.idBaby,
    @required this.idDoctor,
    @required this.idNurse,
    @required this.entry,
    @required this.birth,
    @required this.phoneNumber,
    @required this.theReason,
    @required this.medical,
  });

  factory Apibaby.fromjson(Map<String, dynamic> m) {
    return Apibaby(
      babyfn: m["baby_firstname"],
      babyls: m["baby_lastname"],
      idBaby: m["baby_id"],
      idDoctor: m["doctor_id"],
      entry: m["baby_entry_date"],
      birth: m["baby_birthDate"],
      phoneNumber: m["parents_phone_number"],
      theReason: m["baby_reason_of_entry"],
      medical: m["baby_medical_history"],
      idNurse: m["nurse_id"],
    );
  }
}
