*** Settings ***
Documentation     This Class absically contains all methods and Locators related to Global Search Functionality.
...
...               It contains all Locators of global search
...               It contains all methods of gloabl search
Resource          ../Libraries/Library.robot

*** Variables ***
${Global_Search_Locator}    //button[@aria-label='Search'][@type='button']
${Filter_Type_Locator}    //span[text()="Category"]
${Input_Global_Search}    //input[@aria-label="Search by keyword"]
${Clear_Selection_Locator}    //button[contains(text(),"Clear selection")]
${Latest_Search_History_Locator}    //section[@data-testid="search-history"]//following::a[1]/p

*** Keywords ***
click_Global_SearchButton
    [Documentation]    This method
    ...    click_global_searchButton is genric keyword to wait for the elemnt to visible and \ click on search button.
    sleep    5    #for search history to be updated
    Wait Until Element Is Visible    ${global_search_locator}    ${long_wait}
    Click Button    ${global_search_locator}

select_Filter_Type_Category
    [Documentation]    This method
    ...    select_Filter_Type_Category is genric keyword to wait for the elemnt to visible and \ select Category Type
    Wait Until Element Is Visible    ${filter_type_locator}    ${medium_wait}
    Click Element    ${filter_type_locator}

select_Sub_Category_Filters
    [Arguments]    ${tier1_filter_value}    ${tier2_filter_value}    ${tier3_filter_value}
    [Documentation]    This method
    ...
    ...    I have Create Seperate Class for Category Sub filters Under Modules folder
    ...
    ...    I import all the keyowrds from Catergoty class under modules.
    ...
    ...    This keyword take three agruments from \ testcases for validation of dropdown
    ...
    ...    this keyword return the locator for resuing in testing for other step
    select_Tier1_Category    ${tier1_filter_value}
    select_Tier2_Category    ${tier2_filter_value}
    ${tier3_Filter_Locator}    select_Tier3_Category    ${tier3_filter_value}
    [Return]    ${tier3_Filter_Locator}

input_Global_SearchBox
    [Documentation]    This method
    ...    is genric keyword to wait for the elemnt to visible and \ click in input search box
    Sleep    5
    Wait Until Element Is Visible    ${Input_global_search}
    Click Element    ${Input_global_search}
    [Return]    ${Input_global_search}

clear_Selection
    [Documentation]    This method is used to clear the Search history
    ...    we scroll the page and click clearhistory element
    Wait Until Element Is Visible    ${Clear_selection_locator}    ${short_wait}
    Scroll Element Into View    ${Clear_selection_locator}
    Wait Until Page Contains Element    ${Clear_selection_locator}    ${medium_wait}
    Click Button    ${Clear_selection_locator}

select_latest_Search_History
    [Documentation]    This Method is used to select the search history \
    Wait Until Element Is Visible    ${Latest_Search_History_Locator}    ${medium_wait}
    Click Element    ${Latest_Search_History_Locator}

get_Search_History
    [Documentation]    This methos will get the search history available
    Wait Until Page Contains Element    ${Latest_Search_History_Locator}
    ${Latest_Search}    Get Text    ${Latest_Search_History_Locator}    #Validation of latest search history
    [Return]    ${Latest_Search}
