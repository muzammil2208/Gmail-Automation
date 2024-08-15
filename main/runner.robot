*** Settings ***
Library    SeleniumLibrary
Resource    ../keywords/browser_keywords.robot
Resource    ../keywords/useractions.robot


*** Tasks ***

Open gmail app and collect all emails information
    Open Chrome Browser in Debug mode and connect    https://mail.google.com/mail/u/0/#inbox


Delete all promotion emails
    [Documentation]     this tasks delete all promotion emails form inbox
    Open Chrome Browser in Debug mode and connect   url=https://mail.google.com/mail/u/0/#inbox
    Delete all promotions email
    