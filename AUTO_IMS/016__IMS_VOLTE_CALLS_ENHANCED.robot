*** Settings ***
Documentation     IMS_VOLTE_CALLS_ENHANCED_TEST_SUITE
Suite Setup       SUITE STARTUP
Suite teardown    CLOSE EXISTING CONNECTION
Test Teardown     TEST STOP
Force Tags        IMS_VOLTE_CALLS_ENHANCED
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


AUTO_IMS_VoLTE_ENHANCED_A_NUM_REG
    [Documentation]    "To verify IMS VoLTE Registration of Calling A party msisdn."
    ...    "MSISDN-397458400201 and IMSI-264285300000211"
    [Tags]    CRIT_P1_IMS_VoLTE_CALL_REG
    Set Test Variable    ${STATE_MACHINE}    AUTO_IMS_ENHANCED_REG_CALLING
    ${TC_RESULT} =    START IMS AUTO
    log    ${TC_RESULT}

AUTO_IMS_VoLTE_ENHANCED_B_NUM_REG
    [Documentation]    "To verify IMS VoLTE Registration of Called B party msisdn."
    ...    "MSISDN-397458400202 and IMSI-264285300000212"
    [Tags]    CRIT_P1_IMS_VoLTE_CALL_REG
    Set Test Variable    ${STATE_MACHINE}    AUTO_IMS_ENHANCED_REG_CALLED
    ${TC_RESULT} =    START IMS AUTO
    log    ${TC_RESULT}

AUTO_IMS_VOLTE_CALLS_ENHANCED_001
    [Documentation]    "To Verify whether PCSCF Application is sending Transport parameter(TCP/UDP) in VoLTE-VoLTE Call-->INVITE request sent towards UE when TRANSPORT_FLAG=1 is enabled in PcscfConfig.xml"
    ...    "AMSISDN-397458400201,BMSISDN-397458400212 and A-IMSI-264285300000211,B-IMSI-264285300000212"
    [Tags]    CRIT_P1_IMS_VoLTE_MTCALL
    Set Test Variable    ${CLIENT_SERVER_SCENARIO}    ${1}
    Set Test Variable    ${SEAGULL_EXECUTION}    ${1}
    Set Test Variable    ${SEAGULL_EXECUTION_TYPE}    ${2}
    Set Test Variable    ${SEAGULL_SCENARIO_NAME}    IMS_PCRF_SCENARIO
    Set Test Variable    ${SEAGULL_CONFIG_NAME}    IMS_PCRF_AUTO_CONFIG_2
    Set Test Variable    ${SEAGULL_SESSION_ID}    203
    Set Test Variable    ${CLIENT_STATE_MACHINE}    AUTO_VoLTE_UAC_200
    Set Test Variable    ${SERVER_STATE_MACHINE}    AUTO_VoLTE_UAS_200
    ${TC_RESULT} =    START IMS AUTO
    log    ${TC_RESULT}

AUTO_IMS_VOLTE_CALLS_ENHANCED_002
    [Documentation]    "To Verify whether TAS Application is rejecting the VoLTE Call and sending '484 Address Incomplete' response to UAC when VoLTE-VoLTE call received with invalid dialing pattern"
    ...    "AMSISDN-397458400211,BMSISDN-397458400212"
    [Tags]    CRIT_P1_IMS_VoLTE_MTCALL
    Set Test Variable    ${STATE_MACHINE}    AUTO_VoLTE_UAC_201
    ${TC_RESULT} =    START IMS AUTO
    log    ${TC_RESULT}

AUTO_IMS_VOLTE_CALLS_ENHANCED_003
    [Documentation]    "To Verify whether TAS Application is rejecting the MO Call and sending '484 Address Incomplete' response to UAC when MO call received with invalid dialing pattern"
    ...    "AMSISDN-397458400211,BMSISDN-399898345678"
    [Tags]    CRIT_P1_IMS_VoLTE_MTCALL
    Set Test Variable    ${STATE_MACHINE}    AUTO_VoLTE_UAC_202
    ${TC_RESULT} =    START IMS AUTO
    log    ${TC_RESULT}

