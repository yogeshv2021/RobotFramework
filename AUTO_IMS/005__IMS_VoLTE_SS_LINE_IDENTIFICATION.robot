*** Settings ***
Documentation     IMS_VoLTE_SS_LINE_IDENTIFICATION_TEST_SUITE
Suite Setup       SUITE STARTUP
Suite teardown    CLOSE EXISTING CONNECTION
Test Teardown     TEST STOP
Force Tags        IMS_VoLTE_SS_LINE_IDENTIFICATION
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
Resource          /opt/product/AUTOMATION/TEST_AUTOMATION_FRAMEWORK/IMS_SOLARIS_IPV6_EXP_MSTACK/MODULES/AUTO_SIPP_EXT_MODULE.robot
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

AUTO_IMS_VoLTE_A_NUM_REG_12
    [Documentation]    "To verify IMS VoLTE Registration of Calling A party msisdn for the CLIR and CLIP case of anonymous call."
    [Tags]    CRIT_P1_IMS_VoLTE_CALL_REG
    Set Test Variable    ${STATE_MACHINE}    AUTO_IMS_REG_CALLING_12
    ${TC_RESULT} =    START IMS AUTO
    log    ${TC_RESULT}

AUTO_IMS_VoLTE_B_NUM_REG_12
    [Documentation]    "To verify IMS VoLTE Registration of Called B party msisdn for the CLIR and CLIP case of anonymous call."
    [Tags]    CRIT_P1_IMS_VoLTE_CALL_REG
    Set Test Variable    ${STATE_MACHINE}    AUTO_IMS_REG_CALLED_12
    ${TC_RESULT} =    START IMS AUTO
    log    ${TC_RESULT}


AUTO_IMS_VoLTE_CALL_117
    [Documentation]    "To verify whether TAS is removing PAI when CLIP is enabled but OVERRIDE FLAG is disabled and privacy ID header is sent as ID from UE."
    [Tags]    CRIT_P1_IMS_VoLTE_MTCALL
    Set Test Variable    ${CLIENT_SERVER_SCENARIO}    ${1}
    Set Test Variable    ${CLIENT_STATE_MACHINE}    AUTO_VoLTE_UAC_117
    Set Test Variable    ${SERVER_STATE_MACHINE}    AUTO_VoLTE_UAS_117
    ${TC_RESULT} =    START IMS AUTO
    log    ${TC_RESULT}

AUTO_IMS_VoLTE_CALL_118
    [Documentation]    "To verify whether TAS is removing PAI and privacy header of none when CLIP is enabled but OVERRIDE FLAG is disabled and privacy ID header is sent as none from UE."
    [Tags]    CRIT_P1_IMS_VoLTE_MTCALL
    Set Test Variable    ${CLIENT_SERVER_SCENARIO}    ${1}
    Set Test Variable    ${CLIENT_STATE_MACHINE}    AUTO_VoLTE_UAC_118
    Set Test Variable    ${SERVER_STATE_MACHINE}    AUTO_VoLTE_UAS_118
    ${TC_RESULT} =    START IMS AUTO
    log    ${TC_RESULT}

AUTO_IMS_VoLTE_CALL_119
    [Documentation]    "To verify whether TAS is removing PAI and sending privacy header as ID when CLIP is enabled but OVERRIDE FLAG is disabled and privacy ID header is sent as user from UE."
    [Tags]    CRIT_P1_IMS_VoLTE_MTCALL
    Set Test Variable    ${CLIENT_SERVER_SCENARIO}    ${1}
    Set Test Variable    ${CLIENT_STATE_MACHINE}    AUTO_VoLTE_UAC_119
    Set Test Variable    ${SERVER_STATE_MACHINE}    AUTO_VoLTE_UAS_119
    ${TC_RESULT} =    START IMS AUTO
    log    ${TC_RESULT}

