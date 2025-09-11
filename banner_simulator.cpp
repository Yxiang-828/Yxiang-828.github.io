#include <iostream>
#include <vector>
#include <random>
#include <algorithm>
#include <iomanip>
#include <string>
#include <cmath>

class GachaBannerSimulator {
private:
    std::mt19937 gen;
    std::uniform_real_distribution<double> dis;

    // Common rates
    const double SSR_RATE = 0.04;
    const int SSR_PITY = 60;

    // Banner-specific rates
    const double TAIONA_RATE = 0.25;      // 25% of SSRs are Taiona
    const double ANCESTOR_RATE = 0.125;   // 1/8 of SSRs are ancestors
    const int TAIONA_PITY = 120;
    const int NUM_ANCESTORS = 7;

public:
    GachaBannerSimulator() : gen(std::random_device{}()), dis(0.0, 1.0) {}

    struct TaionaResult {
        std::vector<int> taiona_pulls;
        std::vector<int> ssr_pulls;
        int total_pulls;
        int pity_ssrs;
        int pity_taionas;
    };

    struct StandardResult {
        std::vector<int> ancestor_pulls;
        std::vector<int> ssr_pulls;
        std::vector<int> selected_ancestor_pulls;  // For tracking a specific ancestor
        int total_pulls;
        int pity_ssrs;
    };

    struct LimitedResult {
        std::vector<int> limited_pulls;
        std::vector<int> ancestor_pulls;
        std::vector<int> ssr_pulls;
        std::vector<int> selected_limited_pulls;   // For tracking the specific limited SSR
        std::vector<int> selected_ancestor_pulls;  // For tracking a specific ancestor
        int total_pulls;
        int pity_ssrs;
        bool got_non_limited_ssr;
    };

    // Helper function to calculate probability of getting at least one selected ancestor within N pulls
    double calculateProbabilityWithinPulls(int target_pulls, double avg_pulls_for_selected_ancestor) {
        if (avg_pulls_for_selected_ancestor <= 0) return 0.0;
        // Using geometric distribution approximation: P(X <= n) = 1 - (1-p)^n
        // where p = 1/average_pulls
        double p = 1.0 / avg_pulls_for_selected_ancestor;
        return 1.0 - pow(1.0 - p, target_pulls);
    }

    // Proper pity-aware probability calculation for Standard Banner
    double calculateProbabilityWithinPullsPity(int max_pulls) {
        if (max_pulls <= 0) return 0.0;

        // dp[pull][since_ssr] = probability of being in this state without having gotten selected ancestor yet
        std::vector<std::vector<double>> dp(max_pulls + 1, std::vector<double>(SSR_PITY, 0.0));

        // Initial state: 0 pulls, 0 since last SSR, no selected ancestor yet
        dp[0][0] = 1.0;

        for (int pull = 1; pull <= max_pulls; pull++) {
            for (int since_ssr = 0; since_ssr < SSR_PITY; since_ssr++) {
                if (dp[pull - 1][since_ssr] == 0) continue;

                double prob = dp[pull - 1][since_ssr];

                // Check if this is a guaranteed SSR pull
                bool guaranteed_ssr = (since_ssr == SSR_PITY - 1);

                if (guaranteed_ssr) {
                    // Guaranteed SSR at pity
                    double selected_ancestor_prob = ANCESTOR_RATE * (1.0/NUM_ANCESTORS); // 1.786%
                    double other_ssr_prob = 1.0 - selected_ancestor_prob; // 98.214%

                    // If we don't get selected ancestor, reset pity and continue
                    dp[pull][0] += prob * other_ssr_prob;
                    // If we get selected ancestor, that probability contributes to success (doesn't continue in dp)
                } else {
                    // Regular pull
                    double selected_ancestor_prob = SSR_RATE * ANCESTOR_RATE * (1.0/NUM_ANCESTORS); // ~0.0714%
                    double other_ssr_prob = SSR_RATE - selected_ancestor_prob; // ~3.929%
                    double no_ssr_prob = 1.0 - SSR_RATE; // 96%

                    // If we get selected ancestor, that's success (doesn't continue)
                    // If we get other SSR, reset pity counter
                    dp[pull][0] += prob * other_ssr_prob;
                    // If we get no SSR, increment pity counter
                    int next_since_ssr = since_ssr + 1;
                    if (next_since_ssr < SSR_PITY) {
                        dp[pull][next_since_ssr] += prob * no_ssr_prob;
                    }
                }
            }
        }

        // Sum up all remaining probability (this is probability of NOT getting selected ancestor)
        double prob_no_selected_ancestor = 0.0;
        for (int since_ssr = 0; since_ssr < SSR_PITY; since_ssr++) {
            prob_no_selected_ancestor += dp[max_pulls][since_ssr];
        }

        // Return probability of getting selected ancestor (complement)
        return 1.0 - prob_no_selected_ancestor;
    }