AUTO_IMS_VOLTE_CALLS_ENHANCED_004
    [Documentation]    "To Verify whether TAS Application is removing 'P-Asserted-Identity' and sending INVITE request to UAS during VOLTE-VOLTE call when REMOVE_PAID_HEADER=1 in TasConfig.xml"
    ...    "AMSISDN-397458400211,BMSISDN-397458400212 and A-IMSI-264285300000211,B-IMSI-264285300000212"
    [Tags]    CRIT_P1_IMS_VoLTE_MTCALL
    Set Test Variable    ${CLIENT_SERVER_SCENARIO}    ${1}
    Set Test Variable    ${SEAGULL_EXECUTION}    ${1}
    Set Test Variable    ${SEAGULL_EXECUTION_TYPE}    ${2}
    Set Test Variable    ${SEAGULL_SCENARIO_NAME}    IMS_PCRF_SCENARIO
    Set Test Variable    ${SEAGULL_CONFIG_NAME}    IMS_PCRF_AUTO_CONFIG_2
    Set Test Variable    ${SEAGULL_SESSION_ID}    203
    Set Test Variable    ${CLIENT_STATE_MACHINE}    AUTO_VoLTE_UAC_203
    Set Test Variable    ${SERVER_STATE_MACHINE}    AUTO_VoLTE_UAS_203
    ${TC_RESULT} =    START IMS AUTO
    log    ${TC_RESULT}

AUTO_IMS_VOLTE_CALLS_ENHANCED_005
    [Documentation]    "To Verify whether ICSCF application should not send "SBC-->Record-Route" details in Initial INVITE request during VoLTE MO Call when SBC_RECORD_ROUTE_FLAG=2 in IcscfConfig.xml"
    ...    "AMSISDN-397458400211,BMSISDN-399898345678 and A-IMSI-264285300000211,B-IMSI-264285300005678"
    [Tags]    CRIT_P1_IMS_VoLTE_MTCALL
    Set Test Variable    ${CLIENT_SERVER_SCENARIO}    ${1}
    Set Test Variable    ${CLIENT_STATE_MACHINE}    AUTO_VoLTE_UAC_204
    Set Test Variable    ${SERVER_STATE_MACHINE}    AUTO_VoLTE_UAS_204
    ${TC_RESULT} =    START IMS AUTO
    log    ${TC_RESULT}


AUTO_IMS_VOLTE_CALLS_ENHANCED_006
    [Documentation]    "To Verify the ICSCF Application behavior when it receives VoLTE-MT Call and SBC_RECORD_ROUTE_FLAG=2 in IcscfConfig.xml"
    ...    "AMSISDN-399898345678,BMSISDN-397458400212 and B-IMSI-264285300000212"
    [Tags]    CRIT_P1_IMS_VoLTE_MTCALL
    Set Test Variable    ${CLIENT_SERVER_SCENARIO}    ${1}
    Set Test Variable    ${CLIENT_STATE_MACHINE}    AUTO_VoLTE_UAC_205
    Set Test Variable    ${SERVER_STATE_MACHINE}    AUTO_VoLTE_UAS_205
    ${TC_RESULT} =    START IMS AUTO
    log    ${TC_RESULT}

AUTO_IMS_VOLTE_CALLS_ENHANCED_007
    [Documentation]    "To Verify the ICSCF Application behavior when it receives VoLTE-VoLTE Call and SBC_RECORD_ROUTE_FLAG=2 in IcscfConfig.xml"
    ...    "AMSISDN-397458400211,BMSISDN-397458400212 and A-IMSI-264285300000211,B-IMSI-264285300000212"
    [Tags]    CRIT_P1_IMS_VoLTE_MTCALL
    Set Test Variable    ${CLIENT_SERVER_SCENARIO}    ${1}
    Set Test Variable    ${CLIENT_STATE_MACHINE}    AUTO_VoLTE_UAC_206
    Set Test Variable    ${SERVER_STATE_MACHINE}    AUTO_VoLTE_UAS_206
    ${TC_RESULT} =    START IMS AUTO
    log    ${TC_RESULT}

AUTO_IMS_VOLTE_CALLS_ENHANCED_008
    [Documentation]    "To Verify whether ICSCF application should not send "SBC-->Record-Route" details in Initial INVITE request during IMS VoLTE MO call scenario to international number with double zero dialling when SBC_RECORD_ROUTE_FLAG=2 in IcscfConfig.xml"
    ...    "AMSISDN-397458400211,BMSISDN-399898345678 and A-IMSI-264285300000211,B-IMSI-264285300005678"
    [Tags]    CRIT_P1_IMS_VoLTE_MTCALL
    Set Test Variable    ${CLIENT_SERVER_SCENARIO}    ${1}
    Set Test Variable    ${CLIENT_STATE_MACHINE}    AUTO_VoLTE_UAC_208
    Set Test Variable    ${SERVER_STATE_MACHINE}    AUTO_VoLTE_UAS_208
    ${TC_RESULT} =    START IMS AUTO
    log    ${TC_RESULT}


