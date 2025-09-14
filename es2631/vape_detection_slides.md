# Vape Detection Solution - Slide Content

## **Slide 1: Purpose & Point of View - "Why Clubs Need Intelligent Vape Detection"**

### **SCRIPT (30-45 seconds):**

"Singapore's club environments present a perfect storm for undetected vaping - loud music, dense crowds, low lighting, and fog machines make traditional detection impossible. 📊 **[VISUAL: Club environment diagram showing detection challenges]** This creates critical enforcement gaps for three key stakeholders:

Club owners need reliable detection to maintain their licenses and avoid S$10,000 fines 📚 **[CITATION: Singapore vaping control regulations and penalties]**, but current methods either miss violations entirely or create false alarms that disrupt the customer experience. Public health authorities require consistent enforcement data to protect the 13-35 demographic most vulnerable to vaping normalization 📚 **[CITATION: Age demographics for vaping prevalence in Singapore / or quote prev speaker]**. Law enforcement needs actionable intelligence for all vaping violations, especially drug-laced variants that pose serious health risks, as mentioned by sivansh in his slides.

Therefore, our purpose is to develop an intelligent, adaptive vape detection system that operates effectively in challenging club environments while serving the discrete enforcement needs of multiple stakeholders."

---

## **Slide 2: Core Concept - "How Our Solution Works"**

### **SCRIPT (60 seconds):**

"Our solution uses a four-layer intelligent detection system. 📊 **[VISUAL: System architecture diagram with four detection layers]** First, it continuously learns the club's normal environmental baseline - tracking patterns like peak hours and fog machine usage.

Second, our signature classification engine analyzes particle size distributions and chemical signatures. 📊 **[VISUAL: Particle size comparison chart - vape vs fog vs other sources]** Vape puffs have distinct temporal patterns 📚 **[CITATION: Studies on vape aerosol characteristics and temporal patterns; Li et al. (2024) - Ventilation and features of the lung environment dynamically alter modeled intrapulmonary aerosol exposure from inhaled electronic cigarettes, Scientific Reports]**, and we detect specific compounds like propylene glycol while cross-correlating with drug markers like etomidate 📚 **[CITATION: Chemical composition studies of vaping products and drug-laced variants]**.

Third, intelligent filtering eliminates false positives. We differentiate fog machines - which produce large, sustained volumes - from localized vape puffs. 📊 **[VISUAL: Signal processing graph showing vape signature vs environmental noise]** We filter out perfumes and breath moisture using molecular weight analysis and CO2 correlation 📚 **[CITATION: Environmental interference studies in detection systems; Li et al. (2024) - Hygroscopic growth of e-cig particles in humid lung environment (88% RH) leading to increased micron particle sizes and altered decay rates]**.

Finally, our Bayesian inference engine combines all sensor inputs, assigns confidence scores, and adapts thresholds based on environmental context. 📊 **[VISUAL: Confidence scoring visualization showing sensor fusion]** Only events above certain percentage of confidence trigger alerts 📚 **[CITATION: Optimal confidence thresholds for environmental detection systems balancing false positives and enforcement effectiveness]**."

---

## **Slide 3: Deployment Strategy - "Strategic Implementation"**

### **SCRIPT (45 seconds):**

"Deployment involves strategic placement in high-risk zones - entrance corridors, VIP sections, and bar areas where vaping is most likely. 📊 **[VISUAL: Club floor plan showing optimal detector placement zones]** We avoid areas near fog machines and HVAC vents to minimize false positives.

Our mesh network topology allows distributed processing - each detector validates findings with adjacent units, creating redundancy and improving accuracy through cross-correlation. 📊 **[VISUAL: Network topology diagram showing detector communication mesh]**

Installation requires vibration isolation from bass frequencies, electromagnetic shielding from DJ equipment, and above 1.8-meter positioning for airflow capture 📚 **[CITATION: Environmental factors affecting sensor performance in entertainment venues]**. The system undergoes a pre-calibrated duration of baseline establishment, learning the venue's unique environmental signature before going operational.

---

## **Slide 4: Operational Flow & Implications - "Balancing Innovation with Responsibility"**

### **SCRIPT (60 seconds):**

"This technology creates a paradigm shift from reactive to proactive venue management. Our real-time response protocol works like this: when sensors detect vaping with say, 90% confidence, location is triangulated and discrete alerts sent to security - no more random searches or confrontational enforcement. 📊 **[VISUAL: Timeline diagram showing real-time response workflow]**

The privacy implications are significant but manageable. While we monitor biochemical signatures continuously, no personal information is recorded 📚 **[CITATION: Privacy frameworks for biometric monitoring in public spaces]**. However, there's potential for scope creep - once surveillance infrastructure exists, pressure grows to expand capabilities 📚 **[CITATION: Technology adoption and mission creep in surveillance systems]**.

Economically, this reduces insurance premiums and compliance costs while improving customer experience 📚 **[CITATION: Cost-benefit analysis of automated compliance systems in hospitality]**. But the broader question becomes: as detection technology advances, where do we draw the line between public health protection and personal autonomy? 📚 **[CITATION: Ethics of surveillance technology in public health enforcement]**

This system exemplifies how engineering solutions must consider not just technical feasibility, but social acceptability and ethical boundaries. We're not just building sensors - we're reshaping social behavior in public spaces."

---

## **Key Engineering Concepts to Emphasize:**

1. **Sensor Fusion Theory** - How multiple imperfect sensors create a more reliable system
2. **Machine Learning Classification** - Bayesian inference and pattern recognition
3. **Signal Processing** - Filtering environmental noise from target signals
4. **Network Engineering** - Distributed processing and mesh topology
5. **Control Systems** - Feedback loops for adaptive thresholds

## **Visual Aid Suggestions:**

- **Algorithm flowchart** showing the decision tree
- **Network topology diagram** showing detector placement
- **Signal processing graphs** showing vape signature vs environmental noise
- **Confidence scoring visualization** showing how multiple inputs combine
- **Timeline diagram** showing real-time response workflow


 Slide 2: Core Concept – "How Our Solution Works"
 SCRIPT (~60 sec):
Our system will integrate existing technologies by using components from particulate matter sensors, environmental sensors then improvising it with data filtering algorithms and finally, a central processing unit to link up everything.

So here is a dissection of our features:

[Layer 1: Baseline Learning]
 We will first utilize particulate matter sensors to monitor air quality and detect typical aerosol levels while environmental sensors will be employed to measure temperature and humidity to account for ambient conditions, establishing a baseline for calibration.
[Layer 2: Classification]
Since vape emissions have distinct sizes that differentiate them from other aerosols and particulate matter sensors such as the PMS5003 sensor can be used to detect particle size distributions. We can utilise it to distinguish

[Layer 3: Intelligent Filtering]

 Layer 3 will focus on removing confounders and false positive scenarios. We will utilise filtering algorithms to distinguish fog machine emissions from vape puffs, which are large and sustained compared to localized vape puffs. We will also filter out perfume by analyzing molecular weights, ensuring accurate detection of vaping events.
[Layer 4: Bayesian Inference Engine]

 Finally, a Bayesian inference engine will be utilised and computed through a cpu which connects together every of our sensors. What it does is it’s able to perform statistical inference via a framework, to which we can use it to analyse all our sensor data and assign confidence scores to our analysis such that only events with sufficiently high confidence levels will trigger alerts, minimizing false positives and enhancing reliability.
[Visual: System architecture diagram with four detection layers]
