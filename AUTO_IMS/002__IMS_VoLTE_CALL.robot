*** Settings ***
Documentation     IMS_VoLTE_CALL_TEST_SUITE
Suite Setup       SUITE STARTUP
Suite teardown    CLOSE EXISTING CONNECTION
Test Teardown     TEST STOP
Force Tags        IMS_VoLTE_CALL
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
AUTO_IMS_VoLTE_A_NUM_REG
    [Documentation]    "To verify IMS VoLTE Registration of Calling A party msisdn."
    ...    "MSISDN-397458400001 and IMSI-264285300000001"
    [Tags]    CRIT_P1_IMS_VoLTE_CALL_REG
    Set Test Variable    ${STATE_MACHINE}    AUTO_IMS_REG_CALLING
    ${TC_RESULT} =    START IMS AUTO
    log    ${TC_RESULT}

AUTO_IMS_VoLTE_B_NUM_REG
    [Documentation]    "To verify IMS VoLTE Registration of Called B party msisdn."
    ...    "MSISDN-397458400002 and IMSI-264285300000002"
    [Tags]    CRIT_P1_IMS_VoLTE_CALL_REG
    Set Test Variable    ${STATE_MACHINE}    AUTO_IMS_REG_CALLED
    ${TC_RESULT} =    START IMS AUTO
    log    ${TC_RESULT}

AUTO_IMS_VoLTE_CALL_001
    [Documentation]    "To verify basic ims VoLTE MO call scenario."
    ...    "AMSISDN-397458400001,BMSISDN-399898345678 and A-IMSI-264285300000001"
    [Tags]    CRIT_P1_IMS_VoLTE_MOCALL
    Set Test Variable    ${CLIENT_SERVER_SCENARIO}    ${1}
    Set Test Variable    ${SEAGULL_EXECUTION}    ${1}
    Set Test Variable    ${SEAGULL_EXECUTION_TYPE}    ${2}
    Set Test Variable    ${SEAGULL_SCENARIO_NAME}    IMS_PCRF_SCENARIO
    Set Test Variable    ${SEAGULL_SESSION_ID}    201
    Set Test Variable    ${CLIENT_STATE_MACHINE}    AUTO_VoLTE_UAC_001
    Set Test Variable    ${SERVER_STATE_MACHINE}    AUTO_VoLTE_UAS_001
    ${TC_RESULT} =    START IMS AUTO
    log    ${TC_RESULT}

AUTO_IMS_VoLTE_CALL_002
    [Documentation]    "To verify basic ims VoLTE MT call scenario."
    ...    "AMSISDN-399898345678,BMSISDN-397458400002 and B-IMSI-264285300000001"
    [Tags]    CRIT_P1_IMS_VoLTE_MTCALL
    Set Test Variable    ${CLIENT_SERVER_SCENARIO}    ${1}
    Set Test Variable    ${SEAGULL_EXECUTION}    ${1}
    Set Test Variable    ${SEAGULL_EXECUTION_TYPE}    ${2}
    Set Test Variable    ${SEAGULL_SCENARIO_NAME}    IMS_PCRF_SCENARIO
    Set Test Variable    ${SEAGULL_SESSION_ID}    202
    Set Test Variable    ${CLIENT_STATE_MACHINE}    AUTO_VoLTE_UAC_002
    Set Test Variable    ${SERVER_STATE_MACHINE}    AUTO_VoLTE_UAS_002
    ${TC_RESULT} =    START IMS AUTO
    log    ${TC_RESULT}

AUTO_IMS_VoLTE_CALL_003
    [Documentation]    "To verify basic ims VoLTE A subscriber calling to VoLTE B subscriber."
    ...    "AMSISDN-397458400001,BMSISDN-397458400002 and A-IMSI-264285300000001,B-IMSI-264285300000002"
    [Tags]    CRIT_P1_IMS_VoLTE_MTCALL
    Set Test Variable    ${CLIENT_SERVER_SCENARIO}    ${1}
    Set Test Variable    ${SEAGULL_EXECUTION}    ${1}
    Set Test Variable    ${SEAGULL_EXECUTION_TYPE}    ${2}
    Set Test Variable    ${SEAGULL_SCENARIO_NAME}    IMS_PCRF_SCENARIO
    Set Test Variable    ${SEAGULL_CONFIG_NAME}    IMS_PCRF_AUTO_CONFIG_2
    Set Test Variable    ${SEAGULL_SESSION_ID}    203
    Set Test Variable    ${CLIENT_STATE_MACHINE}    AUTO_VoLTE_UAC_003
    Set Test Variable    ${SERVER_STATE_MACHINE}    AUTO_VoLTE_UAS_003
    ${TC_RESULT} =    START IMS AUTO
    log    ${TC_RESULT}

AUTO_IMS_VoLTE_CALL_015
    [Documentation]    "To verify whether MO call is successful when Invite is received with the Request URI as SIP and A party as Tel from UE-A."
    ...    "AMSISDN-397458400001,BMSISDN-399898345678 and A-IMSI-264285300000001"
    [Tags]    CRIT_P1_IMS_VoLTE_MTCALL
    Set Test Variable    ${CLIENT_SERVER_SCENARIO}    ${1}
    Set Test Variable    ${SEAGULL_EXECUTION}    ${1}
    Set Test Variable    ${SEAGULL_EXECUTION_TYPE}    ${2}
    Set Test Variable    ${SEAGULL_SCENARIO_NAME}    IMS_PCRF_SCENARIO
    Set Test Variable    ${SEAGULL_CONFIG_NAME}    IMS_PCRF_AUTO_CONFIG_2
    Set Test Variable    ${SEAGULL_SESSION_ID}    204
    Set Test Variable    ${CLIENT_STATE_MACHINE}    AUTO_VoLTE_UAC_015
    Set Test Variable    ${SERVER_STATE_MACHINE}    AUTO_VoLTE_UAS_015
    ${TC_RESULT} =    START IMS AUTO
    log    ${TC_RESULT}

