*** Settings ***
Library                                       SeleniumLibrary
Library                                       Library.py
Resource                                      Locators.robot


*** Test Cases ***
TC_001_Login_Logout_Functionality
    User open browser put URL and maximize window             https://www.facebook.com       Chrome
    input text       ${Login_Username}                        Hello
    input text       ${Login_Password}                        abcd
    click element    ${Login_Signin_button}
    ${res}=          concatenate data                         Hello                         Testing
    log to console      ${res}

TC_002_Login_InvalidData
    User open browser put URL and maximize window             https://www.google.com         Chrome
    input text      id=email            Hello
    input text      name=pass           abcd
    click element     xpath=//*[@type='submit']


*** Keywords ***
User open browser put URL and maximize window
    [Arguments]     ${URL}      ${BrowserName}
    open browser    ${URL}      ${BrowserName}
    maximize browser window