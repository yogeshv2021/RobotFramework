*** Settings ***
Documentation     IMS_VoLTE_CALL_ICSCF_TEST_SUITE
Suite Setup       SUITE STARTUP
Suite teardown    CLOSE EXISTING CONNECTION
Test Teardown     TEST STOP
Force Tags        IMS_VoLTE_ICSCF_CALL
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

AUTO_IMS_VoLTE_A_NUM_REG_6
    [Documentation]    "To verify IMS VoLTE Registration of Calling A party msisdn."
    ...    "AMSISDN-397458400001,AIMSI=264285300000001"
    [Tags]    CRIT_P1_IMS_VoLTE_CALL_REG
    Set Test Variable    ${STATE_MACHINE}    AUTO_IMS_REG_CALLING_3
    ${TC_RESULT} =    START IMS AUTO
    log    ${TC_RESULT}

AUTO_IMS_VoLTE_CALL_059
    [Documentation]    "To verify basic ims VoLTE A subscriber calling to same network B subscriber with IMS profile is not attached for the B subscriber and ICSCF forward the call to VF Trunk during LIR failure case."
    ...    "AMSISDN-397458400001,BMSISDN-397458400040"
    [Tags]    CRIT_P1_IMS_VoLTE_MTCALL
    Set Test Variable    ${CLIENT_SERVER_SCENARIO}    ${1}
    Set Test Variable    ${SEAGULL_EXECUTION}    ${1}
    Set Test Variable    ${SEAGULL_EXECUTION_TYPE}    ${2}
    Set Test Variable    ${SEAGULL_SCENARIO_NAME}    IMS_PCRF_SCENARIO
    Set Test Variable    ${SEAGULL_SESSION_ID}    243
    Set Test Variable    ${CLIENT_STATE_MACHINE}    AUTO_VoLTE_UAC_059
    Set Test Variable    ${SERVER_STATE_MACHINE}    AUTO_VoLTE_UAS_059
    ${TC_RESULT} =    START IMS AUTO
    log    ${TC_RESULT}

AUTO_IMS_VoLTE_A_NUM_REG_7
    [Documentation]    "To Verify IMS De_REGISTRATON for B-party."
    ...    "AMSISDN-397458400002"
    [Tags]    CRIT_P1_IMS_REG
    Set Test Variable    ${STATE_MACHINE}    AUTO_IMS_VoLTE_A_NUM_REG_7
    ${TC_RESULT} =    START IMS AUTO
    log    ${TC_RESULT}

AUTO_IMS_VoLTE_CALL_060
    [Documentation]    "To verify basic ims VoLTE A subscriber calling to same network B subscriber with B subscriber is deregistered from the IMS network."
    ...    "AMSISDN-397458400001,BMSISDN-397458400002"
    [Tags]    CRIT_P1_IMS_VoLTE_MTCALL
    Set Test Variable    ${CLIENT_SERVER_SCENARIO}    ${1}
    Set Test Variable    ${SEAGULL_EXECUTION}    ${1}
    Set Test Variable    ${SEAGULL_EXECUTION_TYPE}    ${2}
    Set Test Variable    ${SEAGULL_SCENARIO_NAME}    IMS_PCRF_SCENARIO
    Set Test Variable    ${SEAGULL_SESSION_ID}    244
    Set Test Variable    ${CLIENT_STATE_MACHINE}    AUTO_VoLTE_UAC_060
    Set Test Variable    ${SERVER_STATE_MACHINE}    AUTO_VoLTE_UAS_060
    ${TC_RESULT} =    START IMS AUTO
    log    ${TC_RESULT}

AUTO_IMS_VoLTE_CALL_061
    [Documentation]    "To verify basic ims VoLTE A subscriber calling to same network B subscriber with B subscriber is not registered in IMS netork and entry is not present in HSS_IMS_SUBS_DATA."
    ...    "AMSISDN-397458400001,BMSISDN-397458400002"
    [Tags]    CRIT_P1_IMS_VoLTE_MTCALL
    Set Test Variable    ${CLIENT_SERVER_SCENARIO}    ${1}
    Set Test Variable    ${SEAGULL_EXECUTION}    ${1}
    Set Test Variable    ${SEAGULL_EXECUTION_TYPE}    ${2}
    Set Test Variable    ${SEAGULL_SCENARIO_NAME}    IMS_PCRF_SCENARIO
    Set Test Variable    ${SEAGULL_SESSION_ID}    245
    Set Test Variable    ${CLIENT_STATE_MACHINE}    AUTO_VoLTE_UAC_061
    Set Test Variable    ${SERVER_STATE_MACHINE}    AUTO_VoLTE_UAS_061
    ${TC_RESULT} =    START IMS AUTO
    log    ${TC_RESULT}

AUTO_IMS_VoLTE_CALL_062
    [Documentation]    "To verify basic ims VoLTE A subscriber calling to other subscriber with B subscriber prefix mapped in ICSCF and B-party is not present in HLR table of HSS_IMS_SUBS_DATA and HLR_SUBS_MISISDN_ACCOUNT."
    ...    "AMSISDN-397458400001,BMSISDN-397458490001"
    [Tags]    CRIT_P1_IMS_VoLTE_MTCALL
    Set Test Variable    ${CLIENT_SERVER_SCENARIO}    ${1}
    Set Test Variable    ${SEAGULL_EXECUTION}    ${1}
    Set Test Variable    ${SEAGULL_EXECUTION_TYPE}    ${2}
    Set Test Variable    ${SEAGULL_SCENARIO_NAME}    IMS_PCRF_SCENARIO
    Set Test Variable    ${SEAGULL_SESSION_ID}    246
    Set Test Variable    ${CLIENT_STATE_MACHINE}    AUTO_VoLTE_UAC_062
    Set Test Variable    ${SERVER_STATE_MACHINE}    AUTO_VoLTE_UAS_062
    ${TC_RESULT} =    START IMS AUTO
    log    ${TC_RESULT}

AUTO_IMS_VoLTE_CALL_063
    [Documentation]    "To verify the Volte MO call when B-party MSISDN is prefixed with 39339(CC+NDC) and ICSCF application send Request URI to VF Trunk properly during the Volte MO call."
    ...    "AMSISDN-397458400001,BMSISDN-393392667939"
    [Tags]    CRIT_P1_IMS_VoLTE_MOCALL
    Set Test Variable    ${CLIENT_SERVER_SCENARIO}    ${1}
    Set Test Variable    ${SEAGULL_EXECUTION}    ${1}
    Set Test Variable    ${SEAGULL_EXECUTION_TYPE}    ${2}
    Set Test Variable    ${SEAGULL_SCENARIO_NAME}    IMS_PCRF_SCENARIO
    Set Test Variable    ${SEAGULL_SESSION_ID}    247
    Set Test Variable    ${CLIENT_STATE_MACHINE}    AUTO_VoLTE_UAC_063
    Set Test Variable    ${SERVER_STATE_MACHINE}    AUTO_VoLTE_UAS_063
    ${TC_RESULT} =    START IMS AUTO
    log    ${TC_RESULT}

AUTO_IMS_VoLTE_CALL_064
    [Documentation]    "To verify the Volte MO call when B-party MSISDN is prefixed with 339(NDC) without CC and ICSCF application send Request URI to VF Trunk properly during the Volte MO call."
    ...    "AMSISDN-397458400001,BMSISDN-3392667939"
    [Tags]    CRIT_P1_IMS_VoLTE_MOCALL
    Set Test Variable    ${CLIENT_SERVER_SCENARIO}    ${1}
    Set Test Variable    ${SEAGULL_EXECUTION}    ${1}
    Set Test Variable    ${SEAGULL_EXECUTION_TYPE}    ${2}
    Set Test Variable    ${SEAGULL_SCENARIO_NAME}    IMS_PCRF_SCENARIO
    Set Test Variable    ${SEAGULL_SESSION_ID}    248
    Set Test Variable    ${CLIENT_STATE_MACHINE}    AUTO_VoLTE_UAC_064
    Set Test Variable    ${SERVER_STATE_MACHINE}    AUTO_VoLTE_UAS_064
    ${TC_RESULT} =    START IMS AUTO
    log    ${TC_RESULT}