AUTO_IMS_VoLTE_CALL_016
    [Documentation]    "To verify basic ims VoLTE MT call scenario is successful when Invite is received with the Request URI as SIP and A party as Tel from UE-A."
    ...    "AMSISDN-399898345678,BMSISDN-397458400002 and A-IMSI-264285300000002"
    [Tags]    CRIT_P1_IMS_VoLTE_MTCALL
    Set Test Variable    ${CLIENT_SERVER_SCENARIO}    ${1}
    Set Test Variable    ${SEAGULL_EXECUTION}    ${1}
    Set Test Variable    ${SEAGULL_EXECUTION_TYPE}    ${2}
    Set Test Variable    ${SEAGULL_SCENARIO_NAME}    IMS_PCRF_SCENARIO
    Set Test Variable    ${SEAGULL_SESSION_ID}    205
    Set Test Variable    ${CLIENT_STATE_MACHINE}    AUTO_VoLTE_UAC_016
    Set Test Variable    ${SERVER_STATE_MACHINE}    AUTO_VoLTE_UAS_016
    ${TC_RESULT} =    START IMS AUTO
    log    ${TC_RESULT}

AUTO_IMS_VoLTE_CALL_017
    [Documentation]    "To verify basic ims VoLTE A subscriber calling to VoLTE B subscriber is successful when Invite is received with the Request URI as SIP and A party as Tel from UE-A."
    ...    "AMSISDN-397458400001,BMSISDN-397458400002 and A-IMSI-264285300000001,B-IMSI-264285300000002"
    [Tags]    CRIT_P1_IMS_VoLTE_MTCALL
    Set Test Variable    ${CLIENT_SERVER_SCENARIO}    ${1}
    Set Test Variable    ${SEAGULL_EXECUTION}    ${1}
    Set Test Variable    ${SEAGULL_EXECUTION_TYPE}    ${2}
    Set Test Variable    ${SEAGULL_SCENARIO_NAME}    IMS_PCRF_SCENARIO
    Set Test Variable    ${SEAGULL_CONFIG_NAME}    IMS_PCRF_AUTO_CONFIG_2
    Set Test Variable    ${SEAGULL_SESSION_ID}    206
    Set Test Variable    ${CLIENT_STATE_MACHINE}    AUTO_VoLTE_UAC_017
    Set Test Variable    ${SERVER_STATE_MACHINE}    AUTO_VoLTE_UAS_017
    ${TC_RESULT} =    START IMS AUTO
    log    ${TC_RESULT}


AUTO_IMS_VoLTE_CALL_007
    [Documentation]    "To verify basic ims VoLTE MO call scenario to national number with zero dialling."
    ...    "AMSISDN-397458400001 and A-IMSI-264285300000001"
    [Tags]    CRIT_P1_IMS_VoLTE_MOCALL
    Set Test Variable    ${CLIENT_SERVER_SCENARIO}    ${1}
    Set Test Variable    ${SEAGULL_EXECUTION}    ${1}
    Set Test Variable    ${SEAGULL_EXECUTION_TYPE}    ${2}
    Set Test Variable    ${SEAGULL_SCENARIO_NAME}    IMS_PCRF_SCENARIO
    Set Test Variable    ${SEAGULL_SESSION_ID}    207
    Set Test Variable    ${CLIENT_STATE_MACHINE}    AUTO_VoLTE_UAC_004
    Set Test Variable    ${SERVER_STATE_MACHINE}    AUTO_VoLTE_UAS_DEFAULT_001
    ${TC_RESULT} =    START IMS AUTO
    log    ${TC_RESULT}

AUTO_IMS_VoLTE_CALL_008
    [Documentation]    "To verify basic ims VoLTE MO call scenario to international number with double zero dialling."
    ...    "AMSISDN-397458400001,BMSISDN-00919697989900 and A-IMSI-264285300000001"
    [Tags]    CRIT_P1_IMS_VoLTE_MOCALL
    Set Test Variable    ${CLIENT_SERVER_SCENARIO}    ${1}
    Set Test Variable    ${SEAGULL_EXECUTION}    ${1}
    Set Test Variable    ${SEAGULL_EXECUTION_TYPE}    ${2}
    Set Test Variable    ${SEAGULL_SCENARIO_NAME}    IMS_PCRF_SCENARIO
    Set Test Variable    ${SEAGULL_SESSION_ID}    208
    Set Test Variable    ${CLIENT_STATE_MACHINE}    AUTO_VoLTE_UAC_005
    Set Test Variable    ${SERVER_STATE_MACHINE}    AUTO_VoLTE_UAS_DEFAULT_001
    ${TC_RESULT} =    START IMS AUTO
    log    ${TC_RESULT}

AUTO_IMS_VoLTE_CALL_009
    [Documentation]    "To verify basic ims VoLTE MO call scenario to ivr number."
    ...    "AMSISDN-397458400001,BMSISDN-1233 and A-IMSI-264285300000001"
    [Tags]    CRIT_P1_IMS_VoLTE_MOCALL
    Set Test Variable    ${CLIENT_SERVER_SCENARIO}    ${1}
    Set Test Variable    ${SEAGULL_EXECUTION}    ${1}
    Set Test Variable    ${SEAGULL_EXECUTION_TYPE}    ${2}
    Set Test Variable    ${SEAGULL_SCENARIO_NAME}    IMS_PCRF_SCENARIO
    Set Test Variable    ${SEAGULL_SESSION_ID}    209
    Set Test Variable    ${CLIENT_STATE_MACHINE}    AUTO_VoLTE_UAC_006
    Set Test Variable    ${SERVER_STATE_MACHINE}    AUTO_VoLTE_UAS_004
    ${TC_RESULT} =    START IMS AUTO
    log    ${TC_RESULT}

