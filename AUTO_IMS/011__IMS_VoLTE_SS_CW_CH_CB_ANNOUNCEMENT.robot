*** Settings ***
Documentation     IMS_VoLTE_SS_CW_CH_CB_ANNOUNCEMENT_TEST_SUITE
Suite Setup       SUITE STARTUP
Suite teardown    CLOSE EXISTING CONNECTION
Test Teardown     TEST STOP
Force Tags        IMS_VoLTE_SS_CW_CH_CB
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
    [Documentation]    "To verify IMS VoLTE Registration of SS CW Calling party msisdn for announcement."
    [Tags]    CRIT_P1_IMS_VoLTE_CALL_REG
    Set Test Variable    ${STATE_MACHINE}    AUTO_IMS_REG_SS_CW_CALLING
    ${TC_RESULT} =    START IMS AUTO
    log    ${TC_RESULT}

AUTO_IMS_VoLTE_REG_SS_CW
    [Documentation]    "To verify IMS VoLTE Registration of SS CW called party enabled msisdn for announcement."
    [Tags]    CRIT_P1_IMS_VoLTE_CALL_REG
    Set Test Variable    ${STATE_MACHINE}    AUTO_IMS_REG_SS_CW
    ${TC_RESULT} =    START IMS AUTO
    log    ${TC_RESULT}


AUTO_IMS_VoLTE_SS_CW_ANSCMT_001
    [Documentation]    "To verify basic ims VoLTE SS CW scenario for call waiting announcement."
    [Tags]    CRIT_P1_IMS_VoLTE_MOCALL
    Set Test Variable    ${CLIENT_SERVER_SCENARIO}    ${1}
    Set Test Variable    ${SEAGULL_EXECUTION}    ${1}
    Set Test Variable    ${SEAGULL_EXECUTION_TYPE}    ${2}
    Set Test Variable    ${SEAGULL_SCENARIO_NAME}    IMS_PCRF_SCENARIO
    Set Test Variable    ${SEAGULL_CONFIG_NAME}    IMS_PCRF_AUTO_CONFIG_2
    Set Test Variable    ${SEAGULL_SESSION_ID}    1001
    Set Test Variable    ${CLIENT_STATE_MACHINE}    AUTO_VoLTE_SS_CW_UAC_ANSCMT_A_001
    Set Test Variable    ${SERVER_STATE_MACHINE}    AUTO_VoLTE_SS_CW_UAS_ANSCMT_B_001
    ${TC_RESULT} =    START IMS AUTO
    log    ${TC_RESULT}

AUTO_IMS_VoLTE_SS_CH_ANSCMT_002
    [Documentation]    "To verify basic ims VoLTE Call Hold scenario for call hold announcement."
    [Tags]    CRIT_P1_IMS_VoLTE_MTCALL
    Set Test Variable    ${CLIENT_SERVER_SCENARIO}    ${1}
    Set Test Variable    ${SEAGULL_EXECUTION}    ${1}
    Set Test Variable    ${SEAGULL_EXECUTION_TYPE}    ${2}
    Set Test Variable    ${SEAGULL_SCENARIO_NAME}    IMS_PCRF_SCENARIO_4RAR
    Set Test Variable    ${SEAGULL_CONFIG_NAME}    IMS_PCRF_AUTO_CONFIG_2
    Set Test Variable    ${SEAGULL_SESSION_ID}    1002
    Set Test Variable    ${CLIENT_STATE_MACHINE}    AUTO_VoLTE_SS_CH_UAC_ANSCMT_A_002
    Set Test Variable    ${SERVER_STATE_MACHINE}    AUTO_VoLTE_SS_CH_UAS_ANSCMT_B_002
    ${TC_RESULT} =    START IMS AUTO
    log    ${TC_RESULT}

