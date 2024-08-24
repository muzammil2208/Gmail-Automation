*** Settings ***
Library    SeleniumLibrary
Resource    ../keywords/browser_keywords.robot
Resource    ../keywords/useractions.robot
Library    ../libraries/utilities.py

*** Tasks ***

Open gmail app and collect all emails information
    Open Chrome Browser in Debug mode    https://mail.google.com/mail/u/0/#inbox


Delete all promotion emails
    [Documentation]     this tasks delete all promotion emails form inbox
    Open Chrome Browser in Debug mode  url=https://mail.google.com/mail/u/0/#inbox
    Delete all promotions email
    
Extact all information about emails
    Open Chrome In Headless Mode   url=https://mail.google.com/mail/u/0/#inbox
    Extract all information about emails
