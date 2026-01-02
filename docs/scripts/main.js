/**
 * Main Application Entry Point
 * JavaScript Notes Documentation Website
 */

(function () {
    'use strict';

    /**
     * Initialize the application
     */
    function init() {
        console.log('JavaScript Notes initialized');

        // Add smooth scroll behavior for anchor links
        document.querySelectorAll('a[href^="#"]').forEach(anchor => {
            anchor.addEventListener('click', function (e) {
                const href = this.getAttribute('href');
                // Only handle in-page anchors, let router handle topic links
                if (href.startsWith('#/') || href === '#/') return;

                e.preventDefault();
                const target = document.querySelector(href);
                if (target) {
                    target.scrollIntoView({ behavior: 'smooth' });
                }
            });
        });

        // Add copy functionality to code blocks
        initCopyButtons();

        // Add keyboard navigation support
        initKeyboardNav();
    }

    /**
     * Initialize copy buttons for code blocks
     */
    function initCopyButtons() {
        document.querySelectorAll('.code-container').forEach(container => {
            // Skip if copy button already exists
            if (container.querySelector('.copy-btn')) return;

            const copyBtn = document.createElement('button');
            copyBtn.className = 'copy-btn';
            copyBtn.textContent = 'Copy';
            copyBtn.setAttribute('aria-label', 'Copy code to clipboard');

            copyBtn.addEventListener('click', async () => {
                const code = container.querySelector('code');
                if (!code) return;

                try {
                    await navigator.clipboard.writeText(code.textContent);
                    copyBtn.textContent = 'Copied!';
                    copyBtn.classList.add('copied');

                    setTimeout(() => {
                        copyBtn.textContent = 'Copy';
                        copyBtn.classList.remove('copied');
                    }, 2000);
                } catch (err) {
                    console.error('Failed to copy:', err);
                }
            });

            container.style.position = 'relative';
            container.appendChild(copyBtn);
        });
    }

    /**
     * Initialize keyboard navigation
     */
    function initKeyboardNav() {
        document.addEventListener('keydown', (e) => {
            // Ctrl/Cmd + K for search (future feature)
            if ((e.ctrlKey || e.metaKey) && e.key === 'k') {
                e.preventDefault();
                console.log('Search shortcut triggered');
            }

            // Left/Right arrow keys for topic navigation (when not in input)
            if (document.activeElement.tagName !== 'INPUT' &&
                document.activeElement.tagName !== 'TEXTAREA') {

                if (e.key === 'ArrowLeft') {
                    const prevLink = document.querySelector('.nav-link.prev');
                    if (prevLink) prevLink.click();
                }

                if (e.key === 'ArrowRight') {
                    const nextLink = document.querySelector('.nav-link.next');
                    if (nextLink) nextLink.click();
                }
            }
        });
    }

    /**
     * Reinitialize dynamic content (called after router loads new content)
     */
    function reinitDynamicContent() {
        initCopyButtons();
        if (typeof SyntaxHighlighter !== 'undefined') {
            SyntaxHighlighter.init();
        }
    }

    // Expose reinit function globally for router to use
    window.App = {
        reinitDynamicContent
    };

    // Initialize when DOM is ready
    if (document.readyState === 'loading') {
        document.addEventListener('DOMContentLoaded', init);
    } else {
        init();
    }
})();