AUTO_IMS_VoLTE_CALL_065
    [Documentation]    "To verify the Volte MO call when B-party MSISDN is prefixed with 3939(NDC) and ICSCF application send Request URI to VF Trunk properly during the Volte MO call."
    ...    "AMSISDN-397458400001,BMSISDN-393926679391"
    [Tags]    CRIT_P1_IMS_VoLTE_MOCALL
    Set Test Variable    ${CLIENT_SERVER_SCENARIO}    ${1}
    Set Test Variable    ${SEAGULL_EXECUTION}    ${1}
    Set Test Variable    ${SEAGULL_EXECUTION_TYPE}    ${2}
    Set Test Variable    ${SEAGULL_SCENARIO_NAME}    IMS_PCRF_SCENARIO
    Set Test Variable    ${SEAGULL_SESSION_ID}    249
    Set Test Variable    ${CLIENT_STATE_MACHINE}    AUTO_VoLTE_UAC_065
    Set Test Variable    ${SERVER_STATE_MACHINE}    AUTO_VoLTE_UAS_065
    ${TC_RESULT} =    START IMS AUTO
    log    ${TC_RESULT}

AUTO_IMS_VoLTE_CALL_066
    [Documentation]    "To verify the Volte MO call when B-party MSISDN is prefixed with +39339(CC+NDC)Added Plus and ICSCF application send Request URI to VF Trunk properly during the Volte MO call."
    ...    "AMSISDN-397458400001,BMSISDN-393392667939"
    [Tags]    CRIT_P1_IMS_VoLTE_MOCALL
    Set Test Variable    ${CLIENT_SERVER_SCENARIO}    ${1}
    Set Test Variable    ${SEAGULL_EXECUTION}    ${1}
    Set Test Variable    ${SEAGULL_EXECUTION_TYPE}    ${2}
    Set Test Variable    ${SEAGULL_SCENARIO_NAME}    IMS_PCRF_SCENARIO
    Set Test Variable    ${SEAGULL_SESSION_ID}    250
    Set Test Variable    ${CLIENT_STATE_MACHINE}    AUTO_VoLTE_UAC_066
    Set Test Variable    ${SERVER_STATE_MACHINE}    AUTO_VoLTE_UAS_066
    ${TC_RESULT} =    START IMS AUTO
    log    ${TC_RESULT}

AUTO_IMS_VoLTE_CALL_067
    [Documentation]    "To verify the Volte MO call when B-party MSISDN is prefixed with +3939(NDC)Added Plus  and ICSCF application send Request URI to VF Trunk properly during the Volte MO call."
    ...    "AMSISDN-397458400001,BMSISDN-393926679391"
    [Tags]    CRIT_P1_IMS_VoLTE_MOCALL
    Set Test Variable    ${CLIENT_SERVER_SCENARIO}    ${1}
    Set Test Variable    ${SEAGULL_EXECUTION}    ${1}
    Set Test Variable    ${SEAGULL_EXECUTION_TYPE}    ${2}
    Set Test Variable    ${SEAGULL_SCENARIO_NAME}    IMS_PCRF_SCENARIO
    Set Test Variable    ${SEAGULL_SESSION_ID}    251
    Set Test Variable    ${CLIENT_STATE_MACHINE}    AUTO_VoLTE_UAC_067
    Set Test Variable    ${SERVER_STATE_MACHINE}    AUTO_VoLTE_UAS_067
    ${TC_RESULT} =    START IMS AUTO
    log    ${TC_RESULT}

AUTO_IMS_VoLTE_CALL_068
    [Documentation]    "To verify the Volte MO call when B-party MSISDN is prefixed with 00339(CC+NDC)Added 00 and ICSCF application send Request URI to VF Trunk properly during the Volte MO call."
    ...    "AMSISDN-397458400001,BMSISDN-00393392667939"
    [Tags]    CRIT_P1_IMS_VoLTE_MOCALL
    Set Test Variable    ${CLIENT_SERVER_SCENARIO}    ${1}
    Set Test Variable    ${SEAGULL_EXECUTION}    ${1}
    Set Test Variable    ${SEAGULL_EXECUTION_TYPE}    ${2}
    Set Test Variable    ${SEAGULL_SCENARIO_NAME}    IMS_PCRF_SCENARIO
    Set Test Variable    ${SEAGULL_SESSION_ID}    252
    Set Test Variable    ${CLIENT_STATE_MACHINE}    AUTO_VoLTE_UAC_068
    Set Test Variable    ${SERVER_STATE_MACHINE}    AUTO_VoLTE_UAS_068
    ${TC_RESULT} =    START IMS AUTO
    log    ${TC_RESULT}

AUTO_IMS_VoLTE_CALL_069
    [Documentation]    "To verify the Volte MO call when B-party MSISDN is prefixed with 0039(NDC)Added 00  and ICSCF application send Request URI to VF Trunk properly during the Volte MO call."
    ...    "AMSISDN-397458400001,BMSISDN-00393926679391"
    [Tags]    CRIT_P1_IMS_VoLTE_MOCALL
    Set Test Variable    ${CLIENT_SERVER_SCENARIO}    ${1}
    Set Test Variable    ${SEAGULL_EXECUTION}    ${1}
    Set Test Variable    ${SEAGULL_EXECUTION_TYPE}    ${2}
    Set Test Variable    ${SEAGULL_SCENARIO_NAME}    IMS_PCRF_SCENARIO
    Set Test Variable    ${SEAGULL_SESSION_ID}    253
    Set Test Variable    ${CLIENT_STATE_MACHINE}    AUTO_VoLTE_UAC_069
    Set Test Variable    ${SERVER_STATE_MACHINE}    AUTO_VoLTE_UAS_069
    ${TC_RESULT} =    START IMS AUTO
    log    ${TC_RESULT}

AUTO_IMS_VoLTE_CALL_070
    [Documentation]    "To verify the Volte MO call when B-party MSISDN is prefixed with 0339(CC+NDC)Added 0 and ICSCF application send Request URI to VF Trunk properly during the Volte MO call."
    ...    "AMSISDN-397458400001,BMSISDN-03392667939"
    [Tags]    CRIT_P1_IMS_VoLTE_MOCALL
    Set Test Variable    ${CLIENT_SERVER_SCENARIO}    ${1}
    Set Test Variable    ${SEAGULL_EXECUTION}    ${1}
    Set Test Variable    ${SEAGULL_EXECUTION_TYPE}    ${2}
    Set Test Variable    ${SEAGULL_SCENARIO_NAME}    IMS_PCRF_SCENARIO
    Set Test Variable    ${SEAGULL_SESSION_ID}    254
    Set Test Variable    ${CLIENT_STATE_MACHINE}    AUTO_VoLTE_UAC_070
    Set Test Variable    ${SERVER_STATE_MACHINE}    AUTO_VoLTE_UAS_070
    ${TC_RESULT} =    START IMS AUTO
    log    ${TC_RESULT}

AUTO_IMS_VoLTE_CALL_071
    [Documentation]    "To verify the Volte MO call when B-party MSISDN is prefixed with 039(NDC)Added 0  and ICSCF application send Request URI to VF Trunk properly during the Volte MO call."
    ...    "AMSISDN-397458400001,BMSISDN-03926679391"
    [Tags]    CRIT_P1_IMS_VoLTE_MOCALL
    Set Test Variable    ${CLIENT_SERVER_SCENARIO}    ${1}
    Set Test Variable    ${SEAGULL_EXECUTION}    ${1}
    Set Test Variable    ${SEAGULL_EXECUTION_TYPE}    ${2}
    Set Test Variable    ${SEAGULL_SCENARIO_NAME}    IMS_PCRF_SCENARIO
    Set Test Variable    ${SEAGULL_SESSION_ID}    255
    Set Test Variable    ${CLIENT_STATE_MACHINE}    AUTO_VoLTE_UAC_071
    Set Test Variable    ${SERVER_STATE_MACHINE}    AUTO_VoLTE_UAS_071
    ${TC_RESULT} =    START IMS AUTO
    log    ${TC_RESULT}


