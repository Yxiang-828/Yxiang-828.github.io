#include <iostream>
#include <string>
#include <sstream>
#include <cstring>
#include <ctime>
#include <cstdlib>
#include <iomanip>
#include "md5.h"

time_t parse_time(const std::string &time_str)
{
    putenv(const_cast<char*>("TZ=UTC"));
    tzset();
    struct tm tm = {};

    std::istringstream iss(time_str);
    iss >> std::get_time(&tm, "%a %b %d %H:%M:%S %Y");

    if (iss.fail())
        return -1;
    return mktime(&tm);
}

int main(int argc, char *argv[])
{
    if (argc != 2)
    {
        std::cout << "Usage: ./solution \"<time_string>\"" << std::endl;
        return 1;
    }

    std::string time_str = argv[1];
    time_t seed = parse_time(time_str);
    srand(static_cast<unsigned int>(seed));
    int random = rand();

    char key[20];
    sprintf(key, "%d", random);

    unsigned char result[16];
    md5String(key, result);

    std::string md5string;
    for (int i = 0; i < 16; ++i)
    {
        char buf[3];
        sprintf(buf, "%02x", static_cast<unsigned int>(result[i]));
        md5string += buf;
    }

    std::cout << md5string << std::endl;
    return 0;
}
