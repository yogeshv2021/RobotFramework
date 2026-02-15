*** Settings ***
Documentation     IMS_VoLTE_SRVCC_TEST_SUITE
Suite Setup       SUITE STARTUP
Suite teardown    CLOSE EXISTING CONNECTION
Test Teardown     TEST STOP
Force Tags        IMS_VoLTE_SRVCC_TEST_SUITE
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

AUTO_IMS_REG_SRVCC_A_NUM
    [Documentation]    "To verify IMS VoLTE Registration of Calling A party msisdn."
    [Tags]    CRIT_P1_IMS_VoLTE_SRVCC
    Set Test Variable    ${STATE_MACHINE}    AUTO_IMS_REG_SRVCC_A_NUM
    ${TC_RESULT} =    START IMS AUTO
    log    ${TC_RESULT}

AUTO_IMS_REG_SRVCC_B_NUM
    [Documentation]    "To verify IMS VoLTE Registration of Called B party msisdn."
    [Tags]    CRIT_P1_IMS_VoLTE_SRVCC
    Set Test Variable    ${STATE_MACHINE}    AUTO_IMS_REG_SRVCC_B_NUM
    ${TC_RESULT} =    START IMS AUTO
    log    ${TC_RESULT}

AUTO_IMS_MO_OTHER_SRVCC_INVITE_SIP
    [Documentation]    "To verify VOLTE-VOLTE(MO) SRVCC call is getting success for SIP URI when INVITE Request URI is sent with SIP URI from A-party in Request URI."
    [Tags]    CRIT_P1_IMS_VoLTE_SRVCC
    Set Test Variable    ${CLIENT_SERVER_SCENARIO}    ${3}
    Set Test Variable    ${SEAGULL_EXECUTION}    ${1}
    Set Test Variable    ${SEAGULL_EXECUTION_TYPE}    ${2}
    Set Test Variable    ${SEAGULL_SCENARIO_NAME}    IMS_PCRF_SCENARIO_3RAR
    Set Test Variable    ${SEAGULL_CONFIG_NAME}    IMS_PCRF_AUTO_CONFIG_2
    Set Test Variable    ${SEAGULL_SESSION_ID}    817
    Set Test Variable    ${CLIENT_STATE_MACHINE}    AUTO_IMS_MO_OTHER_SRVCC_CLIENT_SIP_1
    Set Test Variable    ${SERVER_STATE_MACHINE}    AUTO_IMS_MO_OTHER_SRVCC_SERVER_SIP
    Set Test Variable    ${CLIENT_STATE_MACHINE_TWO}    AUTO_IMS_MO_OTHER_SRVCC_SIP_CLIENT_1
    ${TC_RESULT} =    START IMS AUTO
    log    ${TC_RESULT}

AUTO_IMS_MO_OTHER_SRVCC_SIP
    [Documentation]    "To verify VOLTE-VOLTE(MO) SRVCC call is getting success for SIP URI when INVITE Request URI is sent with Tel URI from A-party."
    [Tags]    CRIT_P1_IMS_VoLTE_SRVCC
    Set Test Variable    ${CLIENT_SERVER_SCENARIO}    ${3}
    Set Test Variable    ${SEAGULL_EXECUTION}    ${1}
    Set Test Variable    ${SEAGULL_EXECUTION_TYPE}    ${2}
    Set Test Variable    ${SEAGULL_SCENARIO_NAME}    IMS_PCRF_SCENARIO_3RAR
    Set Test Variable    ${SEAGULL_CONFIG_NAME}    IMS_PCRF_AUTO_CONFIG_2
    Set Test Variable    ${SEAGULL_SESSION_ID}    816
    Set Test Variable    ${CLIENT_STATE_MACHINE}    AUTO_IMS_MO_OTHER_SRVCC_CLIENT_SIP
    Set Test Variable    ${SERVER_STATE_MACHINE}    AUTO_IMS_MO_OTHER_SRVCC_SERVER_SIP
    Set Test Variable    ${CLIENT_STATE_MACHINE_TWO}    AUTO_IMS_MO_OTHER_SRVCC_SIP_CLIENT_1
    ${TC_RESULT} =    START IMS AUTO
    log    ${TC_RESULT}

