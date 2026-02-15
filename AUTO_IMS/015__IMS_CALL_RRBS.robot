*** Settings ***
Documentation     IMS_CALL_RRBS_DOWN_TEST_SUITE
Suite Setup       SUITE STARTUP
Suite teardown    CLOSE EXISTING CONNECTION
Test Teardown     TEST STOP
Force Tags        IMS_CALL_RRBS
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


AUTO_IMS_VoLTE_B_NUM_REG_2
    [Documentation]    "To verify IMS VoLTE Registration of Called B party msisdn."
    [Tags]    CRIT_P1_IMS_VoLTE_CALL_REG
    Set Test Variable    ${STATE_MACHINE}    AUTO_IMS_REG_CALLED
    ${TC_RESULT} =    START IMS AUTO
    log    ${TC_RESULT}


AUTO_IMS_VoLTE_CALL_024
    [Documentation]    "To verify basic ims VoLTE A subscriber calling to unregistered B subscriber with registered status as RP and SCSCF send 404 for the B-party and Invite is framed by the TAS application."
    [Tags]    CRIT_P1_IMS_VoLTE_MTCALL
    Set Test Variable    ${STATE_MACHINE}    AUTO_VoLTE_UAC_024
    ${TC_RESULT} =    START IMS AUTO
    log    ${TC_RESULT}

AUTO_IMS_VoLTE_CALL_025
    [Documentation]    "To verify basic ims VoLTE A subscriber calling to Volte B subscriber with A-party subscriber is having insufficient account balance case."
    [Tags]    CRIT_P1_IMS_VoLTE_MTCALL
    Set Test Variable    ${STATE_MACHINE}    AUTO_VoLTE_UAC_025
    ${TC_RESULT} =    START IMS AUTO
    log    ${TC_RESULT}

AUTO_IMS_VoLTE_CALL_026
    [Documentation]    "To verify basic ims VoLTE A subscriber calling to Volte B subscriber with Sim is blocked for the A-party subscriber."
    [Tags]    CRIT_P1_IMS_VoLTE_MTCALL
    Set Test Variable    ${STATE_MACHINE}    AUTO_VoLTE_UAC_026
    ${TC_RESULT} =    START IMS AUTO
    log    ${TC_RESULT}

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


AUTO_IMS_VoLTE_CALL_027
    [Documentation]    "To verify basic ims VoLTE A subscriber calling to Volte B subscriber is successful even when Sim is blocked for the B-party subscriber(RRBS is not validating the B-party Sim status)."
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

AUTO_IMS_VoLTE_CALL_028
    [Documentation]    "To verify basic ims VoLTE A subscriber calling to Volte B subscriber with MO call service is blocked for the A-party subscriber."
    [Tags]    CRIT_P1_IMS_VoLTE_MTCALL
    Set Test Variable    ${STATE_MACHINE}    AUTO_VoLTE_UAC_028
    ${TC_RESULT} =    START IMS AUTO
    log    ${TC_RESULT}

AUTO_IMS_VoLTE_CALL_029
    [Documentation]    "To verify basic ims VoLTE A subscriber calling to Volte B subscriber with TAS is sending the Update request and then terminate request for accounting to RRBS application."
    [Tags]    CRIT_P1_IMS_VoLTE_MOCALL
    Set Test Variable    ${CLIENT_SERVER_SCENARIO}    ${1}
    Set Test Variable    ${SEAGULL_EXECUTION}    ${1}
    Set Test Variable    ${SEAGULL_EXECUTION_TYPE}    ${2}
    Set Test Variable    ${SEAGULL_SCENARIO_NAME}    IMS_PCRF_SCENARIO
    Set Test Variable    ${SEAGULL_CONFIG_NAME}    IMS_PCRF_AUTO_CONFIG_2
    Set Test Variable    ${SEAGULL_SESSION_ID}    220
    Set Test Variable    ${CLIENT_STATE_MACHINE}    AUTO_VoLTE_UAC_029
    Set Test Variable    ${SERVER_STATE_MACHINE}    AUTO_VoLTE_UAS_029
    ${TC_RESULT} =    START IMS AUTO
    log    ${TC_RESULT}

