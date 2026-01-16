#!/usr/bin/env python3
# -*- coding: utf-8 -*-
#
# SPDX-FileCopyrightText: 2026 The Evolution X Project
# SPDX-License-Identifier: Apache-2.0

import re

def bail():
    print("oops")
    exit(1)

# Map Evolution X 11 minor versions to LineageOS minor versions
def parse_lineage23(v):
    v = int(v)
    if v <= 4:
        return '0'
    elif v == 5:
        return '1'
    else:
        return '2'

s = input()

# Validate input format (e.g., 11.4, 11.4.2, 11.4.2.1)
if not re.match(r"[1-9][0-9]\.[0-9]([0-9])?(\.[0-9])?", s): bail()

evo_maj, evo_mnr = s.split('.')[:2]

# Check if major version is supported
if (int(evo_maj) < 11): bail()

lineage_maj = str(int(evo_maj) + 12)
lineage_mnr = globals()[f"parse_lineage{lineage_maj}"](evo_mnr)
cur = f"lineage-{lineage_maj}.{lineage_mnr}"

print(cur)
