*** Settings ***
Documentation     IMS_VOLTE_ROAMING_TEST_SUITE
Suite Setup       SUITE STARTUP
Suite teardown    CLOSE EXISTING CONNECTION
Test Teardown     TEST STOP
Force Tags        IMS_VOLTE_ROAMING
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

AUTO_IMS_ROAMING_REG_001
    [Documentation]    "To Verify IMS VoLte Roaming Registration."
    [Tags]    CRIT_P1_IMS_REG   
    Set Test Variable    ${STATE_MACHINE}    AUTO_IMS_ROAMING_REG_001
    Set Test Variable    @{PCAP_XML_CONVERSION_END_STRING}    -Y sip -V | sed -n '/Session Initiation Protocol/,/Content-Length/p' | sed 's/^ *//' | sed '/Session Initiation Protocol/i ###############@@@@@@@@NEW SIP MESSAGE@@@@@@@@@##################\n'
    Set Test Variable    ${PCAP_PROTO_GREP}    egrep -hi 'Request-Line:|Status-Line:|CSeq:' 
    Set Test Variable    ${PCAP_PROTO_GREP_END_STRING}    | egrep -v 'egrep|OPTIONS'
    Set Test Variable    ${PROTOCOL_VALIDATION_TYPE}    1
    ${TC_RESULT} =    START IMS AUTO
    log    ${TC_RESULT}

AUTO_IMS_ROAMING_REG_002
    [Documentation]    "To Verify IMS VoLte Roaming Re-Registration."
    [Tags]    CRIT_P1_IMS_REG
    Set Test Variable    ${STATE_MACHINE}    AUTO_IMS_ROAMING_REG_002
    Set Test Variable    @{PCAP_XML_CONVERSION_END_STRING}    -Y sip -V | sed -n '/Session Initiation Protocol/,/Content-Length/p' | sed 's/^ *//' | sed '/Session Initiation Protocol/i ###############@@@@@@@@NEW SIP MESSAGE@@@@@@@@@##################\n'
    Set Test Variable    ${PCAP_PROTO_GREP}    egrep -hi 'Request-Line:|Status-Line:|CSeq:' 
    Set Test Variable    ${PCAP_PROTO_GREP_END_STRING}    | egrep -v 'egrep|OPTIONS'
    Set Test Variable    ${PROTOCOL_VALIDATION_TYPE}    1
    ${TC_RESULT} =    START IMS AUTO
    log    ${TC_RESULT}

AUTO_IMS_ROAMING_REG_003
    [Documentation]    "To Verify IMS VoLte Roaming De-Registration."
    [Tags]    CRIT_P1_IMS_REG
    Set Test Variable    ${STATE_MACHINE}    AUTO_IMS_ROAMING_REG_003
    Set Test Variable    @{PCAP_XML_CONVERSION_END_STRING}    -Y sip -V | sed -n '/Session Initiation Protocol/,/Content-Length/p' | sed 's/^ *//' | sed '/Session Initiation Protocol/i ###############@@@@@@@@NEW SIP MESSAGE@@@@@@@@@##################\n'
    Set Test Variable    ${PCAP_PROTO_GREP}    egrep -hi 'Request-Line|Path:'
    Set Test Variable    ${PCAP_PROTO_GREP_END_STRING}    | egrep -v 'egrep|OPTIONS|.145:|.143:5601|.143:5602'
    ${TC_RESULT} =    START IMS AUTO
    log    ${TC_RESULT}

AUTO_IMS_ROAMING_REG_004
    [Documentation]    "To Verify the PCSCF Application behavior when it receives negative AAR response from PCRF during REGISTER(after 401 Unauthorized) request when SEND_AAR_FOR_REGISTER_FLAG=1 in PcscfConfig.xml."
    [Tags]    CRIT_P1_IMS_REG   
    Set Test Variable    ${STATE_MACHINE}    AUTO_IMS_ROAMING_REG_004
    Set Test Variable    @{PCAP_XML_CONVERSION_END_STRING}    -Y sip -V | sed -n '/Session Initiation Protocol/,/Content-Length/p' | sed 's/^ *//' | sed '/Session Initiation Protocol/i ###############@@@@@@@@NEW SIP MESSAGE@@@@@@@@@##################\n'
    Set Test Variable    ${PCAP_PROTO_GREP}    egrep -hi 'Request-Line:|Status-Line:|CSeq:' 
    Set Test Variable    ${PCAP_PROTO_GREP_END_STRING}    | egrep -v 'egrep|OPTIONS'
    Set Test Variable    ${PROTOCOL_VALIDATION_TYPE}    1
    ${TC_RESULT} =    START IMS AUTO
    log    ${TC_RESULT}