    TaionaResult simulateTaionaBanner(int max_pulls) {
        TaionaResult result = {};
        int pulls_since_ssr = 0;
        int pulls_since_taiona = 0;

        for (int pull = 1; pull <= max_pulls; pull++) {
            double roll = dis(gen);
            bool got_ssr = false;
            bool got_taiona = false;

            // Check Taiona guarantee first (120th pull without Taiona)
            if (pulls_since_taiona == TAIONA_PITY - 1) {
                got_taiona = true;
                got_ssr = true;
                result.pity_taionas++;
            }
            // Check SSR pity (60th pull without SSR)
            else if (pulls_since_ssr == SSR_PITY - 1) {
                got_ssr = true;
                result.pity_ssrs++;

                // Within pity SSR, check for Taiona
                if (roll < TAIONA_RATE) {
                    got_taiona = true;
                }
            }
            // Regular pull
            else {
                if (roll < SSR_RATE) {
                    got_ssr = true;
                    // Check if this SSR is Taiona
                    if (roll < SSR_RATE * TAIONA_RATE) {
                        got_taiona = true;
                    }
                }
            }

            // Update counters and record results
            if (got_ssr) {
                result.ssr_pulls.push_back(pull);
                pulls_since_ssr = 0;

                if (got_taiona) {
                    result.taiona_pulls.push_back(pull);
                    pulls_since_taiona = 0;
                } else {
                    pulls_since_taiona++;
                }
            } else {
                pulls_since_ssr++;
                pulls_since_taiona++;
            }
        }

        result.total_pulls = max_pulls;
        return result;
    }

    // Standard Banner Simulation
    StandardResult simulateStandardBanner(int max_pulls) {
        StandardResult result = {};
        int pulls_since_ssr = 0;

        for (int pull = 1; pull <= max_pulls; pull++) {
            double roll = dis(gen);
            bool got_ssr = false;
            bool got_ancestor = false;

            // Check SSR pity (60th pull without SSR)
            if (pulls_since_ssr == SSR_PITY - 1) {
                got_ssr = true;
                result.pity_ssrs++;

                // Within pity SSR, check for Ancestor
                if (roll < ANCESTOR_RATE) {
                    got_ancestor = true;
                }
            }
            // Regular pull
            else {
                if (roll < SSR_RATE) {
                    got_ssr = true;
                    // Check if this SSR is an Ancestor
                    if (roll < SSR_RATE * ANCESTOR_RATE) {
                        got_ancestor = true;
                    }
                }
            }

            // Update counters and record results
            if (got_ssr) {
                result.ssr_pulls.push_back(pull);
                pulls_since_ssr = 0;

                if (got_ancestor) {
                    result.ancestor_pulls.push_back(pull);
                    // 1/7 chance this ancestor is the selected one we're tracking
                    if (dis(gen) < 1.0 / NUM_ANCESTORS) {
                        result.selected_ancestor_pulls.push_back(pull);
                    }
                }
            } else {
                pulls_since_ssr++;
            }
        }

        result.total_pulls = max_pulls;
        return result;
    }