AUTO_IMS_VoLTE_ENHANCED_E_NUM_REG
    [Documentation]    "To verify IMS VoLTE Registration of Calling E party msisdn."
    ...    "AMSISDN-397458400214,AIMSI=264285300000214"
    [Tags]    CRIT_P1_IMS_VoLTE_CALL_REG
    Set Test Variable    ${STATE_MACHINE}    AUTO_IMS_ENHANCED_REG_CALLING_E_NUMBER
    ${TC_RESULT} =    START IMS AUTO
    log    ${TC_RESULT}


AUTO_IMS_VOLTE_CALLS_ENHANCED_029
    [Documentation]    "PID-IMA-1461 To Verify whether SCSCF Application behavior when it receives VoLTE MO Call with Partially registered subscriber(REGISTERED_STATUS=RP in IMS DB)."
    ...    "AMSISDN-397458400211,BMSISDN-399898345678"
    [Tags]    CRIT_P1_IMS_VoLTE_MTCALL
    Set Test Variable    ${STATE_MACHINE}    AUTO_VoLTE_UAC_229
    ${TC_RESULT} =    START IMS AUTO
    log    ${TC_RESULT}



AUTO_IMS_VOLTE_CALLS_ENHANCED_030
    [Documentation]    "PID-IMA-1383 To Verify the  TAS Application behavior when it receives VoLTE MO call and ACK and BYE are received at same time & RRBS_CHARGEABLE_SECS_FLAG=1 in TAS configuration"
    ...    "AMSISDN-397458400201,BMSISDN-397458400202"
    [Tags]    CRIT_P1_IMS_VoLTE_MOCALL
    Set Test Variable    ${CLIENT_SERVER_SCENARIO}    ${1}
    Set Test Variable    ${CLIENT_STATE_MACHINE}    AUTO_VoLTE_UAC_230
    Set Test Variable    ${SERVER_STATE_MACHINE}    AUTO_VoLTE_UAS_230
    ${TC_RESULT} =    START IMS AUTO
    log    ${TC_RESULT}

AUTO_IMS_VOLTE_CALLS_ENHANCED_031
    [Documentation]    "PID-IMA-1383 To Verify the  TAS Application behavior when it receives VoLTE-VoLTE call and ACK and BYE are received at same time & RRBS_CHARGEABLE_SECS_FLAG=1 in TAS configuration"
    ...    "AMSISDN-397458400201,BMSISDN-399697989901"
    [Tags]    CRIT_P1_IMS_VoLTE_MOCALL
    Set Test Variable    ${CLIENT_SERVER_SCENARIO}    ${1}
    Set Test Variable    ${SEAGULL_EXECUTION}    ${1}
    Set Test Variable    ${SEAGULL_EXECUTION_TYPE}    ${2}
    Set Test Variable    ${SEAGULL_SCENARIO_NAME}    IMS_PCRF_SCENARIO
    Set Test Variable    ${SEAGULL_CONFIG_NAME}    IMS_PCRF_AUTO_CONFIG_2
    Set Test Variable    ${SEAGULL_SESSION_ID}    203
    Set Test Variable    ${CLIENT_STATE_MACHINE}    AUTO_VoLTE_UAC_231
    Set Test Variable    ${SERVER_STATE_MACHINE}    AUTO_VoLTE_UAS_231
    ${TC_RESULT} =    START IMS AUTO
    log    ${TC_RESULT}

AUTO_IMS_VOLTE_CALLS_ENHANCED_032
    [Documentation]    "PID-IMA-1383 To Verify the  TAS Application behavior when it receives VoLTE Mo call and 200 OK sent to UE, but no ACK for INVITE from UE & IGNORE_ACK_FOR_CHARGING_FLAG=1 in TAS configuration"
    ...    "AMSISDN-397458400201,BMSISDN-399697989901"
    [Tags]    CRIT_P1_IMS_VoLTE_MOCALL
    Set Test Variable    ${CLIENT_SERVER_SCENARIO}    ${1}
    Set Test Variable    ${CLIENT_STATE_MACHINE}    AUTO_VoLTE_UAC_232
    Set Test Variable    ${SERVER_STATE_MACHINE}    AUTO_VoLTE_UAS_232
    ${TC_RESULT} =    START IMS AUTO
    log    ${TC_RESULT}