AUTO_IMS_VoLTE_CALL_030
    [Documentation]    "To verify basic ims VoLTE A subscriber calling to VoLTE B subscriber with TAS is sending the Update request and then terminate request for accounting to RRBS application with Bye is received from B-party."
    [Tags]    CRIT_P1_IMS_VoLTE_MTCALL
    Set Test Variable    ${CLIENT_SERVER_SCENARIO}    ${1}
    Set Test Variable    ${SEAGULL_EXECUTION}    ${1}
    Set Test Variable    ${SEAGULL_EXECUTION_TYPE}    ${2}
    Set Test Variable    ${SEAGULL_SCENARIO_NAME}    IMS_PCRF_SCENARIO
    Set Test Variable    ${SEAGULL_CONFIG_NAME}    IMS_PCRF_AUTO_CONFIG_2
    Set Test Variable    ${SEAGULL_SESSION_ID}    221
    Set Test Variable    ${CLIENT_STATE_MACHINE}    AUTO_VoLTE_UAC_030
    Set Test Variable    ${SERVER_STATE_MACHINE}    AUTO_VoLTE_UAS_030
    ${TC_RESULT} =    START IMS AUTO
    log    ${TC_RESULT}

AUTO_IMS_VoLTE_CALL_031
    [Documentation]    "To verify basic ims VoLTE MO call scenario with TAS is sending the Update request and then terminate request for accounting to RRBS application."
    [Tags]    CRIT_P1_IMS_VoLTE_MOCALL
    Set Test Variable    ${CLIENT_SERVER_SCENARIO}    ${1}
    Set Test Variable    ${SEAGULL_EXECUTION}    ${1}
    Set Test Variable    ${SEAGULL_EXECUTION_TYPE}    ${2}
    Set Test Variable    ${SEAGULL_SCENARIO_NAME}    IMS_PCRF_SCENARIO
    Set Test Variable    ${SEAGULL_SESSION_ID}    222
    Set Test Variable    ${CLIENT_STATE_MACHINE}    AUTO_VoLTE_UAC_031
    Set Test Variable    ${SERVER_STATE_MACHINE}    AUTO_VoLTE_UAS_031
    ${TC_RESULT} =    START IMS AUTO
    log    ${TC_RESULT}

AUTO_IMS_VoLTE_CALL_032
    [Documentation]    "To verify basic ims VoLTE to Volte call scenario with TAS is sending the Update request and then terminate request for accounting to RRBS application."
    [Tags]    CRIT_P1_IMS_VoLTE_MOCALL
    Set Test Variable    ${CLIENT_SERVER_SCENARIO}    ${1}
    Set Test Variable    ${SEAGULL_EXECUTION}    ${1}
    Set Test Variable    ${SEAGULL_EXECUTION_TYPE}    ${2}
    Set Test Variable    ${SEAGULL_SCENARIO_NAME}    IMS_PCRF_SCENARIO
    Set Test Variable    ${SEAGULL_SESSION_ID}    223
    Set Test Variable    ${CLIENT_STATE_MACHINE}    AUTO_VoLTE_UAC_032
    Set Test Variable    ${SERVER_STATE_MACHINE}    AUTO_VoLTE_UAS_032
    ${TC_RESULT} =    START IMS AUTO
    log    ${TC_RESULT}

AUTO_IMS_VoLTE_CALL_033
    [Documentation]    "To verify basic ims VoLTE MO call scenario with Volte A subscriber calling other network subscriber TAS is sending the Update request to RRBS and RRBS send insufficient account balance in an ongoing session."
    [Tags]    CRIT_P1_IMS_VoLTE_MOCALL
    Set Test Variable    ${CLIENT_SERVER_SCENARIO}    ${1}
    Set Test Variable    ${SEAGULL_EXECUTION}    ${1}
    Set Test Variable    ${SEAGULL_EXECUTION_TYPE}    ${2}
    Set Test Variable    ${SEAGULL_SCENARIO_NAME}    IMS_PCRF_SCENARIO
    Set Test Variable    ${SEAGULL_SESSION_ID}    224
    Set Test Variable    ${CLIENT_STATE_MACHINE}    AUTO_VoLTE_UAC_033
    Set Test Variable    ${SERVER_STATE_MACHINE}    AUTO_VoLTE_UAS_033
    ${TC_RESULT} =    START IMS AUTO
    log    ${TC_RESULT}

