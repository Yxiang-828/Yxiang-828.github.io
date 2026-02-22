// Smooth scrolling for navigation links
console.log("=== SCRIPT.JS LOADED SUCCESSFULLY ===");
console.log("Current URL:", window.location.href);
console.log("Pathname:", window.location.pathname);

// --- Path Logic ---
const path = window.location.pathname.toLowerCase();
const isInProjects = path.includes("/projects/");
const basePath = isInProjects ? "../" : "";
// --- Navigation Lock ---
window.holoCanNavigate = false;

// --- Audio Preloading ---
const sounds = {
    click: new Audio(basePath + "images/mouse-click.mp3"),
    pop: new Audio(basePath + "images/bubble-pop.mp3"),
    shatter: new Audio(basePath + "images/glass-shatter.mp3")
};

// Preload them so they play immediately
Object.values(sounds).forEach(audio => {
    audio.preload = "auto";
    audio.load();
});

// --- Unlock audio on first user gesture ---
let audioUnlocked = false;
function unlockAudio() {
    if (audioUnlocked) return;
    audioUnlocked = true;
    // play once muted to prime decoding/permission
    Object.values(sounds).forEach(a => {
        a.muted = true;
        a.play().catch(() => { }).then(() => {
            a.pause();
            a.currentTime = 0;
            a.muted = false;
        });
    });
    window.removeEventListener('click', unlockAudio, true);
}
window.addEventListener('click', unlockAudio, { once: true, capture: true });
// --------------------------------------------------

function playSound(type, volume = 1.0) {
    if (sounds[type]) {
        // Clone the node to allow overlapping sounds if clicked rapidly
        const soundClone = sounds[type].cloneNode();
        soundClone.volume = volume;
        soundClone.play().then(() => {
            // console.log(`${type} sound played`);
        }).catch(e => {
            console.log(`${type} sound failed:`, e, 'readyState=', sounds[type].readyState);
        });
    } else {
        console.warn('Requested sound', type, 'does not exist');
    }
}
// ------------------------

// --- View Counter ---
async function updateCounter() {
    try {
        const counterElement = document.getElementById('view-counter');
        const countValue = document.getElementById('count-value');

        if (!counterElement || !countValue) return;

        // Using counterapi.dev - free simple counter service
        // Namespace: Yxiang-828, Key: portfolio
        const response = await fetch('https://api.counterapi.dev/v1/Yxiang-828/portfolio/up');

        if (!response.ok) {
            throw new Error('Counter API failed');
        }

        const data = await response.json();
        countValue.textContent = data.count;
        counterElement.style.display = 'block'; // Show only after successful load

    } catch (error) {
        console.log('View counter unavailable:', error);
        // Fallback or just keep hidden
    }
}

document.addEventListener('DOMContentLoaded', updateCounter);
// --------------------

document.querySelectorAll('nav a[href^="#"]').forEach(anchor => {
    anchor.addEventListener('click', function (e) {
        e.preventDefault();
        const target = document.querySelector(this.getAttribute('href'));
        if (target) {
            target.scrollIntoView({
                behavior: 'smooth',
                block: 'start'
            });
        }
    });
});

// Scroll animations
const observerOptions = {
    threshold: 0.05, // Lowered threshold so it triggers earlier on mobile
    rootMargin: '0px 0px -50px 0px'
};

const observer = new IntersectionObserver((entries) => {
    entries.forEach(entry => {
        if (entry.isIntersecting) {
            entry.target.classList.add('animate-in');
        }
    });
}, observerOptions);

// Observe all sections
document.querySelectorAll('section').forEach(section => {
    observer.observe(section);
});

// Add particle effect to hero background
function createParticles() {
    const hero = document.getElementById('hero');
    if (!hero) return; // Prevent crash on pages without hero section

    for (let i = 0; i < 50; i++) {
        const particle = document.createElement('div');
        particle.className = 'particle';
        particle.style.left = Math.random() * 100 + '%';
        particle.style.animationDelay = Math.random() * 20 + 's';
        particle.style.animationDuration = (Math.random() * 10 + 10) + 's';
        hero.appendChild(particle);
    }
}

createParticles();

// Add skill progress bars animation
function animateSkillBars() {
    const skillItems = document.querySelectorAll('.skill-category li');
    skillItems.forEach((item, index) => {
        setTimeout(() => {
            item.style.opacity = '1';
            item.style.transform = 'translateX(0)';
        }, index * 100);
    });
}

// Trigger skill animation when skills section is in view
const skillsSection = document.getElementById('skills');
const skillsObserver = new IntersectionObserver((entries) => {
    entries.forEach(entry => {
        if (entry.isIntersecting) {
            animateSkillBars();
        }
    });
}, { threshold: 0.05 });

if (skillsSection) {
    skillsObserver.observe(skillsSection);
}