AUTO_IMS_VoLTE_CALL_120
    [Documentation]    "To verify whether TAS is removing PAI and sending privacy header as ID when CLIP is enabled but OVERRIDE FLAG is disabled and privacy ID header is sent as header from UE."
    [Tags]    CRIT_P1_IMS_VoLTE_MTCALL
    Set Test Variable    ${CLIENT_SERVER_SCENARIO}    ${1}
    Set Test Variable    ${CLIENT_STATE_MACHINE}    AUTO_VoLTE_UAC_120
    Set Test Variable    ${SERVER_STATE_MACHINE}    AUTO_VoLTE_UAS_120
    ${TC_RESULT} =    START IMS AUTO
    log    ${TC_RESULT}

AUTO_IMS_VoLTE_CALL_121
    [Documentation]    "To verify whether TAS is removing PAI and sending privacy header as ID when CLIP is enabled but OVERRIDE FLAG is disabled and privacy ID header is sent as session from UE."
    [Tags]    CRIT_P1_IMS_VoLTE_MTCALL
    Set Test Variable    ${CLIENT_SERVER_SCENARIO}    ${1}
    Set Test Variable    ${CLIENT_STATE_MACHINE}    AUTO_VoLTE_UAC_121
    Set Test Variable    ${SERVER_STATE_MACHINE}    AUTO_VoLTE_UAS_121
    ${TC_RESULT} =    START IMS AUTO
    log    ${TC_RESULT}

AUTO_IMS_VoLTE_CALL_122
    [Documentation]    "To verify whether Anonymous call is rejected by MO TAS when CLIR is disabled."
    [Tags]    CRIT_P1_IMS_VoLTE_MTCALL
    Set Test Variable    ${STATE_MACHINE}    AUTO_VoLTE_UAC_122
    ${TC_RESULT} =    START IMS AUTO
    log    ${TC_RESULT}

AUTO_IMS_VoLTE_B_NUM_REG_13
    [Documentation]    "To verify IMS VoLTE Registration of Called B party msisdn for the CLIR and CLIP case of anonymous call."
    [Tags]    CRIT_P1_IMS_VoLTE_CALL_REG
    Set Test Variable    ${STATE_MACHINE}    AUTO_IMS_REG_CALLED_13
    ${TC_RESULT} =    START IMS AUTO
    log    ${TC_RESULT}

AUTO_IMS_VoLTE_CALL_123
    [Documentation]    "To verify whether TAS is removing PAI and sending privacy header as ID when CLIP is disabled and privacy header is sent as id from UE."
    [Tags]    CRIT_P1_IMS_VoLTE_MTCALL
    Set Test Variable    ${CLIENT_SERVER_SCENARIO}    ${1}
    Set Test Variable    ${CLIENT_STATE_MACHINE}    AUTO_VoLTE_UAC_123
    Set Test Variable    ${SERVER_STATE_MACHINE}    AUTO_VoLTE_UAS_123
    ${TC_RESULT} =    START IMS AUTO
    log    ${TC_RESULT}

AUTO_IMS_VoLTE_CALL_124
    [Documentation]    "To verify whether TAS is removing PAI and sending privacy header as ID when CLIP is disabled and privacy header is sent as user from UE."
    [Tags]    CRIT_P1_IMS_VoLTE_MTCALL
    Set Test Variable    ${CLIENT_SERVER_SCENARIO}    ${1}
    Set Test Variable    ${CLIENT_STATE_MACHINE}    AUTO_VoLTE_UAC_124
    Set Test Variable    ${SERVER_STATE_MACHINE}    AUTO_VoLTE_UAS_124
    ${TC_RESULT} =    START IMS AUTO
    log    ${TC_RESULT}

