"""
Description:
    Check the IEEE submission status automatically.

Author: lincoln12w
Github: https://github.com/Lincoln12w

Module:
    selenium, xvfbwrapper

APIs:

    - get_tmi_status_with_chrome

Modify History
--------------
00a 24oct17 lzw First Release.
                Just return the status text.
                Parse the whole status table in the author page,
                  and notify the status with osascript.
01a 25oct17 lzw Check network status before fetching the status of manuscript.
                  (currently use ping)
01b 12feb18 lzw Change target address to
                'https://mc.manuscriptcentral.com/jbhi-embs'
"""

import os
import time

from selenium import webdriver

# os.system('PATH=$PATH:/Applications/Google\ Chrome.app/Contents/MacOS/')


def get_mc_status_with_chrome(use_xvfb=False):
    """
    Get IEEE Manuscript central status.
    """

    chromedriver = '/home/lincoln/chromedriver'

    # For headless chrome
    if use_xvfb:
        from xvfbwrapper import Xvfb

        xvfb = Xvfb(width=1280, height=720)
        xvfb.start()
        chrome_login = webdriver.Chrome(chromedriver)
    else:
        chrome_options = webdriver.ChromeOptions()
        chrome_options.add_argument('--headless')
        chrome_options.add_argument('--disable-gpu')
        chrome_login = webdriver.Chrome(chromedriver, chrome_options=chrome_options)

    # try:
    # chrome_login.get('https://mc.manuscriptcentral.com/tmi-ieee')
    chrome_login.get('https://mc.manuscriptcentral.com/jbhi-embs')

    # Login
    chrome_login.find_element_by_id('USERID').clear()
    chrome_login.find_element_by_id('USERID').send_keys(u'username')
    chrome_login.find_element_by_id('PASSWORD').clear()
    chrome_login.find_element_by_id('PASSWORD').send_keys(u'password')
    chrome_login.find_element_by_id('logInButton').click()

    time.sleep(3)

    # Navigator to Author page
    chrome_login.find_elements_by_class_name('nav-link ')[6].click()

    # Get the status table
    table = chrome_login.find_element_by_class_name('content-inner-div').text.split('\n')

    # Clean the table contents
    for i, entry in enumerate(table):
        allblank = True
        for j, char in enumerate(entry):
            if char != u' ':
                table[i] = table[i][j:]
                allblank = False
                break
        if allblank:
            table[i] = u''

    flag = 1
    while flag:
        flag = 0
        beg = 0
        for i in range(beg, len(table)):
            if table[i] == u'':
                flag = 1
                del table[i]
                beg = i
                break

    # Get submission status
    status = []
    entrynum = (len(table) - 1) / 6
    for i in range(entrynum):
        status.append(table[1 + i * 6 + 2][14:60] + '...\n Status:\t' + table[1 + i * 6 + 1])

        # if table[1 + i * 6 + 1] != u'Awaiting Admin Processing':
        #     status.append(table[1 + i * 6 + 2][14:60] + '...\n Status Changes!!!')

        if table[1 + i * 6 + 1] != u'ADM: Fotiadis, Dimitrios I.':
            status.append(table[1 + i * 6 + 2][14:60] + '...\n Status Changes!!!')

        # if table[1 + i * 6 + 1] != u'With Associate Editor':
        #     status.append(table[1 + i * 6 + 2][14:60] + '...\n Status Changes!!!')


    # # Get submission status
    # submissions = chrome_login.find_elements_by_class_name('pagecontents')

    # status = []

    # for i in range(len(submissions) - 1):
    #     print submissions[1 + i].text
    #     status.append(submissions[i+1].text)

    if use_xvfb:
        xvfb.stop()

    chrome_login.close()

    return status

if __name__ == '__main__':

    # Use ping to check the network status
    # try:
    if not os.system('/sbin/ping -c 1 www.baidu.com > /dev/null 2&> 1'):
        STATUS = get_mc_status_with_chrome()

        for s in STATUS:
            if s[-1] == '!':
                os.system("osascript -e 'display notification \"%s\" with title "
                          "\"Manuscript Status\" sound name \"Submarine\"'" % s)
            os.system("osascript -e 'display notification \"%s\" with title "
                      "\"Manuscript Status\"'" % s)
