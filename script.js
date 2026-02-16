// Smooth scrolling for navigation links
console.log("=== SCRIPT.JS LOADED SUCCESSFULLY ===");
console.log("Current URL:", window.location.href);
console.log("Pathname:", window.location.pathname);

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

// Typing effect removed in favor of CSS animation
/*
const heroText = "Hi, I'm Yao Xiang! A computer engineering student!";
const heroElement = document.querySelector('#hero h2');
let i = 0;

function typeWriter() {
    if (i < heroText.length) {
        heroElement.innerHTML += heroText.charAt(i);
        i++;
        setTimeout(typeWriter, 100);
    } else {
        // Add cursor blinking effect
        heroElement.innerHTML += '<span class="cursor">|</span>';
        setInterval(() => {
            const cursor = document.querySelector('.cursor');
            if (cursor) {
                cursor.style.opacity = cursor.style.opacity === '0' ? '1' : '0';
            }
        }, 500);
    }
}
*/

// Start typing effect when page loads - REMOVED
/*
window.addEventListener('load', () => {
    heroElement.innerHTML = '';
    typeWriter();
});
*/

// Scroll animations
const observerOptions = {
    threshold: 0.1,
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

/*
// Add hover effects to project cards - Moving to CSS for smoother performance
document.querySelectorAll('.project-card').forEach(card => {
    card.addEventListener('mouseenter', () => {
        card.style.transform = 'translateY(-10px) scale(1.02)';
    });

    card.addEventListener('mouseleave', () => {
        card.style.transform = 'translateY(0) scale(1)';
    });
});
*/

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
}, { threshold: 0.5 });

if (skillsSection) {
    skillsObserver.observe(skillsSection);
}

// Add dynamic background color change on scroll - REMOVED for performance/dampening
// window.addEventListener('scroll', () => {
//     const scrollPosition = window.scrollY;
//     const body = document.body;
//     const hue = (scrollPosition / 10) % 360;
//     body.style.background = `linear-gradient(135deg, hsl(${hue}, 50%, 10%) 0%, hsl(${hue + 60}, 50%, 15%) 50%, hsl(${hue + 120}, 50%, 20%) 100%)`;
// });

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

    const path = window.location.pathname.toLowerCase();
    const isMainPage = path.endsWith("index.html") || path === "/" || path.endsWith("/resume") || path.endsWith("/resume/");
    
    // Explicitly Log for Debugging
    console.log("------------------------------------------------");
    console.log("Raw Path:", path);
    console.log("Is Main Page?", isMainPage);
    console.log("Current Tap Count:", holoTapCount);

    // FORCE VISIBILITY - Override all CSS
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
            const popSound = new Audio("images/bubble-pop.mp3");
            popSound.volume = 0.6;
            popSound.play().catch(e => console.log("Pop sound failed:", e));

            element.classList.add("vanished");
            
            // Reappear after 10 seconds
            setTimeout(() => {
                element.classList.remove("vanished");
                
                // Play Pop Sound again
                const popReturn = new Audio("images/bubble-pop.mp3");
                popReturn.volume = 0.6;
                popReturn.play().catch(e => console.log("Pop return failed:", e));

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
            const attackGif = new Image(); attackGif.src = "images/holo-attack.gif";
            const glassImg = new Image(); glassImg.src = "images/broken-glass_nobg.png";
            const shatterSound = new Audio("images/glass-shatter.mp3"); shatterSound.preload = "auto";
        }
        else if (holoTapCount >= 4) {
            text.innerText = "BEGONE!";
            
            // 1. Create Elements if they don't exist
            let attackImg = document.querySelector(".holo-attack-gif");
            if (!attackImg) {
                attackImg = document.createElement("img");
                attackImg.src = "images/holo-attack.gif";
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
            const shatterAudio = new Audio("images/glass-shatter.mp3");
            
            setTimeout(() => {
                shatterAudio.play().catch(e => console.log("Audio play failed:", e));
                glassOverlay.classList.add("glass-shattered");
                attackImg.style.opacity = "0"; // Hide holo after shatter
            }, 600); // Adjust timing to match GIF impact

            // 4. Redirect after delay
            setTimeout(() => { 
                console.log("Redirecting to index.html...");
                window.location.href = "index.html"; 
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
    const clickSound = new Audio("images/mouse-click.mp3");
    clickSound.volume = 0.4;
    // We don't wait for the promise here because we handle delay separately
    clickSound.play().catch(e => console.log("Click sound failed:", e));
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
                
                holoText.innerText = "You've come to the end, do you like it? Press `view details` if you have not!";
                
                // Force show dialog using same logic as interact
                holoContainer.classList.add("talking");
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
                }, 5000);
            }
        }
    }
});
