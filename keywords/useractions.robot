*** Settings ***
Library    SeleniumLibrary
Library    ../libraries/utilities.py
Library    Collections

*** Variables ***
${promotions tag}    xpath=//div[text()="Promotions"]
${select all}    //span[@class="T-Jo J-J5-Ji"]
${bin}    xpath=(//div[@class="asa"])[3]
${select all conversations text}    xpath=//span[text()="Select all "]
${ok_btn}    xpath=//button[@name="ok"]
${menu_btn}    xpath=//div[@aria-label="Main menu"]
${all_email_btn}    xpath=//a[text()="All Mail"]
${more_btn}    xpath=//span[text()="More"]
${email_sender_names}     xpath=(//table[@class="F cf zt"])[last()]//tbody//tr/td[4]/div[2]/span[1]/span
${email_sender_title}    xpath=(//table[@class="F cf zt"])[last()]//tbody//tr/td[4]//div[2]//span//span
${email_sender_date}    xpath=(//table[@class="F cf zt"])[last()]//tbody//tr/td[8]//span//span
${next_toggle}    xpath=(//div[@class="Cr aqJ"]/div//span[@class="Di"]//div[last()])[last()]

*** Keywords ***
Delete all promotions email
    [Documentation]    keyword to delete all promotion emails
    Click Element    ${promotions tag}
    Click Element    ${select all}
    Click Element    ${select all conversations text}
    Click Element    ${bin}    
    Click Element    ${ok_btn}


Extract all information about emails
    [Documentation]    keyword to extract all information about email and save it in excel file
    Click Element    ${more_btn}
    Click Element    ${all_email_btn}
    Extract all information from all visible pages
    
Extract all information from all visible pages
    [Documentation]    this keyword will loop through all pages and collect name,title and date of the email for ui
    ${status}    Get Status of next toogle button
    ${names}    Create List
    ${titles}    Create List
    ${dates}    Create List
    WHILE  '${status}'!='true'
        ${nameslist}    Get Text from series of elements    ${email_sender_names}
        ${titlelist}    Get Text from series of elements    ${email_sender_title}
        ${datelist}    Get Text from series of elements    ${email_sender_date}
        ${names}     Add Two List    ${names}    ${nameslist}
        ${titles}     Add Two List   ${titles}    ${titlelist}
        ${dates}     Add Two List    ${dates}    ${datelist}
        Click Element    ${next_toggle}
        ${status}    Get Status of next toogle button   
        Wait Until Element Is Enabled    ${email_sender_names}    5s         
    END
    Log To Console    ${names}


Get Status of next toogle button
    [Documentation]     return the status of next toggle button (disabled/enabled)
    ${status}    Get Element Attribute      ${next_toggle}      aria-disabled
    RETURN    ${status}
    
Get Text from series of elements
    [Documentation]    this keyword will return a list of all text in series of xpaths
    [Arguments]    ${xpath}
    ${sender_names}      Create List 
     
    ${count}    Get Element Count       ${xpath}
    FOR     ${i}     IN RANGE     1     ${count}
        ${actual_xpath}    Trim Xpath From Name    ${xpath}
        ${element_xpath}    Set Variable    xpath=(${actual_xpath})[${i}]
       TRY
            ${sender_name}    Get Text    ${element_xpath}
            Append To List    ${sender_names}    ${sender_name} 
        EXCEPT
            BREAK
        END
    END
    RETURN    ${sender_names}
        