// Add click effect to CTA button
const ctaButton = document.querySelector('.cta-button');
if (ctaButton) {
    ctaButton.addEventListener('click', (e) => {
        // Create ripple effect
        const ripple = document.createElement('div');
        ripple.className = 'ripple';
        ripple.style.left = e.offsetX + 'px';
        ripple.style.top = e.offsetY + 'px';
        ctaButton.appendChild(ripple);

        setTimeout(() => {
            ripple.remove();
        }, 600);
    });
}
let tapCount = 0;
let lastTapTime = 0;

window.chibiInteract = (element) => {
    const now = Date.now();

    // Reset combo if gap is too long
    if (now - lastTapTime > 1000) {
        tapCount = 0;
        element.classList.remove("shake");
    }

    tapCount++;
    lastTapTime = now;

    // Animate shake
    element.classList.add("shake");
    setTimeout(() => {
        element.classList.remove("shake");
    }, 500);

    // Interactive feedback
    const tooltip = element.querySelector(".chibi-tooltip");

    if (tapCount < 3) {
        tooltip.textContent = "Hey!";
        tooltip.style.opacity = "1";
    } else if (tapCount < 5) {
        tooltip.textContent = "Stop it!";
        tooltip.style.background = "#ff6b6b";
    } else {
        tooltip.textContent = "Ouch! Dizzy...";
        tooltip.style.background = "#8b0000";
        element.classList.add("dizzy");

        // Reset after a while
        setTimeout(() => {
            element.classList.remove("dizzy");
            tapCount = 0;
            tooltip.textContent = "I recovered!";
            tooltip.style.background = "#ff4444";
            setTimeout(() => { tooltip.style.opacity = ""; }, 2000);
        }, 3000);
    }

    // Hide tooltip after a delay if not dizzy
    if (tapCount < 5) {
        setTimeout(() => { tooltip.style.opacity = ""; }, 1500);
    }
};


// Holo Interaction Logic
let holoTapCount = 0;
let holoTimeout;

window.holoInteract = (element) => {
    console.log("=== HOLO CLICKED! FUNCTION CALLED ===");

    holoTapCount++;
    const dialog = element.querySelector(".holo-dialog-box");
    const text = element.querySelector("#holo-text");

    console.log("Dialog element:", dialog);
    console.log("Text element:", text);

    if (!text) {
        console.error("Holo text element not found.");
        return;
    }

    if (!dialog) {
        console.error("Holo dialog element not found.");
        return;
    }

    // Add shake animation
    element.classList.add("shaking");
    setTimeout(() => { element.classList.remove("shaking"); }, 400);

    // Show dialog
    element.classList.add("talking");
    clearTimeout(holoTimeout);

    const isMainPage = path.endsWith("index.html") || path === "/" || path.endsWith("/resume") || path.endsWith("/resume/");
    if (!isMainPage) {
        element.classList.add('holo-visible');
    }

    // reset interaction dialog box tracking for css
    dialog.classList.add('interaction-active');

    if (isMainPage) {
        // --- MAIN PAGE STATE ---
        // if loader still present and user clicked ready prompt
        const loaderElem = document.getElementById('loader');
        if (text && text.innerText === 'Ready?') {
            if (loaderElem) loaderElem.remove();

            // reveal page content now that user has acknowleged
            document.body.classList.remove('preload');
            element.classList.remove('holo-splash-center');
            text.innerText = "Greetings, traveler.";
            window.holoCanNavigate = true;
            sessionStorage.setItem('visited', 'true');

            // Allow dialogue to close naturally
            holoTimeout = setTimeout(() => {
                element.classList.remove("talking");
                dialog.classList.remove("interaction-active");
                dialog.classList.remove("interaction-end");
            }, 3000);
            return;
        }

        // Fun interactions after initial entry, vanish after 5 taps, come back later.
        if (holoTapCount === 1) text.innerText = "Greetings, traveler.";
        else if (holoTapCount === 2) text.innerText = "Do you have any apples?";
        else if (holoTapCount === 3) text.innerText = "Stop poking me!";
        else if (holoTapCount === 4) text.innerText = "I mean it!";
        else if (holoTapCount >= 5) {
            text.innerText = "mph!";

            // Play Pop Sound
            playSound('pop', 0.6);

            element.classList.add("vanished");

            // Reappear after 10 seconds
            setTimeout(() => {
                element.classList.remove("vanished");

                // Play Pop Sound again
                playSound('pop', 0.6);

                holoTapCount = 0; // Reset interaction
                text.innerText = "I'm back!";
                element.classList.add("talking");

                // Hide welcome back message
                setTimeout(() => { element.classList.remove("talking"); }, 2000);
            }, 10000);
            return;
        }
    } else {
        // --- NON-MAIN PAGE STATE ---
        if (holoTapCount === 1) text.innerText = "You should be reading!";
        else if (holoTapCount === 2) text.innerText = "Focus on the project!";
        else if (holoTapCount === 3) {
            text.innerText = "Don't make me angry!";
            const attackGif = new Image(); attackGif.src = basePath + "images/holo-attack.gif";
            const glassImg = new Image(); glassImg.src = basePath + "images/broken-glass_nobg.png";
        }
        else if (holoTapCount >= 4) {
            text.innerText = "BEGONE!";

            // 1. Create Elements if they don't exist
            let attackImg = document.querySelector(".holo-attack-gif");
            if (!attackImg) {
                attackImg = document.createElement("img");
                attackImg.src = basePath + "images/holo-attack.gif"; // UPDATED PATH
                attackImg.classList.add("holo-attack-gif");
                document.body.appendChild(attackImg);
            }

            let glassOverlay = document.querySelector(".broken-glass-overlay");
            if (!glassOverlay) {
                glassOverlay = document.createElement("div");
                glassOverlay.classList.add("broken-glass-overlay");
                document.body.appendChild(glassOverlay);
            }

            // 2. Play Attack Animation (Zoom In from Top Right)
            // Reset state first to ensure replayability if needed
            attackImg.classList.remove("holo-attack-active");
            void attackImg.offsetWidth; // Trigger reflow

            // Start animation
            attackImg.classList.add("holo-attack-active");

            // 3. Play Shatter Sound & Show Glass (Timed with impact)
            setTimeout(() => {
                playSound('shatter', 0.8);
                glassOverlay.classList.add("glass-shattered");
                attackImg.style.opacity = "0"; // Hide holo after shatter
            }, 600); // Adjust timing to match GIF impact

            // 4. Redirect after delay
            setTimeout(() => {
                console.log("Redirecting to index.html...");
                window.location.href = basePath + "index.html"; // UPDATED PATH (Back to home)
            }, 1600); // 600ms impact + 1000ms delay

            return;
        }
    }

    const limit = isMainPage ? 5 : 4;
    if (holoTapCount < limit) {
        holoTimeout = setTimeout(() => {
            element.classList.remove("talking");
            dialog.classList.remove("interaction-active");
            dialog.classList.remove("interaction-end");
        }, 3000);
    }
};


