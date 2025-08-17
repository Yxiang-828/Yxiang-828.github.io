#include <iostream>
#include <vector>
#include <iomanip>
#include <random>
#include <cmath>

class StandardBannerCalculator
{
private:
    double normal_ssr_rate = 0.035;   // 3.5% Normal SSR rate
    double ancestor_ssr_rate = 0.005; // 0.5% Ancestor SSR rate
    double total_ssr_rate = 0.04;     // 4% total SSR rate
    double ancestor_rate = 0.125;     // 1/8 = 12.5% of SSRs are Ancestors
    int first_pity = 60;              // Guaranteed SSR at 60 if no SSR before
    int normal_ssrs = 15;             // 15 normal SSRs
    int ancestor_ssrs = 7;            // 7 ancestor SSRs

public:
    // Method 1: Analytical calculation for probability of NOT getting specific Ancestor
    std::vector<double> calculateAnalytical(int max_pulls)
    {
        std::vector<double> prob_no_ancestor(max_pulls + 1);

        // State tracking: dp[pull][pulls_since_last_ssr]
        // Only track pulls since last SSR
        std::vector<std::vector<double>> dp(max_pulls + 1,
                                            std::vector<double>(61, 0.0));

        // Initial state: 0 pulls, 0 since last SSR
        dp[0][0] = 1.0;

        for (int pull = 1; pull <= max_pulls; pull++)
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
                    // Guaranteed SSR: 12.5% Ancestor, 87.5% Normal SSR
                    // 87.5% chance of not getting Ancestor (reset pity counter)
                    dp[pull][0] += prob * (1 - ancestor_rate);
                    // 12.5% get Ancestor - this path ends
                }
                else
                {
                    // Regular pull
                    double ancestor_prob = ancestor_ssr_rate; // 0.5%
                    double normal_ssr_prob = normal_ssr_rate; // 3.5%
                    double no_ssr_prob = 1 - total_ssr_rate;  // 96%

                    // Get Ancestor - path ends (not added to dp)

                    // Get Normal SSR - reset pity counter
                    dp[pull][0] += prob * normal_ssr_prob;

                    // Get no SSR - increment pity counter
                    int next_since_ssr = since_ssr + 1;
                    if (next_since_ssr < first_pity)
                    {
                        dp[pull][next_since_ssr] += prob * no_ssr_prob;
                    }
                }
            }

            // Calculate probability of not having Ancestor after this pull
            prob_no_ancestor[pull] = 0;
            for (int since_ssr = 0; since_ssr < first_pity; since_ssr++)
            {
                prob_no_ancestor[pull] += dp[pull][since_ssr];
            }
        }

        return prob_no_ancestor;
    }

    // Method 2: Monte Carlo simulation for verification
    double simulateProbability(int target_pulls, int simulations = 1000000)
    {
        std::random_device rd;
        std::mt19937 gen(rd());
        std::uniform_real_distribution<> dis(0.0, 1.0);

        int no_ancestor_count = 0;

        for (int sim = 0; sim < simulations; sim++)
        {
            bool got_ancestor = false;
            int pulls_since_ssr = 0;

            for (int pull = 1; pull <= target_pulls; pull++)
            {
                double roll = dis(gen);

                // Check if guaranteed SSR (60th pull without SSR)
                if (pulls_since_ssr == first_pity - 1)
                {
                    // Guaranteed SSR
                    if (roll < ancestor_rate)
                    {
                        got_ancestor = true;
                        break;
                    }
                    else
                    {
                        // Got Normal SSR - reset pity
                        pulls_since_ssr = 0;
                    }
                }
                else
                {
                    // Regular pull
                    if (roll < ancestor_ssr_rate)
                    {
                        // Got Ancestor
                        got_ancestor = true;
                        break;
                    }
                    else if (roll < total_ssr_rate)
                    {
                        // Got Normal SSR - reset pity
                        pulls_since_ssr = 0;
                    }
                    else
                    {
                        // No SSR - increment pity counter
                        pulls_since_ssr++;
                    }
                }
            }

            if (!got_ancestor)
            {
                no_ancestor_count++;
            }
        }

        return (double)no_ancestor_count / simulations;
    }

    void printResults(int max_pulls)
    {
        std::cout << std::fixed << std::setprecision(6);
        std::cout << "=== Standard Banner Probability Calculator ===" << std::endl;
        std::cout << "Normal SSR Rate: " << normal_ssr_rate * 100 << "%" << std::endl;
        std::cout << "Ancestor SSR Rate: " << ancestor_ssr_rate * 100 << "%" << std::endl;
        std::cout << "Total SSR Rate: " << total_ssr_rate * 100 << "%" << std::endl;
        std::cout << "Pity Ancestor Rate: " << ancestor_rate * 100 << "%" << std::endl;
        std::cout << "First Pity: " << first_pity << " pulls" << std::endl;
        std::cout << "Normal SSRs: " << normal_ssrs << std::endl;
        std::cout << "Ancestor SSRs: " << ancestor_ssrs << std::endl;
        std::cout << std::endl;

        auto analytical = calculateAnalytical(max_pulls);

        std::cout << "Pull\tP(No Ancestor)\tSimulation\tDifference" << std::endl;
        std::cout << "----\t--------------\t----------\t----------" << std::endl;

        // Show key milestone pulls
        std::vector<int> key_pulls = {10, 30, 50, 59, 60, 61, 80, 100, 120, 150, 180, 200, 240, 300, 360, 420, 480, 540, 600, 720, 840, 960, 1000};

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

    // Calculate probability of getting specific ancestor (1/7 of all ancestors)
    void printSpecificAncestorResults(int max_pulls)
    {
        std::cout << std::endl
                  << "=== Specific Ancestor Probability ===" << std::endl;
        std::cout << "Probability of getting a SPECIFIC ancestor (1 out of 7)" << std::endl;
        std::cout << std::endl;

        auto no_ancestor_prob = calculateAnalytical(max_pulls);

        std::cout << "Pull\tP(No Specific)\tP(Get Specific)" << std::endl;
        std::cout << "----\t--------------\t--------------" << std::endl;

        std::vector<int> key_pulls = {60, 120, 180, 240, 300, 360, 420, 480, 540, 600, 720, 840, 960, 1000};

        for (int pull : key_pulls)
        {
            if (pull <= max_pulls)
            {
                // Probability of not getting any ancestor
                double prob_no_any_ancestor = (pull < no_ancestor_prob.size()) ? no_ancestor_prob[pull] : 0.0;

                // Probability of getting at least one ancestor
                double prob_any_ancestor = 1.0 - prob_no_any_ancestor;

                // Probability of getting specific ancestor (approximate)
                // This is a simplification - exact calculation would be more complex
                double prob_specific_ancestor = prob_any_ancestor / 7.0;
                double prob_no_specific = 1.0 - prob_specific_ancestor;

                std::cout << pull << "\t" << prob_no_specific << "\t" << prob_specific_ancestor << std::endl;
            }
        }
    }
};

int main()
{
    StandardBannerCalculator calculator;

    // Calculate probabilities up to pull 1000
    calculator.printResults(1000);

    // Show specific ancestor probabilities
    calculator.printSpecificAncestorResults(1000);

    std::cout << std::endl
              << "=== Custom Pull Calculator ===" << std::endl;
    std::cout << "Enter the number of pulls to calculate (0 to exit): ";

    int pulls;
    while (std::cin >> pulls && pulls > 0)
    {
        auto results = calculator.calculateAnalytical(pulls);
        std::cout << std::fixed << std::setprecision(6);
        std::cout << "Probability of not getting any Ancestor after " << pulls
                  << " pulls: " << results[pulls] << std::endl;
        std::cout << "Probability of getting at least one Ancestor: "
                  << (1.0 - results[pulls]) << std::endl;

        std::cout << "Enter another number of pulls (0 to exit): ";
    }

    return 0;
}