AUTO_IMS_VoLTE_CALL_034
    [Documentation]    "To verify basic ims VoLTE A subscriber calling to VoLTE B subscriber TAS is sending the Update request to RRBS and RRBS send insufficient account balance in an ongoing session.."
    [Tags]    CRIT_P1_IMS_VoLTE_MTCALL
    Set Test Variable    ${CLIENT_SERVER_SCENARIO}    ${1}
    Set Test Variable    ${SEAGULL_EXECUTION}    ${1}
    Set Test Variable    ${SEAGULL_EXECUTION_TYPE}    ${2}
    Set Test Variable    ${SEAGULL_SCENARIO_NAME}    IMS_PCRF_SCENARIO
    Set Test Variable    ${SEAGULL_CONFIG_NAME}    IMS_PCRF_AUTO_CONFIG_2
    Set Test Variable    ${SEAGULL_SESSION_ID}    225
    Set Test Variable    ${CLIENT_STATE_MACHINE}    AUTO_VoLTE_UAC_034
    Set Test Variable    ${SERVER_STATE_MACHINE}    AUTO_VoLTE_UAS_034
    ${TC_RESULT} =    START IMS AUTO
    log    ${TC_RESULT}


AUTO_IMS_VoLTE_A_NUM_REG_4
    [Documentation]    "To verify IMS VoLTE Registration of Calling A party msisdn (Precondition:A-party used for performing the accounting from the bundle.)"
    [Tags]    CRIT_P1_IMS_VoLTE_CALL_REG
    Set Test Variable    ${STATE_MACHINE}    AUTO_IMS_REG_CALLING
    ${TC_RESULT} =    START IMS AUTO
    log    ${TC_RESULT}

AUTO_IMS_VoLTE_B_NUM_REG_4
    [Documentation]    "To verify IMS VoLTE Registration of Called B party msisdn (Precondition:B-party used for performing the accounting from the bundle.)"
    [Tags]    CRIT_P1_IMS_VoLTE_CALL_REG
    Set Test Variable    ${STATE_MACHINE}    AUTO_IMS_REG_CALLED
    ${TC_RESULT} =    START IMS AUTO
    log    ${TC_RESULT}


AUTO_IMS_VoLTE_CALL_041
    [Documentation]    "To verify basic ims VoLTE A subscriber calling to VoLTE B subscriber with RRBS is performing the accounting from the bundle."
    [Tags]    CRIT_P1_IMS_VoLTE_MTCALL
    Set Test Variable    ${CLIENT_SERVER_SCENARIO}    ${1}
    Set Test Variable    ${SEAGULL_EXECUTION}    ${1}
    Set Test Variable    ${SEAGULL_EXECUTION_TYPE}    ${2}
    Set Test Variable    ${SEAGULL_SCENARIO_NAME}    IMS_PCRF_SCENARIO
    Set Test Variable    ${SEAGULL_CONFIG_NAME}    IMS_PCRF_AUTO_CONFIG_2
    Set Test Variable    ${SEAGULL_SESSION_ID}    231
    Set Test Variable    ${CLIENT_STATE_MACHINE}    AUTO_VoLTE_UAC_041
    Set Test Variable    ${SERVER_STATE_MACHINE}    AUTO_VoLTE_UAS_041
    ${TC_RESULT} =    START IMS AUTO
    log    ${TC_RESULT}

AUTO_IMS_VoLTE_CALL_042
    [Documentation]    "To verify basic ims VoLTE A subscriber calling to VoLTE B subscriber with RRBS is performing the accounting from the bundle to Account balance switching case."
    [Tags]    CRIT_P1_IMS_VoLTE_MTCALL
    Set Test Variable    ${CLIENT_SERVER_SCENARIO}    ${1}
    Set Test Variable    ${SEAGULL_EXECUTION}    ${1}
    Set Test Variable    ${SEAGULL_EXECUTION_TYPE}    ${2}
    Set Test Variable    ${SEAGULL_SCENARIO_NAME}    IMS_PCRF_SCENARIO
    Set Test Variable    ${SEAGULL_CONFIG_NAME}    IMS_PCRF_AUTO_CONFIG_2
    Set Test Variable    ${SEAGULL_SESSION_ID}    232
    Set Test Variable    ${CLIENT_STATE_MACHINE}    AUTO_VoLTE_UAC_042
    Set Test Variable    ${SERVER_STATE_MACHINE}    AUTO_VoLTE_UAS_042
    ${TC_RESULT} =    START IMS AUTO
    log    ${TC_RESULT}