AUTO_IMS_VoLTE_A_NUM_REG_11
    [Documentation]    "To verify IMS VoLTE Registration of Calling A party msisdn for the Busy here case."
    ...    "AMSISDN-397458400027"
    [Tags]    CRIT_P1_IMS_VoLTE_CALL_REG
    Set Test Variable    ${STATE_MACHINE}    AUTO_IMS_REG_CALLING_1
    ${TC_RESULT} =    START IMS AUTO
    log    ${TC_RESULT}

AUTO_IMS_VoLTE_B_NUM_REG_11
    [Documentation]    "To verify IMS VoLTE Registration of Called B party msisdn for the Busy here case."
    ...    "AMSISDN-397458400028"
    [Tags]    CRIT_P1_IMS_VoLTE_CALL_REG
    Set Test Variable    ${STATE_MACHINE}    AUTO_IMS_REG_CALLED_1
    ${TC_RESULT} =    START IMS AUTO
    log    ${TC_RESULT}

AUTO_IMS_VoLTE_CALL_101
    [Documentation]    "TO verify whether I-CSCF is handling the call when UE-B is terminating the call immediately with 486 Busy after 183 Session Progress."
    ...    "AMSISDN-397458400027,BMSISDN-397458400028"
    [Tags]    CRIT_P1_IMS_VoLTE_MOCALL
    Set Test Variable    ${CLIENT_SERVER_SCENARIO}    ${1}
    Set Test Variable    ${CLIENT_STATE_MACHINE}    AUTO_VoLTE_UAC_101
    Set Test Variable    ${SERVER_STATE_MACHINE}    AUTO_VoLTE_UAS_101
    ${TC_RESULT} =    START IMS AUTO
    log    ${TC_RESULT}

AUTO_IMS_VoLTE_CALL_102
    [Documentation]    "TO verify whether P-CSCF is handling the call when UE-A is terminating the call immediately with CANCEL request after 183 Session Progress."
    ...    "AMSISDN-397458400001,BMSISDN-399898345678"
    [Tags]    CRIT_P1_IMS_VoLTE_MOCALL
    Set Test Variable    ${CLIENT_SERVER_SCENARIO}    ${1}
    Set Test Variable    ${CLIENT_STATE_MACHINE}    AUTO_VoLTE_UAC_102
    Set Test Variable    ${SERVER_STATE_MACHINE}    AUTO_VoLTE_UAS_102
    ${TC_RESULT} =    START IMS AUTO
    log    ${TC_RESULT}

AUTO_IMS_VoLTE_CALL_103
    [Documentation]    "TO verify whether 182 Queuing Response is handled by I-CSCF application when 182 is sent by UE-B after 180 Ringing."
    ...    "AMSISDN-397458400001,BMSISDN-399898345678"
    [Tags]    CRIT_P1_IMS_VoLTE_MOCALL
    Set Test Variable    ${CLIENT_SERVER_SCENARIO}    ${1}
    Set Test Variable    ${SEAGULL_EXECUTION}    ${1}
    Set Test Variable    ${SEAGULL_EXECUTION_TYPE}    ${2}
    Set Test Variable    ${SEAGULL_SCENARIO_NAME}    IMS_PCRF_SCENARIO
    Set Test Variable    ${SEAGULL_SESSION_ID}    263
    Set Test Variable    ${CLIENT_STATE_MACHINE}    AUTO_VoLTE_UAC_103
    Set Test Variable    ${SERVER_STATE_MACHINE}    AUTO_VoLTE_UAS_103	
    ${TC_RESULT} =    START IMS AUTO
    log    ${TC_RESULT}

AUTO_IMS_VoLTE_CALL_104
    [Documentation]    "TO verify whether I-CSCF application is not sending 182 Queuing Response to other IMS nodes and handling the Bye request from UE-A when 182 Queuing Response is sent by UE-B after ACK request."
    ...    "AMSISDN-397458400001,BMSISDN-399898345678"
    [Tags]    CRIT_P1_IMS_VoLTE_MOCALL
    Set Test Variable    ${CLIENT_SERVER_SCENARIO}    ${1}
    Set Test Variable    ${SEAGULL_EXECUTION}    ${1}
    Set Test Variable    ${SEAGULL_EXECUTION_TYPE}    ${2}
    Set Test Variable    ${SEAGULL_SCENARIO_NAME}    IMS_PCRF_SCENARIO
    Set Test Variable    ${SEAGULL_SESSION_ID}    264
    Set Test Variable    ${CLIENT_STATE_MACHINE}    AUTO_VoLTE_UAC_104
    Set Test Variable    ${SERVER_STATE_MACHINE}    AUTO_VoLTE_UAS_104	
    ${TC_RESULT} =    START IMS AUTO
    log    ${TC_RESULT}

AUTO_IMS_VoLTE_CALL_105
    [Documentation]    "TO verify whether I-CSCF application is not sending 182 Queuing Response to other IMS nodes and handling the 200 OK for the Bye request from UE-A when 182 Queuing Response is sent by UE-B after BYE request."
    ...    "AMSISDN-397458400001,BMSISDN-399898345678"
    [Tags]    CRIT_P1_IMS_VoLTE_MOCALL
    Set Test Variable    ${CLIENT_SERVER_SCENARIO}    ${1}
    Set Test Variable    ${SEAGULL_EXECUTION}    ${1}
    Set Test Variable    ${SEAGULL_EXECUTION_TYPE}    ${2}
    Set Test Variable    ${SEAGULL_SCENARIO_NAME}    IMS_PCRF_SCENARIO
    Set Test Variable    ${SEAGULL_SESSION_ID}    265
    Set Test Variable    ${CLIENT_STATE_MACHINE}    AUTO_VoLTE_UAC_105
    Set Test Variable    ${SERVER_STATE_MACHINE}    AUTO_VoLTE_UAS_105	
    ${TC_RESULT} =    START IMS AUTO
    log    ${TC_RESULT}

AUTO_IMS_VoLTE_CALL_108
    [Documentation]    "To verify whether I-CSCF application is not dumping core when retry-after optional parameter is sent from UE-B as Retry-After 120 (Iam in a meeting) while sending 503 Service Unavailable."
    ...    "AMSISDN-397458400027"
    [Tags]    CRIT_P1_IMS_VoLTE_MTCALL
    Set Test Variable    ${CLIENT_SERVER_SCENARIO}    ${1}
    Set Test Variable    ${CLIENT_STATE_MACHINE}    AUTO_VoLTE_UAC_108
    Set Test Variable    ${SERVER_STATE_MACHINE}    AUTO_VoLTE_UAS_108
    ${TC_RESULT} =    START IMS AUTO
    log    ${TC_RESULT}

AUTO_IMS_VoLTE_CALL_109
    [Documentation]    "To verify whether I-CSCF application is not dumping core when retry-after optional parameter is sent from UE-B as Retry-After 120 (Iam in a meeting) while sending 500 Server Internal Error."
    ...    "AMSISDN-397458400027"
    [Tags]    CRIT_P1_IMS_VoLTE_MTCALL
    Set Test Variable    ${CLIENT_SERVER_SCENARIO}    ${1}
    Set Test Variable    ${CLIENT_STATE_MACHINE}    AUTO_VoLTE_UAC_109
    Set Test Variable    ${SERVER_STATE_MACHINE}    AUTO_VoLTE_UAS_109
    ${TC_RESULT} =    START IMS AUTO
    log    ${TC_RESULT}

AUTO_IMS_VoLTE_CALL_110
    [Documentation]    "To verify whether I-CSCF application is not dumping core when retry-after optional parameter is sent from UE-B as Retry-After 120 (Iam in a meeting) while sending 404 Not Found."
    ...    "AMSISDN-397458400027"
    [Tags]    CRIT_P1_IMS_VoLTE_MTCALL
    Set Test Variable    ${CLIENT_SERVER_SCENARIO}    ${1}
    Set Test Variable    ${CLIENT_STATE_MACHINE}    AUTO_VoLTE_UAC_110
    Set Test Variable    ${SERVER_STATE_MACHINE}    AUTO_VoLTE_UAS_110
    ${TC_RESULT} =    START IMS AUTO
    log    ${TC_RESULT}

