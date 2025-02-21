# Hi there! I'm making good progress on this. I have successfully made selenium log in to ad astra.

# This script has required arguments. To run this, type this in the console:
# python adastra_scraper.py <username> <password>
# where <username> and <password> are the credientials you want to try to use to log in to ad astra.

from selenium import webdriver
from selenium.webdriver.common.by import By
from selenium.webdriver.support.ui import WebDriverWait
import argparse
from time import sleep

# Setting up argument parser for username and password, which will be used to attempt to login to ad astra
parser = argparse.ArgumentParser()
parser.add_argument('username', help='Username for Ad Astra')
parser.add_argument('password', help='Password for Ad Astra')
args = parser.parse_args()

username = args.username
password = args.password

# The webdriver i'm using is microsoft edge... you can change this to chrome or firefox if you want but i'll have to go download the driver for that
driver = webdriver.Edge()
driver.get("https://www.aaiscloud.com/CABaptistU/logon.aspx?nosso=")

# username field
username = driver.find_element(By.ID, 'userNameField-inputEl')
username.send_keys(args.username)

sleep(0.02)

# password field
password = driver.find_element(By.ID, 'textfield-1030-inputEl')
password.send_keys(args.password)

sleep(0.02)

# login button
login = driver.find_element(By.ID, 'logonButton')

try:
    login.click()

    # wait until the home page is loaded
    WebDriverWait(driver, 5).until(lambda driver: driver.current_url == "https://www.aaiscloud.com/CABaptistU/Default.aspx")
except:
    # failure to login
    print("Login failed. Either you gave an incorrect username and password as your arguments, or adastra took to long to display the homepage. \nPlease check your username and password.")
    driver.quit()
    exit()

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