    // Limited Banner Simulation
    LimitedResult simulateLimitedBanner(int max_pulls) {
        LimitedResult result = {};
        result.got_non_limited_ssr = false;
        int pulls_since_ssr = 0;
        bool in_guarantee_state = false;  // State 2: next SSR is Limited vs Ancestor only

        for (int pull = 1; pull <= max_pulls; pull++) {
            double roll = dis(gen);
            bool got_ssr = false;

            // Check SSR pity (60th pull without SSR)
            if (pulls_since_ssr == SSR_PITY - 1) {
                got_ssr = true;
                result.pity_ssrs++;
            }
            // Regular pull
            else if (roll < SSR_RATE) {
                got_ssr = true;
            }

            // If we got an SSR, determine what type
            if (got_ssr) {
                result.ssr_pulls.push_back(pull);
                pulls_since_ssr = 0;

                bool got_limited = false;
                bool got_ancestor = false;
                bool got_other_ssr = false;

                if (in_guarantee_state) {
                    // State 2: 50% Limited vs 50% Ancestor only
                    double ssr_type_roll = dis(gen);
                    if (ssr_type_roll < 0.5) {
                        got_limited = true;
                        in_guarantee_state = false;  // Reset to State 1
                    } else {
                        got_ancestor = true;
                        in_guarantee_state = false;  // Reset to State 1
                    }
                } else {
                    // State 1: 50% Limited vs 50% Anything (ancestors + other SSRs)
                    double ssr_type_roll = dis(gen);
                    if (ssr_type_roll < 0.5) {
                        got_limited = true;
                        // Stay in State 1
                    } else {
                        // Got "anything else" - determine what specifically
                        double anything_roll = dis(gen);
                        if (anything_roll < ANCESTOR_RATE) {
                            got_ancestor = true;
                        } else {
                            got_other_ssr = true;
                        }
                        in_guarantee_state = true;  // Enter State 2
                    }
                }

                if (got_limited) {
                    result.limited_pulls.push_back(pull);
                    result.selected_limited_pulls.push_back(pull);
                } else if (got_ancestor) {
                    result.ancestor_pulls.push_back(pull);
                    // 1/7 chance this ancestor is the selected one
                    if (dis(gen) < 1.0 / NUM_ANCESTORS) {
                        result.selected_ancestor_pulls.push_back(pull);
                    }
                } else {
                    // Got other SSR
                    result.got_non_limited_ssr = true;
                }
            } else {
                pulls_since_ssr++;
            }
        }

        result.total_pulls = max_pulls;
        return result;
    }

    struct Stats {
        double mean;
        double median;
        double p25, p75, p90, p95, p99;
        int min_val, max_val;
        int count;
    };

    Stats calculateStats(const std::vector<int>& data) {
        if (data.empty()) {
            return {0, 0, 0, 0, 0, 0, 0, 0, 0, 0};
        }

        std::vector<int> sorted_data = data;
        std::sort(sorted_data.begin(), sorted_data.end());

        Stats stats;
        stats.count = sorted_data.size();
        stats.min_val = sorted_data.front();
        stats.max_val = sorted_data.back();

        // Calculate mean
        double sum = 0;
        for (int val : sorted_data) {
            sum += val;
        }
        stats.mean = sum / sorted_data.size();

        // Calculate percentiles
        auto getPercentile = [&](double p) -> double {
            double index = p * (sorted_data.size() - 1);
            int lower = (int)index;
            int upper = lower + 1;
            if (upper >= sorted_data.size()) return sorted_data.back();
            double weight = index - lower;
            return sorted_data[lower] * (1 - weight) + sorted_data[upper] * weight;
        };

        stats.median = getPercentile(0.5);
        stats.p25 = getPercentile(0.25);
        stats.p75 = getPercentile(0.75);
        stats.p90 = getPercentile(0.90);
        stats.p95 = getPercentile(0.95);
        stats.p99 = getPercentile(0.99);

        return stats;
    }

    void printStats(const std::string& title, const Stats& stats) {
        std::cout << "\n=== " << title << " ===" << std::endl;
        std::cout << "Count: " << stats.count << std::endl;
        if (stats.count > 0) {
            std::cout << std::fixed << std::setprecision(1);
            std::cout << "Mean: " << stats.mean << " pulls" << std::endl;
            std::cout << "Median: " << stats.median << " pulls" << std::endl;
            std::cout << "Min: " << stats.min_val << ", Max: " << stats.max_val << " pulls" << std::endl;
            std::cout << "25th percentile: " << stats.p25 << " pulls" << std::endl;
            std::cout << "75th percentile: " << stats.p75 << " pulls" << std::endl;
            std::cout << "90th percentile: " << stats.p90 << " pulls" << std::endl;
            std::cout << "95th percentile: " << stats.p95 << " pulls" << std::endl;
            std::cout << "99th percentile: " << stats.p99 << " pulls" << std::endl;
        }
    }

