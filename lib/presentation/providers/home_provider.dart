import 'package:flutter/material.dart';

class HomeProvider with ChangeNotifier {
  bool _isMoodDiarySelected = true;

  bool get isMoodDiarySelected => _isMoodDiarySelected;

  void toggleSelection() {
    _isMoodDiarySelected = !_isMoodDiarySelected;
    notifyListeners();
  }

  String? _selectedEmotion;
  List<String> _selectedTags = [];

  final Map<String, List<String>> _emotionTags = {
    'Радость': [
      'Возбуждение',
      'Восторг',
      'Игривость',
      'Наслаждение',
      'Очарование',
      'Осознанность',
      'Смелость',
      'Удовольствие'
    ],
    'Страх': [
      'Тревога',
      'Беспокойство',
      'Паника',
      'Неуверенность',
      'Нервозность',
      'Опасение',
      'Настороженность'
    ],
    'Бешенство': [
      'Гнев',
      'Злость',
      'Ярость',
      'Обида',
      'Раздражение',
      'Гневливость',
      'Возмущение'
    ],
    'Грусть': [
      'Печаль',
      'Уныние',
      'Одиночество',
      'Ностальгия',
      'Сожаление',
      'Меланхолия',
      'Скорбь'
    ],
    'Спокойствие': [
      'Умиротворение',
      'Расслабленность',
      'Согласие',
      'Гармония',
      'Безмятежность',
      'Невозмутимость',
      'Безопасность'
    ],
    'Сила': [
      'Мощь',
      'Уверенность',
      'Решимость',
      'Мужество',
      'Твердость',
      'Дерзость',
      'Авторитет'
    ],
  };

  String? get selectedEmotion => _selectedEmotion;
  List<String> get selectedTags => _selectedTags;
  Map<String, List<String>> get emotionTags => _emotionTags;

  void selectEmotion(String emotion) {
    _selectedEmotion = emotion;
    _selectedTags = [];
    notifyListeners();
  }

  void toggleTag(String tag) {
    if (_selectedTags.contains(tag)) {
      _selectedTags.remove(tag);
    } else {
      _selectedTags.add(tag);
    }
    notifyListeners();
  }
}
