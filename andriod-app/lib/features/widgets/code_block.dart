import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_highlight/flutter_highlight.dart';
import 'package:flutter_highlight/themes/vs2015.dart';
import '../../core/theme/app_theme.dart';
import '../../core/models/topic_model.dart';

/// Code block widget with VS Code styling
class CodeBlockWidget extends StatefulWidget {
  final CodeBlock codeBlock;

  const CodeBlockWidget({super.key, required this.codeBlock});

  @override
  State<CodeBlockWidget> createState() => _CodeBlockWidgetState();
}

class _CodeBlockWidgetState extends State<CodeBlockWidget> {
  bool _copied = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xFF2D2D30),
        borderRadius: BorderRadius.circular(AppRadius.base),
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
        borderRadius: BorderRadius.circular(AppRadius.base),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header (VS Code window bar)
            _buildHeader(),
            
            // Code content
            _buildCodeContent(),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: AppSpacing.space4,
        vertical: AppSpacing.space3,
      ),
      decoration: const BoxDecoration(
        color: Color(0xFF323233),
        border: Border(
          bottom: BorderSide(color: AppColors.borderColor),
        ),
      ),
      child: Row(
        children: [
          // Window dots
          Row(
            children: [
              _buildDot(const Color(0xFFFF5F57)),
              const SizedBox(width: 6),
              _buildDot(const Color(0xFFFEBC2E)),
              const SizedBox(width: 6),
              _buildDot(const Color(0xFF28C840)),
            ],
          ),
          const SizedBox(width: AppSpacing.space4),
          
          // Filename
          Expanded(
            child: Text(
              widget.codeBlock.filename,
              style: AppTextStyles.caption.copyWith(
                fontFamily: 'FiraCode',
                color: AppColors.textMuted,
              ),
              overflow: TextOverflow.ellipsis,
            ),
          ),
          
          // Copy button
          GestureDetector(
            onTap: _copyCode,
            child: Container(
              padding: const EdgeInsets.symmetric(
                horizontal: AppSpacing.space2,
                vertical: AppSpacing.space1,
              ),
              decoration: BoxDecoration(
                color: AppColors.bgTertiary,
                borderRadius: BorderRadius.circular(AppRadius.sm),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(
                    _copied ? Icons.check : Icons.copy,
                    size: 14,
                    color: _copied ? AppColors.accentGreen : AppColors.textMuted,
                  ),
                  const SizedBox(width: 4),
                  Text(
                    _copied ? 'Copied!' : 'Copy',
                    style: AppTextStyles.caption.copyWith(
                      color: _copied ? AppColors.accentGreen : AppColors.textMuted,
                      fontSize: 11,
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

  Widget _buildDot(Color color) {
    return Container(
      width: 12,
      height: 12,
      decoration: BoxDecoration(
        color: color,
        shape: BoxShape.circle,
      ),
    );
  }

  Widget _buildCodeContent() {
    // Determine the language for syntax highlighting
    String lang = widget.codeBlock.language;
    if (lang == 'javascript' || lang == 'js') {
      lang = 'javascript';
    } else if (lang == 'html') {
      lang = 'xml';
    }
    
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(AppSpacing.space4),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: HighlightView(
          widget.codeBlock.code,
          language: lang,
          theme: vs2015Theme,
          textStyle: AppTextStyles.code.copyWith(
            fontSize: 13,
            height: 1.5,
          ),
          padding: EdgeInsets.zero,
        ),
      ),
    );
  }

  Future<void> _copyCode() async {
    await Clipboard.setData(ClipboardData(text: widget.codeBlock.code));
    setState(() => _copied = true);
    
    // Reset after 2 seconds
    Future.delayed(const Duration(seconds: 2), () {
      if (mounted) {
        setState(() => _copied = false);
      }
    });
  }
}
