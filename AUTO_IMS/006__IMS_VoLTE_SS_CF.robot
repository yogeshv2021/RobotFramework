*** Settings ***
Documentation     IMS_VoLTE_SS_CF_TEST_SUITE
Suite Setup       SUITE STARTUP
Suite teardown    CLOSE EXISTING CONNECTION
Test Teardown     TEST STOP
Force Tags        IMS_VoLTE_SS_CF
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
AUTO_IMS_VoLTE_REG_SS_CALLING
    [Documentation]    "To verify IMS VoLTE Registration of SS call forwarding Call Calling party msisdn."
    [Tags]    CRIT_P1_IMS_VoLTE_SS_CF_REG
    Set Test Variable    ${STATE_MACHINE}    AUTO_IMS_REG_SS_CALLING
    ${TC_RESULT} =    START IMS AUTO
    log    ${TC_RESULT}

AUTO_IMS_VoLTE_REG_SS_CFU
    [Documentation]    "To verify IMS VoLTE Registration of SS CFU enabled msisdn."
    [Tags]    CRIT_P1_IMS_VoLTE_SS_CF_REG
    Set Test Variable    ${STATE_MACHINE}    AUTO_IMS_REG_SS_CFU
    ${TC_RESULT} =    START IMS AUTO
    log    ${TC_RESULT}

AUTO_IMS_VoLTE_REG_SS_CFNRC
    [Documentation]    "To verify IMS VoLTE Registration of SS CFNRC enabled msisdn."
    [Tags]    CRIT_P1_IMS_VoLTE_SS_CF_REG
    Set Test Variable    ${STATE_MACHINE}    AUTO_IMS_REG_SS_CFNRC
    ${TC_RESULT} =    START IMS AUTO
    log    ${TC_RESULT}

AUTO_IMS_VoLTE_REG_SS_CFNRY
    [Documentation]    "To verify IMS VoLTE Registration of SS CFNRY enabled msisdn."
    [Tags]    CRIT_P1_IMS_VoLTE_SS_CF_REG
    Set Test Variable    ${STATE_MACHINE}    AUTO_IMS_REG_SS_CFNRY
    ${TC_RESULT} =    START IMS AUTO
    log    ${TC_RESULT}

AUTO_IMS_VoLTE_REG_SS_CFB
    [Documentation]    "To verify IMS VoLTE Registration of SS CFB enabled msisdn."
    [Tags]    CRIT_P1_IMS_VoLTE_SS_CF_REG
    Set Test Variable    ${STATE_MACHINE}    AUTO_IMS_REG_SS_CFB
    ${TC_RESULT} =    START IMS AUTO
    log    ${TC_RESULT}

AUTO_IMS_VoLTE_SS_CFU_001
    [Documentation]    "To verify basic ims VoLTE SS CFU scenario with CFNRC_OVER_2G and APPLY_CF_CHARGING as 0 in Tas Configuration file."
    [Tags]    CRIT_P1_IMS_VoLTE_SS_CF_CFU
    Set Test Variable    ${CLIENT_SERVER_SCENARIO}    ${1}
    Set Test Variable    ${SEAGULL_EXECUTION}    ${1}
    Set Test Variable    ${SEAGULL_EXECUTION_TYPE}    ${2}
    Set Test Variable    ${SEAGULL_SCENARIO_NAME}    IMS_PCRF_SCENARIO
    Set Test Variable    ${SEAGULL_SESSION_ID}    301
    Set Test Variable    ${CLIENT_STATE_MACHINE}    AUTO_VoLTE_SS_CFU_UAC_001
    Set Test Variable    ${SERVER_STATE_MACHINE}    AUTO_VoLTE_SS_CFU_UAS_001
    ${TC_RESULT} =    START IMS AUTO
    log    ${TC_RESULT}

