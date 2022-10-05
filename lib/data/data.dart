import 'package:memorygame/data/TileModel.dart';

String selectedTile = "";
int? selectedIndex;

bool selected = true;
int points = 0;
int trails=0;

List<TileModel> myPairs = [];
List<bool> clicked = [];


List<TileModel> pairs2 = [
  TileModel(imageAssetPath: 'A', isSelected: false),
  TileModel(imageAssetPath: 'B', isSelected: false),
  TileModel(imageAssetPath: 'C', isSelected: false),
  TileModel(imageAssetPath: 'D', isSelected: false),
  TileModel(imageAssetPath: 'E', isSelected: false),
  TileModel(imageAssetPath: 'F', isSelected: false),
  TileModel(imageAssetPath: 'G', isSelected: false),
  TileModel(imageAssetPath: 'H', isSelected: false),
  TileModel(imageAssetPath: 'A', isSelected: false),
  TileModel(imageAssetPath: 'B', isSelected: false),
  TileModel(imageAssetPath: 'C', isSelected: false),
  TileModel(imageAssetPath: 'D', isSelected: false),
  TileModel(imageAssetPath: 'E', isSelected: false),
  TileModel(imageAssetPath: 'F', isSelected: false),
  TileModel(imageAssetPath: 'G', isSelected: false),
  TileModel(imageAssetPath: 'H', isSelected: false)
];

List<TileModel> pairs = [
  TileModel(isSelected: false, imageAssetPath: 'assets/question.png'),
  TileModel(isSelected: false, imageAssetPath: 'assets/question.png'),
  TileModel(isSelected: false, imageAssetPath: 'assets/question.png'),
  TileModel(isSelected: false, imageAssetPath: 'assets/question.png'),
  TileModel(isSelected: false, imageAssetPath: 'assets/question.png'),
  TileModel(isSelected: false, imageAssetPath: 'assets/question.png'),
  TileModel(isSelected: false, imageAssetPath: 'assets/question.png'),
  TileModel(isSelected: false, imageAssetPath: 'assets/question.png'),
  TileModel(isSelected: false, imageAssetPath: 'assets/question.png'),
  TileModel(isSelected: false, imageAssetPath: 'assets/question.png'),
  TileModel(isSelected: false, imageAssetPath: 'assets/question.png'),
  TileModel(isSelected: false, imageAssetPath: 'assets/question.png'),
  TileModel(isSelected: false, imageAssetPath: 'assets/question.png'),
  TileModel(isSelected: false, imageAssetPath: 'assets/question.png'),
  TileModel(isSelected: false, imageAssetPath: 'assets/question.png'),
  TileModel(isSelected: false, imageAssetPath: 'assets/question.png'),
];
