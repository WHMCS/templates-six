function toggleFAQ(event) {
    event.preventDefault();

    const label = event.currentTarget;
    const faqItem = label.closest('.faq-item');
    const checkbox = faqItem.querySelector('.faq-toggle');

    if (!checkbox) {

        return;
    }

    const isCurrentlyExpanded = checkbox.checked;

    // Close all other FAQs
    const allFaqItems = document.querySelectorAll('.faq-item');
    allFaqItems.forEach(item => {
        const cb = item.querySelector('.faq-toggle');
        const lbl = item.querySelector('.faq-question');
        if (cb && lbl && item !== faqItem) {
            cb.checked = false;
            lbl.setAttribute('aria-expanded', 'false');
        }
    });

    // Toggle current FAQ (opposite of current state)
    checkbox.checked = !isCurrentlyExpanded;
    label.setAttribute('aria-expanded', checkbox.checked ? 'true' : 'false');
}

// Initialize FAQ functionality
document.addEventListener('DOMContentLoaded', function () {
    const faqLabels = document.querySelectorAll('.faq-question');

    faqLabels.forEach(label => {
        // Click support
        label.addEventListener('click', toggleFAQ);

        // Keyboard support
        label.addEventListener('keydown', function (e) {
            if (e.key === 'Enter' || e.key === ' ') {
                e.preventDefault();
                toggleFAQ(e);
            }
        });
    });
});


function openVideoPopup() {
    const popup = document.getElementById('videoPopup');
    const video = document.getElementById('popupVideo');
    if (popup && video) {
        video.play();
        popup.style.display = 'block';
        document.body.style.overflow = 'hidden';
    }
}

function closeVideoPopup() {
    const popup = document.getElementById('videoPopup');
    const video = document.getElementById('popupVideo');
    if (popup && video) {
        video.pause();
        video.currentTime = 0;
        popup.style.display = 'none';
        document.body.style.overflow = 'auto';
    }
}

// Close popup when clicking outside the video
document.addEventListener('DOMContentLoaded', function() {
    const videoPopup = document.getElementById('videoPopup');
    if (videoPopup) {
        videoPopup.addEventListener('click', function (e) {
            if (e.target === this) {
                closeVideoPopup();
            }
        });
    }
});

// Close popup with Escape key
document.addEventListener('keydown', function (e) {
    if (e.key === 'Escape') {
        closeVideoPopup();
    }
});