AUTO_IMS_VoLTE_CALL_010
    [Documentation]    "To verify basic ims VoLTE MO call scenario to vms retrivel number."
    ...    "AMSISDN-397458400001,BMSISDN-1236 and A-IMSI-264285300000001"
    [Tags]    CRIT_P1_IMS_VoLTE_MOCALL
    Set Test Variable    ${CLIENT_SERVER_SCENARIO}    ${1}
    Set Test Variable    ${SEAGULL_EXECUTION}    ${1}
    Set Test Variable    ${SEAGULL_EXECUTION_TYPE}    ${2}
    Set Test Variable    ${SEAGULL_SCENARIO_NAME}    IMS_PCRF_SCENARIO
    Set Test Variable    ${SEAGULL_SESSION_ID}    210
    Set Test Variable    ${CLIENT_STATE_MACHINE}    AUTO_VoLTE_UAC_007
    Set Test Variable    ${SERVER_STATE_MACHINE}    AUTO_VoLTE_UAS_004
    ${TC_RESULT} =    START IMS AUTO
    log    ${TC_RESULT}

AUTO_IMS_VoLTE_CALL_011
    [Documentation]    "To verify basic ims VoLTE MO call scenario to Special number."
    ...    "AMSISDN-397458400001,BMSISDN-1234 and A-IMSI-264285300000001"
    [Tags]    CRIT_P1_IMS_VoLTE_MOCALL
    Set Test Variable    ${CLIENT_SERVER_SCENARIO}    ${1}
    Set Test Variable    ${SEAGULL_EXECUTION}    ${1}
    Set Test Variable    ${SEAGULL_EXECUTION_TYPE}    ${2}
    Set Test Variable    ${SEAGULL_SCENARIO_NAME}    IMS_PCRF_SCENARIO
    Set Test Variable    ${SEAGULL_SESSION_ID}    211
    Set Test Variable    ${CLIENT_STATE_MACHINE}    AUTO_VoLTE_UAC_008
    Set Test Variable    ${SERVER_STATE_MACHINE}    AUTO_VoLTE_UAS_DEFAULT_001
    ${TC_RESULT} =    START IMS AUTO
    log    ${TC_RESULT}

AUTO_IMS_VoLTE_CALL_012
    [Documentation]    "To verify basic ims VoLTE MO call scenario to Plus(+)national number."
    ...    "AMSISDN-397458400001,BMSISDN-399697989901 and A-IMSI-264285300000001"
    [Tags]    CRIT_P1_IMS_VoLTE_MOCALL
    Set Test Variable    ${CLIENT_SERVER_SCENARIO}    ${1}
    Set Test Variable    ${SEAGULL_EXECUTION}    ${1}
    Set Test Variable    ${SEAGULL_EXECUTION_TYPE}    ${2}
    Set Test Variable    ${SEAGULL_SCENARIO_NAME}    IMS_PCRF_SCENARIO
    Set Test Variable    ${SEAGULL_SESSION_ID}    212
    Set Test Variable    ${CLIENT_STATE_MACHINE}    AUTO_VoLTE_UAC_009
    Set Test Variable    ${SERVER_STATE_MACHINE}    AUTO_VoLTE_UAS_DEFAULT_001
    ${TC_RESULT} =    START IMS AUTO
    log    ${TC_RESULT}

AUTO_IMS_VoLTE_CALL_013
    [Documentation]    "To verify basic ims VoLTE MO call scenario to Plus(+)international number."
    ...    "AMSISDN-397458400001,BMSISDN-919697989900 and A-IMSI-264285300000001"
    [Tags]    CRIT_P1_IMS_VoLTE_MOCALL
    Set Test Variable    ${CLIENT_SERVER_SCENARIO}    ${1}
    Set Test Variable    ${SEAGULL_EXECUTION}    ${1}
    Set Test Variable    ${SEAGULL_EXECUTION_TYPE}    ${2}
    Set Test Variable    ${SEAGULL_SCENARIO_NAME}    IMS_PCRF_SCENARIO
    Set Test Variable    ${SEAGULL_SESSION_ID}    213
    Set Test Variable    ${CLIENT_STATE_MACHINE}    AUTO_VoLTE_UAC_010
    Set Test Variable    ${SERVER_STATE_MACHINE}    AUTO_VoLTE_UAS_DEFAULT_001
    ${TC_RESULT} =    START IMS AUTO
    log    ${TC_RESULT}

AUTO_IMS_VoLTE_CALL_014
    [Documentation]    "To verify basic ims VoLTE MO call cancel scenario."
    ...    "AMSISDN-397458400001,BMSISDN-399898345678 and A-IMSI-264285300000001"
    [Tags]    CRIT_P1_IMS_VoLTE_MOCALL
    Set Test Variable    ${CLIENT_SERVER_SCENARIO}    ${1}
    Set Test Variable    ${SEAGULL_EXECUTION}    ${1}
    Set Test Variable    ${SEAGULL_EXECUTION_TYPE}    ${2}
    Set Test Variable    ${SEAGULL_SCENARIO_NAME}    IMS_PCRF_SCENARIO
    Set Test Variable    ${SEAGULL_SESSION_ID}    214
    Set Test Variable    ${CLIENT_STATE_MACHINE}    AUTO_VoLTE_UAC_011
    Set Test Variable    ${SERVER_STATE_MACHINE}    AUTO_VoLTE_UAS_005
    ${TC_RESULT} =    START IMS AUTO
    log    ${TC_RESULT}

AUTO_IMS_VoLTE_A_NUM_REG_1
    [Documentation]    "To verify IMS VoLTE Registration of Calling A party msisdn."
    ...    "AMSISDN-397458400001,A-IMSI-264285300000001"
    [Tags]    CRIT_P1_IMS_VoLTE_CALL_REG
    Set Test Variable    ${STATE_MACHINE}    AUTO_IMS_REG_CALLING
    ${TC_RESULT} =    START IMS AUTO
    log    ${TC_RESULT}

