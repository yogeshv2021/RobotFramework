*** Settings ***
Documentation     IMS_VoLTE_SS_CW_CH_TEST_SUITE
Suite Setup       SUITE STARTUP
Suite teardown    CLOSE EXISTING CONNECTION
Test Teardown     TEST STOP
Force Tags        IMS_VoLTE_SS_CW_CH
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
AUTO_IMS_VoLTE_REG_SS_CW_CALLING
    [Documentation]    "To verify IMS VoLTE Registration of SS CW Calling party msisdn."
    [Tags]    CRIT_P1_IMS_VoLTE_CALL_REG
    Set Test Variable    ${STATE_MACHINE}    AUTO_IMS_REG_SS_CW_CALLING
    ${TC_RESULT} =    START IMS AUTO
    log    ${TC_RESULT}

AUTO_IMS_VoLTE_REG_SS_CW
    [Documentation]    "To verify IMS VoLTE Registration of SS CW called party enabled msisdn."
    [Tags]    CRIT_P1_IMS_VoLTE_CALL_REG
    Set Test Variable    ${STATE_MACHINE}    AUTO_IMS_REG_SS_CW
    ${TC_RESULT} =    START IMS AUTO
    log    ${TC_RESULT}


AUTO_IMS_VoLTE_SS_CW_001
    [Documentation]    "To verify basic ims VoLTE SS CW scenario."
    [Tags]    CRIT_P1_IMS_VoLTE_MOCALL
    Set Test Variable    ${CLIENT_SERVER_SCENARIO}    ${1}
    Set Test Variable    ${SEAGULL_EXECUTION}    ${1}
    Set Test Variable    ${SEAGULL_EXECUTION_TYPE}    ${2}
    Set Test Variable    ${SEAGULL_SCENARIO_NAME}    IMS_PCRF_SCENARIO
    Set Test Variable    ${SEAGULL_CONFIG_NAME}    IMS_PCRF_AUTO_CONFIG_2
    Set Test Variable    ${SEAGULL_SESSION_ID}    401
    Set Test Variable    ${CLIENT_STATE_MACHINE}    AUTO_VoLTE_SS_CW_UAC_A_001
    Set Test Variable    ${SERVER_STATE_MACHINE}    AUTO_VoLTE_SS_CW_UAS_B_001
    ${TC_RESULT} =    START IMS AUTO
    log    ${TC_RESULT}

AUTO_IMS_VoLTE_SS_CH_002
    [Documentation]    "To verify basic ims VoLTE Call Hold scenario."
    [Tags]    CRIT_P1_IMS_VoLTE_MTCALL
    Set Test Variable    ${CLIENT_SERVER_SCENARIO}    ${1}
    Set Test Variable    ${SEAGULL_EXECUTION}    ${1}
    Set Test Variable    ${SEAGULL_EXECUTION_TYPE}    ${2}
    Set Test Variable    ${SEAGULL_SCENARIO_NAME}    IMS_PCRF_SCENARIO_3RAR
    Set Test Variable    ${SEAGULL_CONFIG_NAME}    IMS_PCRF_AUTO_CONFIG_2
    Set Test Variable    ${SEAGULL_SESSION_ID}    402
    Set Test Variable    ${CLIENT_STATE_MACHINE}    AUTO_VoLTE_SS_CH_UAC_A_002
    Set Test Variable    ${SERVER_STATE_MACHINE}    AUTO_VoLTE_SS_CH_UAS_B_002
    ${TC_RESULT} =    START IMS AUTO
    log    ${TC_RESULT}

AUTO_IMS_VoLTE_SS_CH_003
    [Documentation]    "To verify whether call hold is successful when Invite is received with the Request URI as SIP and B party as Tel from UE-A."
    [Tags]    CRIT_P1_IMS_VoLTE_MTCALL
    Set Test Variable    ${CLIENT_SERVER_SCENARIO}    ${1}
    Set Test Variable    ${SEAGULL_EXECUTION}    ${1}
    Set Test Variable    ${SEAGULL_EXECUTION_TYPE}    ${2}
    Set Test Variable    ${SEAGULL_SCENARIO_NAME}    IMS_PCRF_SCENARIO_3RAR
    Set Test Variable    ${SEAGULL_CONFIG_NAME}    IMS_PCRF_AUTO_CONFIG_2
    Set Test Variable    ${SEAGULL_SESSION_ID}    403
    Set Test Variable    ${CLIENT_STATE_MACHINE}    AUTO_VoLTE_SS_CH_UAC_A_003
    Set Test Variable    ${SERVER_STATE_MACHINE}    AUTO_VoLTE_SS_CH_UAS_B_003
    ${TC_RESULT} =    START IMS AUTO
    log    ${TC_RESULT}



*** Keywords ***
