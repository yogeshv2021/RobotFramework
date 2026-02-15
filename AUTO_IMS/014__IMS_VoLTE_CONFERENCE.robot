*** Settings ***
Documentation     IMS_VoLTE_CONF_TEST_SUITE
Suite Setup       SUITE STARTUP
Suite teardown    CLOSE EXISTING CONNECTION
Test Teardown     TEST STOP
Force Tags        IMS_VoLTE_CONF_TEST_SUITE
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
AUTO_IMS_VoLTE_CONF_A_NUM_REG
    [Documentation]    "To verify IMS VoLTE Registration of Calling A party msisdn."
    [Tags]    CRIT_P1_IMS_VoLTE_CONF_CALL_REG
    Set Test Variable    ${STATE_MACHINE}    AUTO_IMS_VoLTE_CONF_A_NUM_REG
    ${TC_RESULT} =    START IMS AUTO
    log    ${TC_RESULT}

AUTO_IMS_VoLTE_CONF_B_NUM_REG
    [Documentation]    "To verify IMS VoLTE Registration of Called B party msisdn."
    [Tags]    CRIT_P1_IMS_VoLTE_CONF_CALL_REG
    Set Test Variable    ${STATE_MACHINE}    AUTO_IMS_VoLTE_CONF_B_NUM_REG
    ${TC_RESULT} =    START IMS AUTO
    log    ${TC_RESULT}

AUTO_IMS_VoLTE_CONF_C_NUM_REG
    [Documentation]    "To verify IMS VoLTE Registration of Called C party msisdn."
    [Tags]    CRIT_P1_IMS_VoLTE_CONF_CALL_REG
    Set Test Variable    ${STATE_MACHINE}    AUTO_IMS_VoLTE_CONF_C_NUM_REG
    ${TC_RESULT} =    START IMS AUTO
    log    ${TC_RESULT}

AUTO_IMS_VoLTE_CONF_D_NUM_REG
    [Documentation]    "To verify IMS VoLTE Registration of Called D party msisdn."
    [Tags]    CRIT_P1_IMS_VoLTE_CONF_CALL_REG
    Set Test Variable    ${STATE_MACHINE}    AUTO_IMS_VoLTE_CONF_D_NUM_REG
    ${TC_RESULT} =    START IMS AUTO
    log    ${TC_RESULT}

AUTO_IMS_VoLTE_CONF_A_PARTY
    [Documentation]    "To verify basic ims VoLTE 3 party conference scenario."
    [Tags]    CRIT_P1_IMS_VoLTE_SS_CF_CFNRC
    Set Test Variable    ${CLIENT_SERVER_SCENARIO}    ${2}
    Set Test Variable    ${SEAGULL_EXECUTION}    ${1}
    Set Test Variable    ${SEAGULL_EXECUTION_TYPE}    ${2}
    Set Test Variable    ${SEAGULL_SCENARIO_NAME}    IMS_PCRF_SCENARIO_CONF
    Set Test Variable    ${SEAGULL_CONFIG_NAME}    IMS_PCRF_AUTO_CONFIG_3
    Set Test Variable    ${SEAGULL_SESSION_ID}    903
    Set Test Variable    ${CLIENT_STATE_MACHINE}    AUTO_IMS_CONF_CLIENT_A_B_001
    Set Test Variable    ${SERVER_STATE_MACHINE}    AUTO_IMS_CONF_SERVER_A_B_001
    Set Test Variable    ${SERVER_STATE_MACHINE_TWO}    AUTO_IMS_CONF_SERVER_A_C_001
    ${TC_RESULT} =    START IMS AUTO
    log    ${TC_RESULT}

AUTO_IMS_VoLTE_CONF_A_PARTY_BYE_BPARTY
    [Documentation]    "To verify basic ims VoLTE 3 party conference scenario in which Bye is received from B-party and C-party without the Contact header."
    [Tags]    CRIT_P1_IMS_VoLTE_SS_CF_CFNRC
    Set Test Variable    ${CLIENT_SERVER_SCENARIO}    ${2}
    Set Test Variable    ${SEAGULL_EXECUTION}    ${1}
    Set Test Variable    ${SEAGULL_EXECUTION_TYPE}    ${2}
    Set Test Variable    ${SEAGULL_SCENARIO_NAME}    IMS_PCRF_SCENARIO_CONF
    Set Test Variable    ${SEAGULL_CONFIG_NAME}    IMS_PCRF_AUTO_CONFIG_3
    Set Test Variable    ${SEAGULL_SESSION_ID}    906
    Set Test Variable    ${CLIENT_STATE_MACHINE}    AUTO_IMS_CONF_CLIENT_A_B_002
    Set Test Variable    ${SERVER_STATE_MACHINE}    AUTO_IMS_CONF_SERVER_A_B_002
    Set Test Variable    ${SERVER_STATE_MACHINE_TWO}    AUTO_IMS_CONF_SERVER_A_C_002
    ${TC_RESULT} =    START IMS AUTO
    log    ${TC_RESULT}