AUTO_IMS_MT_OTHER_SRVCC_INVITE_SIP
    [Documentation]    "To verify VOLTE-VOLTE(MT) SRVCC call is getting success for SIP URI when Request URI and To Header of the INVITE is sent with SIP URI from A-party."
    [Tags]    CRIT_P1_IMS_VoLTE_SRVCC
    Set Test Variable    ${CLIENT_SERVER_SCENARIO}    ${3}
    Set Test Variable    ${SEAGULL_EXECUTION}    ${1}
    Set Test Variable    ${SEAGULL_EXECUTION_TYPE}    ${2}
    Set Test Variable    ${SEAGULL_SCENARIO_NAME}    IMS_PCRF_SCENARIO_3RAR
    Set Test Variable    ${SEAGULL_CONFIG_NAME}    IMS_PCRF_AUTO_CONFIG_2
    Set Test Variable    ${SEAGULL_SESSION_ID}    818
    Set Test Variable    ${CLIENT_STATE_MACHINE}    AUTO_IMS_MT_OTHER_SRVCC_CLIENT_SIP_1
    Set Test Variable    ${SERVER_STATE_MACHINE}    AUTO_IMS_MT_OTHER_SRVCC_SERVER_SIP
    Set Test Variable    ${CLIENT_STATE_MACHINE_TWO}    AUTO_IMS_MT_OTHER_SRVCC_SIP_CLIENT_1
    ${TC_RESULT} =    START IMS AUTO
    log    ${TC_RESULT}

AUTO_IMS_MO_OTHER_SRVCC
    [Documentation]    "To verify VOLTE-VOLTE(MO) SRVCC call is getting success with Request URI as Tel URI."
    [Tags]    CRIT_P1_IMS_VoLTE_SRVCC
    Set Test Variable    ${CLIENT_SERVER_SCENARIO}    ${3}
    Set Test Variable    ${SEAGULL_EXECUTION}    ${1}
    Set Test Variable    ${SEAGULL_EXECUTION_TYPE}    ${2}
    Set Test Variable    ${SEAGULL_SCENARIO_NAME}    IMS_PCRF_SCENARIO_3RAR
    Set Test Variable    ${SEAGULL_CONFIG_NAME}    IMS_PCRF_AUTO_CONFIG_2
    Set Test Variable    ${SEAGULL_SESSION_ID}    815
    Set Test Variable    ${CLIENT_STATE_MACHINE}    AUTO_IMS_MO_OTHER_SRVCC_CLIENT
    Set Test Variable    ${SERVER_STATE_MACHINE}    AUTO_IMS_MO_OTHER_SRVCC_SERVER
    Set Test Variable    ${CLIENT_STATE_MACHINE_TWO}    AUTO_IMS_MO_OTHER_SRVCC_CLIENT_1
    ${TC_RESULT} =    START IMS AUTO
    log    ${TC_RESULT}


AUTO_IMS_MT_OTHER_SRVCC_INVITE_TEL
    [Documentation]    "To verify VOLTE-VOLTE(MT) SRVCC call is getting success for SIP URI when Request URI and To Header of the INVITE is sent with TEL URI from A-party."
    [Tags]    CRIT_P1_IMS_VoLTE_SRVCC
    Set Test Variable    ${CLIENT_SERVER_SCENARIO}    ${3}
    Set Test Variable    ${SEAGULL_EXECUTION}    ${1}
    Set Test Variable    ${SEAGULL_EXECUTION_TYPE}    ${2}
    Set Test Variable    ${SEAGULL_SCENARIO_NAME}    IMS_PCRF_SCENARIO_3RAR
    Set Test Variable    ${SEAGULL_CONFIG_NAME}    IMS_PCRF_AUTO_CONFIG_2
    Set Test Variable    ${SEAGULL_SESSION_ID}    819
    Set Test Variable    ${CLIENT_STATE_MACHINE}    AUTO_IMS_MT_OTHER_SRVCC_CLIENT_TEL_1
    Set Test Variable    ${SERVER_STATE_MACHINE}    AUTO_IMS_MT_OTHER_SRVCC_SERVER_TEL
    Set Test Variable    ${CLIENT_STATE_MACHINE_TWO}    AUTO_IMS_MT_OTHER_SRVCC_TEL_CLIENT_1
    ${TC_RESULT} =    START IMS AUTO
    log    ${TC_RESULT}

