// Smooth scrolling for navigation links
console.log("=== SCRIPT.JS LOADED SUCCESSFULLY ===");
console.log("Current URL:", window.location.href);
console.log("Pathname:", window.location.pathname);

// --- MODIFICATION: Determine Base Path ---
const path = window.location.pathname.toLowerCase();
const isInProjects = path.includes("/projects/");
const basePath = isInProjects ? "../" : "";
// -----------------------------------------

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
        a.play().catch(() => {}).then(() => {
            a.pause();
            a.currentTime = 0;
            a.muted = false;
        });
    });
    window.removeEventListener('click', unlockAudio, true);
}
window.addEventListener('click', unlockAudio, {once: true, capture: true});
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
        console.error("TEXT ELEMENT NOT FOUND!");
        alert("Error: Holo text element not found!");
        return;
    }
    
    if (!dialog) {
        console.error("DIALOG ELEMENT NOT FOUND!");
        alert("Error: Holo dialog not found!");
        return;
    }

    // Add shake animation
    element.classList.add("shaking");
    setTimeout(() => { element.classList.remove("shaking"); }, 400);

    // Show dialog - FORCE DISPLAY
    element.classList.add("talking");
    clearTimeout(holoTimeout);

    // Use global path vars
    const isMainPage = path.endsWith("index.html") || path === "/" || path.endsWith("/resume") || path.endsWith("/resume/");
    
    // Explicitly Log for Debugging
    console.log("------------------------------------------------");
    console.log("Raw Path:", path);
    console.log("Is Main Page?", isMainPage);
    console.log("Current Tap Count:", holoTapCount);

    // FORCE VISIBILITY - Override all CSS
    dialog.style.width = ""; // Reset potentially modified width from scroll event
    dialog.style.maxWidth = ""; // Reset potentially modified max-width from scroll event
    dialog.style.display = "block";
    dialog.style.opacity = "1";
    dialog.style.transform = "translateY(0)";
    dialog.style.visibility = "visible";
    dialog.style.pointerEvents = "auto";
    
    if (isMainPage) {
        // --- MAIN PAGE STATE ---
        // Fun interactions, vanish after 5 taps, come back later.
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
        // --- NON-MAIN PAGE STATE (ALL "View Details" Pages) ---
        // Warning -> Threat -> Attack -> Redirect
        console.log("Executing Sub-page Logic"); // Debug trigger
        
        if (holoTapCount === 1) text.innerText = "You should be reading!";
        else if (holoTapCount === 2) text.innerText = "Focus on the project!";
        else if (holoTapCount === 3) {
            text.innerText = "I'LL SEND YOU BACK HOME IF YOU DO IT AGAIN!";
            // Pre-load assets for smooth animation
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

    const limit = isMainPage ? 5 : 4; // Updated limit for sub-page logic (4 taps)
    if (holoTapCount < limit) {
        // Reset timeout to hide dialog
        holoTimeout = setTimeout(() => { 
            element.classList.remove("talking");
            // Clear inline styles to let CSS take over or hide it
            dialog.style.opacity = "";
            dialog.style.transform = "";
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
        
        // Special handling for links that navigate away (causing sound cut-off)
        // If it's an <a> tag, has an href, is NOT opening in new tab, and is NOT a hash link (smooth scroll)
        if (target.tagName === 'A' && target.href && target.target !== '_blank' && !target.getAttribute('href').startsWith('#')) {
            e.preventDefault(); // Stop immediate navigation
            playClickSound();
            
            // Wait 150ms for sound to start, then navigate manually
            setTimeout(() => {
                window.location.href = target.href;
            }, 150);
        } else {
            // New tabs or buttons just play sound immediately
            playClickSound();
        }
    }
});

// Holo "End of Page" Interaction
let hasReachedBottom = false;

window.addEventListener('scroll', () => {
    if (hasReachedBottom) return; // Only trigger once per page load

    // Check if near bottom (within 50px)
    if ((window.innerHeight + window.scrollY) >= document.body.offsetHeight - 50) {
        hasReachedBottom = true;
        
        const holoContainer = document.querySelector("#holo-container");
        const holoText = document.querySelector("#holo-text");
        const dialog = document.querySelector(".holo-dialog-box");

        if (holoContainer && holoText && dialog) {
            // Only trigger if she's not currently "vanished" or busy
            if (!holoContainer.classList.contains("vanished") && !holoContainer.classList.contains("talking")) {
                
                holoText.innerText = "You've come to the end, do you like it? Press `view details` in the 'featured projects' section if you have not!";
                
                // Force show dialog using same logic as interact
                holoContainer.classList.add("talking");
                dialog.style.width = "400px"; // Make it wider for this long text
                dialog.style.maxWidth = "none"; // Remove any max-width constraint
                dialog.style.display = "block";
                dialog.style.opacity = "1";
                dialog.style.transform = "translateY(0)";
                dialog.style.visibility = "visible";

                // Shake her to get attention
                holoContainer.classList.add("shaking");
                setTimeout(() => { holoContainer.classList.remove("shaking"); }, 400);

                // Hide after 5 seconds automatically
                setTimeout(() => {
                    holoContainer.classList.remove("talking");
                    dialog.style.opacity = "";
                    dialog.style.transform = "";
                    
                    // Wait for fade out transition (300ms) to finish before resetting width
                    // This prevents the "snap to small size" glitch while fading out
                    setTimeout(() => {
                        dialog.style.width = ""; 
                        dialog.style.maxWidth = ""; 
                    }, 350); 
                }, 5000);
            }
        }
    }
});