    std::vector<int> convertToPullsUntil(const std::vector<int>& pull_numbers) {
        std::vector<int> pulls_until;
        for (size_t i = 0; i < pull_numbers.size(); i++) {
            if (i == 0) {
                pulls_until.push_back(pull_numbers[i]);
            } else {
                pulls_until.push_back(pull_numbers[i] - pull_numbers[i-1]);
            }
        }
        return pulls_until;
    }

    void runTaionaBannerSimulation() {
        const int MAX_PULLS = 10000000;  // 10 million pulls
        std::cout << "\n" << std::string(60, '=') << std::endl;
        std::cout << "TAIONA BANNER - 10,000,000 PULLS SIMULATION" << std::endl;
        std::cout << "SSR Rate: 4% | Taiona Rate: 25% of SSRs" << std::endl;
        std::cout << "SSR Pity: 60 pulls | Taiona Pity: 120 pulls" << std::endl;
        std::cout << std::string(60, '=') << std::endl;

        auto result = simulateTaionaBanner(MAX_PULLS);

        // Calculate average pulls
        auto ssr_intervals = convertToPullsUntil(result.ssr_pulls);
        auto taiona_intervals = convertToPullsUntil(result.taiona_pulls);

        double avg_pulls_for_ssr = 0;
        double avg_pulls_for_taiona = 0;

        if (!ssr_intervals.empty()) {
            double sum = 0;
            for (int interval : ssr_intervals) {
                sum += interval;
            }
            avg_pulls_for_ssr = sum / ssr_intervals.size();
        }

        if (!taiona_intervals.empty()) {
            double sum = 0;
            for (int interval : taiona_intervals) {
                sum += interval;
            }
            avg_pulls_for_taiona = sum / taiona_intervals.size();
        }

        // Print results
        std::cout << "\n--- SIMULATION RESULTS ---" << std::endl;
        std::cout << "Total SSRs obtained: " << result.ssr_pulls.size() << std::endl;
        std::cout << "Total Taionas obtained: " << result.taiona_pulls.size() << std::endl;
        std::cout << "SSR Pities triggered: " << result.pity_ssrs << std::endl;
        std::cout << "Taiona Pities triggered: " << result.pity_taionas << std::endl;

        std::cout << "\n--- AVERAGE PULLS ---" << std::endl;
        std::cout << std::fixed << std::setprecision(2);
        std::cout << "Average pulls for SSR: " << avg_pulls_for_ssr << std::endl;
        std::cout << "Average pulls for Taiona: " << avg_pulls_for_taiona << std::endl;

        std::cout << "\n--- RATES ---" << std::endl;
        std::cout << std::fixed << std::setprecision(3);
        std::cout << "Actual SSR rate: " << (double)result.ssr_pulls.size() / MAX_PULLS * 100 << "%" << std::endl;
        std::cout << "Actual Taiona rate: " << (double)result.taiona_pulls.size() / MAX_PULLS * 100 << "%" << std::endl;
        if (!result.ssr_pulls.empty()) {
            std::cout << "Taiona rate among SSRs: " << (double)result.taiona_pulls.size() / result.ssr_pulls.size() * 100 << "%" << std::endl;
        }
    }

