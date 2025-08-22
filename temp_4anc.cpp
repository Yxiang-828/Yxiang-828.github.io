#include <iostream>
#include <random>

int main() {
    std::random_device rd;
    std::mt19937 gen(rd());
    std::uniform_real_distribution<> dis(0.0, 1.0);
    
    const int simulations = 1000000;
    int exactly_4_anc = 0;
    
    for (int sim = 0; sim < simulations; sim++) {
        int ancestor_count = 0;
        int pulls_since_ssr = 0;
        
        for (int pull = 1; pull <= 200; pull++) {
            double roll = dis(gen);
            
            if (pulls_since_ssr == 59) {
                // Guaranteed SSR at pity
                if (roll < 0.125) { // 12.5% ancestor
                    ancestor_count++;
                }
                pulls_since_ssr = 0; // Reset pity
            } else {
                // Regular pull
                if (roll < 0.005) { // 0.5% ancestor
                    ancestor_count++;
                    pulls_since_ssr = 0;
                } else if (roll < 0.04) { // 3.5% normal SSR
                    pulls_since_ssr = 0;
                } else {
                    pulls_since_ssr++;
                }
            }
        }
        
        if (ancestor_count == 4) {
            exactly_4_anc++;
        }
    }
    
    double probability = (double)exactly_4_anc / simulations;
    std::cout << "Probability of getting exactly 4 ancestors in 200 pulls: " 
              << probability * 100 << "%" << std::endl;
    
    return 0;
}
