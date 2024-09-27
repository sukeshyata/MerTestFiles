*** Settings ***
Test Setup
Test Teardown
Resource          ../Libraries/Library.robot

*** Test Cases ***
Verify search filters are set properly
    [Documentation]    \
    ...    Scenario 1
    ...    Search conditions are set correctly.
    ...    Steps:
    ...    1. Go to Mercari top page (https://jp.mercari.com/)
    ...    2. Click on the search bar
    ...    3. Click on "Select by category" (カテゴリーからさがす)
    ...    4. Select "Books, Music & Games" as the tier 1 category (本・音楽・ゲーム)
    ...    5. Select "Books" as the tier 2 category (本)
    ...    6. Select "Computers & Technology" as the tier 3 category (コンピュータ/IT)
    ...    7. Verify the search conditions on the left sidebar are set correctly
    [Setup]    Launch_Browser    Mercari: Japan's largest marketplace
    click_Global_SearchButton
    select_Filter_Type_Category
    select_Sub_Category_Filters    Books, Magazines, Manga    Book    Computer It
    [Teardown]    Capture_Screenshot

Verify browsing history is displayed based on latest search
    [Documentation]    Scenario 2
    ...    Search conditions are set correctly from the latest browsing history.
    ...    Pre-condition:
    ...    Create 2 browsing history entries. The latest one should be the categories in Scenario 1.
    ...    (You can create browsing history by following the same steps in Scenario 1)
    ...    Steps:
    ...    1. Go to Mercari top page (https://jp.mercari.com/)
    ...    2. Click on the search bar
    ...    2. Verify there are 2 browsing histories
    ...    3. Verify the latest browsing history is showing correctly (Computers & Technology / コンピュータ/IT)
    ...    4. Click on the latest browsing histories
    ...    5. Verify the search conditions on the left sidebar are set correctly
    ...    6. Input "javascript" in the search bar and search with the keyword
    ...    7. Go back to Mercari top page (https://jp.mercari.com/)
    ...    8. Verify there are 3 browsing histories
    ...    9. Verify the latest browsing history is showing correctly (javascript, Computers & Technology / javascript, コンピュータ/IT)
    [Setup]    Launch_Browser    Mercari: Japan's largest marketplace
    click_Global_SearchButton
    select_Filter_Type_Category
    select_Sub_Category_Filters    Baby Kids    Baby Shoes    Baby Sandals
    click_Global_SearchButton
    ${tier3_Filter_Locator}    select_Sub_Category_Filters    Books, Magazines, Manga    Book    Computer It
    input_Global_SearchBox
    ${Latest_Search}    get_Search_History
    Should Be Equal    ${Latest_Search}    Computer It    # validation of tier3 filter done here
    ${Latest_Search}    select_latest_Search_History
    ${tier1_filter_text}    ${tier2_filter_text}    get_Text_Filter_Catergory
    Should Be Equal    ${tier1_filter_text}    Books, Magazines, Manga    # validation of tier1 filter done here
    Should Be Equal    ${tier2_filter_text}    Book    # validation of tier2 Filter done here
    Checkbox Should Be Selected    ${tier3_Filter_Locator}
    ${search_Input_Locator}    input_Global_SearchBox
    Input Text    ${search_Input_Locator}    JavaScript
    click_Global_SearchButton
    goto    ${url}
    input_Global_SearchBox
    ${search_History}    get_Search_History
    [Teardown]
