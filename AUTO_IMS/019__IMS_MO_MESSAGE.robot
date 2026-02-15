*** Settings ***
Documentation     IMS_VOLTE_ROAMING_TEST_SUITE
Suite Setup       SUITE STARTUP
Suite teardown    CLOSE EXISTING CONNECTION
Test Teardown     TEST STOP
Force Tags        IMS_VOLTE_MESSAGE
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

AUTO_IMS_MESSAGE_001
    [Documentation]    "To Verify MO SMS is success in IMS."
    [Tags]    CRIT_P1_IMS_MESSAGE   
    Set Test Variable    ${STATE_MACHINE}    AUTO_IMS_MESSAGE_001
    Set Test Variable    @{PCAP_XML_CONVERSION_END_STRING}    -Y sip -V | sed -n '/Session Initiation Protocol/,/Content-Length/p' | sed 's/^ *//' | sed '/Session Initiation Protocol/i ###############@@@@@@@@NEW SIP MESSAGE@@@@@@@@@##################\n'
    Set Test Variable    ${PCAP_PROTO_GREP}    egrep -hi 'Request-Line:|Status-Line:|CSeq:' 
    Set Test Variable    ${PCAP_PROTO_GREP_END_STRING}    | egrep -v 'egrep|OPTIONS'
    Set Test Variable    ${PROTOCOL_VALIDATION_TYPE}    0
    Set Test Variable    ${CLIENT_STATE_MACHINE}    AUTO_IMS_MESSAGE_MO_CLIENT_001
    Set Test Variable    ${SERVER_STATE_MACHINE}    AUTO_IMS_MESSAGE_MO_SUBMIT_SERVER_001
    ${TC_RESULT} =    START IMS AUTO
    log    ${TC_RESULT}


AUTO_IMS_MESSAGE_002
    [Documentation]    "To Verify MO SMS is Failed in IMS when Submit report is received and Subscriber not in registered state in IMS DB."
    [Tags]    CRIT_P2_IMS_MESSAGE   
    Set Test Variable    ${STATE_MACHINE}    AUTO_IMS_MESSAGE_002
    Set Test Variable    @{PCAP_XML_CONVERSION_END_STRING}    -Y sip -V | sed -n '/Session Initiation Protocol/,/Content-Length/p' | sed 's/^ *//' | sed '/Session Initiation Protocol/i ###############@@@@@@@@NEW SIP MESSAGE@@@@@@@@@##################\n'
    Set Test Variable    ${PCAP_PROTO_GREP}    egrep -hi 'Request-Line:|Status-Line:|CSeq:' 
    Set Test Variable    ${PCAP_PROTO_GREP_END_STRING}    | egrep -v 'egrep|OPTIONS'
    Set Test Variable    ${PROTOCOL_VALIDATION_TYPE}    0
    Set Test Variable    ${CLIENT_STATE_MACHINE}    AUTO_IMS_MESSAGE_MO_CLIENT_002
    Set Test Variable    ${SERVER_STATE_MACHINE}    AUTO_IMS_MESSAGE_MO_SUBMIT_SERVER_001
    ${TC_RESULT} =    START IMS AUTO
    log    ${TC_RESULT}


AUTO_IMS_MESSAGE_003
    [Documentation]    "To Verify Rat Type is sent as empty in MO SMS when Rat type not present in pcrfdb."
    [Tags]    CRIT_P1_IMS_MESSAGE   
    Set Test Variable    ${STATE_MACHINE}    AUTO_IMS_MESSAGE_003
    Set Test Variable    @{PCAP_XML_CONVERSION_END_STRING}    -Y sip -V | sed -n '/Session Initiation Protocol/,/Content-Length/p' | sed 's/^ *//' | sed '/Session Initiation Protocol/i ###############@@@@@@@@NEW SIP MESSAGE@@@@@@@@@##################\n'
    Set Test Variable    ${PCAP_PROTO_GREP}    egrep -hi 'Request-Line:|Status-Line:|CSeq:' 
    Set Test Variable    ${PCAP_PROTO_GREP_END_STRING}    | egrep -v 'egrep|OPTIONS'
    Set Test Variable    ${PROTOCOL_VALIDATION_TYPE}    0
    Set Test Variable    ${CLIENT_STATE_MACHINE}    AUTO_IMS_MESSAGE_MO_CLIENT_001
    Set Test Variable    ${SERVER_STATE_MACHINE}    AUTO_IMS_MESSAGE_MO_SUBMIT_SERVER_001
    ${TC_RESULT} =    START IMS AUTO
    log    ${TC_RESULT}