AUTO_IMS_VoLTE_CALL_111
    [Documentation]    "To verify whether I-CSCF application is not dumping core when retry-after optional parameter is sent from UE-B as Retry-After 18000 duration=3600 while sending 503 Service Unavailable."
    ...    "AMSISDN-397458400027"
    [Tags]    CRIT_P1_IMS_VoLTE_MTCALL
    Set Test Variable    ${CLIENT_SERVER_SCENARIO}    ${1}
    Set Test Variable    ${CLIENT_STATE_MACHINE}    AUTO_VoLTE_UAC_111
    Set Test Variable    ${SERVER_STATE_MACHINE}    AUTO_VoLTE_UAS_111
    ${TC_RESULT} =    START IMS AUTO
    log    ${TC_RESULT}

AUTO_IMS_VoLTE_CALL_112
    [Documentation]    "To verify whether I-CSCF application is not dumping core when retry-after optional parameter is sent from UE-B as Retry-After 18000 duration=3600 while sending 500 Server Internal Error."
    ...    "AMSISDN-397458400027"
    [Tags]    CRIT_P1_IMS_VoLTE_MTCALL
    Set Test Variable    ${CLIENT_SERVER_SCENARIO}    ${1}
    Set Test Variable    ${CLIENT_STATE_MACHINE}    AUTO_VoLTE_UAC_112
    Set Test Variable    ${SERVER_STATE_MACHINE}    AUTO_VoLTE_UAS_112
    ${TC_RESULT} =    START IMS AUTO
    log    ${TC_RESULT}

AUTO_IMS_VoLTE_CALL_113
    [Documentation]    "To verify whether I-CSCF application is not dumping core when retry-after optional parameter is sent from UE-B as 18000;duration=3600  while sending 404 Not Found."
    ...    "AMSISDN-397458400027"
    [Tags]    CRIT_P1_IMS_VoLTE_MTCALL
    Set Test Variable    ${CLIENT_SERVER_SCENARIO}    ${1}
    Set Test Variable    ${CLIENT_STATE_MACHINE}    AUTO_VoLTE_UAC_113
    Set Test Variable    ${SERVER_STATE_MACHINE}    AUTO_VoLTE_UAS_113
    ${TC_RESULT} =    START IMS AUTO
    log    ${TC_RESULT}

AUTO_IMS_VoLTE_CALL_114
    [Documentation]    "To verify whether I-CSCF application is not dumping core when retry-after optional parameter is sent from UE-B as Retry-After 18000 while sending 503 Service Unavailable."
    ...    "AMSISDN-397458400027"
    [Tags]    CRIT_P1_IMS_VoLTE_MTCALL
    Set Test Variable    ${CLIENT_SERVER_SCENARIO}    ${1}
    Set Test Variable    ${CLIENT_STATE_MACHINE}    AUTO_VoLTE_UAC_114
    Set Test Variable    ${SERVER_STATE_MACHINE}    AUTO_VoLTE_UAS_114
    ${TC_RESULT} =    START IMS AUTO
    log    ${TC_RESULT}

AUTO_IMS_VoLTE_CALL_115
    [Documentation]    "To verify whether I-CSCF application is not dumping core when retry-after optional parameter is sent from UE-B as Retry-After 18000 while sending 500 Server Internal Error."
    ...    "AMSISDN-397458400027"
    [Tags]    CRIT_P1_IMS_VoLTE_MTCALL
    Set Test Variable    ${CLIENT_SERVER_SCENARIO}    ${1}
    Set Test Variable    ${CLIENT_STATE_MACHINE}    AUTO_VoLTE_UAC_115
    Set Test Variable    ${SERVER_STATE_MACHINE}    AUTO_VoLTE_UAS_115
    ${TC_RESULT} =    START IMS AUTO
    log    ${TC_RESULT}

AUTO_IMS_VoLTE_CALL_116
    [Documentation]    "To verify whether I-CSCF application is not dumping core when retry-after optional parameter is sent from UE-B as 18000 while sending 404 Not Found."
    ...    "AMSISDN-397458400027"
    [Tags]    CRIT_P1_IMS_VoLTE_MTCALL
    Set Test Variable    ${CLIENT_SERVER_SCENARIO}    ${1}
    Set Test Variable    ${CLIENT_STATE_MACHINE}    AUTO_VoLTE_UAC_116
    Set Test Variable    ${SERVER_STATE_MACHINE}    AUTO_VoLTE_UAS_116
    ${TC_RESULT} =    START IMS AUTO
    log    ${TC_RESULT}


AUTO_IMS_VoLTE_B_NUM_REG_18
    [Documentation]    "To verify IMS VoLTE Registration of Portin subscriber who opted into our Network and the subscriber is porting in from Wind Network(falls in Wind CCNCC in Icscf configuration) to Lyca Network."
    ...    "AMSISDN-397458400001"
    [Tags]    CRIT_P1_IMS_VoLTE_CALL_REG
    Set Test Variable    ${STATE_MACHINE}    AUTO_IMS_REG_CALLED_18
    ${TC_RESULT} =    START IMS AUTO
    log    ${TC_RESULT}

AUTO_IMS_VoLTE_A_NUM_REG_13
    [Documentation]    "To verify IMS VoLTE Registration of Calling A party msisdn who will be calling the Ported out Subscriber."
    ...    "AMSISDN-393203203201"
    [Tags]    CRIT_P1_IMS_VoLTE_CALL_REG
    Set Test Variable    ${STATE_MACHINE}    AUTO_IMS_REG_CALLING_13
    ${TC_RESULT} =    START IMS AUTO
    log    ${TC_RESULT}

AUTO_IMS_VoLTE_B_NUM_REG_19
    [Documentation]    "To verify IMS VoLTE Registration of Portin subscriber who opted into our Network and the subscriber is porting in from Airtel Network to Lyca Network."
    ...    "AMSISDN-395203203201"
    [Tags]    CRIT_P1_IMS_VoLTE_CALL_REG
    Set Test Variable    ${STATE_MACHINE}    AUTO_IMS_REG_CALLED_19
    ${TC_RESULT} =    START IMS AUTO
    log    ${TC_RESULT}

AUTO_IMS_VoLTE_CALL_134
    [Documentation]    "To verify basic ims VoLTE call scenario in which B-Pary is a Ported in Subscriber and the subscriber is porting in from Wind Network(falls in Wind CCNCC in Icscf configuration) to Lyca Network."
    ...    "AMSISDN-395203203201"
    [Tags]    CRIT_P1_IMS_VoLTE_MTCALL
    Set Test Variable    ${CLIENT_SERVER_SCENARIO}    ${1}
    Set Test Variable    ${CLIENT_STATE_MACHINE}    AUTO_VoLTE_UAC_134
    Set Test Variable    ${SERVER_STATE_MACHINE}    AUTO_VoLTE_UAS_134
    ${TC_RESULT} =    START IMS AUTO
    log    ${TC_RESULT}

AUTO_IMS_VoLTE_CALL_135
    [Documentation]    "To verify basic ims VoLTE call scenario in which B-Pary is a Ported in Subscriber and the subscriber is porting in from Airtel Network(doesn't falls in Wind CCNCC in Icscf configuration) to Lyca Network."
    ...    "AMSISDN-397458400001,BMSISDN-395203203201"
    [Tags]    CRIT_P1_IMS_VoLTE_MTCALL
    Set Test Variable    ${CLIENT_SERVER_SCENARIO}    ${1}
    Set Test Variable    ${CLIENT_STATE_MACHINE}    AUTO_VoLTE_UAC_135
    Set Test Variable    ${SERVER_STATE_MACHINE}    AUTO_VoLTE_UAS_135
    ${TC_RESULT} =    START IMS AUTO
    log    ${TC_RESULT}

AUTO_IMS_VoLTE_CALL_136
    [Documentation]    "To verify basic ims VoLTE call scenario in which B-Party is a Ported out Subscriber from Lyca Network to Wind Network."
    ...    "AMSISDN-397458400001,BMSISDN-397458401000"
    [Tags]    CRIT_P1_IMS_VoLTE_MTCALL
    Set Test Variable    ${CLIENT_SERVER_SCENARIO}    ${1}
    Set Test Variable    ${CLIENT_STATE_MACHINE}    AUTO_VoLTE_UAC_136
    Set Test Variable    ${SERVER_STATE_MACHINE}    AUTO_VoLTE_UAS_136
    ${TC_RESULT} =    START IMS AUTO
    log    ${TC_RESULT}

