#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <time.h>
#include "md5.h"

int month_to_int(char *mon)
{
    if (!strcmp(mon, "Jan"))
        return 0;
    if (!strcmp(mon, "Feb"))
        return 1;
    if (!strcmp(mon, "Mar"))
        return 2;
    if (!strcmp(mon, "Apr"))
        return 3;
    if (!strcmp(mon, "May"))
        return 4;
    if (!strcmp(mon, "Jun"))
        return 5;
    if (!strcmp(mon, "Jul"))
        return 6;
    if (!strcmp(mon, "Aug"))
        return 7;
    if (!strcmp(mon, "Sep"))
        return 8;
    if (!strcmp(mon, "Oct"))
        return 9;
    if (!strcmp(mon, "Nov"))
        return 10;
    if (!strcmp(mon, "Dec"))
        return 11;
    return -1;
}

int main(int argc, char *argv[])
{
    if (argc != 2)
    {
        printf("Usage: ./solver \"<time_string>\"\n");
        return 1;
    }
    char time_str[30];
    strcpy(time_str, argv[1]);
    // Ensure it ends with \n if not
    if (time_str[strlen(time_str) - 1] != '\n')
    {
        strcat(time_str, "\n");
    }

    struct tm tm;
    memset(&tm, 0, sizeof(struct tm));
    char mon[4];
    sscanf(time_str, "%*s %s %d %d:%d:%d %d", mon, &tm.tm_mday, &tm.tm_hour, &tm.tm_min, &tm.tm_sec, &tm.tm_year);
    tm.tm_year -= 1900;
    tm.tm_mon = month_to_int(mon);
    tm.tm_isdst = -1; // Determine DST

    time_t t = timegm(&tm);

    printf("Parsed time_t: %ld\n", t);

    srand(t);
    int random = rand();
    printf("Random: %d\n", random);

    char key[20];
    sprintf(key, "%d", random);
    printf("Key: %s\n", key);

    unsigned char result[16];
    md5String(key, result);
    char md5string[33];
    for (int i = 0; i < 16; ++i)
        sprintf(&md5string[i * 2], "%02x", (unsigned int)result[i]);
    md5string[32] = '\0';

    printf("MD5: %s\n", md5string);

    return 0;
}