AUTO_IMS_VoLTE_CALL_125
    [Documentation]    "To verify whether TAS is removing PAI and sending privacy header as ID when CLIP is disabled and privacy header is sent as session from UE."
    [Tags]    CRIT_P1_IMS_VoLTE_MTCALL
    Set Test Variable    ${CLIENT_SERVER_SCENARIO}    ${1}
    Set Test Variable    ${CLIENT_STATE_MACHINE}    AUTO_VoLTE_UAC_125
    Set Test Variable    ${SERVER_STATE_MACHINE}    AUTO_VoLTE_UAS_125
    ${TC_RESULT} =    START IMS AUTO
    log    ${TC_RESULT}

AUTO_IMS_VoLTE_CALL_126
    [Documentation]    "To verify whether TAS is removing PAI and sending privacy header as ID when CLIP is disabled and privacy header is sent as none from UE."
    [Tags]    CRIT_P1_IMS_VoLTE_MTCALL
    Set Test Variable    ${CLIENT_SERVER_SCENARIO}    ${1}
    Set Test Variable    ${CLIENT_STATE_MACHINE}    AUTO_VoLTE_UAC_126
    Set Test Variable    ${SERVER_STATE_MACHINE}    AUTO_VoLTE_UAS_126
    ${TC_RESULT} =    START IMS AUTO
    log    ${TC_RESULT}

AUTO_IMS_VoLTE_B_NUM_REG_14
    [Documentation]    "To verify IMS VoLTE Registration of Called B party msisdn for the CLIR and CLIP case of anonymous call."
    [Tags]    CRIT_P1_IMS_VoLTE_CALL_REG
    Set Test Variable    ${STATE_MACHINE}    AUTO_IMS_REG_CALLED_14
    ${TC_RESULT} =    START IMS AUTO
    log    ${TC_RESULT}

AUTO_IMS_VoLTE_CALL_127
    [Documentation]    "To verify whether TAS is removing PAI and sending privacy header as ID when CLIP and Override is Enabled and privacy header is sent as id from UE."
    [Tags]    CRIT_P1_IMS_VoLTE_MTCALL
    Set Test Variable    ${CLIENT_SERVER_SCENARIO}    ${1}
    Set Test Variable    ${CLIENT_STATE_MACHINE}    AUTO_VoLTE_UAC_127
    Set Test Variable    ${SERVER_STATE_MACHINE}    AUTO_VoLTE_UAS_127
    ${TC_RESULT} =    START IMS AUTO
    log    ${TC_RESULT}

AUTO_IMS_VoLTE_CALL_128
    [Documentation]    "To verify whether TAS is removing PAI and sending privacy header as ID when CLIP and Override is Enabled and privacy header is sent as user from UE."
    [Tags]    CRIT_P1_IMS_VoLTE_MTCALL
    Set Test Variable    ${CLIENT_SERVER_SCENARIO}    ${1}
    Set Test Variable    ${CLIENT_STATE_MACHINE}    AUTO_VoLTE_UAC_128
    Set Test Variable    ${SERVER_STATE_MACHINE}    AUTO_VoLTE_UAS_128
    ${TC_RESULT} =    START IMS AUTO
    log    ${TC_RESULT}

AUTO_IMS_VoLTE_CALL_129
    [Documentation]    "To verify whether TAS is removing PAI and sending privacy header as ID when CLIP and Override is Enabled and privacy header is sent as session from UE."
    [Tags]    CRIT_P1_IMS_VoLTE_MTCALL
    Set Test Variable    ${CLIENT_SERVER_SCENARIO}    ${1}
    Set Test Variable    ${CLIENT_STATE_MACHINE}    AUTO_VoLTE_UAC_129
    Set Test Variable    ${SERVER_STATE_MACHINE}    AUTO_VoLTE_UAS_129
    ${TC_RESULT} =    START IMS AUTO
    log    ${TC_RESULT}

AUTO_IMS_VoLTE_CALL_130
    [Documentation]    "To verify whether TAS is removing PAI and sending privacy header as ID when CLIP and Override is Enabled and privacy header is sent as none from UE."
    [Tags]    CRIT_P1_IMS_VoLTE_MTCALL
    Set Test Variable    ${CLIENT_SERVER_SCENARIO}    ${1}
    Set Test Variable    ${CLIENT_STATE_MACHINE}    AUTO_VoLTE_UAC_130
    Set Test Variable    ${SERVER_STATE_MACHINE}    AUTO_VoLTE_UAS_130
    ${TC_RESULT} =    START IMS AUTO
    log    ${TC_RESULT}

