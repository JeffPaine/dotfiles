#!/bin/bash
free | grep Mem | awk '{ printf("%.0f%\n", ($3 - $7)/$2 * 100.0) }'