AUTO_IMS_VoLTE_CALL_137
    [Documentation]    "To verify basic ims VoLTE call scenario in which B-Party is a Ported out Subscriber from Wind Network to Airtel Network."
    ...    "AMSISDN-397458400001,BMSISDN-397458401001"
    [Tags]    CRIT_P1_IMS_VoLTE_MTCALL
    Set Test Variable    ${CLIENT_SERVER_SCENARIO}    ${1}
    Set Test Variable    ${CLIENT_STATE_MACHINE}    AUTO_VoLTE_UAC_137
    Set Test Variable    ${SERVER_STATE_MACHINE}    AUTO_VoLTE_UAS_137
    ${TC_RESULT} =    START IMS AUTO
    log    ${TC_RESULT}

AUTO_IMS_VoLTE_CALL_138
    [Documentation]    "To verify basic ims VoLTE call scenario in which B-Party is a Ported out Subscriber from Airtel Network to Idea Network and CCNDC falls in Home CCNDC list."
    ...    "AMSISDN-397458400001,BMSISDN-397458401002"
    [Tags]    CRIT_P1_IMS_VoLTE_MTCALL
    Set Test Variable    ${CLIENT_SERVER_SCENARIO}    ${1}
    Set Test Variable    ${CLIENT_STATE_MACHINE}    AUTO_VoLTE_UAC_138
    Set Test Variable    ${SERVER_STATE_MACHINE}    AUTO_VoLTE_UAS_138
    ${TC_RESULT} =    START IMS AUTO
    log    ${TC_RESULT}

AUTO_IMS_VoLTE_CALL_139
    [Documentation]    "To verify basic ims VoLTE call scenario in which B-Party is a Ported out Subscriber from Airtel Network to Idea Network and CCNDC falls in Wind CCNDC list."
    ...    "AMSISDN-397458400001,BMSISDN-393203203202"
    [Tags]    CRIT_P1_IMS_VoLTE_MTCALL
    Set Test Variable    ${CLIENT_SERVER_SCENARIO}    ${1}
    Set Test Variable    ${CLIENT_STATE_MACHINE}    AUTO_VoLTE_UAC_139
    Set Test Variable    ${SERVER_STATE_MACHINE}    AUTO_VoLTE_UAS_139
    ${TC_RESULT} =    START IMS AUTO
    log    ${TC_RESULT}

AUTO_IMS_VoLTE_CALL_140
    [Documentation]    "To verify basic ims VoLTE call scenario in which B-party number prefix is 456+MSISDN and TAS application send the Long number to RRBS application as a special number and there is no charging applied for the subscriber."
    ...    "AMSISDN-397458400001,BMSISDN-4561231231230"
    [Tags]    CRIT_P1_IMS_VoLTE_MTCALL
    Set Test Variable    ${CLIENT_SERVER_SCENARIO}    ${1}
    Set Test Variable    ${CLIENT_STATE_MACHINE}    AUTO_VoLTE_UAC_140
    Set Test Variable    ${SERVER_STATE_MACHINE}    AUTO_VoLTE_UAS_140
    ${TC_RESULT} =    START IMS AUTO
    log    ${TC_RESULT}

AUTO_IMS_VoLTE_CALL_141
    [Documentation]    "To verify basic ims VoLTE call scenario in which B-party number prefix is 456+CC+MSISDN and TAS application send the Long number to RRBS application as a special number and there is no charging applied for the subscriber."
    ...    "AMSISDN-397458400001,BMSISDN-456391231231230"
    [Tags]    CRIT_P1_IMS_VoLTE_MTCALL
    Set Test Variable    ${CLIENT_SERVER_SCENARIO}    ${1}
    Set Test Variable    ${CLIENT_STATE_MACHINE}    AUTO_VoLTE_UAC_141
    Set Test Variable    ${SERVER_STATE_MACHINE}    AUTO_VoLTE_UAS_141
    ${TC_RESULT} =    START IMS AUTO
    log    ${TC_RESULT}

AUTO_IMS_VoLTE_CALL_142
    [Documentation]    "To verify basic ims VoLTE call scenario in which B-Pary is a Wind Network(falls in Wind CCNCC in Icscf configuration) and I-CSCF application send  the prefix of WIND_SPECIAL_ROUTING_PREFIX in Request URI."
    ...    "AMSISDN-397458400001,BMSISDN-456391231231230"
    [Tags]    CRIT_P1_IMS_VoLTE_MTCALL
    Set Test Variable    ${CLIENT_SERVER_SCENARIO}    ${1}
    Set Test Variable    ${CLIENT_STATE_MACHINE}    AUTO_VoLTE_UAC_142
    Set Test Variable    ${SERVER_STATE_MACHINE}    AUTO_VoLTE_UAS_142
    ${TC_RESULT} =    START IMS AUTO
    log    ${TC_RESULT}

AUTO_IMS_VoLTE_ENHANCED_C_NUM_REG
    [Documentation]    "To verify IMS VoLTE Registration of Calling C party msisdn."
    ...    "AMSISDN-397458400211,AIMSI=264285300000211"
    [Tags]    CRIT_P1_IMS_VoLTE_CALL_REG
    Set Test Variable    ${STATE_MACHINE}    AUTO_IMS_ENHANCED_REG_CALLING_C_NUMBER
    ${TC_RESULT} =    START IMS AUTO
    log    ${TC_RESULT}


AUTO_IMS_VOLTE_CALLS_ENHANCED_009
    [Documentation]    "POF-6356-To verify the Volte MO call when B-party MSISDN is prefixed with 39984(CC+NDC) and ICSCF application send Request URI to FNO Network System properly during the Volte MO call."
    ...    "AMSISDN-397458400211,BMSISDN-399842667939"
    [Tags]    CRIT_P1_IMS_VoLTE_MOCALL
    Set Test Variable    ${CLIENT_SERVER_SCENARIO}    ${1}
    Set Test Variable    ${SEAGULL_EXECUTION}    ${1}
    Set Test Variable    ${SEAGULL_EXECUTION_TYPE}    ${2}
    Set Test Variable    ${SEAGULL_SCENARIO_NAME}    IMS_PCRF_SCENARIO
    Set Test Variable    ${SEAGULL_SESSION_ID}    247
    Set Test Variable    ${CLIENT_STATE_MACHINE}    AUTO_VoLTE_UAC_209
    Set Test Variable    ${SERVER_STATE_MACHINE}    AUTO_VoLTE_UAS_209
    ${TC_RESULT} =    START IMS AUTO
    log    ${TC_RESULT}

AUTO_IMS_VOLTE_CALLS_ENHANCED_010
    [Documentation]    "POF-6356-To verify the Volte MO call when B-party MSISDN is prefixed with 984(NDC) without CC and ICSCF application send Request URI to FNO Network System properly during the Volte MO call."
    ...    "AMSISDN-397458400211,BMSISDN-399842667939"
    [Tags]    CRIT_P1_IMS_VoLTE_MOCALL
    Set Test Variable    ${CLIENT_SERVER_SCENARIO}    ${1}
    Set Test Variable    ${SEAGULL_EXECUTION}    ${1}
    Set Test Variable    ${SEAGULL_EXECUTION_TYPE}    ${2}
    Set Test Variable    ${SEAGULL_SCENARIO_NAME}    IMS_PCRF_SCENARIO
    Set Test Variable    ${SEAGULL_SESSION_ID}    247
    Set Test Variable    ${CLIENT_STATE_MACHINE}    AUTO_VoLTE_UAC_210
    Set Test Variable    ${SERVER_STATE_MACHINE}    AUTO_VoLTE_UAS_210
    ${TC_RESULT} =    START IMS AUTO
    log    ${TC_RESULT}