    void runStandardBannerSimulation() {
        const int MAX_PULLS = 10000000;  // 10 million pulls
        std::cout << "\n" << std::string(60, '=') << std::endl;
        std::cout << "STANDARD BANNER - 10,000,000 PULLS SIMULATION" << std::endl;
        std::cout << "SSR Rate: 4% | Ancestor Rate: 1/8 of SSRs" << std::endl;
        std::cout << "SSR Pity: 60 pulls | 7 Ancestors available" << std::endl;
        std::cout << std::string(60, '=') << std::endl;

        auto result = simulateStandardBanner(MAX_PULLS);

        // Calculate average pulls
        auto ssr_intervals = convertToPullsUntil(result.ssr_pulls);
        auto ancestor_intervals = convertToPullsUntil(result.ancestor_pulls);
        auto selected_ancestor_intervals = convertToPullsUntil(result.selected_ancestor_pulls);

        double avg_pulls_for_ssr = 0;
        double avg_pulls_for_ancestor = 0;
        double avg_pulls_for_selected_ancestor = 0;

        if (!ssr_intervals.empty()) {
            double sum = 0;
            for (int interval : ssr_intervals) {
                sum += interval;
            }
            avg_pulls_for_ssr = sum / ssr_intervals.size();
        }

        if (!ancestor_intervals.empty()) {
            double sum = 0;
            for (int interval : ancestor_intervals) {
                sum += interval;
            }
            avg_pulls_for_ancestor = sum / ancestor_intervals.size();
        }

        if (!selected_ancestor_intervals.empty()) {
            double sum = 0;
            for (int interval : selected_ancestor_intervals) {
                sum += interval;
            }
            avg_pulls_for_selected_ancestor = sum / selected_ancestor_intervals.size();
        }

        // Print results
        std::cout << "\n--- SIMULATION RESULTS ---" << std::endl;
        std::cout << "Total SSRs obtained: " << result.ssr_pulls.size() << std::endl;
        std::cout << "Total Ancestors obtained: " << result.ancestor_pulls.size() << std::endl;
        std::cout << "Selected Ancestor obtained: " << result.selected_ancestor_pulls.size() << " times" << std::endl;
        std::cout << "SSR Pities triggered: " << result.pity_ssrs << std::endl;

        std::cout << "\n--- AVERAGE PULLS ---" << std::endl;
        std::cout << std::fixed << std::setprecision(2);
        std::cout << "Average pulls for SSR: " << avg_pulls_for_ssr << std::endl;
        std::cout << "Average pulls for Ancestor: " << avg_pulls_for_ancestor << std::endl;
        std::cout << "Average pulls for Selected Ancestor: " << avg_pulls_for_selected_ancestor << std::endl;

        std::cout << "\n--- RATES ---" << std::endl;
        std::cout << std::fixed << std::setprecision(4);
        std::cout << "Actual SSR rate: " << (double)result.ssr_pulls.size() / MAX_PULLS * 100 << "%" << std::endl;
        std::cout << "Actual Ancestor rate: " << (double)result.ancestor_pulls.size() / MAX_PULLS * 100 << "%" << std::endl;
        std::cout << "Actual Selected Ancestor rate: " << (double)result.selected_ancestor_pulls.size() / MAX_PULLS * 100 << "%" << std::endl;
        if (!result.ssr_pulls.empty()) {
            std::cout << "Ancestor rate among SSRs: " << (double)result.ancestor_pulls.size() / result.ssr_pulls.size() * 100 << "%" << std::endl;
            std::cout << "Selected Ancestor rate among SSRs: " << (double)result.selected_ancestor_pulls.size() / result.ssr_pulls.size() * 100 << "%" << std::endl;
            std::cout << "Selected Ancestor rate among Ancestors: " << (double)result.selected_ancestor_pulls.size() / result.ancestor_pulls.size() * 100 << "%" << std::endl;
        }

        // Add probability ranges for getting selected ancestor within specific pull counts
        if (avg_pulls_for_selected_ancestor > 0) {
            std::cout << "\n--- THEORETICAL RATES ---" << std::endl;
            std::cout << std::fixed << std::setprecision(6);

            // Calculate theoretical expected pulls for SSR with pity system
            double theoretical_expected_ssr = 0.0;
            double prob_no_ssr_so_far = 1.0;

            // Calculate expected pulls considering pity at pull 60
            for (int n = 1; n <= SSR_PITY - 1; n++) {
                double prob_ssr_on_this_pull = SSR_RATE * prob_no_ssr_so_far;
                theoretical_expected_ssr += n * prob_ssr_on_this_pull;
                prob_no_ssr_so_far *= (1.0 - SSR_RATE);
            }
            // Add pity pull (guaranteed SSR at pull 60)
            theoretical_expected_ssr += SSR_PITY * prob_no_ssr_so_far;

            // Theoretical rates with corrected pity calculation
            double theoretical_selected_ancestor_rate = (1.0 / theoretical_expected_ssr) * ANCESTOR_RATE * (1.0/NUM_ANCESTORS);
            double theoretical_expected_selected_ancestor = 1.0 / theoretical_selected_ancestor_rate;

            std::cout << "Theoretical SSR expected pulls (with pity): " << theoretical_expected_ssr << std::endl;
            std::cout << "Theoretical Selected Ancestor rate: " << theoretical_selected_ancestor_rate * 100 << "%" << std::endl;
            std::cout << "Expected pulls for Selected Ancestor: " << theoretical_expected_selected_ancestor << " pulls" << std::endl;

            std::cout << "\n--- PROBABILITY RANGES FOR SELECTED ANCESTOR ---" << std::endl;
            std::cout << "Probability of getting Selected Ancestor within:" << std::endl;
            std::cout << std::fixed << std::setprecision(1);

            std::vector<int> pull_targets = {100, 200, 500, 1000, 1500, 2000};
            for (int target : pull_targets) {
                double prob = calculateProbabilityWithinPullsPity(target);
                std::cout << "  " << std::setw(4) << target << " pulls: " << std::setw(5) << prob * 100 << "%" << std::endl;
            }

            // Interactive pull calculator
            std::cout << "\n--- CUSTOM PULL CALCULATOR ---" << std::endl;
            std::cout << "Enter your pull budget to calculate probability of getting Selected Ancestor" << std::endl;
            std::cout << "(Enter 0 to skip): ";

            int custom_pulls;
            std::cin >> custom_pulls;

            while (custom_pulls > 0) {
                double custom_prob = calculateProbabilityWithinPullsPity(custom_pulls);
                std::cout << std::fixed << std::setprecision(1);
                std::cout << "Probability of getting Selected Ancestor within " << custom_pulls << " pulls: " << custom_prob * 100 << "%" << std::endl;

                // Also show reverse calculation - how many pulls for X% chance
                std::cout << std::fixed << std::setprecision(0);
                std::cout << "For comparison:" << std::endl;
                std::cout << "  50% chance: ~" << theoretical_expected_selected_ancestor * 0.693 << " pulls" << std::endl;
                std::cout << "  75% chance: ~" << theoretical_expected_selected_ancestor * 1.386 << " pulls" << std::endl;
                std::cout << "  90% chance: ~" << theoretical_expected_selected_ancestor * 2.303 << " pulls" << std::endl;

                std::cout << "\nEnter another pull count (0 to finish): ";
                std::cin >> custom_pulls;
            }
        }
    }

