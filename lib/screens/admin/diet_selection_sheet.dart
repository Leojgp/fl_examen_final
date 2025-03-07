import 'package:fl_examen_final/utils/extended_models.dart';
import 'package:flutter/material.dart';
import 'package:fl_examen_final/theme/theme.dart';
import 'package:fl_examen_final/models/user.dart' as umodel;
import 'package:fl_examen_final/services/diet_service.dart';
import 'package:intl/intl.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class DietSelectionSheet extends StatefulWidget {
  final umodel.User user;
  final List<CompleteDiet> diets;
  final VoidCallback onDietAssigned;

  const DietSelectionSheet({
    Key? key,
    required this.user,
    required this.diets,
    required this.onDietAssigned,
  }) : super(key: key);

  @override
  State<DietSelectionSheet> createState() => _DietSelectionSheetState();
}

class _DietSelectionSheetState extends State<DietSelectionSheet> {
  CompleteDiet? _selectedDiet;
  DateTime _selectedDate = DateTime.now();
  bool _isAssigning = false;

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: _selectedDate,
      firstDate: DateTime.now(),
      lastDate: DateTime.now().add(const Duration(days: 365)),
      builder: (context, child) {
        return Theme(
          data: Theme.of(context).copyWith(
            colorScheme: const ColorScheme.light(
              primary: AppTheme.mediumGreen,
              onPrimary: Colors.white,
            ),
          ),
          child: child!,
        );
      },
    );

    if (picked != null && picked != _selectedDate) {
      setState(() {
        _selectedDate = picked;
      });
    }
  }

  Future<void> _assignDiet() async {
    if (_selectedDiet == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(AppLocalizations.of(context)!.pleaseSelectADiet)),
      );
      return;
    }

    setState(() {
      _isAssigning = true;
    });

    try {
      await assignDietToUser (widget.user.uid, _selectedDiet!, _selectedDate);

      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(AppLocalizations.of(context)!.dietAssignedSuccessfully)),
      );

      Navigator.pop(context);
      widget.onDietAssigned();
    } catch (e) {
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('${AppLocalizations.of(context)!.failedToAssignDiet} $e')
        ),
      );
    } finally {
      if (mounted) {
        setState(() {
          _isAssigning = false;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      height: MediaQuery.of(context).size.height * 0.7,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                '${AppLocalizations.of(context)!.assignDietToUser} ${widget.user.name}',
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
              IconButton(
                icon: const Icon(Icons.close),
                onPressed: () => Navigator.pop(context),
              ),
            ],
          ),

          const SizedBox(height: 16),

          // Date selection
          GestureDetector(
            onTap: () => _selectDate(context),
            child: Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                border: Border.all(color: AppTheme.mediumGreen),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    '${AppLocalizations.of(context)!.startDate} ${DateFormat('MMM dd, yyyy').format(_selectedDate)}',
                    style: const TextStyle(fontSize: 16),
                  ),
                  const Icon(Icons.calendar_today, color: AppTheme.mediumGreen),
                ],
              ),
            ),
          ),

          const SizedBox(height: 16),
          Text(
            AppLocalizations.of(context)!.availableDiets,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
          const SizedBox(height: 8),

          // Debug info to check if we have diets
          if (widget.diets.isEmpty)
            const Center(
                child: Text('No diets available',
                    style: TextStyle(fontSize: 18, color: Colors.red))),

          // Diet list
          Expanded(
            child: widget.diets.isEmpty
                ? Center(child: Text(AppLocalizations.of(context)!.noDietsAvailable))
                : ListView.builder(
                    itemCount: widget.diets.length,
                    itemBuilder: (context, index) {
                      final diet = widget.diets[index];
                      final bool isSelected = _selectedDiet == diet;

                      return Card(
                        elevation: isSelected ? 3 : 1,
                        margin: const EdgeInsets.only(bottom: 8),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                          side: BorderSide(
                            color: isSelected
                                ? AppTheme.mediumGreen
                                : Colors.transparent,
                            width: 2,
                          ),
                        ),
                        child: InkWell(
                          onTap: () {
                            setState(() {
                              _selectedDiet = diet;
                            });
                          },
                          child: Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: Row(
                              children: [
                                if (isSelected)
                                  const Icon(Icons.check_circle,
                                      color: AppTheme.mediumGreen)
                                else
                                  const Icon(Icons.circle_outlined,
                                      color: Colors.grey),
                                const SizedBox(width: 12),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        diet.diet.type,
                                        style: const TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 16,
                                        ),
                                      ),
                                      Text(
                                        'Type: ${diet.diet.type}',
                                        style: TextStyle(
                                          color: Colors.grey[700],
                                          fontSize: 14,
                                        ),
                                      ),
                                      Text(
                                        'Total Calories: ${diet.totalKcal} kcal',
                                        style: TextStyle(
                                          color: Colors.grey[700],
                                          fontSize: 14,
                                        ),
                                      ),
                                      Text(
                                        'Meals: ${diet.meals.length}',
                                        style: TextStyle(
                                          color: Colors.grey[700],
                                          fontSize: 14,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  ),
          ),

          const SizedBox(height: 16),

          // Assign button
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: _isAssigning ? null : _assignDiet,
              style: ElevatedButton.styleFrom(
                backgroundColor: AppTheme.mediumGreen,
                padding: const EdgeInsets.symmetric(vertical: 14),
                disabledBackgroundColor: Colors.grey,
              ),
              child: _isAssigning
                  ? const SizedBox(
                      height: 20,
                      width: 20,
                      child: CircularProgressIndicator(
                        color: Colors.white,
                        strokeWidth: 2,
                      ),
                    )
                  : Text(
                      AppLocalizations.of(context)!.assignSelectedDiet,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                      ),
                    ),
            ),
          ),
        ],
      ),
    );
  }
}