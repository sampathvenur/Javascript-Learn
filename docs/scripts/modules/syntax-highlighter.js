/**
 * Syntax Highlighter Module
 * Pure JavaScript syntax highlighting for JS, HTML, and CSS
 */

const SyntaxHighlighter = (function () {
    'use strict';

    // Token patterns for JavaScript
    const jsPatterns = [
        { pattern: /(\/\/.*$)/gm, className: 'token-comment' },
        { pattern: /(\/\*[\s\S]*?\*\/)/g, className: 'token-comment' },
        { pattern: /("(?:[^"\\]|\\.)*"|'(?:[^'\\]|\\.)*'|`(?:[^`\\]|\\.)*`)/g, className: 'token-string' },
        { pattern: /\b(\d+\.?\d*)\b/g, className: 'token-number' },
        { pattern: /\b(const|let|var|function|return|if|else|for|while|do|switch|case|break|continue|default|try|catch|finally|throw|new|delete|typeof|instanceof|in|of|class|extends|super|import|export|from|as|async|await|yield|this|null|undefined|true|false|NaN|Infinity)\b/g, className: 'token-keyword' },
        { pattern: /\b([a-zA-Z_$][\w$]*)\s*(?=\()/g, className: 'token-function' },
        { pattern: /\b(console|document|window|Array|Object|String|Number|Boolean|Date|Math|JSON|Promise|Error|Map|Set|Symbol|RegExp)\b/g, className: 'token-class-name' }
    ];

    // Track which elements have been highlighted
    const highlightedElements = new WeakSet();

    /**
     * Apply syntax highlighting to code string
     */
    function highlight(code, language) {
        // Escape HTML entities first
        let result = code
            .replace(/&/g, '&amp;')
            .replace(/</g, '&lt;')
            .replace(/>/g, '&gt;');

        // Use placeholder tokens to prevent nested replacements
        const tokens = [];

        jsPatterns.forEach(rule => {
            result = result.replace(rule.pattern, (match, group) => {
                const index = tokens.length;
                tokens.push({ text: group, className: rule.className });
                return `%%TOKEN_${index}%%`;
            });
        });

        // Replace placeholders with actual spans
        tokens.forEach((token, index) => {
            result = result.replace(
                `%%TOKEN_${index}%%`,
                `<span class="${token.className}">${token.text}</span>`
            );
        });

        return result;
    }

    /**
     * Initialize highlighting for all code blocks
     */
    function init() {
        const codeBlocks = document.querySelectorAll('.code-container code');

        codeBlocks.forEach(block => {
            // Skip if already highlighted
            if (highlightedElements.has(block)) return;

            const container = block.closest('.code-container');
            const language = container?.dataset.language || 'javascript';
            const originalCode = block.textContent;

            block.innerHTML = highlight(originalCode, language);
            highlightedElements.add(block);
        });
    }

    /**
     * Highlight a single element
     */
    function highlightElement(element, language = 'javascript') {
        if (highlightedElements.has(element)) return;

        const originalCode = element.textContent;
        element.innerHTML = highlight(originalCode, language);
        highlightedElements.add(element);
    }

    // Public API
    return {
        init,
        highlight,
        highlightElement
    };
})();

// Auto-initialize when DOM is ready
if (document.readyState === 'loading') {
    document.addEventListener('DOMContentLoaded', SyntaxHighlighter.init);
} else {
    SyntaxHighlighter.init();
}