AUTO_IMS_VoLTE_SS_CH_ANSCMT_003
    [Documentation]    "To verify whether call hold is successful when Invite is received with the Request URI as SIP and B party as Tel from UE-A for call hold announcement."
    [Tags]    CRIT_P1_IMS_VoLTE_MTCALL
    Set Test Variable    ${CLIENT_SERVER_SCENARIO}    ${1}
    Set Test Variable    ${SEAGULL_EXECUTION}    ${1}
    Set Test Variable    ${SEAGULL_EXECUTION_TYPE}    ${2}
    Set Test Variable    ${SEAGULL_SCENARIO_NAME}    IMS_PCRF_SCENARIO_4RAR
    Set Test Variable    ${SEAGULL_CONFIG_NAME}    IMS_PCRF_AUTO_CONFIG_2
    Set Test Variable    ${SEAGULL_SESSION_ID}    1003
    Set Test Variable    ${CLIENT_STATE_MACHINE}    AUTO_VoLTE_SS_CH_UAC_ANSCMT_A_003
    Set Test Variable    ${SERVER_STATE_MACHINE}    AUTO_VoLTE_SS_CH_UAS_ANSCMT_B_003
    ${TC_RESULT} =    START IMS AUTO
    log    ${TC_RESULT}

AUTO_IMS_VoLTE_SS_CH_ANSCMT_004
    [Documentation]    "To verify basic ims VoLTE Call Hold scenario followed by call release for call hold announcement."
    [Tags]    CRIT_P1_IMS_VoLTE_MTCALL
    Set Test Variable    ${CLIENT_SERVER_SCENARIO}    ${1}
    Set Test Variable    ${SEAGULL_EXECUTION}    ${1}
    Set Test Variable    ${SEAGULL_EXECUTION_TYPE}    ${2}
    Set Test Variable    ${SEAGULL_SCENARIO_NAME}    IMS_PCRF_SCENARIO_4RAR
    Set Test Variable    ${SEAGULL_CONFIG_NAME}    IMS_PCRF_AUTO_CONFIG_2
    Set Test Variable    ${SEAGULL_SESSION_ID}    1004
    Set Test Variable    ${CLIENT_STATE_MACHINE}    AUTO_VoLTE_SS_CH_UAC_ANSCMT_A_004
    Set Test Variable    ${SERVER_STATE_MACHINE}    AUTO_VoLTE_SS_CH_UAS_ANSCMT_B_004
    ${TC_RESULT} =    START IMS AUTO
    log    ${TC_RESULT}

AUTO_IMS_VoLTE_SS_CH_ANSCMT_005
    [Documentation]    "To verify basic ims VoLTE Call Hold followed by call release and once again A-party is holding the call for call hold announcement."
    [Tags]    CRIT_P1_IMS_VoLTE_MTCALL
    Set Test Variable    ${CLIENT_SERVER_SCENARIO}    ${1}
    Set Test Variable    ${SEAGULL_EXECUTION}    ${1}
    Set Test Variable    ${SEAGULL_EXECUTION_TYPE}    ${2}
    Set Test Variable    ${SEAGULL_SCENARIO_NAME}    IMS_PCRF_SCENARIO_5RAR
    Set Test Variable    ${SEAGULL_CONFIG_NAME}    IMS_PCRF_AUTO_CONFIG_2
    Set Test Variable    ${SEAGULL_SESSION_ID}    1005
    Set Test Variable    ${CLIENT_STATE_MACHINE}    AUTO_VoLTE_SS_CH_UAC_ANSCMT_A_005
    Set Test Variable    ${SERVER_STATE_MACHINE}    AUTO_VoLTE_SS_CH_UAS_ANSCMT_B_005
    ${TC_RESULT} =    START IMS AUTO
    log    ${TC_RESULT}

AUTO_IMS_VoLTE_SS_CH_ANSCMT_006
    [Documentation]    "To verify basic ims VoLTE Call Hold followed by call release is performed by A-party twice for call hold announcement."
    [Tags]    CRIT_P1_IMS_VoLTE_MTCALL
    Set Test Variable    ${CLIENT_SERVER_SCENARIO}    ${1}
    Set Test Variable    ${SEAGULL_EXECUTION}    ${1}
    Set Test Variable    ${SEAGULL_EXECUTION_TYPE}    ${2}
    Set Test Variable    ${SEAGULL_SCENARIO_NAME}    IMS_PCRF_SCENARIO_6RAR
    Set Test Variable    ${SEAGULL_CONFIG_NAME}    IMS_PCRF_AUTO_CONFIG_2
    Set Test Variable    ${SEAGULL_SESSION_ID}    1006
    Set Test Variable    ${CLIENT_STATE_MACHINE}    AUTO_VoLTE_SS_CH_UAC_ANSCMT_A_006
    Set Test Variable    ${SERVER_STATE_MACHINE}    AUTO_VoLTE_SS_CH_UAS_ANSCMT_B_006
    ${TC_RESULT} =    START IMS AUTO
    log    ${TC_RESULT}