AUTO_IMS_VOLTE_CALLS_ENHANCED_011
    [Documentation]    "POF-6356-To verify the Volte MO call when B-party MSISDN is prefixed with 3988(CC+NDC) and ICSCF application send Request URI to FNO Network System properly during the Volte MO call."
    ...    "AMSISDN-397458400211,BMSISDN-398826679391"
    [Tags]    CRIT_P1_IMS_VoLTE_MOCALL
    Set Test Variable    ${CLIENT_SERVER_SCENARIO}    ${1}
    Set Test Variable    ${SEAGULL_EXECUTION}    ${1}
    Set Test Variable    ${SEAGULL_EXECUTION_TYPE}    ${2}
    Set Test Variable    ${SEAGULL_SCENARIO_NAME}    IMS_PCRF_SCENARIO
    Set Test Variable    ${SEAGULL_SESSION_ID}    247
    Set Test Variable    ${CLIENT_STATE_MACHINE}    AUTO_VoLTE_UAC_211
    Set Test Variable    ${SERVER_STATE_MACHINE}    AUTO_VoLTE_UAS_211
    ${TC_RESULT} =    START IMS AUTO
    log    ${TC_RESULT}

AUTO_IMS_VOLTE_CALLS_ENHANCED_012
    [Documentation]    "POF-6356-To verify the Volte MO call when B-party MSISDN is prefixed with +39984(CC+NDC)Added Plus and ICSCF application send Request URI to FNO Network System properly during the Volte MO call."
    ...    "AMSISDN-397458400211,BMSISDN-399842667939"
    [Tags]    CRIT_P1_IMS_VoLTE_MOCALL
    Set Test Variable    ${CLIENT_SERVER_SCENARIO}    ${1}
    Set Test Variable    ${SEAGULL_EXECUTION}    ${1}
    Set Test Variable    ${SEAGULL_EXECUTION_TYPE}    ${2}
    Set Test Variable    ${SEAGULL_SCENARIO_NAME}    IMS_PCRF_SCENARIO
    Set Test Variable    ${SEAGULL_SESSION_ID}    247
    Set Test Variable    ${CLIENT_STATE_MACHINE}    AUTO_VoLTE_UAC_212
    Set Test Variable    ${SERVER_STATE_MACHINE}    AUTO_VoLTE_UAS_212
    ${TC_RESULT} =    START IMS AUTO
    log    ${TC_RESULT}

AUTO_IMS_VOLTE_CALLS_ENHANCED_013
    [Documentation]    "POF-6356-To verify the Volte MO call when B-party MSISDN is prefixed with +3988(CC+NDC)Added Plus and ICSCF application send Request URI to FNO Network System properly during the Volte MO call."
    ...    "AMSISDN-397458400211,BMSISDN-398826679391"
    [Tags]    CRIT_P1_IMS_VoLTE_MOCALL
    Set Test Variable    ${CLIENT_SERVER_SCENARIO}    ${1}
    Set Test Variable    ${SEAGULL_EXECUTION}    ${1}
    Set Test Variable    ${SEAGULL_EXECUTION_TYPE}    ${2}
    Set Test Variable    ${SEAGULL_SCENARIO_NAME}    IMS_PCRF_SCENARIO
    Set Test Variable    ${SEAGULL_SESSION_ID}    247
    Set Test Variable    ${CLIENT_STATE_MACHINE}    AUTO_VoLTE_UAC_213
    Set Test Variable    ${SERVER_STATE_MACHINE}    AUTO_VoLTE_UAS_213
    ${TC_RESULT} =    START IMS AUTO
    log    ${TC_RESULT}

AUTO_IMS_VOLTE_CALLS_ENHANCED_014
    [Documentation]    "POF-6356-To verify the Volte MO call when B-party MSISDN is prefixed with +984(NDC)Added Plus  and ICSCF application send Request URI to FNO Network System properly during the Volte MO call."
    ...    "AMSISDN-397458400211,BMSISDN-399842667939"
    [Tags]    CRIT_P1_IMS_VoLTE_MOCALL
    Set Test Variable    ${CLIENT_SERVER_SCENARIO}    ${1}
    Set Test Variable    ${SEAGULL_EXECUTION}    ${1}
    Set Test Variable    ${SEAGULL_EXECUTION_TYPE}    ${2}
    Set Test Variable    ${SEAGULL_SCENARIO_NAME}    IMS_PCRF_SCENARIO
    Set Test Variable    ${SEAGULL_SESSION_ID}    247
    Set Test Variable    ${CLIENT_STATE_MACHINE}    AUTO_VoLTE_UAC_214
    Set Test Variable    ${SERVER_STATE_MACHINE}    AUTO_VoLTE_UAS_214
    ${TC_RESULT} =    START IMS AUTO
    log    ${TC_RESULT}

AUTO_IMS_VOLTE_CALLS_ENHANCED_015
    [Documentation]    "POF-6356-To verify the Volte MO call when B-party MSISDN is prefixed with 0039984(CC+NDC)Added 00 and ICSCF application send Request URI to FNO Network System properly during the Volte MO call."
    ...    "AMSISDN-397458400211,BMSISDN-399842667939"
    [Tags]    CRIT_P1_IMS_VoLTE_MOCALL
    Set Test Variable    ${CLIENT_SERVER_SCENARIO}    ${1}
    Set Test Variable    ${SEAGULL_EXECUTION}    ${1}
    Set Test Variable    ${SEAGULL_EXECUTION_TYPE}    ${2}
    Set Test Variable    ${SEAGULL_SCENARIO_NAME}    IMS_PCRF_SCENARIO
    Set Test Variable    ${SEAGULL_SESSION_ID}    247
    Set Test Variable    ${CLIENT_STATE_MACHINE}    AUTO_VoLTE_UAC_215
    Set Test Variable    ${SERVER_STATE_MACHINE}    AUTO_VoLTE_UAS_215
    ${TC_RESULT} =    START IMS AUTO
    log    ${TC_RESULT}

AUTO_IMS_VOLTE_CALLS_ENHANCED_016
    [Documentation]    "POF-6356-To verify the Volte MO call when B-party MSISDN is prefixed with 003988(CC+NDC)Added 00  and ICSCF application send Request URI to FNO Network System properly during the Volte MO call."
    ...    "AMSISDN-397458400211,BMSISDN-399842667939"
    [Tags]    CRIT_P1_IMS_VoLTE_MOCALL
    Set Test Variable    ${CLIENT_SERVER_SCENARIO}    ${1}
    Set Test Variable    ${SEAGULL_EXECUTION}    ${1}
    Set Test Variable    ${SEAGULL_EXECUTION_TYPE}    ${2}
    Set Test Variable    ${SEAGULL_SCENARIO_NAME}    IMS_PCRF_SCENARIO
    Set Test Variable    ${SEAGULL_SESSION_ID}    247
    Set Test Variable    ${CLIENT_STATE_MACHINE}    AUTO_VoLTE_UAC_216
    Set Test Variable    ${SERVER_STATE_MACHINE}    AUTO_VoLTE_UAS_216
    ${TC_RESULT} =    START IMS AUTO
    log    ${TC_RESULT}

AUTO_IMS_VOLTE_CALLS_ENHANCED_017
    [Documentation]    "POF-6356-To verify the Volte MO call when B-party MSISDN is prefixed with 0984(CC+NDC)Added 0 and ICSCF application send Request URI to FNO Network System properly during the Volte MO call."
    ...    "AMSISDN-397458400211,BMSISDN-399842667939"
    [Tags]    CRIT_P1_IMS_VoLTE_MOCALL
    Set Test Variable    ${CLIENT_SERVER_SCENARIO}    ${1}
    Set Test Variable    ${SEAGULL_EXECUTION}    ${1}
    Set Test Variable    ${SEAGULL_EXECUTION_TYPE}    ${2}
    Set Test Variable    ${SEAGULL_SCENARIO_NAME}    IMS_PCRF_SCENARIO
    Set Test Variable    ${SEAGULL_SESSION_ID}    247
    Set Test Variable    ${CLIENT_STATE_MACHINE}    AUTO_VoLTE_UAC_217
    Set Test Variable    ${SERVER_STATE_MACHINE}    AUTO_VoLTE_UAS_217
    ${TC_RESULT} =    START IMS AUTO
    log    ${TC_RESULT}