AUTO_IMS_VoLTE_SS_CFNRC_002
    [Documentation]    "To verify basic ims VoLTE SS CFNRC scenario with CFNRC_OVER_2G and APPLY_CF_CHARGING as 1 in Tas Configuration file."
    [Tags]    CRIT_P1_IMS_VoLTE_SS_CF_CFNRC
    Set Test Variable    ${CLIENT_SERVER_SCENARIO}    ${2}
    Set Test Variable    ${SEAGULL_EXECUTION}    ${1}
    Set Test Variable    ${SEAGULL_EXECUTION_TYPE}    ${2}
    Set Test Variable    ${SEAGULL_SCENARIO_NAME}    IMS_PCRF_SCENARIO
    Set Test Variable    ${SEAGULL_SESSION_ID}    302
    Set Test Variable    ${CLIENT_STATE_MACHINE}    AUTO_VoLTE_SS_CFNRC_UAC_A_002
    Set Test Variable    ${SERVER_STATE_MACHINE}    AUTO_VoLTE_SS_CFNRC_UAS_B_002
    Set Test Variable    ${SERVER_STATE_MACHINE_TWO}    AUTO_VoLTE_SS_CFNRC_UAS_C_002
    ${TC_RESULT} =    START IMS AUTO
    log    ${TC_RESULT}

AUTO_IMS_VoLTE_SS_CFNRY_003
    [Documentation]    "To verify basic ims VoLTE SS CFNRY scenario with CFNRC_OVER_2G and APPLY_CF_CHARGING as 1 in Tas Configuration file."
    [Tags]    CRIT_P1_IMS_VoLTE_SS_CF_CFNRY
    Set Test Variable    ${CLIENT_SERVER_SCENARIO}    ${2}
    Set Test Variable    ${SEAGULL_EXECUTION}    ${1}
    Set Test Variable    ${SEAGULL_EXECUTION_TYPE}    ${2}
    Set Test Variable    ${SEAGULL_SCENARIO_NAME}    IMS_PCRF_SCENARIO
    Set Test Variable    ${SEAGULL_CONFIG_NAME}    IMS_PCRF_AUTO_CONFIG_2
    Set Test Variable    ${SEAGULL_SESSION_ID}    303
    Set Test Variable    ${CLIENT_STATE_MACHINE}    AUTO_VoLTE_SS_CFNRY_UAC_A_003
    Set Test Variable    ${SERVER_STATE_MACHINE}    AUTO_VoLTE_SS_CFNRY_UAS_B_003
    Set Test Variable    ${SERVER_STATE_MACHINE_TWO}    AUTO_VoLTE_SS_CFNRY_UAS_C_003
    ${TC_RESULT} =    START IMS AUTO
    log    ${TC_RESULT}

AUTO_IMS_VoLTE_SS_CFB_004
    [Documentation]    "To verify basic ims VoLTE SS CB scenario with CFNRC_OVER_2G and APPLY_CF_CHARGING as 1 in Tas Configuration file."
    [Tags]    CRIT_P1_IMS_VoLTE_SS_CF_CFB
    Set Test Variable    ${CLIENT_SERVER_SCENARIO}    ${2}
    Set Test Variable    ${SEAGULL_EXECUTION}    ${1}
    Set Test Variable    ${SEAGULL_EXECUTION_TYPE}    ${2}
    Set Test Variable    ${SEAGULL_SCENARIO_NAME}    IMS_PCRF_SCENARIO
    Set Test Variable    ${SEAGULL_CONFIG_NAME}    IMS_PCRF_AUTO_CONFIG_2
    Set Test Variable    ${SEAGULL_SESSION_ID}    304
    Set Test Variable    ${CLIENT_STATE_MACHINE}    AUTO_VoLTE_SS_CFB_UAC_A_004
    Set Test Variable    ${SERVER_STATE_MACHINE}    AUTO_VoLTE_SS_CFB_UAS_B_004
    Set Test Variable    ${SERVER_STATE_MACHINE_TWO}    AUTO_VoLTE_SS_CFB_UAS_C_004
    ${TC_RESULT} =    START IMS AUTO
    log    ${TC_RESULT}

*** Keywords ***