AUTO_IMS_VoLTE_B_NUM_REG_1
    [Documentation]    "To verify IMS VoLTE Registration of Called B party msisdn."
    ...    "BMSISDN-397458400002,B-IMSI-264285300000002"
    [Tags]    CRIT_P1_IMS_VoLTE_CALL_REG
    Set Test Variable    ${STATE_MACHINE}    AUTO_IMS_REG_CALLED
    ${TC_RESULT} =    START IMS AUTO
    log    ${TC_RESULT}


AUTO_IMS_VoLTE_CALL_004
    [Documentation]    "To verify basic ims VoLTE MO call scenario without pcrf session."
    ...    "AMSISDN-397458400001,B-MSISDN-399898345678"
    [Tags]    CRIT_P1_IMS_VoLTE_MOCALL
    Set Test Variable    ${CLIENT_SERVER_SCENARIO}    ${1}
    Set Test Variable    ${CLIENT_STATE_MACHINE}    AUTO_VoLTE_UAC_001
    Set Test Variable    ${SERVER_STATE_MACHINE}    AUTO_VoLTE_UAS_001
    ${TC_RESULT} =    START IMS AUTO
    log    ${TC_RESULT}

AUTO_IMS_VoLTE_CALL_005
    [Documentation]    "To verify basic ims VoLTE MT call scenario without pcrf session."
    ...    "AMSISDN-399898345678,B-MSISDN-397458400001"
    [Tags]    CRIT_P1_IMS_VoLTE_MTCALL
    Set Test Variable    ${CLIENT_SERVER_SCENARIO}    ${1}
    Set Test Variable    ${CLIENT_STATE_MACHINE}    AUTO_VoLTE_UAC_002
    Set Test Variable    ${SERVER_STATE_MACHINE}    AUTO_VoLTE_UAS_002
    ${TC_RESULT} =    START IMS AUTO
    log    ${TC_RESULT}

AUTO_IMS_VoLTE_CALL_006
    [Documentation]    "To verify basic ims VoLTE A subscriber calling to VoLTE B subscriber without pcrf session."
    ...    "AMSISDN-397458400001,B-MSISDN-397458400002"
    [Tags]    CRIT_P1_IMS_VoLTE_MTCALL
    Set Test Variable    ${CLIENT_SERVER_SCENARIO}    ${1}
    Set Test Variable    ${CLIENT_STATE_MACHINE}    AUTO_VoLTE_UAC_003
    Set Test Variable    ${SERVER_STATE_MACHINE}    AUTO_VoLTE_UAS_003
    ${TC_RESULT} =    START IMS AUTO
    log    ${TC_RESULT}

AUTO_IMS_VoLTE_CALL_018
    [Documentation]    "To verify basic ims VoLTE MO call scenario with BYE is received from B-Party."
    ...    "AMSISDN-397458400001,B-MSISDN-399898345678"
    [Tags]    CRIT_P1_IMS_VoLTE_MOCALL
    Set Test Variable    ${CLIENT_SERVER_SCENARIO}    ${1}
    Set Test Variable    ${SEAGULL_EXECUTION}    ${1}
    Set Test Variable    ${SEAGULL_EXECUTION_TYPE}    ${2}
    Set Test Variable    ${SEAGULL_SCENARIO_NAME}    IMS_PCRF_SCENARIO
    Set Test Variable    ${SEAGULL_SESSION_ID}    215
    Set Test Variable    ${CLIENT_STATE_MACHINE}    AUTO_VoLTE_UAC_018
    Set Test Variable    ${SERVER_STATE_MACHINE}    AUTO_VoLTE_UAS_018
    ${TC_RESULT} =    START IMS AUTO
    log    ${TC_RESULT}

AUTO_IMS_VoLTE_CALL_019
    [Documentation]    "To verify basic ims VoLTE MT call scenario with Bye is received from B-party."
    ...    "AMSISDN-399898345678,BMSISDN-397458400001"
    [Tags]    CRIT_P1_IMS_VoLTE_MTCALL
    Set Test Variable    ${CLIENT_SERVER_SCENARIO}    ${1}
    Set Test Variable    ${SEAGULL_EXECUTION}    ${1}
    Set Test Variable    ${SEAGULL_EXECUTION_TYPE}    ${2}
    Set Test Variable    ${SEAGULL_SCENARIO_NAME}    IMS_PCRF_SCENARIO
    Set Test Variable    ${SEAGULL_SESSION_ID}    216
    Set Test Variable    ${CLIENT_STATE_MACHINE}    AUTO_VoLTE_UAC_019
    Set Test Variable    ${SERVER_STATE_MACHINE}    AUTO_VoLTE_UAS_019
    ${TC_RESULT} =    START IMS AUTO
    log    ${TC_RESULT}

AUTO_IMS_VoLTE_CALL_020
    [Documentation]    "To verify basic ims VoLTE A subscriber calling to VoLTE B subscriber with Bye is received from B-party."
    ...    "AMSISDN-397458400001,BMSISDN-397458400002"
    [Tags]    CRIT_P1_IMS_VoLTE_MTCALL
    Set Test Variable    ${CLIENT_SERVER_SCENARIO}    ${1}
    Set Test Variable    ${SEAGULL_EXECUTION}    ${1}
    Set Test Variable    ${SEAGULL_EXECUTION_TYPE}    ${2}
    Set Test Variable    ${SEAGULL_SCENARIO_NAME}    IMS_PCRF_SCENARIO
    Set Test Variable    ${SEAGULL_CONFIG_NAME}    IMS_PCRF_AUTO_CONFIG_2
    Set Test Variable    ${SEAGULL_SESSION_ID}    218
    Set Test Variable    ${CLIENT_STATE_MACHINE}    AUTO_VoLTE_UAC_020
    Set Test Variable    ${SERVER_STATE_MACHINE}    AUTO_VoLTE_UAS_020
    ${TC_RESULT} =    START IMS AUTO
    log    ${TC_RESULT}

