#include <iostream>
#include <vector>
#include <iomanip>
#include <random>
#include <cmath>

class GachaCalculator
{
private:
    double ssr_rate = 0.04;     // 4% SSR rate
    double taiona_rate = 0.25;  // 25% of SSRs are Taiona
    int first_pity = 60;        // Guaranteed SSR at 60 if no SSR before
    int taiona_guarantee = 120; // Guaranteed Taiona at 120

public:
    // Method 1: Analytical calculation using dynamic programming
    std::vector<double> calculateAnalytical(int max_pulls)
    {
        std::vector<double> prob_no_taiona(max_pulls + 1);

        // State tracking: dp[pull][pulls_since_last_ssr]
        // Only track pulls since last SSR, not lifetime SSR history
        std::vector<std::vector<double>> dp(max_pulls + 1,
                                            std::vector<double>(61, 0.0));

        // Initial state: 0 pulls, 0 since last SSR
        dp[0][0] = 1.0;

        for (int pull = 1; pull <= max_pulls && pull < taiona_guarantee; pull++)
        {
            for (int since_ssr = 0; since_ssr < first_pity; since_ssr++)
            {
                if (dp[pull - 1][since_ssr] == 0)
                    continue;

                double prob = dp[pull - 1][since_ssr];

                // Check if this is a guaranteed SSR pull (60th pull without SSR)
                bool guaranteed_ssr = (since_ssr == first_pity - 1);

                if (guaranteed_ssr)
                {
                    // Guaranteed SSR: 25% Taiona, 75% other SSR
                    // 75% chance of not getting Taiona (reset pity counter)
                    dp[pull][0] += prob * (1 - taiona_rate);
                    // 25% get Taiona - this path ends
                }
                else
                {
                    // Regular pull
                    double taiona_prob = ssr_rate * taiona_rate;          // 1%
                    double other_ssr_prob = ssr_rate * (1 - taiona_rate); // 3%
                    double no_ssr_prob = 1 - ssr_rate;                    // 96%

                    // Get Taiona - path ends (not added to dp)

                    // Get other SSR - reset pity counter
                    dp[pull][0] += prob * other_ssr_prob;

                    // Get no SSR - increment pity counter
                    int next_since_ssr = since_ssr + 1;
                    if (next_since_ssr < first_pity)
                    {
                        dp[pull][next_since_ssr] += prob * no_ssr_prob;
                    }
                }
            }

            // Calculate probability of not having Taiona after this pull
            prob_no_taiona[pull] = 0;
            for (int since_ssr = 0; since_ssr < first_pity; since_ssr++)
            {
                prob_no_taiona[pull] += dp[pull][since_ssr];
            }
        }

        // At pull 120, guaranteed Taiona
        if (max_pulls >= taiona_guarantee)
        {
            prob_no_taiona[taiona_guarantee] = 0.0;
        }

        return prob_no_taiona;
    }

    // Method 2: Monte Carlo simulation for verification
    double simulateProbability(int target_pulls, int simulations = 1000000)
    {
        std::random_device rd;
        std::mt19937 gen(rd());
        std::uniform_real_distribution<> dis(0.0, 1.0);

        int no_taiona_count = 0;

        for (int sim = 0; sim < simulations; sim++)
        {
            bool got_taiona = false;
            int pulls_since_ssr = 0;

            for (int pull = 1; pull <= target_pulls && pull < taiona_guarantee; pull++)
            {
                double roll = dis(gen);

                // Check if guaranteed SSR (60th pull without SSR)
                if (pulls_since_ssr == first_pity - 1)
                {
                    // Guaranteed SSR
                    if (roll < taiona_rate)
                    {
                        got_taiona = true;
                        break;
                    }
                    else
                    {
                        // Got other SSR - reset pity
                        pulls_since_ssr = 0;
                    }
                }
                else
                {
                    // Regular pull
                    if (roll < ssr_rate * taiona_rate)
                    {
                        // Got Taiona
                        got_taiona = true;
                        break;
                    }
                    else if (roll < ssr_rate)
                    {
                        // Got other SSR - reset pity
                        pulls_since_ssr = 0;
                    }
                    else
                    {
                        // No SSR - increment pity counter
                        pulls_since_ssr++;
                    }
                }
            }

            // At pull 120, guaranteed Taiona
            if (target_pulls >= taiona_guarantee)
            {
                got_taiona = true;
            }

            if (!got_taiona)
            {
                no_taiona_count++;
            }
        }

        return (double)no_taiona_count / simulations;
    }

    void printResults(int max_pulls)
    {
        std::cout << std::fixed << std::setprecision(6);
        std::cout << "=== Gacha Probability Calculator ===" << std::endl;
        std::cout << "SSR Rate: " << ssr_rate * 100 << "%" << std::endl;
        std::cout << "Taiona Rate (of SSRs): " << taiona_rate * 100 << "%" << std::endl;
        std::cout << "First Pity: " << first_pity << " pulls" << std::endl;
        std::cout << "Taiona Guarantee: " << taiona_guarantee << " pulls" << std::endl;
        std::cout << std::endl;

        auto analytical = calculateAnalytical(max_pulls);

        std::cout << "Pull\tP(No Taiona)\tSimulation\tDifference" << std::endl;
        std::cout << "----\t------------\t----------\t----------" << std::endl;

        // Show key milestone pulls
        std::vector<int> key_pulls = {10, 30, 50, 59, 60, 61, 80, 100, 119, 120};

        for (int pull : key_pulls)
        {
            if (pull <= max_pulls)
            {
                double analytical_prob = (pull < analytical.size()) ? analytical[pull] : 0.0;
                double simulation_prob = simulateProbability(pull, 100000); // Smaller sample for speed
                double difference = std::abs(analytical_prob - simulation_prob);

                std::cout << pull << "\t" << analytical_prob << "\t"
                          << simulation_prob << "\t" << difference << std::endl;
            }
        }
    }
};

int main()
{
    GachaCalculator calculator;

    // Calculate probabilities up to pull 120
    calculator.printResults(120);

    std::cout << std::endl
              << "=== Custom Pull Calculator ===" << std::endl;
    std::cout << "Enter the number of pulls to calculate (0 to exit): ";

    int pulls;
    while (std::cin >> pulls && pulls > 0)
    {
        if (pulls >= 120)
        {
            std::cout << "Probability of not getting Taiona after " << pulls
                      << " pulls: 0.000000 (guaranteed at pull 120)" << std::endl;
        }
        else
        {
            auto results = calculator.calculateAnalytical(pulls);
            std::cout << std::fixed << std::setprecision(6);
            std::cout << "Probability of not getting Taiona after " << pulls
                      << " pulls: " << results[pulls] << std::endl;
        }

        std::cout << "Enter another number of pulls (0 to exit): ";
    }

    return 0;
}