AUTO_IMS_ROAMING_REG_005
    [Documentation]    "To Verify whether PCSCF Application should not send AAR request to PCRF during REGISTER(after 401 Unauthorized) request when SEND_AAR_FOR_REGISTER_FLAG=0 in PcscfConfig.xml and REJECT_REG_IF_MCC_MNC_UNAVAIL_FLAG=1 in ScscfConfig.xml."
    [Tags]    CRIT_P1_IMS_REG   
    Set Test Variable    ${STATE_MACHINE}    AUTO_IMS_ROAMING_REG_005
    Set Test Variable    @{PCAP_XML_CONVERSION_END_STRING}    -Y sip -V | sed -n '/Session Initiation Protocol/,/Content-Length/p' | sed 's/^ *//' | sed '/Session Initiation Protocol/i ###############@@@@@@@@NEW SIP MESSAGE@@@@@@@@@##################\n'
    Set Test Variable    ${PCAP_PROTO_GREP}    egrep -hi 'Request-Line:|Status-Line:|CSeq:' 
    Set Test Variable    ${PCAP_PROTO_GREP_END_STRING}    | egrep -v 'egrep|OPTIONS'
    Set Test Variable    ${PROTOCOL_VALIDATION_TYPE}    1
    ${TC_RESULT} =    START IMS AUTO
    log    ${TC_RESULT}



AUTO_IMS_ROAMING_REG_006
    [Documentation]    "To Verify the SCSCF Application behavior when it receives REGISTER request without MCC_MNC in "REGISTER-->P-Visited-Network-ID"  request from ICSCF and REJECT_REG_IF_MCC_MNC_UNAVAIL_FLAG=0 in ScscfConfig.xml."
    [Tags]    CRIT_P1_IMS_REG   
    Set Test Variable    ${STATE_MACHINE}    AUTO_IMS_ROAMING_REG_006
    Set Test Variable    @{PCAP_XML_CONVERSION_END_STRING}    -Y sip -V | sed -n '/Session Initiation Protocol/,/Content-Length/p' | sed 's/^ *//' | sed '/Session Initiation Protocol/i ###############@@@@@@@@NEW SIP MESSAGE@@@@@@@@@##################\n'
    Set Test Variable    ${PCAP_PROTO_GREP}    egrep -hi 'Request-Line:|Status-Line:|CSeq:' 
    Set Test Variable    ${PCAP_PROTO_GREP_END_STRING}    | egrep -v 'egrep|OPTIONS'
    Set Test Variable    ${PROTOCOL_VALIDATION_TYPE}    1
    ${TC_RESULT} =    START IMS AUTO
    log    ${TC_RESULT}


AUTO_IMS_ROAMING_REG_007
    [Documentation]    "To Verify the SCSCF Application behavior when it receives REGISTER request with MCC_MNC in "REGISTER-->P-Visited-Network-ID"  request from ICSCF and REJECT_REG_IF_MCC_MNC_UNAVAIL_FLAG=0 in ScscfConfig.xml."
    [Tags]    CRIT_P1_IMS_REG   
    Set Test Variable    ${STATE_MACHINE}    AUTO_IMS_ROAMING_REG_007
    Set Test Variable    @{PCAP_XML_CONVERSION_END_STRING}    -Y sip -V | sed -n '/Session Initiation Protocol/,/Content-Length/p' | sed 's/^ *//' | sed '/Session Initiation Protocol/i ###############@@@@@@@@NEW SIP MESSAGE@@@@@@@@@##################\n'
    Set Test Variable    ${PCAP_PROTO_GREP}    egrep -hi 'Request-Line:|Status-Line:|CSeq:' 
    Set Test Variable    ${PCAP_PROTO_GREP_END_STRING}    | egrep -v 'egrep|OPTIONS'
    Set Test Variable    ${PROTOCOL_VALIDATION_TYPE}    1
    ${TC_RESULT} =    START IMS AUTO
    log    ${TC_RESULT}


AUTO_IMS_ROAMING_REG_008
    [Documentation]    "To Verify whether SCSCF Application behavior when it receives REGISTER request with MCC_MNC in "REGISTER-->P-Visited-Network-ID"  request from ICSCF and REJECT_REG_IF_MCC_MNC_UNAVAIL_FLAG=1  in ScscfConfig.xml."
    [Tags]    CRIT_P1_IMS_REG   
    Set Test Variable    ${STATE_MACHINE}    AUTO_IMS_ROAMING_REG_008
    Set Test Variable    @{PCAP_XML_CONVERSION_END_STRING}    -Y sip -V | sed -n '/Session Initiation Protocol/,/Content-Length/p' | sed 's/^ *//' | sed '/Session Initiation Protocol/i ###############@@@@@@@@NEW SIP MESSAGE@@@@@@@@@##################\n'
    Set Test Variable    ${PCAP_PROTO_GREP}    egrep -hi 'Request-Line:|Status-Line:|CSeq:' 
    Set Test Variable    ${PCAP_PROTO_GREP_END_STRING}    | egrep -v 'egrep|OPTIONS'
    Set Test Variable    ${PROTOCOL_VALIDATION_TYPE}    1
    ${TC_RESULT} =    START IMS AUTO
    log    ${TC_RESULT}


