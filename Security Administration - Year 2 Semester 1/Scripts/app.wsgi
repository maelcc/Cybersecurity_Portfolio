#!/usr/bin/env python3

import sys
import logging

logging.basicConfig(stream=sys.stderr, level=logging.DEBUG)

sys.path.insert(0, '/var/www/techstart')

from app import app as application