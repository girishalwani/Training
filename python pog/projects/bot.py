from selenium import webdriver
from time import sleep
from password import pw

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
        sleep(3)

    def go_to_home(self):
        feeds = self.driver.find_element_by_xpath("/html/body/div[1]/section/nav/div[2]/div/div/div[1]/a")
        feeds.click()
        sleep(3)
    
    def go_to_account(self):
        self.account = self.driver.find_element_by_xpath("/html/body/div[1]/section/nav/div[2]/div/div/div[3]/div/div[5]/a")
        self.account.click()
        sleep(3)
    
    def close_button(self):
        close_button = self.driver.find_element_by_xpath("/html/body/div[4]/div/div/div[1]/div/div[2]/button")
        close_button.click()
        sleep(3)
    
    def reload(self):
        refresh = self.driver.refresh()
        sleep(3)


    def get_following(self):
        self.go_to_account()
        self.driver.find_element_by_xpath("/html/body/div[1]/section/main/div/header/section/ul/li[3]/a").click()
        sleep(3)
        sugs = self.driver.find_element_by_xpath("//h4[contains(text(), 'Suggestions')]")
        self.driver.execute_script("arguments[0].scrollIntoView(true);",sugs)
        scoll_wind = self.driver.find_element_by_xpath("/html/body/div[4]/div/div/div[2]/ul")
        last_ht,new_ht=0,1
        while(last_ht!=new_ht):
            last_ht=new_ht
            sleep(3)
            new_ht=self.driver.execute_script("""
            arguments[0].scrollTo(0,arguments[0].scrollHeight);
            return arguments[0].scrollHeight;
            """,scoll_wind)
        
        following = scoll_wind.find_elements_by_tag_name('a')
        following_names = [names.text for names in following if names.text!=""]
        
        self.close_button()
        self.go_to_home()
        self.reload()
        
        print("following -> ",following_names)
        return following_names


    def get_sugestions(self):
        self.go_to_account()
        self.driver.find_element_by_xpath("/html/body/div[1]/section/main/div/header/section/ul/li[3]/a").click()
        sleep(3)
        
        see_all_suggestions = self.driver.find_element_by_xpath("/html/body/div[4]/div/div/div[2]/div[3]/a")
        self.driver.execute_script("arguments[0].scrollIntoView(true);",see_all_suggestions)
        sleep(2)
        #self.driver.execute_script("window.scrollTo(0, document.body.scrollHeight);")
        see_all_suggestions.click()
        sleep(3)
        scroll_wind =self.driver.find_element_by_xpath("/html/body/div[1]/section/main/div/div[2]")

        last_ht,new_ht=0,1
        while(last_ht!=new_ht):
            last_ht=new_ht
            sleep(3)
            new_ht=self.driver.execute_script("""
            window.scrollTo(0,arguments[0].scrollHeight);
            return arguments[0].scrollHeight;
            """,scroll_wind)

        links = scroll_wind.find_elements_by_tag_name('a')
        names = [name.text for name in links if name.text!='']
        sleep(3)
        
        self.go_to_home()
        self.reload()

        print("suggestions -> ",names)
        return names

    
    def Unfollow(self):
        following = self.get_following()
        enter_username = input("enter a username from followning to unfollow -> ")

        #xpath of unfollow button element
        if(enter_username in following):
            self.driver.get("https://www.instagram.com/"+enter_username+"/")
            sleep(3)
            unfollow_button = self.driver.find_element_by_xpath("/html/body/div[1]/section/main/div/header/section/div[1]/div[2]/span/span[1]/button")
            unfollow_button.click()
            unfollow = self.driver.find_element_by_xpath("//button[contains(text(),'Unfollow')]")
            unfollow.click()
            sleep(3)
        
        self.go_to_home()
        self.reload()



    def follow_suggested(self,following,suggestions):
        for i in range(0,2):
            if (suggestions[i] not in following):
                self.driver.get("https://www.instagram.com/"+suggestions[i]+"/")
                sleep(3)
                follow = self.driver.find_element_by_xpath("//button[contains(text(),'Follow')]")
                follow.click()
                sleep(3)
                
            else:
                continue
        
        self.go_to_home()
        self.reload()

    

    def get_followers(self):
        self.go_to_account()
        followers = self.driver.find_element_by_xpath("/html/body/div[1]/section/main/div/header/section/ul/li[2]/a")
        followers.click()
        sleep(3)

        sugs = self.driver.find_element_by_xpath("//h4[contains(text(), 'Suggestions')]")
        self.driver.execute_script("arguments[0].scrollIntoView(true);",sugs)

        scroll_followers_wind = self.driver.find_element_by_xpath("/html/body/div[4]/div/div/div[2]/ul")

        last_ht,new_ht=0,1
        while(last_ht!=new_ht):
            last_ht=new_ht
            sleep(3)
            new_ht=self.driver.execute_script("""
            arguments[0].scrollTo(0,arguments[0].scrollHeight);
            return arguments[0].scrollHeight;
            """,scroll_followers_wind)

        followers = scroll_followers_wind.find_elements_by_tag_name('a')
        followers_names = [names.text for names in followers if names.text!=""]

        self.close_button()
        self.go_to_home()
        self.reload()

        print("followers -> ",followers_names)
        return followers_names


    def logout(self):
        self.go_to_account()
        
        setting = self.driver.find_element_by_xpath("/html/body/div[1]/section/main/div/header/section/div[1]/div/button")
        setting.click()
        sleep(2)

        logout = self.driver.find_element_by_xpath("//button[contains(text(),'Log Out')]")
        logout.click()
        sleep(1)

        self.reload()
    


user=InstagramBot()
user.login("<username>","<password>")

#following= user.get_following()
#suggestions = user.get_sugestions()
#user.follow_suggested(following,suggestions)
#user.get_followers()
#user.Unfollow()
#user.logout()