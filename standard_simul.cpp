#include <iostream>
#include <vector>
#include <random>
#include <iomanip>
#include <algorithm>
#include <cmath>

class MegaGachaSimulator
{
private:
    static constexpr double TOTAL_SSR_RATE = 0.04;
    static constexpr double SPECIFIC_NONANC_RATE = 0.002333;
    static constexpr double SINGLE_ANC_RATE = 0.000714;
    static constexpr int PITY_THRESHOLD = 59;
    static constexpr int NUM_ANC_SSRS = 7;
    static constexpr int NUM_NONANC_SSRS = 15;

    static constexpr double TOTAL_ANC_RATE = SINGLE_ANC_RATE * NUM_ANC_SSRS;
    static constexpr double TOTAL_NONANC_RATE = SPECIFIC_NONANC_RATE * NUM_NONANC_SSRS;
    static constexpr double GUARANTEE_ANC_PROB = TOTAL_ANC_RATE / TOTAL_SSR_RATE;
    static constexpr double GUARANTEE_NONANC_PROB = TOTAL_NONANC_RATE / TOTAL_SSR_RATE;

    std::mt19937 rng;
    std::uniform_real_distribution<double> dist;

    struct PullResult
    {
        std::vector<int> ssr_pulls;             // All SSR pull numbers
        std::vector<int> specific_nonanc_pulls; // Specific non-anc SSR pull numbers
        std::vector<int> specific_anc_pulls;    // Specific anc SSR pull numbers
    };

    PullResult simulate_until_100m_samples()
    {
        PullResult result;
        int pity_counter = 0;
        constexpr int target_nonanc_id = 0;
        constexpr int target_anc_id = 0;
        constexpr long long MIN_SAMPLES = 10000000LL; // 10M samples for each category
        
        long long pull = 1;
        while (true) {
            double roll = dist(rng);
            bool is_guarantee = (pity_counter >= PITY_THRESHOLD);
            bool got_ssr = false;

            if (is_guarantee)
            {
                got_ssr = true;
                if (roll < GUARANTEE_ANC_PROB)
                {
                    // Anc SSR - use same logic as normal pulls
                    double adjusted_roll = roll * (TOTAL_ANC_RATE / GUARANTEE_ANC_PROB);
                    int anc_id = static_cast<int>(adjusted_roll / SINGLE_ANC_RATE);
                    if (anc_id >= NUM_ANC_SSRS)
                        anc_id = NUM_ANC_SSRS - 1;

                    if (anc_id == target_anc_id)
                    {
                        result.specific_anc_pulls.push_back(pull);
                    }
                }
                else
                {
                    // Non-anc SSR - use same logic as normal pulls
                    double nonanc_roll = (roll - GUARANTEE_ANC_PROB) / GUARANTEE_NONANC_PROB;
                    int nonanc_id = static_cast<int>(nonanc_roll * NUM_NONANC_SSRS);
                    if (nonanc_id >= NUM_NONANC_SSRS)
                        nonanc_id = NUM_NONANC_SSRS - 1;

                    if (nonanc_id == target_nonanc_id)
                    {
                        result.specific_nonanc_pulls.push_back(pull);
                    }
                }
                pity_counter = 0;
            }
            else
            {
                if (roll < TOTAL_ANC_RATE)
                {
                    // Anc SSR
                    got_ssr = true;
                    int anc_id = static_cast<int>(roll / SINGLE_ANC_RATE);
                    if (anc_id >= NUM_ANC_SSRS)
                        anc_id = NUM_ANC_SSRS - 1;

                    if (anc_id == target_anc_id)
                    {
                        result.specific_anc_pulls.push_back(pull);
                    }
                    pity_counter = 0;
                }
                else if (roll < TOTAL_SSR_RATE)
                {
                    // Non-anc SSR
                    got_ssr = true;
                    double nonanc_roll = (roll - TOTAL_ANC_RATE) / SPECIFIC_NONANC_RATE;
                    int nonanc_id = static_cast<int>(nonanc_roll);
                    if (nonanc_id >= NUM_NONANC_SSRS)
                        nonanc_id = NUM_NONANC_SSRS - 1;

                    if (nonanc_id == target_nonanc_id)
                    {
                        result.specific_nonanc_pulls.push_back(pull);
                    }
                    pity_counter = 0;
                }
                else
                {
                    pity_counter++;
                }
            }

            if (got_ssr)
            {
                result.ssr_pulls.push_back(pull);
            }

            // Check if we have enough samples for all categories
            if (result.ssr_pulls.size() >= MIN_SAMPLES &&
                result.specific_nonanc_pulls.size() >= MIN_SAMPLES &&
                result.specific_anc_pulls.size() >= MIN_SAMPLES) {
                std::cout << "\nReached 10M samples for all categories at pull " << pull << "!\n";
                break;
            }

            // Progress update every 10M pulls
            if (pull % 10000000 == 0)
            {
                std::cout << "Progress: " << (pull / 1000000) << "M pulls | SSRs: " << result.ssr_pulls.size() 
                         << " | Non-anc: " << result.specific_nonanc_pulls.size() 
                         << " | Anc: " << result.specific_anc_pulls.size() << "\r" << std::flush;
            }
            
            pull++;
        }

        return result;
    }