AUTO_IMS_VoLTE_CALL_043
    [Documentation]    "To verify basic ims VoLTE A subscriber calling to VoLTE B subscriber TAS is sending the Update request to RRBS and RRBS send insufficient account balance in an ongoing session.."
    [Tags]    CRIT_P1_IMS_VoLTE_MTCALL
    Set Test Variable    ${CLIENT_SERVER_SCENARIO}    ${1}
    Set Test Variable    ${SEAGULL_EXECUTION}    ${1}
    Set Test Variable    ${SEAGULL_EXECUTION_TYPE}    ${2}
    Set Test Variable    ${SEAGULL_SCENARIO_NAME}    IMS_PCRF_SCENARIO
    Set Test Variable    ${SEAGULL_CONFIG_NAME}    IMS_PCRF_AUTO_CONFIG_2
    Set Test Variable    ${SEAGULL_SESSION_ID}    233
    Set Test Variable    ${CLIENT_STATE_MACHINE}    AUTO_VoLTE_UAC_043
    Set Test Variable    ${SERVER_STATE_MACHINE}    AUTO_VoLTE_UAS_043
    ${TC_RESULT} =    START IMS AUTO
    log    ${TC_RESULT}

AUTO_IMS_VoLTE_A_NUM_REG_5
    [Documentation]    "To verify IMS VoLTE Registration of Calling A party msisdn for the Multiple bundle case."
    [Tags]    CRIT_P1_IMS_VoLTE_CALL_REG
    Set Test Variable    ${STATE_MACHINE}    AUTO_IMS_REG_CALLING_2
    ${TC_RESULT} =    START IMS AUTO
    log    ${TC_RESULT}

AUTO_IMS_VoLTE_CALL_044
    [Documentation]    "To verify basic ims VoLTE A subscriber calling to VoLTE B subscriber with RRBS is performing the accounting from the least expiry bundle during multiple bundle case."
    [Tags]    CRIT_P1_IMS_VoLTE_MTCALL
    Set Test Variable    ${CLIENT_SERVER_SCENARIO}    ${1}
    Set Test Variable    ${SEAGULL_EXECUTION}    ${1}
    Set Test Variable    ${SEAGULL_EXECUTION_TYPE}    ${2}
    Set Test Variable    ${SEAGULL_SCENARIO_NAME}    IMS_PCRF_SCENARIO
    Set Test Variable    ${SEAGULL_CONFIG_NAME}    IMS_PCRF_AUTO_CONFIG_2
    Set Test Variable    ${SEAGULL_SESSION_ID}    234
    Set Test Variable    ${CLIENT_STATE_MACHINE}    AUTO_VoLTE_UAC_044
    Set Test Variable    ${SERVER_STATE_MACHINE}    AUTO_VoLTE_UAS_044
    ${TC_RESULT} =    START IMS AUTO
    log    ${TC_RESULT}

AUTO_IMS_VoLTE_CALL_045
    [Documentation]    "To verify basic ims VoLTE A subscriber calling to VoLTE B subscriber with RRBS is performing the accounting from the least expiry bundle 1 to bundle 2 during multiple bundle case."
    [Tags]    CRIT_P1_IMS_VoLTE_MTCALL
    Set Test Variable    ${CLIENT_SERVER_SCENARIO}    ${1}
    Set Test Variable    ${SEAGULL_EXECUTION}    ${1}
    Set Test Variable    ${SEAGULL_EXECUTION_TYPE}    ${2}
    Set Test Variable    ${SEAGULL_SCENARIO_NAME}    IMS_PCRF_SCENARIO
    Set Test Variable    ${SEAGULL_CONFIG_NAME}    IMS_PCRF_AUTO_CONFIG_2
    Set Test Variable    ${SEAGULL_SESSION_ID}    235
    Set Test Variable    ${CLIENT_STATE_MACHINE}    AUTO_VoLTE_UAC_045
    Set Test Variable    ${SERVER_STATE_MACHINE}    AUTO_VoLTE_UAS_045
    ${TC_RESULT} =    START IMS AUTO
    log    ${TC_RESULT}