AUTO_IMS_ROAMING_REG_009
    [Documentation]    "To Verify whether SCSCF Application behavior when it receives REGISTER request without MCC_MNC in "REGISTER-->P-Visited-Network-ID"  request from ICSCF and REJECT_REG_IF_MCC_MNC_UNAVAIL_FLAG=1  in ScscfConfig.xml."
    [Tags]    CRIT_P1_IMS_REG   
    Set Test Variable    ${STATE_MACHINE}    AUTO_IMS_ROAMING_REG_009
    Set Test Variable    @{PCAP_XML_CONVERSION_END_STRING}    -Y sip -V | sed -n '/Session Initiation Protocol/,/Content-Length/p' | sed 's/^ *//' | sed '/Session Initiation Protocol/i ###############@@@@@@@@NEW SIP MESSAGE@@@@@@@@@##################\n'
    Set Test Variable    ${PCAP_PROTO_GREP}    egrep -hi 'Request-Line:|Status-Line:|CSeq:' 
    Set Test Variable    ${PCAP_PROTO_GREP_END_STRING}    | egrep -v 'egrep|OPTIONS'
    Set Test Variable    ${PROTOCOL_VALIDATION_TYPE}    1
    ${TC_RESULT} =    START IMS AUTO
    log    ${TC_RESULT}


AUTO_IMS_VoLTE_ROAMING_A_NUM_REG
    [Documentation]    "To verify IMS VoLTE Registration of Calling A party msisdn."
    ...    "MSISDN-397458400501 and IMSI-264285300000501"
    [Tags]    CRIT_P1_IMS_VoLTE_CALL_REG
    Set Test Variable    ${STATE_MACHINE}    AUTO_IMS_VOLTE_ROAMING_REG_CALLING
    ${TC_RESULT} =    START IMS AUTO
    log    ${TC_RESULT}

AUTO_IMS_VoLTE_ROAMING_B_NUM_REG
    [Documentation]    "To verify IMS VoLTE Registration of Called B party msisdn."
    ...    "MSISDN-397458400502 and IMSI-264285300000502"
    [Tags]    CRIT_P1_IMS_VoLTE_CALL_REG
    Set Test Variable    ${STATE_MACHINE}    AUTO_IMS_VOLTE_ROAMING_REG_CALLED
    ${TC_RESULT} =    START IMS AUTO
    log    ${TC_RESULT}

AUTO_IMS_VOLTE_ROAMING_001
    [Documentation]    "To verify Roaming IMS VoLTE MO call scenario."
    ...    "AMSISDN-397458400501,BMSISDN-399898345678 and A-IMSI-264285300000501"
    [Tags]    CRIT_P1_IMS_VoLTE_MOCALL
    Set Test Variable    ${CLIENT_SERVER_SCENARIO}    ${1}
    Set Test Variable    ${SEAGULL_EXECUTION}    ${1}
    Set Test Variable    ${SEAGULL_EXECUTION_TYPE}    ${2}
    Set Test Variable    ${SEAGULL_SCENARIO_NAME}    IMS_PCRF_SCENARIO
    Set Test Variable    ${SEAGULL_SESSION_ID}    201
    Set Test Variable    ${CLIENT_STATE_MACHINE}    AUTO_VoLTE_ROAMING_UAC_001
    Set Test Variable    ${SERVER_STATE_MACHINE}    AUTO_VoLTE_ROAMING_UAS_001
    ${TC_RESULT} =    START IMS AUTO
    log    ${TC_RESULT}

AUTO_IMS_VOLTE_ROAMING_002
    [Documentation]    "To verify Roaming IMS VoLTE MT call scenario."
    ...    "AMSISDN-399898345678,BMSISDN-397458400502 and B-IMSI-264285300000502"
    [Tags]    CRIT_P1_IMS_VoLTE_MTCALL
    Set Test Variable    ${CLIENT_SERVER_SCENARIO}    ${1}
    Set Test Variable    ${SEAGULL_EXECUTION}    ${1}
    Set Test Variable    ${SEAGULL_EXECUTION_TYPE}    ${2}
    Set Test Variable    ${SEAGULL_SCENARIO_NAME}    IMS_PCRF_SCENARIO
    Set Test Variable    ${SEAGULL_SESSION_ID}    202
    Set Test Variable    ${CLIENT_STATE_MACHINE}    AUTO_VoLTE_ROAMING_UAC_002
    Set Test Variable    ${SERVER_STATE_MACHINE}    AUTO_VoLTE_ROAMING_UAS_002
    ${TC_RESULT} =    START IMS AUTO
    log    ${TC_RESULT}

