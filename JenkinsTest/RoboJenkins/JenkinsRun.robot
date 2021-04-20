*** Settings ***
Library    SeleniumLibrary


*** Keywords ***
LogIfFailKW
    Log    The value of the sum was below 20, therefore the test failed    
    
RandomSummarizeKW
    @{Numbers}=    Evaluate    random.sample(range(1,11),4)    random
    ${Sum}=    Evaluate    ${Numbers}[0]+${Numbers}[1]+${Numbers}[2]+${Numbers}[3]
    ${Test}=    Set Variable    20
    ${Result}=    Evaluate    ${Sum}>=${Test}
    Run Keyword If    ${Result}==False    LogIfFailKW    
    Run Keyword If    ${Result}==False   fail 

*** Test Cases ***
    
JenkinsTest
    RandomSummarizeKW