// Global Click Sound Effect
function playClickSound() {
    playSound('click', 0.4);
}

// Global Event Listener - Catches ALL interaction clicks with Navigation Delay
document.addEventListener('click', (e) => {
    // We want to catch:
    // 1. Any <button>
    // 2. Any <a> link
    // 3. Any element with role="button"
    // 4. Any input specific types
    // 5. Explicit interactive classes like .project-card

    const target = e.target.closest('a, button, [role="button"], input[type="submit"], input[type="button"], input[type="reset"], .project-card, .cta-button');

    // Condition 1: Must be a valid target
    // Condition 2: Must NOT be inside Holo container (she has her own sounds)
    if (target && !e.target.closest('#holo-container')) {
        // check navigation lock on main page
        const isMainPage = path.endsWith("index.html") || path === "/" || path.endsWith("/resume") || path.endsWith("/resume/");
        if (isMainPage && !window.holoCanNavigate) {
            // prevent navigation attempts until holo clicked
            if (target.tagName === 'A' && target.href && target.target !== '_blank' && !target.getAttribute('href').startsWith('#')) {
                // silently block and maybe prompt user
                console.log('Navigation blocked until holo is tapped');
                return; // drop the event
            }
        }

        const isNewTabModifier = e.ctrlKey || e.metaKey || e.button === 1;

        if (target.tagName === 'A' && target.href && target.target !== '_blank' && !target.getAttribute('href').startsWith('#')) {
            playClickSound();

            // Allow native navigation if the user is explicitly requesting a new tab via modifier or middle click
            if (!isNewTabModifier) {
                e.preventDefault();
                setTimeout(() => {
                    window.location.href = target.href;
                }, 150);
            }
        } else {
            // New tabs, buttons, or hash links play sound immediately
            playClickSound();
        }
    }
});

// Holo "End of Page" Interaction
let hasReachedBottom = false;

let scrollThrottle = false;

window.addEventListener('scroll', () => {
    if (hasReachedBottom) return;

    if (!scrollThrottle) {
        window.requestAnimationFrame(() => {
            if ((window.innerHeight + window.scrollY) >= document.body.offsetHeight - 50) {
                hasReachedBottom = true;

                const holoContainer = document.querySelector("#holo-container");
                const holoText = document.querySelector("#holo-text");
                const dialog = document.querySelector(".holo-dialog-box");

                if (holoContainer && holoText && dialog) {
                    holoContainer.classList.remove("vanished");


                    const isMainPage = path.endsWith("index.html") || path === "/" || path.endsWith("/resume") || path.endsWith("/resume/");

                    if (isMainPage) {
                        holoText.innerText = "You've come to the end, do you like it? Press `view details` in the 'featured projects' section if you have not!";
                    } else {
                        holoText.innerText = "How is it?";
                    }

                    holoContainer.classList.add("talking");
                    dialog.classList.add("interaction-end");

                    holoContainer.classList.add("shaking");
                    setTimeout(() => { holoContainer.classList.remove("shaking"); }, 400);

                    setTimeout(() => {
                        holoContainer.classList.remove("talking");
                        dialog.classList.remove("interaction-end");
                    }, 5000);
                }
            }
            scrollThrottle = false;
        });
        scrollThrottle = true;
    }
});
