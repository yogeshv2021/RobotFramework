*** Settings ***
Documentation     IMS_VoLTE_SPECIAL_NUMBERS_TEST_SUITE
Suite Setup       SUITE STARTUP
Suite teardown    CLOSE EXISTING CONNECTION
Test Teardown     TEST STOP
Force Tags        IMS_VoLTE_SPECIAL_NUMBERS
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


AUTO_IMS_VoLTE_A_NUM_REG_8	
    [Documentation]    "To verify IMS VoLTE Registration of Calling A party msisdn."
    [Tags]    CRIT_P1_IMS_VoLTE_CALL_REG
    Set Test Variable    ${STATE_MACHINE}    AUTO_IMS_REG_CALLING
    ${TC_RESULT} =    START IMS AUTO
    log    ${TC_RESULT}

AUTO_IMS_VoLTE_B_NUM_REG
    [Documentation]    "To verify IMS VoLTE Registration of Called B party msisdn."
    [Tags]    CRIT_P1_IMS_VoLTE_CALL_REG
    Set Test Variable    ${STATE_MACHINE}    AUTO_IMS_REG_CALLED
    ${TC_RESULT} =    START IMS AUTO
    log    ${TC_RESULT}

AUTO_IMS_VoLTE_CALL_143
    [Documentation]    "To verify basic ims VoLTE call scenario in which TAS is rejecting with 484 Address incomplete when Request URI and To Header is received with special numbers like *123."
    [Tags]    CRIT_P1_IMS_VoLTE_CALL_REG
    Set Test Variable    ${STATE_MACHINE}    AUTO_VoLTE_UAC_143
    ${TC_RESULT} =    START IMS AUTO
    log    ${TC_RESULT}

AUTO_IMS_VoLTE_CALL_144
    [Documentation]    "To verify basic ims VoLTE call scenario for tel URI case in which TAS application handles the international call properly with Plus(+)international number."
    [Tags]    CRIT_P1_IMS_VoLTE_MOCALL
    Set Test Variable    ${CLIENT_SERVER_SCENARIO}    ${1}
    Set Test Variable    ${CLIENT_STATE_MACHINE}    AUTO_VoLTE_UAC_144
    Set Test Variable    ${SERVER_STATE_MACHINE}    AUTO_VoLTE_UAS_DEFAULT_002
    Set Test Variable    @{PCAP_XML_CONVERSION_END_STRING}    -Y sip -V | sed -n '/Session Initiation Protocol/,/Content-Length/p' | sed 's/^ *//' | sed '/Session Initiation Protocol/i ###############@@@@@@@@NEW SIP MESSAGE@@@@@@@@@##################\n'
    Set Test Variable    ${PCAP_PROTO_GREP}    egrep -hi 'Request-Line:|Status-Line:
    Set Test Variable    ${PCAP_PROTO_GREP_END_STRING}    | egrep -v 'egrep|OPTIONS'
    Set Test Variable    ${PROTOCOL_VALIDATION_TYPE}    1
    ${TC_RESULT} =    START IMS AUTO
    log    ${TC_RESULT}

AUTO_IMS_VoLTE_CALL_145
    [Documentation]    "To verify basic ims VoLTE MO call scenario for tel URI case in which TAS application handles the call properly with Plus(+)international number."
    [Tags]    CRIT_P1_IMS_VoLTE_MOCALL
    Set Test Variable    ${CLIENT_SERVER_SCENARIO}    ${1}
    Set Test Variable    ${CLIENT_STATE_MACHINE}    AUTO_VoLTE_UAC_145
    Set Test Variable    ${SERVER_STATE_MACHINE}    AUTO_VoLTE_UAS_145
    ${TC_RESULT} =    START IMS AUTO
    log    ${TC_RESULT}

AUTO_IMS_VoLTE_CALL_146
    [Documentation]    "To verify basic ims VoLTE MT call scenario for tel URI case in which TAS application handles the call properly with Plus(+)international number."
    [Tags]    CRIT_P1_IMS_VoLTE_MTCALL
    Set Test Variable    ${CLIENT_SERVER_SCENARIO}    ${1}
    Set Test Variable    ${CLIENT_STATE_MACHINE}    AUTO_VoLTE_UAC_146
    Set Test Variable    ${SERVER_STATE_MACHINE}    AUTO_VoLTE_UAS_146
    ${TC_RESULT} =    START IMS AUTO
    log    ${TC_RESULT}