AUTO_IMS_MT_OTHER_SRVCC_INVITE_TEL_BPARTY_BYE
    [Documentation]    "To verify VOLTE-VOLTE(MT) SRVCC call is getting success for SIP URI when Request URI and To Header of the INVITE is sent with TEL URI from A-party."
    [Tags]    CRIT_P1_IMS_VoLTE_SRVCC
    Set Test Variable    ${CLIENT_SERVER_SCENARIO}    ${3}
    Set Test Variable    ${SEAGULL_EXECUTION}    ${1}
    Set Test Variable    ${SEAGULL_EXECUTION_TYPE}    ${2}
    Set Test Variable    ${SEAGULL_SCENARIO_NAME}    IMS_PCRF_SCENARIO_3RAR
    Set Test Variable    ${SEAGULL_CONFIG_NAME}    IMS_PCRF_AUTO_CONFIG_2
    Set Test Variable    ${SEAGULL_SESSION_ID}    820
    Set Test Variable    ${CLIENT_STATE_MACHINE}    AUTO_IMS_MT_OTHER_SRVCC_CLIENT_SIP_1_BPARTY_BYE
    Set Test Variable    ${SERVER_STATE_MACHINE}    AUTO_IMS_MT_OTHER_SRVCC_SERVER_SIP_BPARTY_BYE
    Set Test Variable    ${CLIENT_STATE_MACHINE_TWO}    AUTO_IMS_MT_OTHER_SRVCC_SIP_CLIENT_1_BPARTY_BYE
    ${TC_RESULT} =    START IMS AUTO
    log    ${TC_RESULT}

AUTO_IMS_MT_OTHER_SRVCC_INVITE_UNKNOWN_SESSIONMAP
    [Documentation]    "To verify SCSCF application is sending 404 Not Found to ICSCF application when SRVCC Invite request has been received with MSISDN which is not present in the map."
    [Tags]    CRIT_P1_IMS_VoLTE_SRVCC
    Set Test Variable    ${STATE_MACHINE}    AUTO_IMS_MT_OTHER_SRVCC_SIP_CLIENT_1_UNKNOWN_SESSION
    ${TC_RESULT} =    START IMS AUTO
    log    ${TC_RESULT}

AUTO_IMS_MT_OTHER_SRVCC_INVITE_UNKNOWN_STRSN
    [Documentation]    "To verify SCSCF application is sending 404 Not Found to ICSCF application when SRVCC Invite request has been received with Unknonw STRSN."
    [Tags]    CRIT_P1_IMS_VoLTE_SRVCC
    Set Test Variable    ${STATE_MACHINE}    AUTO_IMS_MT_OTHER_SRVCC_SIP_CLIENT_1_UNKNOWN_SESSION
    ${TC_RESULT} =    START IMS AUTO
    log    ${TC_RESULT}

AUTO_IMS_MO_OTHER_SRVCC_INVITE_SIP_2
    [Documentation]    "To verify VOLTE-VOLTE(MO) SRVCC call is getting success for SIP URI when INVITE Request URI is sent with SIP URI from A-party in Request URI and BYE is sent before the ACK received from 2G leg."
    [Tags]    CRIT_P1_IMS_VoLTE_SRVCC
    Set Test Variable    ${CLIENT_SERVER_SCENARIO}    ${3}
    Set Test Variable    ${SEAGULL_EXECUTION}    ${1}
    Set Test Variable    ${SEAGULL_EXECUTION_TYPE}    ${2}
    Set Test Variable    ${SEAGULL_SCENARIO_NAME}    IMS_PCRF_SCENARIO_3RAR
    Set Test Variable    ${SEAGULL_CONFIG_NAME}    IMS_PCRF_AUTO_CONFIG_2
    Set Test Variable    ${SEAGULL_SESSION_ID}    821
    Set Test Variable    ${CLIENT_STATE_MACHINE}    AUTO_IMS_MO_OTHER_SRVCC_CLIENT_SIP_2
    Set Test Variable    ${SERVER_STATE_MACHINE}    AUTO_IMS_MO_OTHER_SRVCC_SERVER_SIP_2
    Set Test Variable    ${CLIENT_STATE_MACHINE_TWO}    AUTO_IMS_MO_OTHER_SRVCC_SIP_CLIENT_2
    ${TC_RESULT} =    START IMS AUTO
    log    ${TC_RESULT}


*** Keywords ***