AUTO_IMS_VOLTE_CALLS_ENHANCED_033
    [Documentation]    "PID-IMA-1383 To Verify the  TAS Application behavior when it receives VoLTE-VoLTE call and 200 OK sent to UE, but no ACK for INVITE from UE & IGNORE_ACK_FOR_CHARGING_FLAG=1 in TAS configuration"
    ...    "AMSISDN-397458400201,BMSISDN-397458400202"
    [Tags]    CRIT_P1_IMS_VoLTE_MOCALL
    Set Test Variable    ${CLIENT_SERVER_SCENARIO}    ${1}
    Set Test Variable    ${SEAGULL_EXECUTION}    ${1}
    Set Test Variable    ${SEAGULL_EXECUTION_TYPE}    ${2}
    Set Test Variable    ${SEAGULL_SCENARIO_NAME}    IMS_PCRF_SCENARIO
    Set Test Variable    ${SEAGULL_CONFIG_NAME}    IMS_PCRF_AUTO_CONFIG_2
    Set Test Variable    ${SEAGULL_SESSION_ID}    203
    Set Test Variable    ${CLIENT_STATE_MACHINE}    AUTO_VoLTE_UAC_233
    Set Test Variable    ${SERVER_STATE_MACHINE}    AUTO_VoLTE_UAS_233
    ${TC_RESULT} =    START IMS AUTO
    log    ${TC_RESULT}

AUTO_IMS_VOLTE_CALLS_ENHANCED_034
    [Documentation]    "PID-IMA-1383 To Verify whether TAS Application is adding To Tag in BYE request during VoLTE MO Call --> BYE request received without To Tag and ADD_TO_TAG_IN_SUBSEQUENT_REQUEST=1 in TAS Configuration"
    ...    "AMSISDN-397458400201,BMSISDN-399697989901"
    [Tags]    CRIT_P1_IMS_VoLTE_MOCALL
    Set Test Variable    ${CLIENT_SERVER_SCENARIO}    ${1}
    Set Test Variable    ${CLIENT_STATE_MACHINE}    AUTO_VoLTE_UAC_234
    Set Test Variable    ${SERVER_STATE_MACHINE}    AUTO_VoLTE_UAS_234
    ${TC_RESULT} =    START IMS AUTO
    log    ${TC_RESULT}

AUTO_IMS_VOLTE_CALLS_ENHANCED_035
    [Documentation]    "PID-IMA-1383 To Verify whether TAS Application is adding To Tag in BYE request during VoLTE-VoLTE Call --> BYE request received without To Tag and ADD_TO_TAG_IN_SUBSEQUENT_REQUEST=1 in TAS Configuration"
    ...    "AMSISDN-397458400201,BMSISDN-397458400202"
    [Tags]    CRIT_P1_IMS_VoLTE_MOCALL
    Set Test Variable    ${CLIENT_SERVER_SCENARIO}    ${1}
    Set Test Variable    ${CLIENT_STATE_MACHINE}    AUTO_VoLTE_UAC_235
    Set Test Variable    ${SERVER_STATE_MACHINE}    AUTO_VoLTE_UAS_235
    ${TC_RESULT} =    START IMS AUTO
    log    ${TC_RESULT}

AUTO_IMS_VOLTE_CALLS_ENHANCED_036
    [Documentation]    "PID-IMA-1383 To Verify whether TAS Application is adding To Tag in ACK request during VoLTE MO Call --> ACK request received without To Tag and ADD_TO_TAG_IN_SUBSEQUENT_REQUEST=1 in TAS Configuration"
    ...    "AMSISDN-397458400201,BMSISDN-399697989901"
    [Tags]    CRIT_P1_IMS_VoLTE_MOCALL
    Set Test Variable    ${CLIENT_SERVER_SCENARIO}    ${1}
    Set Test Variable    ${CLIENT_STATE_MACHINE}    AUTO_VoLTE_UAC_236
    Set Test Variable    ${SERVER_STATE_MACHINE}    AUTO_VoLTE_UAS_236
    ${TC_RESULT} =    START IMS AUTO
    log    ${TC_RESULT}

