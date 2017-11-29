#importing the files/jars
require 'rubygems'
require 'test/unit'
require 'selenium-webdriver'

class Demo < Test::Unit::TestCase
  
#launching Driver
def setup
  @driver=Selenium::WebDriver.for :firefox

  @driver.navigate.to "https://demo.mahara.org/"
end


#Login Method 
def test_login
  #Enter Username
  username = @driver.find_element(:id,'login_login_username') 
  username.send_keys("Student")
  puts "Username Entered"

#Enter Password
  passwd = @driver.find_element(:xpath,'//*[@type="password"]') 
  passwd.send_keys("MaharaDemo")
  puts "Password Entered"
  
#Submit button 
  submit = @driver.find_element(:xpath,'//*[@id="login_submit"]')
  submit.click
  puts "Login Successful"

#Put a sleep  
  sleep 5

#Logout
  dropdown = @driver.find_element(:xpath,"//*[@class='icon icon-chevron-down collapsed']") 
  dropdown.click
  
  sleep 3
  
  logout = @driver.find_element(:xpath,"//a[@href='https://demo.mahara.org/?logout']")
  logout.click
  puts "Logout Success"

end
end