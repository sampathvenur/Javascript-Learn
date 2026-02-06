import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../core/theme/app_theme.dart';
import '../../core/data/notes_content.dart';
import '../../core/models/topic_model.dart';
import '../topic/topic_screen.dart';
import '../home/home_screen.dart';

/// Drawer navigation with collapsible phases
class DrawerNavigation extends StatefulWidget {
  final String? currentTopicPath;
  
  const DrawerNavigation({super.key, this.currentTopicPath});

  @override
  State<DrawerNavigation> createState() => _DrawerNavigationState();
}

class _DrawerNavigationState extends State<DrawerNavigation> {
  final Map<int, bool> _expandedPhases = {};

  @override
  void initState() {
    super.initState();
    // Expand the phase containing the current topic
    if (widget.currentTopicPath != null) {
      final topic = NotesContent.getTopicByPath(widget.currentTopicPath!);
      if (topic != null) {
        _expandedPhases[topic.phaseNumber] = true;
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final phases = NotesContent.phases;
    
    return Drawer(
      backgroundColor: AppColors.bgSecondary,
      child: SafeArea(
        child: Column(
          children: [
            // Header
            _buildHeader(context),
            
            // Navigation
            Expanded(
              child: ListView.builder(
                padding: const EdgeInsets.symmetric(vertical: AppSpacing.space4),
                itemCount: phases.length,
                itemBuilder: (context, index) {
                  final phase = phases[index];
                  return _buildPhaseSection(context, phase);
                },
              ),
            ),
            
            // Footer
            _buildFooter(context),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(AppSpacing.space5),
      decoration: const BoxDecoration(
        border: Border(
          bottom: BorderSide(color: AppColors.borderColor),
        ),
      ),
      child: InkWell(
        onTap: () {
          Navigator.of(context).pop();
          Navigator.of(context).pushAndRemoveUntil(
            MaterialPageRoute(builder: (context) => const HomeScreen()),
            (route) => false,
          );
        },
        child: Row(
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  colors: [AppColors.bgTertiary, AppColors.bgElevated],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                borderRadius: BorderRadius.circular(AppRadius.base),
              ),
              child: Text('{ }', style: AppTextStyles.logoIcon),
            ),
            const SizedBox(width: 12),
            Text('JavaScript Notes', style: AppTextStyles.logoText),
          ],
        ),
      ),
    );
  }

  Widget _buildPhaseSection(BuildContext context, Phase phase) {
    final isExpanded = _expandedPhases[phase.number] ?? false;
    final phaseColor = AppColors.getPhaseColor(phase.number);
    
    return Column(
      children: [
        // Phase header (toggle)
        InkWell(
          onTap: () {
            setState(() {
              _expandedPhases[phase.number] = !isExpanded;
            });
          },
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: AppSpacing.space4,
              vertical: AppSpacing.space3,
            ),
            child: Row(
              children: [
                // Phase badge
                Container(
                  width: 24,
                  height: 24,
                  decoration: BoxDecoration(
                    color: phaseColor,
                    borderRadius: BorderRadius.circular(AppRadius.sm),
                  ),
                  alignment: Alignment.center,
                  child: Text(
                    '${phase.number}',
                    style: AppTextStyles.caption.copyWith(
                      color: AppColors.textBright,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
                const SizedBox(width: AppSpacing.space3),
                
                // Phase title
                Expanded(
                  child: Text(
                    phase.title,
                    style: AppTextStyles.bodySmall.copyWith(
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                
                // Arrow
                AnimatedRotation(
                  turns: isExpanded ? 0.25 : 0,
                  duration: const Duration(milliseconds: 200),
                  child: const Icon(
                    Icons.arrow_forward_ios,
                    size: 12,
                    color: AppColors.textMuted,
                  ),
                ),
              ],
            ),
          ),
        ),
        
        // Topic list (collapsible)
        AnimatedCrossFade(
          firstChild: const SizedBox(width: double.infinity),
          secondChild: _buildTopicList(context, phase),
          crossFadeState: isExpanded 
              ? CrossFadeState.showSecond 
              : CrossFadeState.showFirst,
          duration: const Duration(milliseconds: 200),
        ),
      ],
    );
  }

  Widget _buildTopicList(BuildContext context, Phase phase) {
    return Column(
      children: phase.topics.map((topic) {
        final isActive = widget.currentTopicPath == topic.fullPath;
        
        return InkWell(
          onTap: () {
            Navigator.of(context).pop();
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => TopicScreen(topicPath: topic.fullPath),
              ),
            );
          },
          child: Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(
              horizontal: AppSpacing.space4,
              vertical: AppSpacing.space2,
            ),
            margin: const EdgeInsets.only(left: 24 + AppSpacing.space3 + AppSpacing.space4),
            decoration: BoxDecoration(
              color: isActive ? AppColors.bgActive : Colors.transparent,
              border: Border(
                left: BorderSide(
                  color: isActive ? AppColors.accentBlue : Colors.transparent,
                  width: 2,
                ),
              ),
            ),
            child: Text(
              topic.title,
              style: AppTextStyles.bodySmall.copyWith(
                color: isActive ? AppColors.textBright : AppColors.textSecondary,
              ),
            ),
          ),
        );
      }).toList(),
    );
  }

  Widget _buildFooter(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(AppSpacing.space4),
      decoration: const BoxDecoration(
        border: Border(
          top: BorderSide(color: AppColors.borderColor),
        ),
      ),
      child: Column(
        children: [
          GestureDetector(
            onTap: () => _launchGitHub(),
            child: Text.rich(
              TextSpan(
                text: 'Made by ',
                style: AppTextStyles.caption,
                children: [
                  TextSpan(
                    text: 'Sampath Kumar',
                    style: AppTextStyles.caption.copyWith(
                      color: AppColors.accentBlue,
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: AppSpacing.space2),
          Text(
            '© 2026 JavaScript Notes',
            style: AppTextStyles.caption,
          ),
        ],
      ),
    );
  }

  Future<void> _launchGitHub() async {
    final uri = Uri.parse('https://github.com/sampathvenur');
    try {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    } catch (e) {
      // ignore - link didn't open
    }
  }
}