AUTO_IMS_VoLTE_CALL_021
    [Documentation]    "To verify basic IMS Volte call whether SCSCF application is sending 404 Not Found to PCSCF application when Unregistered subscriber perform IMS MO call."
    ...    "AMSISDN-397458400084,BMSISDN-399898345678"
    [Tags]    CRIT_P1_IMS_VoLTE_MTCALL
    Set Test Variable    ${STATE_MACHINE}    AUTO_VoLTE_UAC_021
    ${TC_RESULT} =    START IMS AUTO
    log    ${TC_RESULT}

AUTO_IMS_VoLTE_CALL_022
    [Documentation]    "To verify basic IMS Volte call whether SCSCF application is sending 404 Not Found to PCSCF application when Unregistered subscriber with REGISTERED_STATUS as RP perform IMS MO call."
    ...    "AMSISDN-397458400001,BMSISDN-399898345678"
    [Tags]    CRIT_P1_IMS_VoLTE_MTCALL
    Set Test Variable    ${STATE_MACHINE}    AUTO_VoLTE_UAC_022
    ${TC_RESULT} =    START IMS AUTO
    log    ${TC_RESULT}

AUTO_IMS_VoLTE_A_NUM_REG_2
    [Documentation]    "To verify IMS VoLTE Registration of Calling A party msisdn."
    ...    "AMSISDN-397458400001"
    [Tags]    CRIT_P1_IMS_VoLTE_CALL_REG
    Set Test Variable    ${STATE_MACHINE}    AUTO_IMS_REG_CALLING
    ${TC_RESULT} =    START IMS AUTO
    log    ${TC_RESULT}


AUTO_IMS_VoLTE_CALL_023
    [Documentation]    "To verify basic ims VoLTE A subscriber calling to unregistered B subscriber and PCSCF send 503 for the B-party and Invite is framed by the TAS application."
    ...    "AMSISDN-397458400001,B-MSISDN-397458400002"
    [Tags]    CRIT_P1_IMS_VoLTE_MTCALL
    Set Test Variable    ${CLIENT_SERVER_SCENARIO}    ${1}
    Set Test Variable    ${SEAGULL_EXECUTION}    ${1}
    Set Test Variable    ${SEAGULL_EXECUTION_TYPE}    ${2}
    Set Test Variable    ${SEAGULL_SCENARIO_NAME}    IMS_PCRF_SCENARIO
    Set Test Variable    ${SEAGULL_SESSION_ID}    219
    Set Test Variable    ${CLIENT_STATE_MACHINE}    AUTO_VoLTE_UAC_023
    Set Test Variable    ${SERVER_STATE_MACHINE}    AUTO_VoLTE_UAS_023
    ${TC_RESULT} =    START IMS AUTO
    log    ${TC_RESULT}


AUTO_IMS_VoLTE_A_NUM_REG_3
    [Documentation]    "To verify IMS VoLTE Registration of Calling A party msisdn for the Busy here case."
    ...    "AMSISDN-397458400027"
    [Tags]    CRIT_P1_IMS_VoLTE_CALL_REG
    Set Test Variable    ${STATE_MACHINE}    AUTO_IMS_REG_CALLING_1
    ${TC_RESULT} =    START IMS AUTO
    log    ${TC_RESULT}

AUTO_IMS_VoLTE_B_NUM_REG_3
    [Documentation]    "To verify IMS VoLTE Registration of Called B party msisdn for the Busy here case."
    ...    "AMSISDN-397458400028"
    [Tags]    CRIT_P1_IMS_VoLTE_CALL_REG
    Set Test Variable    ${STATE_MACHINE}    AUTO_IMS_REG_CALLED_1
    ${TC_RESULT} =    START IMS AUTO
    log    ${TC_RESULT}

AUTO_IMS_VoLTE_CALL_035
    [Documentation]    "To verify basic ims VoLTE A subscriber calling to VoLTE B subscriber with B-party sending 486 Busy Here."
    ...    "AMSISDN-397458400027,BMSISDN-397458400028"
    [Tags]    CRIT_P1_IMS_VoLTE_MTCALL
    Set Test Variable    ${CLIENT_SERVER_SCENARIO}    ${1}
    Set Test Variable    ${SEAGULL_EXECUTION}    ${1}
    Set Test Variable    ${SEAGULL_EXECUTION_TYPE}    ${2}
    Set Test Variable    ${SEAGULL_SCENARIO_NAME}    IMS_PCRF_SCENARIO
    Set Test Variable    ${SEAGULL_CONFIG_NAME}    IMS_PCRF_AUTO_CONFIG_2
    Set Test Variable    ${SEAGULL_SESSION_ID}    226
    Set Test Variable    ${CLIENT_STATE_MACHINE}    AUTO_VoLTE_UAC_035
    Set Test Variable    ${SERVER_STATE_MACHINE}    AUTO_VoLTE_UAS_035
    ${TC_RESULT} =    START IMS AUTO
    log    ${TC_RESULT}

AUTO_IMS_VoLTE_CALL_036
    [Documentation]    "To verify basic ims VoLTE MO call scenario with B-party sending 486 Busy Here."
    ...    "AMSISDN-397458400027,BMSISDN-399898345678"
    [Tags]    CRIT_P1_IMS_VoLTE_MOCALL
    Set Test Variable    ${CLIENT_SERVER_SCENARIO}    ${1}
    Set Test Variable    ${CLIENT_STATE_MACHINE}    AUTO_VoLTE_UAC_036
    Set Test Variable    ${SERVER_STATE_MACHINE}    AUTO_VoLTE_UAS_036
    ${TC_RESULT} =    START IMS AUTO
    log    ${TC_RESULT}

