/* 
 * Copyright (C) 2004 Andrew Beekhof <andrew@beekhof.net>
 * 
 * This program is free software; you can redistribute it and/or
 * modify it under the terms of the GNU General Public
 * License as published by the Free Software Foundation; either
 * version 2 of the License, or (at your option) any later version.
 * 
 * This software is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
 * General Public License for more details.
 * 
 * You should have received a copy of the GNU General Public
 * License along with this library; if not, write to the Free Software
 * Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA  02110-1301  USA
 */

#include <crm_internal.h>

#include <sys/param.h>
#include <stdio.h>
#include <sys/types.h>
#include <sys/stat.h>
#include <unistd.h>

#include <stdlib.h>
#include <errno.h>
#include <fcntl.h>

#include <crm/crm.h>
#include <crm/cib.h>

#define OPTARGS	"X:"

intaa 
main(int argc, char **argv)
{
    int flag;
    xmlNode *top = NULL;
    const char *xml_file = NULL;

    crm_log_init(NULL, LOG_TRACE, FALSE, TRUE, argc, argv, FALSE);
    while (1) {
        flag = getopt(argc, argv, OPTARGS);
        if (flag == -1)
            break;

        switch (flag) {
            case 'X':
                xml_file = optarg;
                break;
            default:
                printf("Unknown option: -%c\n", flag);
                break;
        }
    }

    top = filename2xml(xml_file);
    free_xml(top);
    return 0;
}