AUTO_IMS_VoLTE_CONF_A_PARTY_MULTIPLE_REFER
    [Documentation]    "To verify basic ims VoLTE 3 party conference scenario with multiple REFER is received once after the other without sending the 200 OK of the Notify request."
    [Tags]    CRIT_P1_IMS_VoLTE_SS_CF_CFNRC
    Set Test Variable    ${CLIENT_SERVER_SCENARIO}    ${2}
    Set Test Variable    ${SEAGULL_EXECUTION}    ${1}
    Set Test Variable    ${SEAGULL_EXECUTION_TYPE}    ${2}
    Set Test Variable    ${SEAGULL_SCENARIO_NAME}    IMS_PCRF_SCENARIO_CONF
    Set Test Variable    ${SEAGULL_CONFIG_NAME}    IMS_PCRF_AUTO_CONFIG_3
    Set Test Variable    ${SEAGULL_SESSION_ID}    904
    Set Test Variable    ${CLIENT_STATE_MACHINE}    AUTO_IMS_CONF_CLIENT_A_B_001_MULTIPLE_REFER
    Set Test Variable    ${SERVER_STATE_MACHINE}    AUTO_IMS_CONF_SERVER_A_B_001_MULTIPLE_REFER
    Set Test Variable    ${SERVER_STATE_MACHINE_TWO}    AUTO_IMS_CONF_SERVER_A_C_001_MULTIPLE_REFER
    ${TC_RESULT} =    START IMS AUTO
    log    ${TC_RESULT}

AUTO_IMS_VoLTE_CONF_A_PARTY_MULTIPLE_REFER_TEL
    [Documentation]    "To verify basic ims VoLTE 3 party conference scenario with A-party Terminating the B-party by Refer-Bye method and terminating the C-party call with Bye Conference URI."
    [Tags]    CRIT_P1_IMS_VoLTE_SS_CF_CFNRC
    Set Test Variable    ${CLIENT_SERVER_SCENARIO}    ${2}
    Set Test Variable    ${SEAGULL_EXECUTION}    ${1}
    Set Test Variable    ${SEAGULL_EXECUTION_TYPE}    ${2}
    Set Test Variable    ${SEAGULL_SCENARIO_NAME}    IMS_PCRF_SCENARIO_CONF
    Set Test Variable    ${SEAGULL_CONFIG_NAME}    IMS_PCRF_AUTO_CONFIG_3
    Set Test Variable    ${SEAGULL_SESSION_ID}    904
    Set Test Variable    ${CLIENT_STATE_MACHINE}    AUTO_IMS_CONF_CLIENT_A_B_001_MULTIPLE_REFER_TEL
    Set Test Variable    ${SERVER_STATE_MACHINE}    AUTO_IMS_CONF_SERVER_A_B_001_MULTIPLE_REFER_TEL
    Set Test Variable    ${SERVER_STATE_MACHINE_TWO}    AUTO_IMS_CONF_SERVER_A_C_001_MULTIPLE_REFER_TEL
    ${TC_RESULT} =    START IMS AUTO
    log    ${TC_RESULT}



AUTO_IMS_VoLTE_CONF_MT_A_PARTY
    [Documentation]    "To verify basic ims VoLTE 3 party conference scenario."
    [Tags]    CRIT_P1_IMS_VoLTE_SS_CF_CFNRC
    Set Test Variable    ${CLIENT_SERVER_SCENARIO}    ${2}
    Set Test Variable    ${SEAGULL_EXECUTION}    ${1}
    Set Test Variable    ${SEAGULL_EXECUTION_TYPE}    ${2}
    Set Test Variable    ${SEAGULL_SCENARIO_NAME}    IMS_PCRF_SCENARIO_CONF
    Set Test Variable    ${SEAGULL_CONFIG_NAME}    IMS_PCRF_AUTO_CONFIG_3
    Set Test Variable    ${SEAGULL_SESSION_ID}    905
    Set Test Variable    ${CLIENT_STATE_MACHINE}    AUTO_IMS_CONF_CLIENT_MT_A_B_001
    Set Test Variable    ${SERVER_STATE_MACHINE}    AUTO_IMS_CONF_SERVER_MT_A_B_001
    Set Test Variable    ${SERVER_STATE_MACHINE_TWO}    AUTO_IMS_CONF_SERVER_MT_A_C_001
    ${TC_RESULT} =    START IMS AUTO
    log    ${TC_RESULT}

*** Keywords ***