AUTO_IMS_VoLTE_CALL_046
    [Documentation]    "To verify basic ims VoLTE A subscriber calling to VoLTE B subscriber with RRBS is performing the accounting from the bundle 2 to account balance case with bundle 1 allowance is already exhausted in the start of the session during multiple bundle case."
    [Tags]    CRIT_P1_IMS_VoLTE_MTCALL
    Set Test Variable    ${CLIENT_SERVER_SCENARIO}    ${1}
    Set Test Variable    ${SEAGULL_EXECUTION}    ${1}
    Set Test Variable    ${SEAGULL_EXECUTION_TYPE}    ${2}
    Set Test Variable    ${SEAGULL_SCENARIO_NAME}    IMS_PCRF_SCENARIO
    Set Test Variable    ${SEAGULL_CONFIG_NAME}    IMS_PCRF_AUTO_CONFIG_2
    Set Test Variable    ${SEAGULL_SESSION_ID}    236
    Set Test Variable    ${CLIENT_STATE_MACHINE}    AUTO_VoLTE_UAC_046
    Set Test Variable    ${SERVER_STATE_MACHINE}    AUTO_VoLTE_UAS_046
    ${TC_RESULT} =    START IMS AUTO
    log    ${TC_RESULT}

AUTO_IMS_VoLTE_CALL_047
    [Documentation]    "To verify basic ims VoLTE A subscriber calling to VoLTE B subscriber with RRBS is performing the accounting from the bundle 2 with bundle 1 allowance is already exhausted in the start of the session during multiple bundle case."
    [Tags]    CRIT_P1_IMS_VoLTE_MTCALL
    Set Test Variable    ${CLIENT_SERVER_SCENARIO}    ${1}
    Set Test Variable    ${SEAGULL_EXECUTION}    ${1}
    Set Test Variable    ${SEAGULL_EXECUTION_TYPE}    ${2}
    Set Test Variable    ${SEAGULL_SCENARIO_NAME}    IMS_PCRF_SCENARIO
    Set Test Variable    ${SEAGULL_CONFIG_NAME}    IMS_PCRF_AUTO_CONFIG_2
    Set Test Variable    ${SEAGULL_SESSION_ID}    237
    Set Test Variable    ${CLIENT_STATE_MACHINE}    AUTO_VoLTE_UAC_047
    Set Test Variable    ${SERVER_STATE_MACHINE}    AUTO_VoLTE_UAS_047
    ${TC_RESULT} =    START IMS AUTO
    log    ${TC_RESULT}

AUTO_IMS_VoLTE_CALL_048
    [Documentation]    "To verify basic ims VoLTE MO call scenario with RRBS is performing the accounting from the least expiry bundle during the multiple bundle case."
    [Tags]    CRIT_P1_IMS_VoLTE_MOCALL
    Set Test Variable    ${CLIENT_SERVER_SCENARIO}    ${1}
    Set Test Variable    ${SEAGULL_EXECUTION}    ${1}
    Set Test Variable    ${SEAGULL_EXECUTION_TYPE}    ${2}
    Set Test Variable    ${SEAGULL_SCENARIO_NAME}    IMS_PCRF_SCENARIO
    Set Test Variable    ${SEAGULL_SESSION_ID}    238
    Set Test Variable    ${CLIENT_STATE_MACHINE}    AUTO_VoLTE_UAC_048
    Set Test Variable    ${SERVER_STATE_MACHINE}    AUTO_VoLTE_UAS_048
    ${TC_RESULT} =    START IMS AUTO
    log    ${TC_RESULT}