    double calculate_mean(const std::vector<double> &data)
    {
        double sum = 0;
        for (double val : data)
            sum += val;
        return sum / data.size();
    }

    double calculate_median(std::vector<double> data)
    {
        std::sort(data.begin(), data.end());
        size_t n = data.size();
        return (n % 2 == 0) ? (data[n / 2 - 1] + data[n / 2]) / 2.0 : data[n / 2];
    }

    double calculate_std(const std::vector<double> &data, double mean)
    {
        double sum_sq_diff = 0;
        for (double val : data)
        {
            sum_sq_diff += (val - mean) * (val - mean);
        }
        return std::sqrt(sum_sq_diff / data.size());
    }

    void print_detailed_stats(const std::vector<double> &data, const std::string &title)
    {
        if (data.empty())
            return;

        std::vector<double> sorted_data = data;
        std::sort(sorted_data.begin(), sorted_data.end());

        double mean = calculate_mean(data);
        double median = calculate_median(data);
        double std_dev = calculate_std(data, mean);

        // Percentiles
        double p10 = sorted_data[static_cast<size_t>(0.10 * sorted_data.size())];
        double p25 = sorted_data[static_cast<size_t>(0.25 * sorted_data.size())];
        double p75 = sorted_data[static_cast<size_t>(0.75 * sorted_data.size())];
        double p90 = sorted_data[static_cast<size_t>(0.90 * sorted_data.size())];
        double p95 = sorted_data[static_cast<size_t>(0.95 * sorted_data.size())];
        double p99 = sorted_data[static_cast<size_t>(0.99 * sorted_data.size())];

        double min_val = sorted_data.front();
        double max_val = sorted_data.back();

        std::cout << "=== " << title << " ===\n";
        std::cout << "Sample size: " << data.size() << "\n";
        std::cout << "Mean: " << std::fixed << std::setprecision(1) << mean << " pulls\n";
        std::cout << "Median: " << median << " pulls\n";
        std::cout << "Std Dev: " << std_dev << " pulls (CV: " << std::setprecision(2) << (std_dev / mean) << ")\n";
        std::cout << "\nDistribution breakdown:\n";
        std::cout << "Min: " << std::setprecision(0) << min_val << " pulls\n";
        std::cout << "10th percentile: " << p10 << " pulls\n";
        std::cout << "25th percentile: " << p25 << " pulls\n";
        std::cout << "75th percentile: " << p75 << " pulls\n";
        std::cout << "90th percentile: " << p90 << " pulls\n";
        std::cout << "95th percentile: " << p95 << " pulls\n";
        std::cout << "99th percentile: " << p99 << " pulls\n";
        std::cout << "Max: " << max_val << " pulls\n\n";
    }

public:
    MegaGachaSimulator(unsigned seed = std::random_device{}())
        : rng(seed), dist(0.0, 1.0) {}

    void run_mega_simulation()
    {
        std::cout << "Running simulation until 10M samples for all categories...\n";
        std::cout << "This will take a VERY long time...\n\n";

        PullResult result = simulate_until_100m_samples();

        std::cout << "\nSimulation complete!\n\n";

        // Calculate intervals between SSRs for statistical analysis
        std::vector<double> ssr_intervals;
        std::vector<double> nonanc_intervals;
        std::vector<double> anc_intervals;

        // Calculate intervals between consecutive SSRs
        if (result.ssr_pulls.size() > 1)
        {
            for (size_t i = 1; i < result.ssr_pulls.size(); i++)
            {
                ssr_intervals.push_back(result.ssr_pulls[i] - result.ssr_pulls[i - 1]);
            }
        }

        // Calculate intervals between consecutive specific non-anc SSRs
        if (result.specific_nonanc_pulls.size() > 1)
        {
            for (size_t i = 1; i < result.specific_nonanc_pulls.size(); i++)
            {
                nonanc_intervals.push_back(result.specific_nonanc_pulls[i] - result.specific_nonanc_pulls[i - 1]);
            }
        }

        // Calculate intervals between consecutive specific anc SSRs
        if (result.specific_anc_pulls.size() > 1)
        {
            for (size_t i = 1; i < result.specific_anc_pulls.size(); i++)
            {
                anc_intervals.push_back(result.specific_anc_pulls[i] - result.specific_anc_pulls[i - 1]);
            }
        }

        // Output results
        std::cout << std::fixed << std::setprecision(2);

        if (!ssr_intervals.empty())
        {
            print_detailed_stats(ssr_intervals, "ANY SSR INTERVAL STATISTICS");
        }

        if (!nonanc_intervals.empty())
        {
            print_detailed_stats(nonanc_intervals, "SPECIFIC NON-ANC SSR INTERVAL STATISTICS");
        }

        if (!anc_intervals.empty())
        {
            print_detailed_stats(anc_intervals, "SPECIFIC ANC SSR INTERVAL STATISTICS");
        }
    }
};

int main()
{
    MegaGachaSimulator simulator;
    simulator.run_mega_simulation();
    return 0;
}