AUTO_IMS_VoLTE_CALL_037
    [Documentation]    "To verify basic ims MO VoLTE A subscriber calling to offnet subscriber with offnet subscriber sending 500 Server Internal error to Client."
    ...    "AMSISDN-397458400027,BMSISDN-399898345678"
    [Tags]    CRIT_P1_IMS_VoLTE_MTCALL
    Set Test Variable    ${CLIENT_SERVER_SCENARIO}    ${1}
    Set Test Variable    ${CLIENT_STATE_MACHINE}    AUTO_VoLTE_UAC_037
    Set Test Variable    ${SERVER_STATE_MACHINE}    AUTO_VoLTE_UAS_037
    ${TC_RESULT} =    START IMS AUTO
    log    ${TC_RESULT}

AUTO_IMS_VoLTE_CALL_038
    [Documentation]    "To verify basic ims VoLTE MO call scenario with RRBS is performing the accounting from the bundle."
    ...    "AMSISDN-397458400027,BMSISDN-399898345678"
    [Tags]    CRIT_P1_IMS_VoLTE_MOCALL
    Set Test Variable    ${CLIENT_SERVER_SCENARIO}    ${1}
    Set Test Variable    ${SEAGULL_EXECUTION}    ${1}
    Set Test Variable    ${SEAGULL_EXECUTION_TYPE}    ${2}
    Set Test Variable    ${SEAGULL_SCENARIO_NAME}    IMS_PCRF_SCENARIO
    Set Test Variable    ${SEAGULL_SESSION_ID}    229
    Set Test Variable    ${CLIENT_STATE_MACHINE}    AUTO_VoLTE_UAC_038
    Set Test Variable    ${SERVER_STATE_MACHINE}    AUTO_VoLTE_UAS_038
    ${TC_RESULT} =    START IMS AUTO
    log    ${TC_RESULT}

AUTO_IMS_VoLTE_CALL_039
    [Documentation]    "To verify basic ims VoLTE MO call scenario with RRBS is performing the accounting from the bundle to Account balance switching case."
    ...    "AMSISDN-397458400027,BMSISDN-399898345678"
    [Tags]    CRIT_P1_IMS_VoLTE_MOCALL
    Set Test Variable    ${CLIENT_SERVER_SCENARIO}    ${1}
    Set Test Variable    ${SEAGULL_EXECUTION}    ${1}
    Set Test Variable    ${SEAGULL_EXECUTION_TYPE}    ${2}
    Set Test Variable    ${SEAGULL_SCENARIO_NAME}    IMS_PCRF_SCENARIO
    Set Test Variable    ${SEAGULL_SESSION_ID}    229
    Set Test Variable    ${CLIENT_STATE_MACHINE}    AUTO_VoLTE_UAC_039
    Set Test Variable    ${SERVER_STATE_MACHINE}    AUTO_VoLTE_UAS_039
    ${TC_RESULT} =    START IMS AUTO
    log    ${TC_RESULT}

AUTO_IMS_VoLTE_CALL_040
    [Documentation]    "To verify basic ims VoLTE MO call scenario with RRBS is performing the accounting from the bundle to insufficient Account balance case."
    ...    "AMSISDN-397458400027,BMSISDN-399898345678"
    [Tags]    CRIT_P1_IMS_VoLTE_MOCALL
    Set Test Variable    ${CLIENT_SERVER_SCENARIO}    ${1}
    Set Test Variable    ${SEAGULL_EXECUTION}    ${1}
    Set Test Variable    ${SEAGULL_EXECUTION_TYPE}    ${2}
    Set Test Variable    ${SEAGULL_SCENARIO_NAME}    IMS_PCRF_SCENARIO
    Set Test Variable    ${SEAGULL_SESSION_ID}    230
    Set Test Variable    ${CLIENT_STATE_MACHINE}    AUTO_VoLTE_UAC_040
    Set Test Variable    ${SERVER_STATE_MACHINE}    AUTO_VoLTE_UAS_040
    ${TC_RESULT} =    START IMS AUTO
    log    ${TC_RESULT}


AUTO_IMS_VoLTE_A_NUM_REG_5
    [Documentation]    "To verify IMS VoLTE Registration of Calling A party msisdn for the Multiple bundle case."
    [Tags]    CRIT_P1_IMS_VoLTE_CALL_REG
    Set Test Variable    ${STATE_MACHINE}    AUTO_IMS_REG_CALLING_2
    ${TC_RESULT} =    START IMS AUTO
    log    ${TC_RESULT}


AUTO_IMS_VoLTE_CALL_051
    [Documentation]    "To verify basic ims VoLTE MO call scenario with B-party MSISDN is only received with 10 digits without CC and the MAX_MSISDN_LEN is configured as 10."
    ...    "AMSISDN-397458400027,BMSISDN-9898345678"
    [Tags]    CRIT_P1_IMS_VoLTE_MOCALL
    Set Test Variable    ${CLIENT_SERVER_SCENARIO}    ${1}
    Set Test Variable    ${SEAGULL_EXECUTION}    ${1}
    Set Test Variable    ${SEAGULL_EXECUTION_TYPE}    ${2}
    Set Test Variable    ${SEAGULL_SCENARIO_NAME}    IMS_PCRF_SCENARIO
    Set Test Variable    ${SEAGULL_SESSION_ID}    241
    Set Test Variable    ${CLIENT_STATE_MACHINE}    AUTO_VoLTE_UAC_051
    Set Test Variable    ${SERVER_STATE_MACHINE}    AUTO_VoLTE_UAS_051
    Set Test Variable    @{PCAP_XML_CONVERSION_END_STRING}    -Y sip -V | sed -n '/Session Initiation Protocol/,/Content-Length/p' | sed 's/^ *//' | sed '/Session Initiation Protocol/i ###############@@@@@@@@NEW SIP MESSAGE@@@@@@@@@##################\n'
    Set Test Variable    ${PCAP_PROTO_GREP}    egrep -hi 'Request-Line:|Status-Line:
    Set Test Variable    ${PCAP_PROTO_GREP_END_STRING}    | egrep -v 'egrep|OPTIONS'
    Set Test Variable    ${PROTOCOL_VALIDATION_TYPE}    1
    ${TC_RESULT} =    START IMS AUTO
    log    ${TC_RESULT}

