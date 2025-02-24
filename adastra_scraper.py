# Hi there! I'm making good progress on this. I have successfully made selenium log in to ad astra.

# This script has required arguments. To run this, type this in the console:
# python adastra_scraper.py <username> <password>
# where <username> and <password> are the credientials you want to try to use to log in to ad astra.

from selenium import webdriver
from selenium.webdriver.common.by import By
from selenium.webdriver.common.keys import Keys
from selenium.webdriver.support.ui import WebDriverWait
from selenium.webdriver.common.action_chains import ActionChains
import argparse
from time import sleep

# attempts to login to ad astra with the given username and password. 
# returns boolean: True if successful, False if not
def login(username, password, driver):
    # navigate to the login page
    driver.get("https://www.aaiscloud.com/CABaptistU/logon.aspx?nosso=")

    

    # username field
    username_field = driver.find_element(By.ID, 'userNameField-inputEl')
    username_field.send_keys(username)

    sleep(0.02)

    # password field
    password_field = driver.find_element(By.ID, 'textfield-1030-inputEl')
    password_field.send_keys(password)

    sleep(0.02)

    # login button
    login_button = driver.find_element(By.ID, 'logonButton')

    try:
        # click on login button
        login_button.click()

        sleep(0.02)

        # wait until the home page is loaded
        WebDriverWait(driver, 5).until(lambda driver: driver.current_url == "https://www.aaiscloud.com/CABaptistU/Default.aspx")
        return True
    except:
        # failure to login
        print("Login failed. Adastra took to long to display the homepage.")
        driver.quit()
        return False

# once we log in, we can navigate to the calendar page and scrape the classroom data.
# returns dictionary mapped by classroom name to (WILL DECIDE DETAILS LATER)
def get_room_data(driver):
    # navigate to the calendar page
    driver.get("https://www.aaiscloud.com/CABaptistU/Calendars/DailyGridCalendar.aspx")

    # Once we get here, we need to switch to the correct calendar. 
    # By default it does not tell us anything about what times each class will be occupied. We need to switch to "Full_ Grid."

    # Clicks on the calendar selection dropdown arrow to show the options
    calendar_selection_dropdown_arrow = driver.find_element(By.ID, 'DailyGridCalendarForm_CalendarComboCtrl-trigger-picker')
    calendar_selection_dropdown_arrow.click()

    sleep(0.15)

    # Clicks on the "Full_ Grid" option
    full_grid_option = driver.find_element(By.CSS_SELECTOR, '#DailyGridCalendarForm_CalendarComboCtrl-picker-listEl > li:nth-child(2)')
    full_grid_option.click()

    sleep(5)
    return {}


if __name__ == '__main__':
    # Setting up argument parser for username and password, which will be used to attempt to login to ad astra
    parser = argparse.ArgumentParser()
    parser.add_argument('username', help='Username for Ad Astra')
    parser.add_argument('password', help='Password for Ad Astra')
    args = parser.parse_args()

    driver = webdriver.Edge()

    # attempting login. If successful, we shall commence the funny
    if login(args.username, args.password, driver):
        room_data = get_room_data(driver) # the funny in question
        
        # other stuff here eventually
        driver.quit()

        
        


# all this stuff below was just test code I wrote when using selenium to navigate httpbin.org for my own understanding

# form_link = driver.find_element(By.CSS_SELECTOR, 'a[href="/forms/post"]')
# form_link.click()

# custname = driver.find_element(By.CSS_SELECTOR, '[name="custname"]')
# custname.send_keys("John Doe")

# custemail = driver.find_element(By.CSS_SELECTOR, '[name="custemail"]')
# custemail.send_keys("bungus@bungus.com")

# submit = driver.find_element(By.CSS_SELECTOR, 'button')
# sleep(1)
# submit.click()

# sleep(5)
# driver.quit()