AUTO_IMS_REG_001
    [Documentation]    "To Verify IMS REGISTRATON."
    [Tags]    CRIT_P1_IMS_REG
    Set Test Variable    ${STATE_MACHINE}    AUTO_IMS_REG_001
    ${TC_RESULT} =    START IMS AUTO
    log    ${TC_RESULT}

AUTO_IMS_VoLTE_REG_SS_OUTGOING_CALL_BARRING
    [Documentation]    "To verify IMS VoLTE Registration of SS OUTGOING CALL BARRING CALLING msisdn."
    [Tags]    CRIT_P1_IMS_VoLTE_CALL_REG
    Set Test Variable    ${STATE_MACHINE}    AUTO_IMS_REG_SS_OUTGOING_CALL_BARRING
    ${TC_RESULT} =    START IMS AUTO
    log    ${TC_RESULT}

AUTO_IMS_VoLTE_REG_SS_INCOMING_CALL_BARRING
    [Documentation]    "To verify IMS VoLTE Registration of SS INCOMING CALL BARRING CALLED msisdn."
    [Tags]    CRIT_P1_IMS_VoLTE_CALL_REG
    Set Test Variable    ${STATE_MACHINE}    AUTO_IMS_REG_SS_INCOMING_CALL_BARRING
    ${TC_RESULT} =    START IMS AUTO
    log    ${TC_RESULT}

AUTO_IMS_VoLTE_SS_OCB_PM_WITH_ANSCMNT
    [Documentation]    "To verify basic ims VoLTE SS OUTGOING_CALL_BARRING scenario with TAS application is sending Invite request to Powermedia application during Outgoing call barring case."
    [Tags]    CRIT_P1_IMS_VoLTE_MOCALL
    Set Test Variable    ${SEAGULL_EXECUTION}    ${1}
    Set Test Variable    ${SEAGULL_EXECUTION_TYPE}    ${2}
    Set Test Variable    ${SEAGULL_SCENARIO_NAME}    IMS_PCRF_SCENARIO
    Set Test Variable    ${SEAGULL_SESSION_ID}    1007
    Set Test Variable    ${STATE_MACHINE}    AUTO_IMS_VoLTE_SS_OUTGOING_PM_CALL_BARRING 
    ${TC_RESULT} =    START IMS AUTO
    log    ${TC_RESULT}

AUTO_IMS_VoLTE_SS_OCB_PM_INT_WITH_ANSCMNT
    [Documentation]    "To verify basic ims VoLTE SS OUTGOING_CALL_BARRING INTERNATIONAL scenario with TAS application is sending Invite request to Powermedia application during Outgoing call barring case of International number."
    [Tags]    CRIT_P1_IMS_VoLTE_MOCALL
    Set Test Variable    ${SEAGULL_EXECUTION}    ${1}
    Set Test Variable    ${SEAGULL_EXECUTION_TYPE}    ${2}
    Set Test Variable    ${SEAGULL_SCENARIO_NAME}    IMS_PCRF_SCENARIO
    Set Test Variable    ${SEAGULL_SESSION_ID}    1009
    Set Test Variable    ${STATE_MACHINE}    AUTO_IMS_VoLTE_SS_OUTGOING_PM_CALL_BARRING_INTERNATIONAL
    ${TC_RESULT} =    START IMS AUTO
    log    ${TC_RESULT}


AUTO_IMS_VoLTE_SS_INCOMING_POWERMEDIA_WITH_ANSCMNT
    [Documentation]    "To verify basic ims VoLTE SS INCOMING_CALL_BARRING scenario with TAS application is sending Invite request to Powermedia application during Ingoing call barring case."
    [Tags]    CRIT_P1_IMS_VoLTE_MTCALL
    Set Test Variable    ${SEAGULL_EXECUTION}    ${1}
    Set Test Variable    ${SEAGULL_EXECUTION_TYPE}    ${2}
    Set Test Variable    ${SEAGULL_SCENARIO_NAME}    IMS_PCRF_SCENARIO
    Set Test Variable    ${SEAGULL_SESSION_ID}    1008
    Set Test Variable    ${STATE_MACHINE}    AUTO_IMS_VoLTE_SS_INCOMING_PM1_CALL_BARRING
    ${TC_RESULT} =    START IMS AUTO
    log    ${TC_RESULT}




*** Keywords ***
