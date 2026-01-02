/**
 * Navigation Module
 * Handles sidebar toggle, phase expansion, and active state management
 */

const Navigation = (function () {
    'use strict';

    // DOM Elements
    let sidebar, sidebarOverlay, hamburgerBtn, phaseToggles;

    /**
     * Initialize navigation
     */
    function init() {
        // Cache DOM elements
        sidebar = document.getElementById('sidebar');
        sidebarOverlay = document.getElementById('sidebar-overlay');
        hamburgerBtn = document.getElementById('hamburger-btn');
        phaseToggles = document.querySelectorAll('.phase-toggle');

        // Bind events
        bindEvents();
    }

    /**
     * Bind all event listeners
     */
    function bindEvents() {
        // Hamburger menu toggle
        if (hamburgerBtn) {
            hamburgerBtn.addEventListener('click', toggleSidebar);
        }

        // Overlay click closes sidebar
        if (sidebarOverlay) {
            sidebarOverlay.addEventListener('click', closeSidebar);
        }

        // Phase toggle buttons
        phaseToggles.forEach(toggle => {
            toggle.addEventListener('click', handlePhaseToggle);
        });

        // Topic link clicks
        document.querySelectorAll('.phase-topics a').forEach(link => {
            link.addEventListener('click', handleTopicClick);
        });

        // Phase card clicks on homepage
        document.querySelectorAll('.phase-card').forEach(card => {
            card.addEventListener('click', handlePhaseCardClick);
        });

        // Handle escape key
        document.addEventListener('keydown', (e) => {
            if (e.key === 'Escape') closeSidebar();
        });
    }

    /**
     * Toggle sidebar open/closed
     */
    function toggleSidebar() {
        sidebar.classList.toggle('open');
        sidebarOverlay.classList.toggle('active');
        hamburgerBtn.classList.toggle('active');
        document.body.style.overflow = sidebar.classList.contains('open') ? 'hidden' : '';
    }

    /**
     * Close sidebar
     */
    function closeSidebar() {
        sidebar.classList.remove('open');
        sidebarOverlay.classList.remove('active');
        hamburgerBtn.classList.remove('active');
        document.body.style.overflow = '';
    }

    /**
     * Handle phase toggle click
     */
    function handlePhaseToggle(e) {
        const phaseEl = e.currentTarget.closest('.nav-phase');
        const isExpanded = phaseEl.classList.contains('expanded');

        // Toggle current phase
        phaseEl.classList.toggle('expanded');
        e.currentTarget.setAttribute('aria-expanded', !isExpanded);
    }

    /**
     * Handle topic link click
     */
    function handleTopicClick(e) {
        // Update active state
        document.querySelectorAll('.phase-topics li').forEach(li => {
            li.classList.remove('active');
        });
        e.currentTarget.parentElement.classList.add('active');

        // Close sidebar on mobile
        if (window.innerWidth <= 1024) {
            closeSidebar();
        }
    }

    /**
     * Handle phase card click on homepage
     */
    function handlePhaseCardClick(e) {
        const phase = e.currentTarget.dataset.phase;
        const phaseEl = document.querySelector(`.nav-phase[data-phase="${phase}"]`);

        if (phaseEl) {
            // Expand the phase
            phaseEl.classList.add('expanded');
            phaseEl.querySelector('.phase-toggle').setAttribute('aria-expanded', 'true');

            // Get first topic link and navigate
            const firstTopic = phaseEl.querySelector('.phase-topics a');
            if (firstTopic) {
                window.location.hash = firstTopic.getAttribute('href').substring(1);
            }
        }
    }

    /**
     * Set active topic based on current hash
     */
    function setActiveFromHash(hash) {
        // Remove all active states
        document.querySelectorAll('.phase-topics li').forEach(li => {
            li.classList.remove('active');
        });

        // Find matching link and set active
        const activeLink = document.querySelector(`.phase-topics a[href="#${hash}"]`);
        if (activeLink) {
            activeLink.parentElement.classList.add('active');

            // Expand parent phase
            const phaseEl = activeLink.closest('.nav-phase');
            if (phaseEl) {
                phaseEl.classList.add('expanded');
                phaseEl.querySelector('.phase-toggle').setAttribute('aria-expanded', 'true');
            }
        }
    }

    /**
     * Expand a specific phase by number
     */
    function expandPhase(phaseNum) {
        const phaseEl = document.querySelector(`.nav-phase[data-phase="${phaseNum}"]`);
        if (phaseEl) {
            phaseEl.classList.add('expanded');
            phaseEl.querySelector('.phase-toggle').setAttribute('aria-expanded', 'true');
        }
    }

    // Public API
    return {
        init,
        closeSidebar,
        setActiveFromHash,
        expandPhase
    };
})();

// Initialize when DOM is ready
if (document.readyState === 'loading') {
    document.addEventListener('DOMContentLoaded', Navigation.init);
} else {
    Navigation.init();
}