AUTO_IMS_VOLTE_ROAMING_003
    [Documentation]    "To verify IMS VoLTE Roaming A subscriber is calling to VoLTE Home B subscriber(MO Leg Roaming Call)."
    ...    "AMSISDN-397458400501,BMSISDN-397458400502 and A-IMSI-264285300000501,B-IMSI-264285300000502"
    [Tags]    CRIT_P1_IMS_VoLTE_MTCALL
    Set Test Variable    ${CLIENT_SERVER_SCENARIO}    ${1}
    Set Test Variable    ${SEAGULL_EXECUTION}    ${1}
    Set Test Variable    ${SEAGULL_EXECUTION_TYPE}    ${2}
    Set Test Variable    ${SEAGULL_SCENARIO_NAME}    IMS_PCRF_SCENARIO
    Set Test Variable    ${SEAGULL_CONFIG_NAME}    IMS_PCRF_AUTO_CONFIG_2
    Set Test Variable    ${SEAGULL_SESSION_ID}    203
    Set Test Variable    ${CLIENT_STATE_MACHINE}    AUTO_VoLTE_ROAMING_UAC_003
    Set Test Variable    ${SERVER_STATE_MACHINE}    AUTO_VoLTE_ROAMING_UAS_003
    ${TC_RESULT} =    START IMS AUTO
    log    ${TC_RESULT}

AUTO_IMS_VOLTE_ROAMING_004
    [Documentation]    "To verify IMS VoLTE Home A subscriber is calling to VoLTE Roaming B subscriber(MT Leg Roaming Call)."
    ...    "AMSISDN-397458400501,BMSISDN-397458400502 and A-IMSI-264285300000501,B-IMSI-264285300000502"
    [Tags]    CRIT_P1_IMS_VoLTE_MTCALL
    Set Test Variable    ${CLIENT_SERVER_SCENARIO}    ${1}
    Set Test Variable    ${SEAGULL_EXECUTION}    ${1}
    Set Test Variable    ${SEAGULL_EXECUTION_TYPE}    ${2}
    Set Test Variable    ${SEAGULL_SCENARIO_NAME}    IMS_PCRF_SCENARIO
    Set Test Variable    ${SEAGULL_CONFIG_NAME}    IMS_PCRF_AUTO_CONFIG_2
    Set Test Variable    ${SEAGULL_SESSION_ID}    203
    Set Test Variable    ${CLIENT_STATE_MACHINE}    AUTO_VoLTE_ROAMING_UAC_004
    Set Test Variable    ${SERVER_STATE_MACHINE}    AUTO_VoLTE_ROAMING_UAS_004
    ${TC_RESULT} =    START IMS AUTO
    log    ${TC_RESULT}

AUTO_IMS_VOLTE_ROAMING_005
    [Documentation]    "To verify IMS VoLTE Roaming A subscriber is calling to VoLTE Roaming B subscriber(MO & MT Leg Roaming Call)."
    ...    "AMSISDN-397458400501,BMSISDN-397458400502 and A-IMSI-264285300000501,B-IMSI-264285300000502"
    [Tags]    CRIT_P1_IMS_VoLTE_MTCALL
    Set Test Variable    ${CLIENT_SERVER_SCENARIO}    ${1}
    Set Test Variable    ${SEAGULL_EXECUTION}    ${1}
    Set Test Variable    ${SEAGULL_EXECUTION_TYPE}    ${2}
    Set Test Variable    ${SEAGULL_SCENARIO_NAME}    IMS_PCRF_SCENARIO
    Set Test Variable    ${SEAGULL_CONFIG_NAME}    IMS_PCRF_AUTO_CONFIG_2
    Set Test Variable    ${SEAGULL_SESSION_ID}    203
    Set Test Variable    ${CLIENT_STATE_MACHINE}    AUTO_VoLTE_ROAMING_UAC_005
    Set Test Variable    ${SERVER_STATE_MACHINE}    AUTO_VoLTE_ROAMING_UAS_005
    ${TC_RESULT} =    START IMS AUTO
    log    ${TC_RESULT}

AUTO_IMS_VOLTE_ROAMING_006
    [Documentation]    "To Verify  SCSCF Application should reject the call with 503 Service Unavailable error when MCC_MNC is not available in IMS DB during MT Call."
    ...    "AMSISDN-399898345678,BMSISDN-397458400502 and B-IMSI-264285300000502"
    [Tags]    CRIT_P1_IMS_VoLTE_MTCALL
    Set Test Variable    ${STATE_MACHINE}    AUTO_VoLTE_ROAMING_UAC_006
    ${TC_RESULT} =    START IMS AUTO
    log    ${TC_RESULT}


*** Keywords ***


