
import 'package:students_voice/models/user_model/user.dart';
import 'package:json_annotation/json_annotation.dart';

part 'generated_complaint_report.dart';


@JsonSerializable(explicitToJson: true)
class Report{
  
  @JsonKey(name: "_id")
   String complaintId;
   String title;
   String description;
   String status;
   User reporter ;

   Report({
      required this.complaintId,
      required this.title,
      required this.description,
      required this.status,
      required this.reporter,

   });

    factory Report.fromJson(Map<String,dynamic> json) =>_$ReportFromJson(json);
    Map<String,dynamic> toJson() =>_$ReportToJson(this);
       
    Map<String, dynamic> toMap() {
    return {
      "id": complaintId,
      'title': title,
      'description': description,
      'status': status,
      'reporter': reporter,
    };
  }

}