    void runLimitedBannerSimulation() {
        const int MAX_PULLS = 10000000;  // 10 million pulls
        std::cout << "\n" << std::string(60, '=') << std::endl;
        std::cout << "LIMITED BANNER - 10,000,000 PULLS SIMULATION" << std::endl;
        std::cout << "SSR Rate: 4% | Limited Rate: 50% initially, then 50% vs Ancestor" << std::endl;
        std::cout << "SSR Pity: 60 pulls | 7 Ancestors available" << std::endl;
        std::cout << std::string(60, '=') << std::endl;

        auto result = simulateLimitedBanner(MAX_PULLS);

        // Calculate average pulls
        auto ssr_intervals = convertToPullsUntil(result.ssr_pulls);
        auto limited_intervals = convertToPullsUntil(result.limited_pulls);
        auto ancestor_intervals = convertToPullsUntil(result.ancestor_pulls);
        auto selected_ancestor_intervals = convertToPullsUntil(result.selected_ancestor_pulls);

        double avg_pulls_for_ssr = 0;
        double avg_pulls_for_limited = 0;
        double avg_pulls_for_ancestor = 0;
        double avg_pulls_for_selected_ancestor = 0;

        if (!ssr_intervals.empty()) {
            double sum = 0;
            for (int interval : ssr_intervals) {
                sum += interval;
            }
            avg_pulls_for_ssr = sum / ssr_intervals.size();
        }

        if (!limited_intervals.empty()) {
            double sum = 0;
            for (int interval : limited_intervals) {
                sum += interval;
            }
            avg_pulls_for_limited = sum / limited_intervals.size();
        }

        if (!ancestor_intervals.empty()) {
            double sum = 0;
            for (int interval : ancestor_intervals) {
                sum += interval;
            }
            avg_pulls_for_ancestor = sum / ancestor_intervals.size();
        }

        if (!selected_ancestor_intervals.empty()) {
            double sum = 0;
            for (int interval : selected_ancestor_intervals) {
                sum += interval;
            }
            avg_pulls_for_selected_ancestor = sum / selected_ancestor_intervals.size();
        }

        // Print results
        std::cout << "\n--- SIMULATION RESULTS ---" << std::endl;
        std::cout << "Total SSRs obtained: " << result.ssr_pulls.size() << std::endl;
        std::cout << "Total Limited SSRs obtained: " << result.limited_pulls.size() << std::endl;
        std::cout << "Total Ancestors obtained: " << result.ancestor_pulls.size() << std::endl;
        std::cout << "Selected Ancestor obtained: " << result.selected_ancestor_pulls.size() << " times" << std::endl;
        std::cout << "SSR Pities triggered: " << result.pity_ssrs << std::endl;
        std::cout << "Got non-limited SSR trigger: " << (result.got_non_limited_ssr ? "Yes" : "No") << std::endl;

        std::cout << "\n--- AVERAGE PULLS ---" << std::endl;
        std::cout << std::fixed << std::setprecision(2);
        std::cout << "Average pulls for SSR: " << avg_pulls_for_ssr << std::endl;
        std::cout << "Average pulls for Limited SSR: " << avg_pulls_for_limited << std::endl;
        std::cout << "Average pulls for Ancestor: " << avg_pulls_for_ancestor << std::endl;
        std::cout << "Average pulls for Selected Ancestor: " << avg_pulls_for_selected_ancestor << std::endl;

        std::cout << "\n--- RATES ---" << std::endl;
        std::cout << std::fixed << std::setprecision(4);
        std::cout << "Actual SSR rate: " << (double)result.ssr_pulls.size() / MAX_PULLS * 100 << "%" << std::endl;
        std::cout << "Actual Limited SSR rate: " << (double)result.limited_pulls.size() / MAX_PULLS * 100 << "%" << std::endl;
        std::cout << "Actual Ancestor rate: " << (double)result.ancestor_pulls.size() / MAX_PULLS * 100 << "%" << std::endl;
        std::cout << "Actual Selected Ancestor rate: " << (double)result.selected_ancestor_pulls.size() / MAX_PULLS * 100 << "%" << std::endl;
        if (!result.ssr_pulls.empty()) {
            std::cout << "Limited rate among SSRs: " << (double)result.limited_pulls.size() / result.ssr_pulls.size() * 100 << "%" << std::endl;
            std::cout << "Ancestor rate among SSRs: " << (double)result.ancestor_pulls.size() / result.ssr_pulls.size() * 100 << "%" << std::endl;
        }
    }
};

int main() {
    GachaBannerSimulator simulator;

    std::cout << "=== GACHA BANNER SIMULATOR - 10M PULLS ===" << std::endl;
    std::cout << "1. Taiona Banner" << std::endl;
    std::cout << "2. Standard Banner" << std::endl;
    std::cout << "3. Limited Banner" << std::endl;
    std::cout << "4. All Banners" << std::endl;
    std::cout << "Enter your choice (1-4): ";

    int choice;
    std::cin >> choice;

    switch (choice) {
        case 1:
            simulator.runTaionaBannerSimulation();
            break;
        case 2:
            simulator.runStandardBannerSimulation();
            break;
        case 3:
            simulator.runLimitedBannerSimulation();
            break;
        case 4:
            simulator.runTaionaBannerSimulation();
            simulator.runStandardBannerSimulation();
            simulator.runLimitedBannerSimulation();
            break;
        default:
            std::cout << "Invalid choice!" << std::endl;
            return 1;
    }

    return 0;
}