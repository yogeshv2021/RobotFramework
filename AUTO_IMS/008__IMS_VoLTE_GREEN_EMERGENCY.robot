*** Settings ***
Documentation     IMS_VoLTE_EMERGENCY_TEST_SUITE
Suite Setup       SUITE STARTUP
Suite teardown    CLOSE EXISTING CONNECTION
Test Teardown     TEST STOP
Force Tags        IMS_VoLTE_EMERGENCY_TEST_SUITE
Default Tags      P2
Test Timeout      5 minutes
Library           Collections
Library           SSHLibrary
Library           OperatingSystem
Library           String
Library           BuiltIn
Library           DateTime
Library           DatabaseLibrary
Library           XML
Library           Rammbock
Resource          /opt/product/AUTOMATION/TEST_AUTOMATION_FRAMEWORK/IMS_SOLARIS_IPV6_EXP_MSTACK/MODULES/AUTO_MGTS_CONNECT.robot
Resource          /opt/product/AUTOMATION/TEST_AUTOMATION_FRAMEWORK/IMS_SOLARIS_IPV6_EXP_MSTACK/MODULES/AUTO_START_STOP.robot
Resource          /opt/product/AUTOMATION/TEST_AUTOMATION_FRAMEWORK/IMS_SOLARIS_IPV6_EXP_MSTACK/MODULES/AUTO_APP_CONNECT.robot
Resource          /opt/product/AUTOMATION/TEST_AUTOMATION_FRAMEWORK/IMS_SOLARIS_IPV6_EXP_MSTACK/MODULES/AUTO_SEAGULL_RUN.robot
Resource          /opt/product/AUTOMATION/TEST_AUTOMATION_FRAMEWORK/IMS_SOLARIS_IPV6_EXP_MSTACK/MODULES/AUTO_SIPP_MODULE.robot
Resource          /opt/product/AUTOMATION/TEST_AUTOMATION_FRAMEWORK/IMS_SOLARIS_IPV6_EXP_MSTACK/MODULES/AUTO_DB_MODULE.robot
Resource          /opt/product/AUTOMATION/TEST_AUTOMATION_FRAMEWORK/IMS_SOLARIS_IPV6_EXP_MSTACK/MODULES/AUTO_LOGGING.robot
Resource          /opt/product/AUTOMATION/TEST_AUTOMATION_FRAMEWORK/IMS_SOLARIS_IPV6_EXP_MSTACK/MODULES/AUTO_CDR_MODULE.robot
Resource          /opt/product/AUTOMATION/TEST_AUTOMATION_FRAMEWORK/IMS_SOLARIS_IPV6_EXP_MSTACK/MODULES/AUTO_SUITE_MODULE.robot
Resource          /opt/product/AUTOMATION/TEST_AUTOMATION_FRAMEWORK/IMS_SOLARIS_IPV6_EXP_MSTACK/MODULES/AUTO_PCAP_MODULE.robot
Resource          /opt/product/AUTOMATION/TEST_AUTOMATION_FRAMEWORK/IMS_SOLARIS_IPV6_EXP_MSTACK/MODULES/AUTO_SHELL_MODULE.robot
Resource          /opt/product/AUTOMATION/TEST_AUTOMATION_FRAMEWORK/IMS_SOLARIS_IPV6_EXP_MSTACK/MODULES/AUTO_REMOTE_APP.robot
Resource          /opt/product/AUTOMATION/TEST_AUTOMATION_FRAMEWORK/IMS_SOLARIS_IPV6_EXP_MSTACK/MODULES/AUTO_TESTCASE_MODULE.robot
Variables         /opt/product/AUTOMATION/TEST_AUTOMATION_FRAMEWORK/IMS_SOLARIS_IPV6_EXP_MSTACK/CONFIG/AUTO_MAIN_DETAILS.py
Variables         /opt/product/AUTOMATION/TEST_AUTOMATION_FRAMEWORK/IMS_SOLARIS_IPV6_EXP_MSTACK/CONFIG/AUTO_LOGGING_DETAILS.py
Variables         /opt/product/AUTOMATION/TEST_AUTOMATION_FRAMEWORK/IMS_SOLARIS_IPV6_EXP_MSTACK/CONFIG/AUTO_CDR_DETAILS.py
Variables         /opt/product/AUTOMATION/TEST_AUTOMATION_FRAMEWORK/IMS_SOLARIS_IPV6_EXP_MSTACK/CONFIG/AUTO_DB_DETAILS.py
Variables         /opt/product/AUTOMATION/TEST_AUTOMATION_FRAMEWORK/IMS_SOLARIS_IPV6_EXP_MSTACK/CONFIG/AUTO_SEAGULL_DETAILS.py
Variables         /opt/product/AUTOMATION/TEST_AUTOMATION_FRAMEWORK/IMS_SOLARIS_IPV6_EXP_MSTACK/CONFIG/AUTO_PCAP_DETAILS.py
Variables         /opt/product/AUTOMATION/TEST_AUTOMATION_FRAMEWORK/IMS_SOLARIS_IPV6_EXP_MSTACK/CONFIG/AUTO_SHELL_COMMAND_DETAILS.py
Variables         /opt/product/AUTOMATION/TEST_AUTOMATION_FRAMEWORK/IMS_SOLARIS_IPV6_EXP_MSTACK/CONFIG/AUTO_REMOTE_APP_DETAILS.py
Variables         /opt/product/AUTOMATION/TEST_AUTOMATION_FRAMEWORK/IMS_SOLARIS_IPV6_EXP_MSTACK/CONFIG/AUTO_SIPP_DETAILS.py

