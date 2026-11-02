/*
 * SPDX-FileCopyrightText: The LineageOS Project
 * SPDX-License-Identifier: Apache-2.0
 */

#include <errno.h>
#include <fcntl.h>
#include <limits.h>
#include <stdio.h>

#define HAL_ATTR_PATH "/sys/class/input/input%u/%n"
#define EVENT_ATTR_PATH "/sys/class/input/event%u/device/%s"

int tof_open(const char *path, int flags)
{
    char fixed[PATH_MAX];
    unsigned int event;
    int prefix_len = 0;
    int len;

    sscanf(path, HAL_ATTR_PATH, &event, &prefix_len);
    if (!prefix_len)
        return open(path, flags);

    len = snprintf(fixed, sizeof(fixed), EVENT_ATTR_PATH, event, path + prefix_len);
    if (len < 0 || len >= (int)sizeof(fixed)) {
        errno = ENAMETOOLONG;
        return -1;
    }

    return open(fixed, flags);
}