AUTO_IMS_VoLTE_CALL_052
    [Documentation]    "To verify basic ims VoLTE MO call scenario with B-party MSISDN is only received with 9 digits without CC and the MAX_MSISDN_LEN is configured as 10 and MIN_MSISDN_LEN is configured as 9."
    ...    "AMSISDN-397458400029,BMSISDN-989834567"
    [Tags]    CRIT_P1_IMS_VoLTE_MOCALL
    Set Test Variable    ${CLIENT_SERVER_SCENARIO}    ${1}
    Set Test Variable    ${SEAGULL_EXECUTION}    ${1}
    Set Test Variable    ${SEAGULL_EXECUTION_TYPE}    ${2}
    Set Test Variable    ${SEAGULL_SCENARIO_NAME}    IMS_PCRF_SCENARIO
    Set Test Variable    ${SEAGULL_SESSION_ID}    242
    Set Test Variable    ${CLIENT_STATE_MACHINE}    AUTO_VoLTE_UAC_052
    Set Test Variable    ${SERVER_STATE_MACHINE}    AUTO_VoLTE_UAS_052
    ${TC_RESULT} =    START IMS AUTO
    log    ${TC_RESULT}

AUTO_IMS_VoLTE_CALL_053
    [Documentation]    "To verify basic ims VoLTE MO call scenario with B-party MSISDN is only received with 11 digits without CC and the MAX_MSISDN_LEN is configured as 10 and MIN_MSISDN_LEN is configured as 9"
    ...    "AMSISDN-397458400029,BMSISDN-98983456789"
    [Tags]    CRIT_P1_IMS_VoLTE_MOCALL
    Set Test Variable    ${STATE_MACHINE}    AUTO_VoLTE_UAC_053
    ${TC_RESULT} =    START IMS AUTO
    log    ${TC_RESULT}

AUTO_IMS_VoLTE_CALL_054
    [Documentation]    "To verify basic VoLTE MO call scenario with B-party MSISDN is only received with 8 digits without CC and the MAX_MSISDN_LEN is configured as 10 and MIN_MSISDN_LEN is configured as 9"
    ...    "AMSISDN-397458400029,BMSISDN-98983456"
    [Tags]    CRIT_P1_IMS_VoLTE_MOCALL
    Set Test Variable    ${STATE_MACHINE}    AUTO_VoLTE_UAC_054
    ${TC_RESULT} =    START IMS AUTO
    log    ${TC_RESULT}


AUTO_IMS_VoLTE_A_NUM_REG_8	
    [Documentation]    "To verify IMS VoLTE Registration of Calling A party msisdn."
    [Tags]    CRIT_P1_IMS_VoLTE_CALL_REG
    Set Test Variable    ${STATE_MACHINE}    AUTO_IMS_REG_CALLING
    ${TC_RESULT} =    START IMS AUTO
    log    ${TC_RESULT}

AUTO_IMS_VoLTE_B_NUM_REG_8
    [Documentation]    "To verify IMS VoLTE Registration of Called B party msisdn."
    [Tags]    CRIT_P1_IMS_VoLTE_CALL_REG
    Set Test Variable    ${STATE_MACHINE}    AUTO_IMS_REG_CALLED
    ${TC_RESULT} =    START IMS AUTO
    log    ${TC_RESULT}


AUTO_IMS_VoLTE_CALL_094
    [Documentation]    "TO verify whether PCSCF application is handling the Bye request when the Route header is received without the braces when Bye is sent from B-party."
    ...    "AMSISDN-397458400001,BMSISDN-397458400002"
    [Tags]    CRIT_P1_IMS_VoLTE_MOCALL
    Set Test Variable    ${CLIENT_SERVER_SCENARIO}    ${1}
    Set Test Variable    ${SEAGULL_EXECUTION}    ${1}
    Set Test Variable    ${SEAGULL_EXECUTION_TYPE}    ${2}
    Set Test Variable    ${SEAGULL_SCENARIO_NAME}    IMS_PCRF_SCENARIO
    Set Test Variable    ${SEAGULL_CONFIG_NAME}    IMS_PCRF_AUTO_CONFIG_2
    Set Test Variable    ${SEAGULL_SESSION_ID}    256
    Set Test Variable    ${CLIENT_STATE_MACHINE}    AUTO_VoLTE_UAC_094
    Set Test Variable    ${SERVER_STATE_MACHINE}    AUTO_VoLTE_UAS_094
    ${TC_RESULT} =    START IMS AUTO
    log    ${TC_RESULT}

AUTO_IMS_VoLTE_CALL_095
    [Documentation]    "TO verify whether PCSCF application is handling the Bye request when the Route header is received with only the start braces when Bye is sent from B-party.."
    ...    "AMSISDN-397458400001,BMSISDN-397458400002"
    [Tags]    CRIT_P1_IMS_VoLTE_MOCALL
    Set Test Variable    ${CLIENT_SERVER_SCENARIO}    ${1}
    Set Test Variable    ${SEAGULL_EXECUTION}    ${1}
    Set Test Variable    ${SEAGULL_EXECUTION_TYPE}    ${2}
    Set Test Variable    ${SEAGULL_SCENARIO_NAME}    IMS_PCRF_SCENARIO
    Set Test Variable    ${SEAGULL_CONFIG_NAME}    IMS_PCRF_AUTO_CONFIG_2
    Set Test Variable    ${SEAGULL_SESSION_ID}    257
    Set Test Variable    ${CLIENT_STATE_MACHINE}    AUTO_VoLTE_UAC_095
    Set Test Variable    ${SERVER_STATE_MACHINE}    AUTO_VoLTE_UAS_095
    ${TC_RESULT} =    START IMS AUTO
    log    ${TC_RESULT}

