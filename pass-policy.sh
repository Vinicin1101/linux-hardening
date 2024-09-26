#!/bin/bash

# Password policy
echo "password requisite pam_pwquality.so retry=3 minlen=12 ucredit=-1 lcredit=-1 dcredit=-1 ocredit=-1 maxsequence=3 reject_username" >> /etc/pam.d/common-password
echo "The Password Policy has been set to a minimum of 12 characters with complexity."

# Login attempts
echo "auth required pam_tally2.so deny=5 unlock_time=600 onerr=fail audit even_deny_root" >> /etc/pam.d/common-auth
echo "The number of login attempts is limited to 5 before the temporary 10-minute lockout."
