import 'package:indian_heritage/model/constants.dart';
import 'package:meta/meta.dart';

class HeritageSite {
  final String featureImageUri;
  final String details;
  final List<String> carouselImageUris;
  final String title;

  HeritageSite({
    @required this.featureImageUri,
    @required this.details,
    @required this.carouselImageUris,
    @required this.title,
  });
}

List<HeritageSite> heritageSites = <HeritageSite>[
  nalanda,
  taj,
  victoria,
  redFort,
  qutub,
  konark,
];
