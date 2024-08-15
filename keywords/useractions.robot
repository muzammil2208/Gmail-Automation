*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${promotions tag}    xpath=//div[text()="Promotions"]
${select all}    //span[@class="T-Jo J-J5-Ji"]
${bin}    xpath=(//div[@class="asa"])[3]
${select all conversations text}    xpath=//span[text()="Select all "]
${ok_btn}    xpath=//button[@name="ok"]


*** Keywords ***
Delete all promotions email
    Click Element    ${promotions tag}
    Click Element    ${select all}
    Click Element    ${select all conversations text}
    Click Element    ${bin}    
    Click Element    ${ok_btn}