AUTO_IMS_VOLTE_CALLS_ENHANCED_037
    [Documentation]    "PID-IMA-1383 To Verify whether TAS Application is adding To Tag in ACK request during VoLTE-VoLTE Call --> ACK request received without To Tag and ADD_TO_TAG_IN_SUBSEQUENT_REQUEST=1 in TAS Configuration"
    ...    "AMSISDN-397458400201,BMSISDN-397458400202"
    [Tags]    CRIT_P1_IMS_VoLTE_MOCALL
    Set Test Variable    ${CLIENT_SERVER_SCENARIO}    ${1}
    Set Test Variable    ${CLIENT_STATE_MACHINE}    AUTO_VoLTE_UAC_237
    Set Test Variable    ${SERVER_STATE_MACHINE}    AUTO_VoLTE_UAS_237
    ${TC_RESULT} =    START IMS AUTO
    log    ${TC_RESULT}

AUTO_IMS_VOLTE_CALLS_ENHANCED_038
    [Documentation]    "PID-IMA-1383 To Verify whether TAS Application is adding To Tag in BYE & ACK request during VoLTE MO Call --> BYE & ACK request received without To Tag and ADD_TO_TAG_IN_SUBSEQUENT_REQUEST=1 in TAS Configuration"
    ...    "AMSISDN-397458400201,BMSISDN-399697989901"
    [Tags]    CRIT_P1_IMS_VoLTE_MOCALL
    Set Test Variable    ${CLIENT_SERVER_SCENARIO}    ${1}
    Set Test Variable    ${CLIENT_STATE_MACHINE}    AUTO_VoLTE_UAC_238
    Set Test Variable    ${SERVER_STATE_MACHINE}    AUTO_VoLTE_UAS_238
    ${TC_RESULT} =    START IMS AUTO
    log    ${TC_RESULT}

AUTO_IMS_VOLTE_CALLS_ENHANCED_039
    [Documentation]    "PID-IMA-1383 To Verify whether TAS Application is adding To Tag in BYE & ACK request during VoLTE-VoLTE Call --> BYE & ACK request received without To Tag and ADD_TO_TAG_IN_SUBSEQUENT_REQUEST=1 in TAS Configuration"
    ...    "AMSISDN-397458400201,BMSISDN-397458400202"
    [Tags]    CRIT_P1_IMS_VoLTE_MOCALL
    Set Test Variable    ${CLIENT_SERVER_SCENARIO}    ${1}
    Set Test Variable    ${CLIENT_STATE_MACHINE}    AUTO_VoLTE_UAC_239
    Set Test Variable    ${SERVER_STATE_MACHINE}    AUTO_VoLTE_UAS_239
    ${TC_RESULT} =    START IMS AUTO
    log    ${TC_RESULT}

AUTO_IMS_VOLTE_CALLS_ENHANCED_043
    [Documentation]    "PID-IMA-4511 To verify whether TAS Application is properly resetting Request timer when CCR-U response is received from RRBS during MO Call"
    ...    "AMSISDN-397458400201,BMSISDN-399697989901"
    [Tags]    CRIT_P1_IMS_VoLTE_MOCALL
    Set Test Variable    ${CLIENT_SERVER_SCENARIO}    ${1}
    Set Test Variable    ${CLIENT_STATE_MACHINE}    AUTO_VoLTE_UAC_243
    Set Test Variable    ${SERVER_STATE_MACHINE}    AUTO_VoLTE_UAS_243
    ${TC_RESULT} =    START IMS AUTO
    log    ${TC_RESULT}

AUTO_IMS_VOLTE_CALLS_ENHANCED_044
    [Documentation]    "PID-IMA-4511 To verify whether TAS Application is properly resetting Request timer when CCR-U response is received from RRBS during VoLTE-VoLTE Call"
    ...    "AMSISDN-397458400201,BMSISDN-397458400202"
    [Tags]    CRIT_P1_IMS_VoLTE_MOCALL
    Set Test Variable    ${CLIENT_SERVER_SCENARIO}    ${1}
    Set Test Variable    ${CLIENT_STATE_MACHINE}    AUTO_VoLTE_UAC_244
    Set Test Variable    ${SERVER_STATE_MACHINE}    AUTO_VoLTE_UAS_244
    ${TC_RESULT} =    START IMS AUTO
    log    ${TC_RESULT}



*** Keywords ***


