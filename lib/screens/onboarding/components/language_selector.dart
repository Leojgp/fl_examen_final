import 'package:flutter/material.dart';

class LanguageSelector extends StatelessWidget {
  final Function(String) onLanguageSelected;

  const LanguageSelector({required this.onLanguageSelected, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<String>(
      icon: const Icon(Icons.translate,),
      onSelected: (String languageCode) {
        onLanguageSelected(languageCode);
      },
      itemBuilder: (BuildContext context) {
        return [
          const PopupMenuItem<String>(
            value: 'en',
            child: Text('English',style: TextStyle(fontSize: 14)),
          ),
          const PopupMenuItem<String>(
            value: 'es',
            child: Text('Español',style: TextStyle(fontSize: 14)),
          ),
                    const PopupMenuItem<String>(
            value: 'fr',
            child: Text('Français',style: TextStyle(fontSize: 14)),
          ),
                              const PopupMenuItem<String>(
            value: 'ar',
            child: Text('العربية ',style: TextStyle(fontSize: 14)),
          ),
        ];
      },
    );
  }
}