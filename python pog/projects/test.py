#import pyautogui

from pywinauto import Application
from pynput.keyboard import Key,Controller
from selenium import webdriver
from time import sleep
from password import pw
import os



class InstagramBot:
    

    def __init__(self):
        self.driver= webdriver.Chrome()
        self.driver.get("https://www.instagram.com/")
        sleep(2)
    
    def login(self,username,password):
        login_id= self.driver.find_element_by_xpath("//input[@name=\"username\"]").send_keys(username)
        sleep(2)
        login_pass = self.driver.find_element_by_xpath("//input[@name=\"password\"]").send_keys(password)
        #login_pass.send_keys(keys.RETURN)
        sleep(2)
        self.driver.find_element_by_xpath("//button[@type=\"submit\"]").click()
        sleep(5)
        self.driver.find_element_by_xpath("//button[@type=\"button\"]").click()
        sleep(5)
        self.driver.find_element_by_xpath("//button[contains(text(),'Not Now')]").click()
        sleep(5)
    
    def reload(self):
        refresh = self.driver.refresh()
        sleep(3)

    def mobile_interactive(self):
        keyboard = Controller()

        keyboard.press(Key.ctrl)
        keyboard.press(Key.shift)
        keyboard.press("i")

        keyboard.release(Key.ctrl)
        keyboard.release(Key.shift)
        keyboard.release("i")

        sleep(2)

        keyboard.press(Key.ctrl)
        keyboard.press(Key.shift)
        keyboard.press("m")

        keyboard.release(Key.ctrl)
        keyboard.release(Key.shift)
        keyboard.release("m")

        sleep(2)

        self.reload()

        sleep(5)
        sleep(2)

        keyboard.press(Key.ctrl)
        keyboard.press(Key.shift)
        keyboard.press("i")

        keyboard.release(Key.ctrl)
        keyboard.release(Key.shift)
        keyboard.release("i")
        sleep(4)

    def exit_mobile_interactive(self):
        keyboard = Controller()
        
        sleep(2)

        keyboard.press(Key.ctrl)
        keyboard.press(Key.shift)
        keyboard.press("i")

        keyboard.release(Key.ctrl)
        keyboard.release(Key.shift)
        keyboard.release("i")

        sleep(2)

        self.reload()
        sleep(4)

    
    def upload_post(self):
        keyboard = Controller()

        keyboard.press(Key.ctrl)
        keyboard.press(Key.shift)
        keyboard.press("i")

        keyboard.release(Key.ctrl)
        keyboard.release(Key.shift)
        keyboard.release("i")

        sleep(2)

        keyboard.press(Key.ctrl)
        keyboard.press(Key.shift)
        keyboard.press("m")

        keyboard.release(Key.ctrl)
        keyboard.release(Key.shift)
        keyboard.release("m")

        sleep(2)

        self.reload()

        sleep(5)
        sleep(2)

        keyboard.press(Key.ctrl)
        keyboard.press(Key.shift)
        keyboard.press("i")

        keyboard.release(Key.ctrl)
        keyboard.release(Key.shift)
        keyboard.release("i")
        sleep(4)
        
        sleep(2)

        cancel = self.driver.find_element_by_xpath("/html/body/div[4]/div/div/div/div[3]/button[2]")
        cancel.click()
        sleep(4)

        new_post = self.driver.find_element_by_xpath("/html/body/div[1]/section/nav[2]/div/div/div[2]/div/div/div[3]")
        new_post.click()

        #self.driver.switch_to. send_keys("./memes/meme.jpg")

        app = Application()
        app.connect(title_re="Open")
        app.Open.Edit.SetText("./memes/meme.jpg")
        sleep(3)
        app.Open.Button.click()

        





        '''sleep(3)
        self.driver.switch_to.active_element().send_keys(".//memes/meme.jpg")
    '''


user=InstagramBot()
user.login("memebot97","BablooFighter100")
user.upload_post()