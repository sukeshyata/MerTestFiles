*** Settings ***
Documentation     This Category Module contains all Sub Action performed under Catergory and its locators
Resource          ../Libraries/Library.robot

*** Variables ***
${Category_Tier1_Locator}    //*[@id="search-filter"]//ul/child::li[2]//*[@data-testid="Category"]//select    # //*[@id="search-filter"]//ul/child::li[2]//*[@data-testid="Category"]//select
${Category_Tier2_Locator}    //*[@data-testid="category_id"]//*[@id="accordion_content"]//div[2]//select    # //*[@data-testid="category_id"]//*[@id="accordion_content"]//div[2]//select
${Category_Tier3_Locator}    //span[text()="{}"]//preceding::input[1]    # //input[@name="category_id"]/..//span[text()="{}"]

*** Keywords ***
select_Tier1_Category
    [Arguments]    ${tier1_filter_value}
    sleep    5
    Wait Until Element Is Visible    ${Category_tier1_locator}    ${long_wait}
    Wait Until Page Contains Element    ${Category_tier1_locator}    ${long_wait}
    Select From List By Label    ${Category_tier1_locator}    ${tier1_filter_value}

select_Tier2_Category
    [Arguments]    ${tier2_filter_value}
    sleep    5    # this wait given for page to load the tier 2 dropdown
    Wait Until Element Is Visible    ${Category_tier2_locator}    ${long_wait}
    Wait Until Page Contains Element    ${Category_tier2_locator}    ${long_wait}
    Select From List By Label    ${Category_tier2_locator}    ${tier2_filter_value}

select_Tier3_Category
    [Arguments]    ${tier3_filter_value}
    ${tier3_Filter}    Replace String    ${Category_Tier3_Locator}    {}    ${tier3_filter_value}
    Wait Until Element Is Visible    ${tier3_Filter}    ${long_wait}
    Scroll Element Into View    ${tier3_Filter}
    Wait Until Page Contains Element    ${tier3_Filter}    ${long_wait}
    Click Element    ${tier3_Filter}
    [Return]    ${tier3_Filter}

get_Text_Filter_Catergory
    ${Validate_tier1_filter}    Get Selected List Label    ${Category_Tier1_Locator}
    ${Validate_tier2_filter}    Get Selected List Label    ${Category_Tier2_Locator}
    [Return]    ${Validate_tier1_filter}    ${Validate_tier2_filter}
