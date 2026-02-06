import 'package:flutter/material.dart';
import '../../core/theme/app_theme.dart';
import '../../core/models/topic_model.dart';

/// Phase card widget for home screen
class PhaseCard extends StatelessWidget {
  final Phase phase;
  final VoidCallback onTap;

  const PhaseCard({
    super.key,
    required this.phase,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final phaseColor = AppColors.getPhaseColor(phase.number);
    
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        decoration: BoxDecoration(
          color: AppColors.bgSecondary,
          borderRadius: BorderRadius.circular(AppRadius.lg),
          border: Border.all(color: AppColors.borderColor),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.2),
              blurRadius: 8,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(AppRadius.lg),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Header with gradient
              _buildHeader(phaseColor),
              
              // Description
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: AppSpacing.space5,
                    vertical: AppSpacing.space3,
                  ),
                  child: Text(
                    phase.description,
                    style: AppTextStyles.bodySmall.copyWith(
                      color: AppColors.textSecondary,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ),
              
              // Topic count badge
              Padding(
                padding: const EdgeInsets.only(
                  left: AppSpacing.space5,
                  right: AppSpacing.space5,
                  bottom: AppSpacing.space5,
                ),
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: AppSpacing.space3,
                    vertical: AppSpacing.space1,
                  ),
                  decoration: BoxDecoration(
                    color: AppColors.bgTertiary,
                    borderRadius: BorderRadius.circular(AppRadius.sm),
                  ),
                  child: Text(
                    '${phase.topicCount} Topics',
                    style: AppTextStyles.caption.copyWith(
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildHeader(Color phaseColor) {
    return Container(
      padding: const EdgeInsets.all(AppSpacing.space5),
      decoration: BoxDecoration(
        color: phaseColor.withOpacity(0.1),
      ),
      child: Row(
        children: [
          // Phase number
          Text(
            phase.number.toString().padLeft(2, '0'),
            style: AppTextStyles.h2.copyWith(
              fontFamily: 'FiraCode',
              color: phaseColor,
              fontWeight: FontWeight.w700,
            ),
          ),
          const SizedBox(width: AppSpacing.space4),
          
          // Phase title
          Expanded(
            child: Text(
              phase.title,
              style: AppTextStyles.h4,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );
  }
}
