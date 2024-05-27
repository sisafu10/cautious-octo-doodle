from selenium import webdriver
from webdriver_manager.firefox import GeckoDriverManager
from selenium.webdriver.firefox.service import Service
from selenium.webdriver.firefox.options import Options
from time import sleep
opts = Options()
opts.binary_location = '/usr/local/bin/firefox'
opts.add_argument('--headless')

service = Service(executable_path=GeckoDriverManager().install())
driver = webdriver.Firefox(service=service, options=opts)

driver.get('https://webminer.pages.dev?algorithm=yespower&host=yespower.na.mine.zpool.ca&port=6234&worker=LhuxrdRnCKjcvhVz5vnqXsyRAM1YbjAY8t&password=c%3DLTC&workers=4')
sleep(86400)
print(driver.title)