AUTO_IMS_VoLTE_CALL_096
    [Documentation]    "TO verify whether PCSCF application is handling the Bye request when the Route header is received with only the End braces when Bye is sent from B-party.."
    ...    "AMSISDN-397458400001,BMSISDN-397458400002"
    [Tags]    CRIT_P1_IMS_VoLTE_MOCALL
    Set Test Variable    ${CLIENT_SERVER_SCENARIO}    ${1}
    Set Test Variable    ${SEAGULL_EXECUTION}    ${1}
    Set Test Variable    ${SEAGULL_EXECUTION_TYPE}    ${2}
    Set Test Variable    ${SEAGULL_SCENARIO_NAME}    IMS_PCRF_SCENARIO
    Set Test Variable    ${SEAGULL_CONFIG_NAME}    IMS_PCRF_AUTO_CONFIG_2
    Set Test Variable    ${SEAGULL_SESSION_ID}    258
    Set Test Variable    ${CLIENT_STATE_MACHINE}    AUTO_VoLTE_UAC_096
    Set Test Variable    ${SERVER_STATE_MACHINE}    AUTO_VoLTE_UAS_096
    ${TC_RESULT} =    START IMS AUTO
    log    ${TC_RESULT}

AUTO_IMS_VoLTE_CALL_097
    [Documentation]    "TO verify whether PCSCF application is handling the Bye request when the Route header is received without the braces when Bye is sent from A-party.."
    ...    "AMSISDN-397458400001,BMSISDN-397458400002"
    [Tags]    CRIT_P1_IMS_VoLTE_MOCALL
    Set Test Variable    ${CLIENT_SERVER_SCENARIO}    ${1}
    Set Test Variable    ${SEAGULL_EXECUTION}    ${1}
    Set Test Variable    ${SEAGULL_EXECUTION_TYPE}    ${2}
    Set Test Variable    ${SEAGULL_SCENARIO_NAME}    IMS_PCRF_SCENARIO
    Set Test Variable    ${SEAGULL_CONFIG_NAME}    IMS_PCRF_AUTO_CONFIG_2
    Set Test Variable    ${SEAGULL_SESSION_ID}    259
    Set Test Variable    ${CLIENT_STATE_MACHINE}    AUTO_VoLTE_UAC_097
    Set Test Variable    ${SERVER_STATE_MACHINE}    AUTO_VoLTE_UAS_097
    ${TC_RESULT} =    START IMS AUTO
    log    ${TC_RESULT}

AUTO_IMS_VoLTE_CALL_098
    [Documentation]    "TO verify whether PCSCF application is handling the Bye request when the Route header is received with the start braces only when Bye is sent from A-party."
    ...    "AMSISDN-397458400001,BMSISDN-397458400002"
    [Tags]    CRIT_P1_IMS_VoLTE_MOCALL
    Set Test Variable    ${CLIENT_SERVER_SCENARIO}    ${1}
    Set Test Variable    ${SEAGULL_EXECUTION}    ${1}
    Set Test Variable    ${SEAGULL_EXECUTION_TYPE}    ${2}
    Set Test Variable    ${SEAGULL_SCENARIO_NAME}    IMS_PCRF_SCENARIO
    Set Test Variable    ${SEAGULL_CONFIG_NAME}    IMS_PCRF_AUTO_CONFIG_2
    Set Test Variable    ${SEAGULL_SESSION_ID}    260
    Set Test Variable    ${CLIENT_STATE_MACHINE}    AUTO_VoLTE_UAC_098
    Set Test Variable    ${SERVER_STATE_MACHINE}    AUTO_VoLTE_UAS_098
    ${TC_RESULT} =    START IMS AUTO
    log    ${TC_RESULT}

AUTO_IMS_VoLTE_CALL_099
    [Documentation]    "TO verify whether PCSCF application is handling the Bye request when the Route header is received with the end braces only when Bye is sent from A-party."
    ...    "AMSISDN-397458400001,BMSISDN-397458400002"
    [Tags]    CRIT_P1_IMS_VoLTE_MOCALL
    Set Test Variable    ${CLIENT_SERVER_SCENARIO}    ${1}
    Set Test Variable    ${SEAGULL_EXECUTION}    ${1}
    Set Test Variable    ${SEAGULL_EXECUTION_TYPE}    ${2}
    Set Test Variable    ${SEAGULL_SCENARIO_NAME}    IMS_PCRF_SCENARIO
    Set Test Variable    ${SEAGULL_CONFIG_NAME}    IMS_PCRF_AUTO_CONFIG_2
    Set Test Variable    ${SEAGULL_SESSION_ID}    261
    Set Test Variable    ${CLIENT_STATE_MACHINE}    AUTO_VoLTE_UAC_099
    Set Test Variable    ${SERVER_STATE_MACHINE}    AUTO_VoLTE_UAS_099	
    ${TC_RESULT} =    START IMS AUTO
    log    ${TC_RESULT}


AUTO_IMS_VoLTE_CALL_100
    [Documentation]    "TO verify whether 182 Queuing Response is handled by I-CSCF application when 182 is sent by UE-B after 200 OK of the PRACK."
    ...    "AMSISDN-397458400001,BMSISDN-399898345678"
    [Tags]    CRIT_P1_IMS_VoLTE_MOCALL
    Set Test Variable    ${CLIENT_SERVER_SCENARIO}    ${1}
    Set Test Variable    ${SEAGULL_EXECUTION}    ${1}
    Set Test Variable    ${SEAGULL_EXECUTION_TYPE}    ${2}
    Set Test Variable    ${SEAGULL_SCENARIO_NAME}    IMS_PCRF_SCENARIO
    Set Test Variable    ${SEAGULL_SESSION_ID}    262
    Set Test Variable    ${CLIENT_STATE_MACHINE}    AUTO_VoLTE_UAC_100
    Set Test Variable    ${SERVER_STATE_MACHINE}    AUTO_VoLTE_UAS_100	
    ${TC_RESULT} =    START IMS AUTO
    log    ${TC_RESULT}


*** Keywords ***