AUTO_IMS_VoLTE_CALL_049
    [Documentation]    "To verify basic ims VoLTE MO call scenario with RRBS is performing the accounting from the least expiry bundle 1 to bundle 2 during multiple bundle case."
    [Tags]    CRIT_P1_IMS_VoLTE_MOCALL
    Set Test Variable    ${CLIENT_SERVER_SCENARIO}    ${1}
    Set Test Variable    ${SEAGULL_EXECUTION}    ${1}
    Set Test Variable    ${SEAGULL_EXECUTION_TYPE}    ${2}
    Set Test Variable    ${SEAGULL_SCENARIO_NAME}    IMS_PCRF_SCENARIO
    Set Test Variable    ${SEAGULL_SESSION_ID}    239
    Set Test Variable    ${CLIENT_STATE_MACHINE}    AUTO_VoLTE_UAC_049
    Set Test Variable    ${SERVER_STATE_MACHINE}    AUTO_VoLTE_UAS_049
    ${TC_RESULT} =    START IMS AUTO
    log    ${TC_RESULT}

AUTO_IMS_VoLTE_CALL_050
    [Documentation]    "To verify basic ims VoLTE MO call scenario with RRBS is performing the accounting from the bundle 2 to account balance during multiple bundle case."
    [Tags]    CRIT_P1_IMS_VoLTE_MOCALL
    Set Test Variable    ${CLIENT_SERVER_SCENARIO}    ${1}
    Set Test Variable    ${SEAGULL_EXECUTION}    ${1}
    Set Test Variable    ${SEAGULL_EXECUTION_TYPE}    ${2}
    Set Test Variable    ${SEAGULL_SCENARIO_NAME}    IMS_PCRF_SCENARIO
    Set Test Variable    ${SEAGULL_SESSION_ID}    240
    Set Test Variable    ${CLIENT_STATE_MACHINE}    AUTO_VoLTE_UAC_050
    Set Test Variable    ${SERVER_STATE_MACHINE}    AUTO_VoLTE_UAS_050
    ${TC_RESULT} =    START IMS AUTO
    log    ${TC_RESULT}


AUTO_IMS_VoLTE_A_NUM_REG_1
    [Documentation]    "To verify IMS VoLTE Registration of Calling A party msisdn."
    [Tags]    CRIT_P1_IMS_VoLTE_CALL_REG
    Set Test Variable    ${STATE_MACHINE}    AUTO_IMS_REG_CALLING
    ${TC_RESULT} =    START IMS AUTO
    log    ${TC_RESULT}

AUTO_IMS_VoLTE_B_NUM_REG_1
    [Documentation]    "To verify IMS VoLTE Registration of Called B party msisdn."
    [Tags]    CRIT_P1_IMS_VoLTE_CALL_REG
    Set Test Variable    ${STATE_MACHINE}    AUTO_IMS_REG_CALLED
    ${TC_RESULT} =    START IMS AUTO
    log    ${TC_RESULT}

IMS_CALL_RRBS_DOWN_001
    [Documentation]    "To verify basic ims VoLTE MO call scenario with RRBS application goes down gracefully during the IMS call when subscriber browse from Account balance case."
    [Tags]    CRIT_P1_IMS_CALL_RRBS_DOWN
    Set Test Variable    ${CLIENT_SERVER_SCENARIO}    ${1}
    Set Test Variable    ${SEAGULL_EXECUTION}    ${1}
    Set Test Variable    ${SEAGULL_EXECUTION_TYPE}    ${2}
    Set Test Variable    ${SEAGULL_SCENARIO_NAME}    IMS_PCRF_SCENARIO
    Set Test Variable    ${SEAGULL_SESSION_ID}    111
    Set Test Variable    ${CLIENT_STATE_MACHINE}    AUTO_VoLTE_UAC_072
    Set Test Variable    ${SERVER_STATE_MACHINE}    AUTO_VoLTE_UAS_072
    ${TC_RESULT} =    START IMS AUTO
    log    ${TC_RESULT}

IMS_CALL_RRBS_DOWN_002
    [Documentation]    "To verify basic ims VoLTE MO call scenario with RRBS application goes down gracefully during the IMS call when Volte A subscriber immediately terminate the call by sending BYE request to B-party."
    [Tags]    CRIT_P1_IMS_CALL_RRBS_DOWN
    Set Test Variable    ${CLIENT_SERVER_SCENARIO}    ${1}
    Set Test Variable    ${SEAGULL_EXECUTION}    ${1}
    Set Test Variable    ${SEAGULL_EXECUTION_TYPE}    ${2}
    Set Test Variable    ${SEAGULL_SCENARIO_NAME}    IMS_PCRF_SCENARIO
    Set Test Variable    ${SEAGULL_SESSION_ID}    112
    Set Test Variable    ${CLIENT_STATE_MACHINE}    AUTO_VoLTE_UAC_073
    Set Test Variable    ${SERVER_STATE_MACHINE}    AUTO_VoLTE_UAS_073
    ${TC_RESULT} =    START IMS AUTO
    log    ${TC_RESULT}