*** Variables ***
${LOGGER_Validation}    1
${CDR_Validation}    0
${PRE_DB_Validation}    1
${POST_DB_QUERY_Validation}    1

*** Test Cases ***
AUTO_IMS_VoLTE_EMERGENCY
    [Documentation]    "To verify IMS MO Emergency call Rejection."
    [Tags]    CRIT_P1_IMS_VoLTE_CALL_REG
    Set Test Variable    ${SIPP_PROTO_GREP}    egrep -i 'INVITE|380 Alternative Service|Warning|Content-Type|Support|ACK'
    Set Test Variable    ${SIPP_PROTO_GREP_END_STRING}    
    Set Test Variable    ${SIPP_PROTO_VALIDATION}    ${1}
    Set Test Variable    ${SIPP_PROTO_VALIDATION_TYPE}    ${1}
    Set Test Variable    ${STATE_MACHINE}    AUTO_IMS_VoLTE_EMERGENCY
    ${TC_RESULT} =    START IMS AUTO
    log    ${TC_RESULT}

AUTO_IMS_VoLTE_SMS
    [Documentation]    "To verify IMS MO SMS Rejection."
    [Tags]    CRIT_P1_IMS_VoLTE_CALL_REG
    Set Test Variable    ${SIPP_PROTO_GREP}    egrep -i 'CSeq|380 Alternative Service|Warning|Content-Type|Support|ACK|User-Agent'
    Set Test Variable    ${SIPP_PROTO_GREP_END_STRING}    
    Set Test Variable    ${SIPP_PROTO_VALIDATION}    ${1}
    Set Test Variable    ${SIPP_PROTO_VALIDATION_TYPE}    ${1}
    Set Test Variable    ${STATE_MACHINE}    AUTO_IMS_VoLTE_SMS
    ${TC_RESULT} =    START IMS AUTO
    log    ${TC_RESULT}

AUTO_IMS_VoLTE_A_NUM_REG_9
    [Documentation]    "To verify IMS VoLTE Registration of Calling A party msisdn for the Multiple bundle case."
    ...    "AMSISDN-397458400029"
    [Tags]    CRIT_P1_IMS_VoLTE_CALL_REG
    Set Test Variable    ${STATE_MACHINE}    AUTO_IMS_REG_CALLING_2
    ${TC_RESULT} =    START IMS AUTO
    log    ${TC_RESULT}

AUTO_IMS_VoLTE_CALL_055
    [Documentation]    "To verify basic VoLTE MO call scenario with B-party MSISDN is received with Green number configured as 911."
    ...    "AMSISDN-397458400029,BMSISDN-911"
    [Tags]    CRIT_P1_IMS_VoLTE_MOCALL
    Set Test Variable    ${STATE_MACHINE}    AUTO_VoLTE_UAC_055
    ${TC_RESULT} =    START IMS AUTO
    log    ${TC_RESULT}

AUTO_IMS_VoLTE_CALL_056
    [Documentation]    "To verify basic VoLTE MO call scenario with B-party MSISDN is received with Green number configured as 112."
    ...    "AMSISDN-397458400029,BMSISDN-112"
    [Tags]    CRIT_P1_IMS_VoLTE_MOCALL
    Set Test Variable    ${STATE_MACHINE}    AUTO_VoLTE_UAC_056
    ${TC_RESULT} =    START IMS AUTO
    log    ${TC_RESULT}

