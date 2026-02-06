import 'package:flutter/material.dart';
import '../../core/theme/app_theme.dart';
import '../../core/data/notes_content.dart';
import '../../core/models/topic_model.dart';
import '../widgets/drawer_navigation.dart';
import '../widgets/code_block.dart';
import '../home/home_screen.dart';

/// Topic content screen displaying notes
class TopicScreen extends StatelessWidget {
  final String topicPath;

  const TopicScreen({super.key, required this.topicPath});

  @override
  Widget build(BuildContext context) {
    final topic = NotesContent.getTopicByPath(topicPath);
    
    if (topic == null) {
      return _buildErrorScreen(context);
    }

    final phaseColor = AppColors.getPhaseColor(topic.phaseNumber);
    
    return Scaffold(
      backgroundColor: AppColors.bgPrimary,
      drawer: DrawerNavigation(currentTopicPath: topicPath),
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
              child: Text('{ }', style: AppTextStyles.logoIcon.copyWith(fontSize: 16)),
            ),
            const SizedBox(width: 10),
            Expanded(
              child: Text(
                topic.title,
                style: AppTextStyles.logoText.copyWith(fontSize: 16),
                overflow: TextOverflow.ellipsis,
              ),
            ),
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
        padding: const EdgeInsets.all(AppSpacing.space6),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Topic Header
            _buildHeader(topic, phaseColor),
            const SizedBox(height: AppSpacing.space8),
            
            // Topic Sections
            ...topic.sections.map((section) => _buildSection(section)),
            
            // Navigation
            const SizedBox(height: AppSpacing.space10),
            _buildNavigation(context, topic),
          ],
        ),
      ),
    );
  }

  Widget _buildErrorScreen(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bgPrimary,
      appBar: AppBar(
        backgroundColor: AppColors.bgSecondary,
        title: Text('Topic Not Found', style: AppTextStyles.logoText),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.warning, size: 64, color: AppColors.accentYellow),
            const SizedBox(height: AppSpacing.space4),
            Text('Topic Not Found', style: AppTextStyles.h3),
            const SizedBox(height: AppSpacing.space2),
            Text(
              'The requested topic could not be loaded.',
              style: AppTextStyles.bodySecondary,
            ),
            const SizedBox(height: AppSpacing.space6),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pushAndRemoveUntil(
                  MaterialPageRoute(builder: (context) => const HomeScreen()),
                  (route) => false,
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.accentBlue,
                foregroundColor: AppColors.textBright,
                padding: const EdgeInsets.symmetric(
                  horizontal: AppSpacing.space6,
                  vertical: AppSpacing.space3,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(AppRadius.base),
                ),
              ),
              child: const Text('Back to Home'),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader(Topic topic, Color phaseColor) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Phase badge
        Container(
          padding: const EdgeInsets.symmetric(
            horizontal: AppSpacing.space3,
            vertical: AppSpacing.space1,
          ),
          decoration: BoxDecoration(
            color: phaseColor,
            borderRadius: BorderRadius.circular(AppRadius.sm),
          ),
          child: Text(
            'Phase ${topic.phaseNumber}'.toUpperCase(),
            style: AppTextStyles.caption.copyWith(
              color: AppColors.textBright,
              fontWeight: FontWeight.w600,
              letterSpacing: 0.5,
            ),
          ),
        ),
        const SizedBox(height: AppSpacing.space3),
        
        // Title
        Text(topic.title, style: AppTextStyles.h2),
        const SizedBox(height: AppSpacing.space3),
        
        // Description
        Text(topic.description, style: AppTextStyles.bodySecondary.copyWith(fontSize: 18)),
        
        const SizedBox(height: AppSpacing.space6),
        Container(height: 1, color: AppColors.borderColor),
      ],
    );
  }

  Widget _buildSection(TopicSection section) {
    return Padding(
      padding: const EdgeInsets.only(bottom: AppSpacing.space10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Section title
          if (section.title != null) ...[
            Container(
              decoration: const BoxDecoration(
                border: Border(
                  bottom: BorderSide(color: AppColors.accentBlue, width: 2),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.only(bottom: AppSpacing.space2),
                child: Text(section.title!, style: AppTextStyles.h3),
              ),
            ),
            const SizedBox(height: AppSpacing.space4),
          ],
          
          // Section contents
          ...section.contents.map((content) => _buildContent(content)),
        ],
      ),
    );
  }

  Widget _buildContent(TopicContent content) {
    switch (content.type) {
      case ContentType.paragraph:
        return Padding(
          padding: const EdgeInsets.only(bottom: AppSpacing.space4),
          child: Text(
            content.text!,
            style: AppTextStyles.body.copyWith(height: 1.8),
          ),
        );
      
      case ContentType.bulletList:
        return Padding(
          padding: const EdgeInsets.only(bottom: AppSpacing.space4),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: content.items!.map((item) => Padding(
              padding: const EdgeInsets.only(
                left: AppSpacing.space4,
                bottom: AppSpacing.space2,
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('• ', style: AppTextStyles.body.copyWith(color: AppColors.accentBlue)),
                  Expanded(child: Text(item, style: AppTextStyles.body.copyWith(height: 1.7))),
                ],
              ),
            )).toList(),
          ),
        );
      
      case ContentType.numberedList:
        return Padding(
          padding: const EdgeInsets.only(bottom: AppSpacing.space4),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: content.items!.asMap().entries.map((entry) => Padding(
              padding: const EdgeInsets.only(
                left: AppSpacing.space4,
                bottom: AppSpacing.space2,
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '${entry.key + 1}. ',
                    style: AppTextStyles.body.copyWith(color: AppColors.accentBlue),
                  ),
                  Expanded(child: Text(entry.value, style: AppTextStyles.body.copyWith(height: 1.7))),
                ],
              ),
            )).toList(),
          ),
        );
      
      case ContentType.codeBlock:
        return Padding(
          padding: const EdgeInsets.only(bottom: AppSpacing.space6),
          child: CodeBlockWidget(codeBlock: content.codeBlock!),
        );
      
      case ContentType.note:
      case ContentType.tip:
      case ContentType.warning:
        return _buildNoteBox(content);
    }
  }

  Widget _buildNoteBox(TopicContent content) {
    Color borderColor;
    Color bgColor;
    IconData icon;
    
    switch (content.type) {
      case ContentType.tip:
        borderColor = AppColors.accentGreen;
        bgColor = AppColors.accentGreen.withOpacity(0.1);
        icon = Icons.lightbulb_outline;
        break;
      case ContentType.warning:
        borderColor = const Color(0xFFFF9800);
        bgColor = const Color(0xFFFF9800).withOpacity(0.1);
        icon = Icons.warning_amber_outlined;
        break;
      default:
        borderColor = AppColors.accentBlue;
        bgColor = AppColors.accentBlue.withOpacity(0.1);
        icon = Icons.info_outline;
    }
    
    return Container(
      margin: const EdgeInsets.only(bottom: AppSpacing.space5),
      padding: const EdgeInsets.all(AppSpacing.space4),
      decoration: BoxDecoration(
        color: bgColor,
        border: Border(left: BorderSide(color: borderColor, width: 4)),
        borderRadius: BorderRadius.circular(AppRadius.base),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(icon, color: borderColor, size: 20),
              const SizedBox(width: AppSpacing.space2),
              Text(
                content.noteTitle!,
                style: AppTextStyles.body.copyWith(
                  fontWeight: FontWeight.w600,
                  color: borderColor,
                ),
              ),
            ],
          ),
          const SizedBox(height: AppSpacing.space2),
          Text(content.noteText!, style: AppTextStyles.body),
        ],
      ),
    );
  }

  Widget _buildNavigation(BuildContext context, Topic currentTopic) {
    final prevTopic = NotesContent.getPreviousTopic(currentTopic);
    final nextTopic = NotesContent.getNextTopic(currentTopic);
    
    return Container(
      padding: const EdgeInsets.only(top: AppSpacing.space6),
      decoration: const BoxDecoration(
        border: Border(top: BorderSide(color: AppColors.borderColor)),
      ),
      child: Row(
        children: [
          // Previous
          if (prevTopic != null)
            Expanded(
              child: _buildNavButton(
                context,
                title: prevTopic.title,
                label: '← Previous',
                topic: prevTopic,
                alignment: CrossAxisAlignment.start,
              ),
            )
          else
            Expanded(
              child: _buildNavButton(
                context,
                title: 'Home',
                label: '← Previous',
                isHome: true,
                alignment: CrossAxisAlignment.start,
              ),
            ),
          
          const SizedBox(width: AppSpacing.space4),
          
          // Next
          if (nextTopic != null)
            Expanded(
              child: _buildNavButton(
                context,
                title: nextTopic.title,
                label: 'Next →',
                topic: nextTopic,
                alignment: CrossAxisAlignment.end,
              ),
            )
          else
            Expanded(
              child: _buildNavButton(
                context,
                title: 'Home',
                label: 'Next →',
                isHome: true,
                alignment: CrossAxisAlignment.end,
              ),
            ),
        ],
      ),
    );
  }

  Widget _buildNavButton(
    BuildContext context, {
    required String title,
    required String label,
    Topic? topic,
    bool isHome = false,
    CrossAxisAlignment alignment = CrossAxisAlignment.start,
  }) {
    return GestureDetector(
      onTap: () {
        if (isHome) {
          Navigator.of(context).pushAndRemoveUntil(
            MaterialPageRoute(builder: (context) => const HomeScreen()),
            (route) => false,
          );
        } else if (topic != null) {
          Navigator.of(context).pushReplacement(
            MaterialPageRoute(
              builder: (context) => TopicScreen(topicPath: topic.fullPath),
            ),
          );
        }
      },
      child: Container(
        padding: const EdgeInsets.all(AppSpacing.space4),
        decoration: BoxDecoration(
          color: AppColors.bgSecondary,
          borderRadius: BorderRadius.circular(AppRadius.base),
          border: Border.all(color: AppColors.borderColor),
        ),
        child: Column(
          crossAxisAlignment: alignment,
          children: [
            Text(
              label.toUpperCase(),
              style: AppTextStyles.caption.copyWith(
                color: AppColors.textMuted,
                letterSpacing: 0.5,
              ),
            ),
            const SizedBox(height: AppSpacing.space1),
            Text(
              title,
              style: AppTextStyles.body.copyWith(
                fontWeight: FontWeight.w500,
                color: AppColors.textBright,
              ),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ),
      ),
    );
  }
}