AUTO_IMS_VoLTE_A_NUM_REG_3
    [Documentation]    "To verify IMS VoLTE Registration of Calling A party msisdn."
    [Tags]    CRIT_P1_IMS_VoLTE_CALL_REG
    Set Test Variable    ${STATE_MACHINE}    AUTO_IMS_REG_CALLING_1
    ${TC_RESULT} =    START IMS AUTO
    log    ${TC_RESULT}

IMS_CALL_RRBS_DOWN_003
    [Documentation]    "To verify basic ims VoLTE MO call scenario with RRBS application goes down gracefully during the IMS call when subscriber browse from Bundle bucket case."
    [Tags]    CRIT_P1_IMS_CALL_RRBS_DOWN
    Set Test Variable    ${CLIENT_SERVER_SCENARIO}    ${1}
    Set Test Variable    ${SEAGULL_EXECUTION}    ${1}
    Set Test Variable    ${SEAGULL_EXECUTION_TYPE}    ${2}
    Set Test Variable    ${SEAGULL_SCENARIO_NAME}    IMS_PCRF_SCENARIO
    Set Test Variable    ${SEAGULL_SESSION_ID}    113
    Set Test Variable    ${CLIENT_STATE_MACHINE}    AUTO_VoLTE_UAC_074
    Set Test Variable    ${SERVER_STATE_MACHINE}    AUTO_VoLTE_UAS_074
    ${TC_RESULT} =    START IMS AUTO
    log    ${TC_RESULT}

IMS_CALL_RRBS_DOWN_004
    [Documentation]    "To verify basic ims VoLTE MO call scenario with RRBS application goes down gracefully after the first Update request sent to RRBS during the IMS call when subscriber browse from Account balance case."
    [Tags]    CRIT_P1_IMS_CALL_RRBS_DOWN
    Set Test Variable    ${CLIENT_SERVER_SCENARIO}    ${1}
    Set Test Variable    ${SEAGULL_EXECUTION}    ${1}
    Set Test Variable    ${SEAGULL_EXECUTION_TYPE}    ${2}
    Set Test Variable    ${SEAGULL_SCENARIO_NAME}    IMS_PCRF_SCENARIO
    Set Test Variable    ${SEAGULL_SESSION_ID}    114
    Set Test Variable    ${CLIENT_STATE_MACHINE}    AUTO_VoLTE_UAC_075
    Set Test Variable    ${SERVER_STATE_MACHINE}    AUTO_VoLTE_UAS_075
    ${TC_RESULT} =    START IMS AUTO
    log    ${TC_RESULT}

IMS_CALL_RRBS_DOWN_005
    [Documentation]    "To verify basic ims VoLTE MO call scenario with RRBS application goes down gracefully after the first Update request sent to RRBS during the IMS call when subscriber browse from Bundle bucket case."
    [Tags]    CRIT_P1_IMS_CALL_RRBS_DOWN
    Set Test Variable    ${CLIENT_SERVER_SCENARIO}    ${1}
    Set Test Variable    ${SEAGULL_EXECUTION}    ${1}
    Set Test Variable    ${SEAGULL_EXECUTION_TYPE}    ${2}
    Set Test Variable    ${SEAGULL_SCENARIO_NAME}    IMS_PCRF_SCENARIO
    Set Test Variable    ${SEAGULL_SESSION_ID}    115
    Set Test Variable    ${CLIENT_STATE_MACHINE}    AUTO_VoLTE_UAC_076
    Set Test Variable    ${SERVER_STATE_MACHINE}    AUTO_VoLTE_UAS_076
    ${TC_RESULT} =    START IMS AUTO
    log    ${TC_RESULT}



*** Keywords ***