AUTO_IMS_MESSAGE_004
    [Documentation]    "To Verify MO SMS is getting failed when IPSMGW is down."
    [Tags]    CRIT_P1_IMS_MESSAGE   
    Set Test Variable    ${STATE_MACHINE}    AUTO_IMS_MESSAGE_004
    Set Test Variable    @{PCAP_XML_CONVERSION_END_STRING}    -Y sip -V | sed -n '/Session Initiation Protocol/,/Content-Length/p' | sed 's/^ *//' | sed '/Session Initiation Protocol/i ###############@@@@@@@@NEW SIP MESSAGE@@@@@@@@@##################\n'
    Set Test Variable    ${PCAP_PROTO_GREP}    egrep -hi 'Request-Line:|Status-Line:|CSeq:' 
    Set Test Variable    ${PCAP_PROTO_GREP_END_STRING}    | egrep -v 'egrep|OPTIONS'
    Set Test Variable    ${PROTOCOL_VALIDATION_TYPE}    0
    Set Test Variable    ${CLIENT_STATE_MACHINE}    AUTO_IMS_MESSAGE_MO_CLIENT_001
    Set Test Variable    ${SERVER_STATE_MACHINE}    AUTO_IMS_MESSAGE_MO_SUBMIT_SERVER_001
    ${TC_RESULT} =    START IMS AUTO
    log    ${TC_RESULT}


AUTO_IMS_MESSAGE_005
    [Documentation]    "To Verify MO SMS is success when To Address is received in tel URI."
    [Tags]    CRIT_P1_IMS_MESSAGE   
    Set Test Variable    ${STATE_MACHINE}    AUTO_IMS_MESSAGE_005
    Set Test Variable    @{PCAP_XML_CONVERSION_END_STRING}    -Y sip -V | sed -n '/Session Initiation Protocol/,/Content-Length/p' | sed 's/^ *//' | sed '/Session Initiation Protocol/i ###############@@@@@@@@NEW SIP MESSAGE@@@@@@@@@##################\n'
    Set Test Variable    ${PCAP_PROTO_GREP}    egrep -hi 'Request-Line:|Status-Line:|CSeq:' 
    Set Test Variable    ${PCAP_PROTO_GREP_END_STRING}    | egrep -v 'egrep|OPTIONS'
    Set Test Variable    ${PROTOCOL_VALIDATION_TYPE}    0
    Set Test Variable    ${CLIENT_STATE_MACHINE}    AUTO_IMS_MESSAGE_MO_CLIENT_005
    Set Test Variable    ${SERVER_STATE_MACHINE}    AUTO_IMS_MESSAGE_MO_SUBMIT_SERVER_001
    ${TC_RESULT} =    START IMS AUTO
    log    ${TC_RESULT}

AUTO_IMS_MESSAGE_006
    [Documentation]    "To Verify MO SMS is failed when content length is received as empty."
    [Tags]    CRIT_P1_IMS_MESSAGE   
    Set Test Variable    ${STATE_MACHINE}    AUTO_IMS_MESSAGE_006
    Set Test Variable    @{PCAP_XML_CONVERSION_END_STRING}    -Y sip -V | sed -n '/Session Initiation Protocol/,/Content-Length/p' | sed 's/^ *//' | sed '/Session Initiation Protocol/i ###############@@@@@@@@NEW SIP MESSAGE@@@@@@@@@##################\n'
    Set Test Variable    ${PCAP_PROTO_GREP}    egrep -hi 'Request-Line:|Status-Line:|CSeq:' 
    Set Test Variable    ${PCAP_PROTO_GREP_END_STRING}    | egrep -v 'egrep|OPTIONS'
    Set Test Variable    ${PROTOCOL_VALIDATION_TYPE}    0
    Set Test Variable    ${CLIENT_STATE_MACHINE}    AUTO_IMS_MESSAGE_MO_CLIENT_006
    Set Test Variable    ${SERVER_STATE_MACHINE}    AUTO_IMS_MESSAGE_MO_SUBMIT_SERVER_001
    ${TC_RESULT} =    START IMS AUTO
    log    ${TC_RESULT}


*** Keywords ***