AUTO_IMS_VOLTE_CALLS_ENHANCED_018
    [Documentation]    "POF-6356-To verify the Volte MO call when B-party MSISDN is prefixed with 088(NDC)Added 0  and ICSCF application send Request URI to FNO Network System properly during the Volte MO call."
    ...    "AMSISDN-397458400211,BMSISDN-399842667939"
    [Tags]    CRIT_P1_IMS_VoLTE_MOCALL
    Set Test Variable    ${CLIENT_SERVER_SCENARIO}    ${1}
    Set Test Variable    ${SEAGULL_EXECUTION}    ${1}
    Set Test Variable    ${SEAGULL_EXECUTION_TYPE}    ${2}
    Set Test Variable    ${SEAGULL_SCENARIO_NAME}    IMS_PCRF_SCENARIO
    Set Test Variable    ${SEAGULL_SESSION_ID}    247
    Set Test Variable    ${CLIENT_STATE_MACHINE}    AUTO_VoLTE_UAC_218
    Set Test Variable    ${SERVER_STATE_MACHINE}    AUTO_VoLTE_UAS_218
    ${TC_RESULT} =    START IMS AUTO
    log    ${TC_RESULT}

AUTO_IMS_VoLTE_ENHANCED_D_NUM_REG
    [Documentation]    "To verify IMS VoLTE Registration of Calling D party msisdn."
    ...    "AMSISDN-397458400212,AIMSI=264285300000212"
    [Tags]    CRIT_P1_IMS_VoLTE_CALL_REG
    Set Test Variable    ${STATE_MACHINE}    AUTO_IMS_ENHANCED_REG_CALLING_D_NUMBER
    ${TC_RESULT} =    START IMS AUTO
    log    ${TC_RESULT}


AUTO_IMS_VOLTE_CALLS_ENHANCED_019
    [Documentation]    "POF-6356-To verify the Volte MO call when B-party MSISDN is prefixed with 39568(CC+NDC) and ICSCF application send Request URI to BASE_MNO Network System properly during the Volte MO call."
    ...    "AMSISDN-397458400212,BMSISDN-395683782076"
    [Tags]    CRIT_P1_IMS_VoLTE_MOCALL
    Set Test Variable    ${CLIENT_SERVER_SCENARIO}    ${1}
    Set Test Variable    ${SEAGULL_EXECUTION}    ${1}
    Set Test Variable    ${SEAGULL_EXECUTION_TYPE}    ${2}
    Set Test Variable    ${SEAGULL_SCENARIO_NAME}    IMS_PCRF_SCENARIO
    Set Test Variable    ${SEAGULL_SESSION_ID}    247
    Set Test Variable    ${CLIENT_STATE_MACHINE}    AUTO_VoLTE_UAC_219
    Set Test Variable    ${SERVER_STATE_MACHINE}    AUTO_VoLTE_UAS_219
    ${TC_RESULT} =    START IMS AUTO
    log    ${TC_RESULT}

AUTO_IMS_VOLTE_CALLS_ENHANCED_020
    [Documentation]    "POF-6356-To verify the Volte MO call when B-party MSISDN is prefixed with 568(NDC) without CC and ICSCF application send Request URI to BASE_MNO Network System properly during the Volte MO call."
    ...    "AMSISDN-397458400212,BMSISDN-395683782076"
    [Tags]    CRIT_P1_IMS_VoLTE_MOCALL
    Set Test Variable    ${CLIENT_SERVER_SCENARIO}    ${1}
    Set Test Variable    ${SEAGULL_EXECUTION}    ${1}
    Set Test Variable    ${SEAGULL_EXECUTION_TYPE}    ${2}
    Set Test Variable    ${SEAGULL_SCENARIO_NAME}    IMS_PCRF_SCENARIO
    Set Test Variable    ${SEAGULL_SESSION_ID}    247
    Set Test Variable    ${CLIENT_STATE_MACHINE}    AUTO_VoLTE_UAC_220
    Set Test Variable    ${SERVER_STATE_MACHINE}    AUTO_VoLTE_UAS_220
    ${TC_RESULT} =    START IMS AUTO
    log    ${TC_RESULT}

AUTO_IMS_VOLTE_CALLS_ENHANCED_021
    [Documentation]    "POF-6356-To verify the Volte MO call when B-party MSISDN is prefixed with 3972(CC+NDC) and ICSCF application send Request URI to BASE_MNO Network System properly during the Volte MO call."
    ...    "AMSISDN-397458400212,BMSISDN-397212894224"
    [Tags]    CRIT_P1_IMS_VoLTE_MOCALL
    Set Test Variable    ${CLIENT_SERVER_SCENARIO}    ${1}
    Set Test Variable    ${SEAGULL_EXECUTION}    ${1}
    Set Test Variable    ${SEAGULL_EXECUTION_TYPE}    ${2}
    Set Test Variable    ${SEAGULL_SCENARIO_NAME}    IMS_PCRF_SCENARIO
    Set Test Variable    ${SEAGULL_SESSION_ID}    247
    Set Test Variable    ${CLIENT_STATE_MACHINE}    AUTO_VoLTE_UAC_221
    Set Test Variable    ${SERVER_STATE_MACHINE}    AUTO_VoLTE_UAS_221
    ${TC_RESULT} =    START IMS AUTO
    log    ${TC_RESULT}

AUTO_IMS_VOLTE_CALLS_ENHANCED_022
    [Documentation]    "POF-6356-To verify the Volte MO call when B-party MSISDN is prefixed with 72(NDC) without CC and ICSCF application send Request URI to BASE_MNO Network System properly during the Volte MO call."
    ...    "AMSISDN-397458400212,BMSISDN-397212894224"
    [Tags]    CRIT_P1_IMS_VoLTE_MOCALL
    Set Test Variable    ${CLIENT_SERVER_SCENARIO}    ${1}
    Set Test Variable    ${SEAGULL_EXECUTION}    ${1}
    Set Test Variable    ${SEAGULL_EXECUTION_TYPE}    ${2}
    Set Test Variable    ${SEAGULL_SCENARIO_NAME}    IMS_PCRF_SCENARIO
    Set Test Variable    ${SEAGULL_SESSION_ID}    247
    Set Test Variable    ${CLIENT_STATE_MACHINE}    AUTO_VoLTE_UAC_222
    Set Test Variable    ${SERVER_STATE_MACHINE}    AUTO_VoLTE_UAS_222
    ${TC_RESULT} =    START IMS AUTO
    log    ${TC_RESULT}

AUTO_IMS_VOLTE_CALLS_ENHANCED_023
    [Documentation]    "POF-6356-To verify the Volte MO call when B-party MSISDN is prefixed with +3972(CC+NDC)Added Plus and ICSCF application send Request URI to BASE_MNO Network System properly during the Volte MO call."
    ...    "AMSISDN-397458400212,BMSISDN-395683782076"
    [Tags]    CRIT_P1_IMS_VoLTE_MOCALL
    Set Test Variable    ${CLIENT_SERVER_SCENARIO}    ${1}
    Set Test Variable    ${SEAGULL_EXECUTION}    ${1}
    Set Test Variable    ${SEAGULL_EXECUTION_TYPE}    ${2}
    Set Test Variable    ${SEAGULL_SCENARIO_NAME}    IMS_PCRF_SCENARIO
    Set Test Variable    ${SEAGULL_SESSION_ID}    247
    Set Test Variable    ${CLIENT_STATE_MACHINE}    AUTO_VoLTE_UAC_223
    Set Test Variable    ${SERVER_STATE_MACHINE}    AUTO_VoLTE_UAS_223
    ${TC_RESULT} =    START IMS AUTO
    log    ${TC_RESULT}

AUTO_IMS_VOLTE_CALLS_ENHANCED_024
    [Documentation]    "POF-6356-To verify the Volte MO call when B-party MSISDN is prefixed with 0039568(CC+NDC)Added 00 and ICSCF application send Request URI to BASE_MNO Network System properly during the Volte MO call."
    ...    "AMSISDN-397458400212,BMSISDN-395683782076"
    [Tags]    CRIT_P1_IMS_VoLTE_MOCALL
    Set Test Variable    ${CLIENT_SERVER_SCENARIO}    ${1}
    Set Test Variable    ${SEAGULL_EXECUTION}    ${1}
    Set Test Variable    ${SEAGULL_EXECUTION_TYPE}    ${2}
    Set Test Variable    ${SEAGULL_SCENARIO_NAME}    IMS_PCRF_SCENARIO
    Set Test Variable    ${SEAGULL_SESSION_ID}    247
    Set Test Variable    ${CLIENT_STATE_MACHINE}    AUTO_VoLTE_UAC_224
    Set Test Variable    ${SERVER_STATE_MACHINE}    AUTO_VoLTE_UAS_224
    ${TC_RESULT} =    START IMS AUTO
    log    ${TC_RESULT}