AUTO_IMS_VoLTE_CALL_147
    [Documentation]    "To verify basic ims VoLTE call scenario in which TAS is rejecting with 484 Address incomplete when Request URI and To Header is received with special numbers like *123#."
    [Tags]    CRIT_P1_IMS_VoLTE_CALL_REG
    Set Test Variable    ${STATE_MACHINE}    AUTO_VoLTE_UAC_147
    ${TC_RESULT} =    START IMS AUTO
    log    ${TC_RESULT}

AUTO_IMS_VoLTE_CALL_148
    [Documentation]    "To verify basic ims VoLTE call scenario in which TAS is rejecting with 484 Address incomplete when Request URI and To Header is received with special numbers like #123*."
    [Tags]    CRIT_P1_IMS_VoLTE_CALL_REG
    Set Test Variable    ${STATE_MACHINE}    AUTO_VoLTE_UAC_148
    ${TC_RESULT} =    START IMS AUTO
    log    ${TC_RESULT}

AUTO_IMS_VoLTE_CALL_149
    [Documentation]    "To verify basic ims VoLTE call scenario in which TAS is rejecting with 484 Address incomplete when Request URI and To Header is received with special numbers like *123# in tel URI."
    [Tags]    CRIT_P1_IMS_VoLTE_CALL_REG
    Set Test Variable    ${STATE_MACHINE}    AUTO_VoLTE_UAC_149
    ${TC_RESULT} =    START IMS AUTO
    log    ${TC_RESULT}

AUTO_IMS_VoLTE_CALL_150
    [Documentation]    "To verify basic ims VoLTE call scenario in which TAS application is adding the CC and sending to RRBS application for accounting when UE-A calls fixed line numbers(06763509) with REMOVE_CC_FLAG as 1 in Tasconfig.xml file."
    [Tags]    CRIT_P1_IMS_VoLTE_MOCALL
    Set Test Variable    ${CLIENT_SERVER_SCENARIO}    ${1}
    Set Test Variable    ${CLIENT_STATE_MACHINE}    AUTO_VoLTE_UAC_150
    Set Test Variable    ${SERVER_STATE_MACHINE}    AUTO_VoLTE_UAS_150
    ${TC_RESULT} =    START IMS AUTO
    log    ${TC_RESULT}

AUTO_IMS_VoLTE_CALL_151
    [Documentation]    "To verify basic ims VoLTE call scenario in which TAS application is not adding the CC and sending only MSISDN to RRBS application when UE-A calls fixed line numbers(06763509) with REMOVE_CC_FLAG as 0 in Tasconfig.xml file as a result RRBS throws Zone not found error."
    [Tags]    CRIT_P1_IMS_VoLTE_CALL_REG
    Set Test Variable    ${STATE_MACHINE}    AUTO_VoLTE_UAC_151
    ${TC_RESULT} =    START IMS AUTO
    log    ${TC_RESULT}

AUTO_IMS_VoLTE_A_NUM_REG_13
    [Documentation]    "To verify IMS VoLTE Registration of Calling A party msisdn(2digit CC+9 digits MSISDN registration case IMA-316)."
    [Tags]    CRIT_P1_IMS_VoLTE_CALL_REG
    Set Test Variable    ${STATE_MACHINE}    AUTO_IMS_REG_CALLING_100
    ${TC_RESULT} =    START IMS AUTO
    log    ${TC_RESULT}

AUTO_IMS_VoLTE_CALL_160
    [Documentation]    "To verify basic ims VoLTE call scenario in which in which TAS application is handling the CC+9 digits B-party MSISDN during the Voltecall(IMA-316)."
    [Tags]    CRIT_P1_IMS_VoLTE_MOCALL
    Set Test Variable    ${CLIENT_SERVER_SCENARIO}    ${1}
    Set Test Variable    ${CLIENT_STATE_MACHINE}    AUTO_VoLTE_UAC_160
    Set Test Variable    ${SERVER_STATE_MACHINE}    AUTO_VoLTE_UAS_160
    ${TC_RESULT} =    START IMS AUTO
    log    ${TC_RESULT}

