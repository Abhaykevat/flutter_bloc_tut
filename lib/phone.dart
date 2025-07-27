// import 'package:equatable/equatable.dart';

// class Phone extends Equatable {
//   final String id;
//   final String phoneName;
//   final String phoneImage;

//   const Phone({
//     required this.id,
//     required this.phoneName,
//     required this.phoneImage,
//   });

//   @override
//   List<Object?> get props => [id]; // Only compare by id
// }




import 'package:equatable/equatable.dart';

class Phone extends Equatable {
  final String phoneName;
  final String phoneImage;

  const Phone({
    required this.phoneName,
    required this.phoneImage,
  });

  @override
  List<Object?> get props => [phoneName, phoneImage];
}
