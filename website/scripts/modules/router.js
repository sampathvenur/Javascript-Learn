/**
 * Router Module
 * Simple hash-based SPA router for loading topic content
 */

const Router = (function () {
    'use strict';

    // DOM Elements
    let homeScreen, topicContainer, loadingState, errorState;

    // Cache for loaded content
    const contentCache = {};

    /**
     * Initialize router
     */
    function init() {
        // Cache DOM elements
        homeScreen = document.getElementById('home-screen');
        topicContainer = document.getElementById('topic-container');
        loadingState = document.getElementById('loading-state');
        errorState = document.getElementById('error-state');

        // Listen for hash changes
        window.addEventListener('hashchange', handleRoute);

        // Handle initial route
        handleRoute();
    }

    /**
     * Handle route changes
     */
    function handleRoute() {
        const hash = window.location.hash.slice(1); // Remove #

        if (!hash || hash === '/') {
            showHome();
        } else {
            loadTopic(hash);
        }
    }

    /**
     * Show home screen
     */
    function showHome() {
        hideAll();
        homeScreen.style.display = 'block';
        Navigation.setActiveFromHash('');
    }

    /**
     * Load topic content
     */
    async function loadTopic(path) {
        hideAll();
        showLoading();

        // Parse path: /1-foundations/variables -> topics/1-foundations/variables.html
        const filePath = `topics${path}.html`;

        try {
            let content;

            // Check cache first
            if (contentCache[filePath]) {
                content = contentCache[filePath];
            } else {
                const response = await fetch(filePath);

                if (!response.ok) {
                    throw new Error('Topic not found');
                }

                content = await response.text();
                contentCache[filePath] = content;
            }

            // Display content
            hideLoading();
            topicContainer.innerHTML = content;
            topicContainer.style.display = 'block';

            // Initialize syntax highlighting for new content
            if (typeof SyntaxHighlighter !== 'undefined') {
                SyntaxHighlighter.init();
            }

            // Update navigation active state
            Navigation.setActiveFromHash(path);

            // Scroll to top
            window.scrollTo(0, 0);

        } catch (error) {
            console.error('Error loading topic:', error);
            hideLoading();
            showError();
        }
    }

    /**
     * Hide all content areas
     */
    function hideAll() {
        homeScreen.style.display = 'none';
        topicContainer.style.display = 'none';
        errorState.style.display = 'none';
        hideLoading();
    }

    /**
     * Show loading state
     */
    function showLoading() {
        loadingState.style.display = 'flex';
    }

    /**
     * Hide loading state
     */
    function hideLoading() {
        loadingState.style.display = 'none';
    }

    /**
     * Show error state
     */
    function showError() {
        errorState.style.display = 'flex';
    }

    /**
     * Navigate to a specific path
     */
    function navigate(path) {
        window.location.hash = path;
    }

    /**
     * Clear content cache
     */
    function clearCache() {
        Object.keys(contentCache).forEach(key => delete contentCache[key]);
    }

    // Public API
    return {
        init,
        navigate,
        clearCache
    };
})();

// Initialize when DOM is ready
if (document.readyState === 'loading') {
    document.addEventListener('DOMContentLoaded', Router.init);
} else {
    Router.init();
}