AUTO_IMS_VoLTE_B_NUM_REG_15
    [Documentation]    "To verify IMS VoLTE Registration of Called B party msisdn for the CLIR and CLIP case of anonymous call."
    [Tags]    CRIT_P1_IMS_VoLTE_CALL_REG
    Set Test Variable    ${STATE_MACHINE}    AUTO_IMS_REG_CALLED_15
    ${TC_RESULT} =    START IMS AUTO
    log    ${TC_RESULT}


AUTO_IMS_VoLTE_CALL_131
    [Documentation]    "To verify basic ims VoLTE MT call scenario in which TAS is removing the PAI header and set privacy value is set as id when CLIP is enabled but OVERRIDE FLAG is disabled when privacy id set as id."
    [Tags]    CRIT_P1_IMS_VoLTE_MTCALL
    Set Test Variable    ${CLIENT_SERVER_SCENARIO}    ${1}
    Set Test Variable    ${CLIENT_STATE_MACHINE}    AUTO_VoLTE_UAC_131
    Set Test Variable    ${SERVER_STATE_MACHINE}    AUTO_VoLTE_UAS_131
    ${TC_RESULT} =    START IMS AUTO
    log    ${TC_RESULT}

AUTO_IMS_VoLTE_B_NUM_REG_16
    [Documentation]    "To verify IMS VoLTE Registration of Called B party msisdn for the CLIR and CLIP case of anonymous call."
    [Tags]    CRIT_P1_IMS_VoLTE_CALL_REG
    Set Test Variable    ${STATE_MACHINE}    AUTO_IMS_REG_CALLED_16
    ${TC_RESULT} =    START IMS AUTO
    log    ${TC_RESULT}


AUTO_IMS_VoLTE_CALL_132
    [Documentation]    "To verify basic ims VoLTE MT call scenario in which TAS is removing the PAI header and set privacy value is set as id when CLIP is disabled when privacy id set as id."
    [Tags]    CRIT_P1_IMS_VoLTE_MTCALL
    Set Test Variable    ${CLIENT_SERVER_SCENARIO}    ${1}
    Set Test Variable    ${CLIENT_STATE_MACHINE}    AUTO_VoLTE_UAC_132
    Set Test Variable    ${SERVER_STATE_MACHINE}    AUTO_VoLTE_UAS_132
    ${TC_RESULT} =    START IMS AUTO
    log    ${TC_RESULT}

AUTO_IMS_VoLTE_B_NUM_REG_17
    [Documentation]    "To verify IMS VoLTE Registration of Called B party msisdn for the CLIR and CLIP case of anonymous call."
    [Tags]    CRIT_P1_IMS_VoLTE_CALL_REG
    Set Test Variable    ${STATE_MACHINE}    AUTO_IMS_REG_CALLED_17
    ${TC_RESULT} =    START IMS AUTO
    log    ${TC_RESULT}

AUTO_IMS_VoLTE_CALL_133
    [Documentation]    "To verify basic ims VoLTE MT call scenario in which TAS is not removing the PAI header and set privacy value is set as id when CLIP and Override flag is enabled when privacy id set as id."
    [Tags]    CRIT_P1_IMS_VoLTE_MTCALL
    Set Test Variable    ${CLIENT_SERVER_SCENARIO}    ${1}
    Set Test Variable    ${CLIENT_STATE_MACHINE}    AUTO_VoLTE_UAC_133
    Set Test Variable    ${SERVER_STATE_MACHINE}    AUTO_VoLTE_UAS_133
    ${TC_RESULT} =    START IMS AUTO
    log    ${TC_RESULT}
