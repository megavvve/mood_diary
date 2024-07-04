import 'package:flutter/material.dart';
import 'package:mood_diary/presentation/providers/home_provider.dart';
import 'package:mood_diary/presentation/providers/notes_provider.dart';
import 'package:mood_diary/presentation/providers/self_esteem_provider.dart';
import 'package:mood_diary/presentation/providers/stress_level_provider.dart';
import 'package:provider/provider.dart';

bool isFormIsFull(BuildContext context) {
  final notesProvider = Provider.of<NotesProvider>(context);
  final stressLevelProvider = Provider.of<StressLevelProvider>(context);
  final homeProvider = Provider.of<HomeProvider>(context);
  final selfEsteemProvider = Provider.of<SelfEsteemProvider>(context);
  return selfEsteemProvider.selfEsteemLevel != 0.0 &&
      notesProvider.notes.isNotEmpty &&
      stressLevelProvider.stressLevel != 0.0 &&
      homeProvider.isMoodDiarySelected != false;
}