AUTO_IMS_VoLTE_CALL_057
    [Documentation]    "To verify basic VoLTE MO call scenario with B-party MSISDN is received with number as 0112(prefixed with 0) which is not configured in the Green number and TAS send 404 Not Found."
    ...    "AMSISDN-397458400029,BMSISDN-0112"
    [Tags]    CRIT_P1_IMS_VoLTE_MOCALL
    Set Test Variable    ${STATE_MACHINE}    AUTO_VoLTE_UAC_057
    ${TC_RESULT} =    START IMS AUTO
    log    ${TC_RESULT}

AUTO_IMS_VoLTE_CALL_058
    [Documentation]    "To verify basic VoLTE MO call scenario with B-party MSISDN is received with number as 1120(suffixed with 0) which is configured in the Green number and PCSCF send 380 Alternative services to UE."
    ...    "AMSISDN-397458400029,BMSISDN-1120"
    [Tags]    CRIT_P1_IMS_VoLTE_MOCALL
    Set Test Variable    ${STATE_MACHINE}    AUTO_VoLTE_UAC_058
    ${TC_RESULT} =    START IMS AUTO
    log    ${TC_RESULT}

AUTO_IMS_VoLTE_CALL_0581
    [Documentation]    "To verify basic VoLTE MO call scenario with B-party MSISDN is received with number as 800XXXXXXX which is configured in the Green number with the value as only 800 and PCSCF send 380 Alternative services to UE."
    ...    "AMSISDN-397458400029,BMSISDN-800"
    [Tags]    CRIT_P1_IMS_VoLTE_MOCALL
    Set Test Variable    ${STATE_MACHINE}    AUTO_VoLTE_UAC_0581
    ${TC_RESULT} =    START IMS AUTO
    log    ${TC_RESULT}

AUTO_IMS_VoLTE_CALL_0582
    [Documentation]    "To verify basic VoLTE MO call scenario with B-party MSISDN is received with number as 112XXXXXXX which is configured in the Green number with the value as only 800 and PCSCF send 380 Alternative services to UE."
    ...    "AMSISDN-397458400029,BMSISDN-112"
    [Tags]    CRIT_P1_IMS_VoLTE_MOCALL
    Set Test Variable    ${STATE_MACHINE}    AUTO_VoLTE_UAC_0582
    ${TC_RESULT} =    START IMS AUTO
    log    ${TC_RESULT}

AUTO_IMS_VoLTE_CALL_0583
    [Documentation]    "To verify basic VoLTE MO call scenario with B-party MSISDN is received with number as 1107684120 which is not configured in the Green number list of 112 and PCSCF send 380 Alternative services to UE."
    ...    "AMSISDN-397458400029,BMSISDN-1107684120"
    [Tags]    CRIT_P1_IMS_VoLTE_MOCALL
    Set Test Variable    ${STATE_MACHINE}    AUTO_VoLTE_UAC_0583
    ${TC_RESULT} =    START IMS AUTO
    log    ${TC_RESULT}

AUTO_IMS_VoLTE_CALL_0584
    [Documentation]    "To verify basic VoLTE MO call scenario with B-party MSISDN is received with number as 391127684120(CC+MSISDN) which is configured in the Green number list of 112 and PCSCF send 380 Alternative services to UE."
    ...    "AMSISDN-397458400029,BMSISDN-391127684120"
    [Tags]    CRIT_P1_IMS_VoLTE_MOCALL
    Set Test Variable    ${STATE_MACHINE}    AUTO_VoLTE_UAC_0584
    ${TC_RESULT} =    START IMS AUTO
    log    ${TC_RESULT}

AUTO_IMS_VoLTE_CALL_0585
    [Documentation]    "To verify basic VoLTE MO call scenario with B-party MSISDN is received with number as 391107684120(CC+MSISDN) which is configured in the Green number list of 391 and PCSCF send 380 Alternative services to UE."
    ...    "AMSISDN-397458400029,BMSISDN-391107684120"
    [Tags]    CRIT_P1_IMS_VoLTE_MOCALL
    Set Test Variable    ${STATE_MACHINE}    AUTO_VoLTE_UAC_0585
    ${TC_RESULT} =    START IMS AUTO
    log    ${TC_RESULT}




*** Keywords ***