AUTO_IMS_VoLTE_CALL_161
    [Documentation]    "To verify MT call in which TAS application is handling the CC+9 digits B-party MSISDN during the MT call(IMA-316)."
    [Tags]    CRIT_P1_IMS_VoLTE_MOCALL
    Set Test Variable    ${CLIENT_SERVER_SCENARIO}    ${1}
    Set Test Variable    ${CLIENT_STATE_MACHINE}    AUTO_VoLTE_UAC_161
    Set Test Variable    ${SERVER_STATE_MACHINE}    AUTO_VoLTE_UAS_161
    ${TC_RESULT} =    START IMS AUTO
    log    ${TC_RESULT}

AUTO_IMS_VoLTE_CALL_162
    [Documentation]    "To verify basic International call in which TAS application is handling the 6 digits International B-party MSISDN(IMA-316)."
    [Tags]    CRIT_P1_IMS_VoLTE_MOCALL
    Set Test Variable    ${CLIENT_SERVER_SCENARIO}    ${1}
    Set Test Variable    ${CLIENT_STATE_MACHINE}    AUTO_VoLTE_UAC_162
    Set Test Variable    ${SERVER_STATE_MACHINE}    AUTO_VoLTE_UAS_162
    ${TC_RESULT} =    START IMS AUTO
    log    ${TC_RESULT}

AUTO_IMS_VoLTE_CALL_163
    [Documentation]    "To verify MT call in which TAS application is handling the CC+9 digits B-party MSISDN with Tel URI during the MT call(IMA-316)."
    [Tags]    CRIT_P1_IMS_VoLTE_MOCALL
    Set Test Variable    ${CLIENT_SERVER_SCENARIO}    ${1}
    Set Test Variable    ${CLIENT_STATE_MACHINE}    AUTO_VoLTE_UAC_163
    Set Test Variable    ${SERVER_STATE_MACHINE}    AUTO_VoLTE_UAS_163
    ${TC_RESULT} =    START IMS AUTO
    log    ${TC_RESULT}

AUTO_IMS_VoLTE_CALL_164
    [Documentation]    "To verify basic Volet to Volte call in which TAS application is handling the 9 digits B-party MSISDN without CC during the VtoV call(IMA-316)."
    [Tags]    CRIT_P1_IMS_VoLTE_MOCALL
    Set Test Variable    ${CLIENT_SERVER_SCENARIO}    ${1}
    Set Test Variable    ${CLIENT_STATE_MACHINE}    AUTO_VoLTE_UAC_164
    Set Test Variable    ${SERVER_STATE_MACHINE}    AUTO_VoLTE_UAS_164
    ${TC_RESULT} =    START IMS AUTO
    log    ${TC_RESULT}

AUTO_IMS_VoLTE_CALL_165
    [Documentation]    "To verify MT call in which TAS application is handling the 9 digits B-party MSISDN without CC during the MT call(IMA-316)."
    [Tags]    CRIT_P1_IMS_VoLTE_MOCALL
    Set Test Variable    ${CLIENT_SERVER_SCENARIO}    ${1}
    Set Test Variable    ${CLIENT_STATE_MACHINE}    AUTO_VoLTE_UAC_165
    Set Test Variable    ${SERVER_STATE_MACHINE}    AUTO_VoLTE_UAS_165
    ${TC_RESULT} =    START IMS AUTO
    log    ${TC_RESULT}

AUTO_IMS_VoLTE_CALL_166
    [Documentation]    "To verify basic ims VoLTE MT call scenario without pcrf session."
    [Tags]    CRIT_P1_IMS_VoLTE_MTCALL
    Set Test Variable    ${CLIENT_SERVER_SCENARIO}    ${1}
    Set Test Variable    ${CLIENT_STATE_MACHINE}    AUTO_VoLTE_UAC_166
    Set Test Variable    ${SERVER_STATE_MACHINE}    AUTO_VoLTE_UAS_166
    ${TC_RESULT} =    START IMS AUTO
    log    ${TC_RESULT}