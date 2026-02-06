/// Represents a JavaScript learning phase/category
class Phase {
  final int number;
  final String id;
  final String title;
  final String description;
  final int topicCount;
  final List<Topic> topics;

  const Phase({
    required this.number,
    required this.id,
    required this.title,
    required this.description,
    required this.topicCount,
    required this.topics,
  });
}

/// Represents a topic within a phase
class Topic {
  final String id;
  final String title;
  final int phaseNumber;
  final String phaseId;
  final String description;
  final List<TopicSection> sections;
  final TopicNav? navigation;

  const Topic({
    required this.id,
    required this.title,
    required this.phaseNumber,
    required this.phaseId,
    required this.description,
    required this.sections,
    this.navigation,
  });

  String get fullPath => '$phaseId/$id';
}

/// Navigation links for a topic
class TopicNav {
  final NavLink? previous;
  final NavLink? next;

  const TopicNav({this.previous, this.next});
}

/// A navigation link
class NavLink {
  final String title;
  final String path;

  const NavLink({required this.title, required this.path});
}

/// A section within a topic
class TopicSection {
  final String? title;
  final List<TopicContent> contents;

  const TopicSection({
    this.title,
    required this.contents,
  });
}

/// Content block types
enum ContentType {
  paragraph,
  bulletList,
  numberedList,
  codeBlock,
  note,
  tip,
  warning,
}

/// A content block within a section
class TopicContent {
  final ContentType type;
  final String? text;
  final List<String>? items;
  final CodeBlock? codeBlock;
  final String? noteTitle;
  final String? noteText;

  const TopicContent.paragraph(String this.text)
      : type = ContentType.paragraph,
        items = null,
        codeBlock = null,
        noteTitle = null,
        noteText = null;

  const TopicContent.bulletList(List<String> this.items)
      : type = ContentType.bulletList,
        text = null,
        codeBlock = null,
        noteTitle = null,
        noteText = null;

  const TopicContent.numberedList(List<String> this.items)
      : type = ContentType.numberedList,
        text = null,
        codeBlock = null,
        noteTitle = null,
        noteText = null;

  const TopicContent.code(CodeBlock this.codeBlock)
      : type = ContentType.codeBlock,
        text = null,
        items = null,
        noteTitle = null,
        noteText = null;

  const TopicContent.note({required String title, required String content})
      : type = ContentType.note,
        noteTitle = title,
        noteText = content,
        text = null,
        items = null,
        codeBlock = null;

  const TopicContent.tip({required String title, required String content})
      : type = ContentType.tip,
        noteTitle = title,
        noteText = content,
        text = null,
        items = null,
        codeBlock = null;

  const TopicContent.warning({required String title, required String content})
      : type = ContentType.warning,
        noteTitle = title,
        noteText = content,
        text = null,
        items = null,
        codeBlock = null;
}

/// Represents a code block
class CodeBlock {
  final String filename;
  final String language;
  final String code;

  const CodeBlock({
    required this.filename,
    this.language = 'javascript',
    required this.code,
  });
}
