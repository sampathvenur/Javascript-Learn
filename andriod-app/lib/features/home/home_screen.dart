import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../core/theme/app_theme.dart';
import '../../core/data/notes_content.dart';
import '../../core/models/topic_model.dart';
import '../topic/topic_screen.dart';
import '../widgets/phase_card.dart';
import '../widgets/drawer_navigation.dart';

/// Home screen displaying phase cards grid
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final phases = NotesContent.phases;
    
    return Scaffold(
      backgroundColor: AppColors.bgPrimary,
      drawer: const DrawerNavigation(),
      appBar: AppBar(
        backgroundColor: AppColors.bgSecondary,
        title: Row(
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
            Text('JS Notes', style: AppTextStyles.logoText),
          ],
        ),
        leading: Builder(
          builder: (context) => IconButton(
            icon: const Icon(Icons.menu, color: AppColors.textPrimary),
            onPressed: () => Scaffold.of(context).openDrawer(),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Hero Section
            _buildHeroSection(context),
            
            // Phase Cards Grid
            Padding(
              padding: const EdgeInsets.all(AppSpacing.space4),
              child: _buildPhaseGrid(context, phases),
            ),
            
            // Footer
            _buildFooter(context),
          ],
        ),
      ),
    );
  }

  Widget _buildHeroSection(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(
        horizontal: AppSpacing.space4,
        vertical: AppSpacing.space10,
      ),
      child: Column(
        children: [
          // Hero Icon
          Container(
            padding: const EdgeInsets.symmetric(
              horizontal: AppSpacing.space8,
              vertical: AppSpacing.space6,
            ),
            decoration: BoxDecoration(
              gradient: const LinearGradient(
                colors: [AppColors.bgSecondary, AppColors.bgTertiary],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              borderRadius: BorderRadius.circular(AppRadius.lg),
              border: Border.all(color: AppColors.borderColor),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.3),
                  blurRadius: 20,
                  offset: const Offset(0, 8),
                ),
              ],
            ),
            child: Text(
              '{ }',
              style: AppTextStyles.logoIcon.copyWith(fontSize: 48),
            ),
          ),
          const SizedBox(height: AppSpacing.space6),
          
          // Title
          ShaderMask(
            shaderCallback: (bounds) => const LinearGradient(
              colors: [AppColors.textBright, AppColors.accentBlue],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ).createShader(bounds),
            child: Text(
              'JavaScript Notes',
              style: AppTextStyles.h1.copyWith(color: Colors.white),
              textAlign: TextAlign.center,
            ),
          ),
          const SizedBox(height: AppSpacing.space3),
          
          // Subtitle
          Text(
            'Your comprehensive guide to mastering JavaScript',
            style: AppTextStyles.bodySecondary,
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: AppSpacing.space4),
          
          // Author
          GestureDetector(
            onTap: () => _launchGitHub(context),
            child: Text.rich(
              TextSpan(
                text: 'Created by ',
                style: AppTextStyles.caption,
                children: [
                  TextSpan(
                    text: 'Sampath Kumar',
                    style: AppTextStyles.caption.copyWith(
                      color: AppColors.accentBlue,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPhaseGrid(BuildContext context, List<Phase> phases) {
    return LayoutBuilder(
      builder: (context, constraints) {
        // Responsive grid
        final crossAxisCount = constraints.maxWidth > 900 ? 4 
            : constraints.maxWidth > 600 ? 3 
            : constraints.maxWidth > 400 ? 2 
            : 1;
        
        return GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: crossAxisCount,
            crossAxisSpacing: AppSpacing.space4,
            mainAxisSpacing: AppSpacing.space4,
            childAspectRatio: 1.1,
          ),
          itemCount: phases.length,
          itemBuilder: (context, index) {
            final phase = phases[index];
            return PhaseCard(
              phase: phase,
              onTap: () => _navigateToFirstTopic(context, phase),
            );
          },
        );
      },
    );
  }

  Widget _buildFooter(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(AppSpacing.space6),
      child: Column(
        children: [
          GestureDetector(
            onTap: () => _launchGitHub(context),
            child: Text.rich(
              TextSpan(
                text: 'Made by ',
                style: AppTextStyles.caption,
                children: [
                  TextSpan(
                    text: 'Sampath Kumar',
                    style: AppTextStyles.caption.copyWith(
                      color: AppColors.accentBlue,
                      fontWeight: FontWeight.w500,
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

  void _navigateToFirstTopic(BuildContext context, Phase phase) {
    if (phase.topics.isNotEmpty) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => TopicScreen(topicPath: phase.topics.first.fullPath),
        ),
      );
    }
  }

  Future<void> _launchGitHub(BuildContext context) async {
    final uri = Uri.parse('https://github.com/sampathvenur');
    try {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    } catch (e) {
      // ignore - link didn't open
    }
  }
}