AUTO_IMS_VOLTE_CALLS_ENHANCED_025
    [Documentation]    "POF-6356-To verify the Volte MO call when B-party MSISDN is prefixed with 003972(CC+NDC)Added 00  and ICSCF application send Request URI to BASE_MNO Network System properly during the Volte MO call."
    ...    "AMSISDN-397458400212,BMSISDN-397212894224"
    [Tags]    CRIT_P1_IMS_VoLTE_MOCALL
    Set Test Variable    ${CLIENT_SERVER_SCENARIO}    ${1}
    Set Test Variable    ${SEAGULL_EXECUTION}    ${1}
    Set Test Variable    ${SEAGULL_EXECUTION_TYPE}    ${2}
    Set Test Variable    ${SEAGULL_SCENARIO_NAME}    IMS_PCRF_SCENARIO
    Set Test Variable    ${SEAGULL_SESSION_ID}    247
    Set Test Variable    ${CLIENT_STATE_MACHINE}    AUTO_VoLTE_UAC_225
    Set Test Variable    ${SERVER_STATE_MACHINE}    AUTO_VoLTE_UAS_225
    ${TC_RESULT} =    START IMS AUTO
    log    ${TC_RESULT}

AUTO_IMS_VOLTE_CALLS_ENHANCED_026
    [Documentation]    "POF-6356-To verify the Volte MO call when B-party MSISDN is prefixed with 0568(CC+NDC)Added 0 and ICSCF application send Request URI to BASE_MNO Network System properly during the Volte MO call."
    ...    "AMSISDN-397458400212,BMSISDN-395683782076"
    [Tags]    CRIT_P1_IMS_VoLTE_MOCALL
    Set Test Variable    ${CLIENT_SERVER_SCENARIO}    ${1}
    Set Test Variable    ${SEAGULL_EXECUTION}    ${1}
    Set Test Variable    ${SEAGULL_EXECUTION_TYPE}    ${2}
    Set Test Variable    ${SEAGULL_SCENARIO_NAME}    IMS_PCRF_SCENARIO
    Set Test Variable    ${SEAGULL_SESSION_ID}    247
    Set Test Variable    ${CLIENT_STATE_MACHINE}    AUTO_VoLTE_UAC_226
    Set Test Variable    ${SERVER_STATE_MACHINE}    AUTO_VoLTE_UAS_226
    ${TC_RESULT} =    START IMS AUTO
    log    ${TC_RESULT}

AUTO_IMS_VOLTE_CALLS_ENHANCED_027
    [Documentation]    "POF-6356-To verify the Volte MO call when B-party MSISDN is prefixed with 072(NDC)Added 0  and ICSCF application send Request URI to BASE_MNO Network System properly during the Volte MO call."
    ...    "AMSISDN-397458400212,BMSISDN-397212894224"
    [Tags]    CRIT_P1_IMS_VoLTE_MOCALL
    Set Test Variable    ${CLIENT_SERVER_SCENARIO}    ${1}
    Set Test Variable    ${SEAGULL_EXECUTION}    ${1}
    Set Test Variable    ${SEAGULL_EXECUTION_TYPE}    ${2}
    Set Test Variable    ${SEAGULL_SCENARIO_NAME}    IMS_PCRF_SCENARIO
    Set Test Variable    ${SEAGULL_SESSION_ID}    247
    Set Test Variable    ${CLIENT_STATE_MACHINE}    AUTO_VoLTE_UAC_227
    Set Test Variable    ${SERVER_STATE_MACHINE}    AUTO_VoLTE_UAS_227
    ${TC_RESULT} =    START IMS AUTO
    log    ${TC_RESULT}

AUTO_IMS_VOLTE_CALLS_ENHANCED_028
    [Documentation]    "POF-6356-To verify the Volte MO call when B-party MSISDN is Ported in subscriber  and ICSCF application send Request URI to BASE_MNO Network System properly during the Volte MO call."
    ...    "AMSISDN-397458400212,BMSISDN-396684840098"
    [Tags]    CRIT_P1_IMS_VoLTE_MOCALL
    Set Test Variable    ${CLIENT_SERVER_SCENARIO}    ${1}
    Set Test Variable    ${SEAGULL_EXECUTION}    ${1}
    Set Test Variable    ${SEAGULL_EXECUTION_TYPE}    ${2}
    Set Test Variable    ${SEAGULL_SCENARIO_NAME}    IMS_PCRF_SCENARIO
    Set Test Variable    ${SEAGULL_SESSION_ID}    247
    Set Test Variable    ${CLIENT_STATE_MACHINE}    AUTO_VoLTE_UAC_228
    Set Test Variable    ${SERVER_STATE_MACHINE}    AUTO_VoLTE_UAS_228
    ${TC_RESULT} =    START IMS AUTO
    log    ${TC_RESULT}

AUTO_IMS_VoLTE_ENHANCED_F_NUM_REG
    [Documentation]    "To verify IMS VoLTE Registration of Calling F party msisdn."
    ...    "AMSISDN-397458400213,AIMSI=264285300000213"
    [Tags]    CRIT_P1_IMS_VoLTE_CALL_REG
    Set Test Variable    ${STATE_MACHINE}    AUTO_IMS_ENHANCED_REG_CALLING_F_NUMBER
    ${TC_RESULT} =    START IMS AUTO
    log    ${TC_RESULT}


AUTO_IMS_VOLTE_CALLS_ENHANCED_040
    [Documentation]    "PID-IMA-4011-To Verify whether ICSCF application is properly sending INVITE request to UGC when it receives MO International call without +(plus) prefix before CC"
    ...    "AMSISDN-397458400213,BMSISDN-904848782076"
    [Tags]    CRIT_P1_IMS_VoLTE_MOCALL
    Set Test Variable    ${CLIENT_SERVER_SCENARIO}    ${1}
    Set Test Variable    ${CLIENT_STATE_MACHINE}    AUTO_VoLTE_UAC_240
    Set Test Variable    ${SERVER_STATE_MACHINE}    AUTO_VoLTE_UAS_240
    ${TC_RESULT} =    START IMS AUTO
    log    ${TC_RESULT}


AUTO_IMS_VOLTE_CALLS_ENHANCED_041
    [Documentation]    "PID-IMA-4011-To Verify whether ICSCF application is correctly finding MO International call received without +(plus) prefix before CC"
    ...    "AMSISDN-397458400213,BMSISDN-904848782076"
    [Tags]    CRIT_P1_IMS_VoLTE_MOCALL
    Set Test Variable    ${CLIENT_SERVER_SCENARIO}    ${1}
    Set Test Variable    ${CLIENT_STATE_MACHINE}    AUTO_VoLTE_UAC_241
    Set Test Variable    ${SERVER_STATE_MACHINE}    AUTO_VoLTE_UAS_241
    ${TC_RESULT} =    START IMS AUTO
    log    ${TC_RESULT}

AUTO_IMS_VOLTE_CALLS_ENHANCED_042
    [Documentation]    "PID-IMA-4011-To Verify whether ICSCF application is properly adding Call Prefix before forwarding INVITE request to UGC when ICSCF application receives MO International call without +(plus) prefix before CC"
    ...    "AMSISDN-397458400213,BMSISDN-904848782076"
    [Tags]    CRIT_P1_IMS_VoLTE_MOCALL
    Set Test Variable    ${CLIENT_SERVER_SCENARIO}    ${1}
    Set Test Variable    ${CLIENT_STATE_MACHINE}    AUTO_VoLTE_UAC_242
    Set Test Variable    ${SERVER_STATE_MACHINE}    AUTO_VoLTE_UAS_242
    ${TC_RESULT} =    START IMS AUTO
    log    ${TC_RESULT}




*** Keywords ***


