*** Settings ***
Documentation     IMS_VoLTE_REGISTRATION_TEST_SUITE
Suite Setup       SUITE STARTUP
Suite teardown    CLOSE EXISTING CONNECTION
Test teardown     TEST STOP
Force Tags        IMS_VoLTE_REGISTRATION
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
AUTO_IMS_REG_001
    [Documentation]    "To Verify IMS Registration over UDP transport Layer."
    [Tags]    CRIT_P1_IMS_REG
    Set Test Variable    ${STATE_MACHINE}    AUTO_IMS_REG_001
    Set Test Variable    @{PCAP_XML_CONVERSION_END_STRING}    -Y sip -V | sed -n '/Session Initiation Protocol/,/Content-Length/p' | sed 's/^ *//' | sed '/Session Initiation Protocol/i ###############@@@@@@@@NEW SIP MESSAGE@@@@@@@@@##################\n'
    Set Test Variable    ${PCAP_PROTO_GREP}    egrep -hi 'Request-Line:|Status-Line:|CSeq:' 
    Set Test Variable    ${PCAP_PROTO_GREP_END_STRING}    | egrep -v 'egrep|OPTIONS'
    Set Test Variable    ${PROTOCOL_VALIDATION_TYPE}    1
    ${TC_RESULT} =    START IMS AUTO
    log    ${TC_RESULT}

AUTO_IMS_REG_002
    [Documentation]    "To Verify IMS Re_REGISTRATON."
    [Tags]    CRIT_P1_IMS_REG
    Set Test Variable    ${STATE_MACHINE}    AUTO_IMS_REG_002
    Set Test Variable    @{PCAP_XML_CONVERSION_END_STRING}    -Y sip -V | sed -n '/Session Initiation Protocol/,/Content-Length/p' | sed 's/^ *//' | sed '/Session Initiation Protocol/i ###############@@@@@@@@NEW SIP MESSAGE@@@@@@@@@##################\n'
    Set Test Variable    ${PCAP_PROTO_GREP}    egrep -hi 'Request-Line:|Status-Line:|CSeq:' 
    Set Test Variable    ${PCAP_PROTO_GREP_END_STRING}    | egrep -v 'egrep|OPTIONS'
    Set Test Variable    ${PROTOCOL_VALIDATION_TYPE}    1
    ${TC_RESULT} =    START IMS AUTO
    log    ${TC_RESULT}

AUTO_IMS_REG_003
    [Documentation]    "To Verify IMS De_REGISTRATON."
    [Tags]    CRIT_P1_IMS_REG
    Set Test Variable    ${STATE_MACHINE}    AUTO_IMS_REG_003
    Set Test Variable    @{PCAP_XML_CONVERSION_END_STRING}    -Y sip -V | sed -n '/Session Initiation Protocol/,/Content-Length/p' | sed 's/^ *//' | sed '/Session Initiation Protocol/i ###############@@@@@@@@NEW SIP MESSAGE@@@@@@@@@##################\n'
    Set Test Variable    ${PCAP_PROTO_GREP}    egrep -hi 'Request-Line|Path:'
    Set Test Variable    ${PCAP_PROTO_GREP_END_STRING}    | egrep -v 'egrep|OPTIONS|.145:|.143:5601|.143:5602'
    ${TC_RESULT} =    START IMS AUTO
    log    ${TC_RESULT}

AUTO_IMS_REG_004
    [Documentation]    "To verify IMS CSCF nodes initiating UAR ,MAR & SAR messages & received proper response from HSS for Successful registration"
    [Tags]    CRIT_P1_IMS_REG
    Set Test Variable    ${STATE_MACHINE}    AUTO_IMS_REG_004
    Set Test Variable    @{PCAP_XML_CONVERSION_END_STRING}    -Y diameter -d tcp.port==8503,diameter -d tcp.port==8501,diameter -V | sed -n '/Diameter Protocol/,/Frame /p' | sed 's/^ *//'
    Set Test Variable    ${PCAP_PROTO_GREP}    egrep 'Command Code:|Result-Code:|Experimental-Result-Code:'
    Set Test Variable    ${PCAP_PROTO_GREP_END_STRING}    | egrep -v 'AVP'
    ${TC_RESULT} =    START IMS AUTO
    log    ${TC_RESULT}

AUTO_IMS_REG_005
    [Documentation]    "To verify successful register response should validate all the UAR, MAR and SAR message AVP's during the Successful registration."
    [Tags]    CRIT_P1_IMS_REG
    Set Test Variable    ${STATE_MACHINE}    AUTO_IMS_REG_005
    Set Test Variable    @{PCAP_XML_CONVERSION_END_STRING}    -Y diameter -d tcp.port==8503,diameter -d tcp.port==8501,diameter -V | sed -n '/Diameter Protocol/,/Frame /p' | sed 's/^ *//'
    Set Test Variable    ${PCAP_PROTO_GREP}    egrep 'Command Code:|Result-Code:|Experimental-Result-Code:|Visited-Network-Identifier:|Public-Identity:|User-Name:|Server-Name:|Path:|Origin-Host:|Origin-Realm:|Auth-Application-Id:|Destination-Realm:|Destination-Host:|3GPP-IMSI:|User-Authorization-Type:|Vendor-Id|Auth-Application-Id|Server-Capabilities:|Mandatory-Capability:|Feature-List-Id:|CX Feature-List Flags|Route-Record|Auth-Session-State|3GPP-SIP-Authentication-Scheme:|3GPP-SIP-Number-Auth-Items:|3GPP-SIP-Auth-Data-Item:|3GPP-SIP-Authenticate:|3GPP-SIP-Authorization:|Server-Assignment-Type|User-Data-Already-Available|Path:|Contact:|From-SIP-Header:|To-SIP-Header:|Record-Route:'
    Set Test Variable    ${PCAP_PROTO_GREP_END_STRING}    | egrep -v 'AVP'
    ${TC_RESULT} =    START IMS AUTO
    log    ${TC_RESULT}

AUTO_IMS_REG_006
    [Documentation]    "To verify successful register response should validate all the UAR message AVP's"
    [Tags]    CRIT_P1_IMS_REG
    Set Test Variable    ${STATE_MACHINE}    AUTO_IMS_REG_006
    Set Test Variable    @{PCAP_XML_CONVERSION_END_STRING}    -Y diameter -d tcp.port==8503,diameter -d tcp.port==8501,diameter -V | sed -n '/Diameter Protocol/,/Frame /p' | sed 's/^ *//'
    Set Test Variable    ${PCAP_PROTO_GREP}    egrep 'Command Code|Result-Code|Experimental-Result-Code'
    Set Test Variable    ${PCAP_PROTO_GREP_END_STRING}    | egrep -v 'AVP'
    ${TC_RESULT} =    START IMS AUTO
    log    ${TC_RESULT}

AUTO_IMS_REG_007
    [Documentation]    "To verify that I-CSCF application send 403 Forbidden when the Unknown User perform the Registration."
    [Tags]    CRIT_P1_IMS_REG
    Set Test Variable    ${STATE_MACHINE}    AUTO_IMS_REG_007
    Set Test Variable    @{PCAP_XML_CONVERSION_END_STRING}    -Y sip -V | sed -n '/Session Initiation Protocol/,/Content-Length/p' | sed 's/^ *//' | sed '/Session Initiation Protocol/i ###############@@@@@@@@NEW SIP MESSAGE@@@@@@@@@##################\n'
    Set Test Variable    ${PCAP_PROTO_GREP}    egrep -hi 'Request-Line:' 
    Set Test Variable    ${PCAP_PROTO_GREP_END_STRING}    | egrep -v 'egrep|OPTIONS'
    ${TC_RESULT} =    START IMS AUTO
    log    ${TC_RESULT}

AUTO_IMS_REG_008
    [Documentation]    "To verify that behavior of P-CSCF Application when second register request receiving as different From address"
    [Tags]    CRIT_P1_IMS_REG
    Set Test Variable    ${STATE_MACHINE}    AUTO_IMS_REG_008
    Set Test Variable    @{PCAP_XML_CONVERSION_END_STRING}    -Y sip -V | sed -n '/Session Initiation Protocol/,/Content-Length/p' | sed 's/^ *//' | sed '/Session Initiation Protocol/i ###############@@@@@@@@NEW SIP MESSAGE@@@@@@@@@##################\n'
    Set Test Variable    ${PCAP_PROTO_GREP}    egrep -hi 'Request-Line:' 
    Set Test Variable    ${PCAP_PROTO_GREP_END_STRING}    | egrep -v 'egrep|OPTIONS'
    ${TC_RESULT} =    START IMS AUTO
    log    ${TC_RESULT}

AUTO_IMS_REG_009
    [Documentation]    "To verify that behavior of P-CSCF Application when second register request receiving as different To address"
    [Tags]    CRIT_P1_IMS_REG
    Set Test Variable    ${STATE_MACHINE}    AUTO_IMS_REG_009
    Set Test Variable    @{PCAP_XML_CONVERSION_END_STRING}    -Y sip -V | sed -n '/Session Initiation Protocol/,/Content-Length/p' | sed 's/^ *//' | sed '/Session Initiation Protocol/i ###############@@@@@@@@NEW SIP MESSAGE@@@@@@@@@##################\n'
    Set Test Variable    ${PCAP_PROTO_GREP}    egrep -hi 'Request-Line:' 
    Set Test Variable    ${PCAP_PROTO_GREP_END_STRING}    | egrep -v 'egrep|OPTIONS'
    ${TC_RESULT} =    START IMS AUTO
    log    ${TC_RESULT}

AUTO_IMS_REG_010
    [Documentation]    "To verify that behavior of P-CSCF Application when second register request Cseq value should receive on First registration request"
    [Tags]    CRIT_P1_IMS_REG
    Set Test Variable    ${STATE_MACHINE}    AUTO_IMS_REG_010
    Set Test Variable    @{PCAP_XML_CONVERSION_END_STRING}    -Y sip -V | sed -n '/Session Initiation Protocol/,/Content-Length/p' | sed 's/^ *//' | sed '/Session Initiation Protocol/i ###############@@@@@@@@NEW SIP MESSAGE@@@@@@@@@##################\n'
    Set Test Variable    ${PCAP_PROTO_GREP}    egrep -hi 'Request-Line:' 
    Set Test Variable    ${PCAP_PROTO_GREP_END_STRING}    | egrep -v 'egrep|OPTIONS'
    ${TC_RESULT} =    START IMS AUTO
    log    ${TC_RESULT}


AUTO_IMS_REG_011
    [Documentation]    "To verify that behavior of S-CSCF Application when domain name not mapped in HSS"
    [Tags]    CRIT_P1_IMS_REG
    Set Test Variable    ${STATE_MACHINE}    AUTO_IMS_REG_011
    Set Test Variable    @{PCAP_XML_CONVERSION_END_STRING}    -Y sip -V | sed -n '/Session Initiation Protocol/,/Content-Length/p' | sed 's/^ *//' | sed '/Session Initiation Protocol/i ###############@@@@@@@@NEW SIP MESSAGE@@@@@@@@@##################\n'
    Set Test Variable    ${PCAP_PROTO_GREP}    egrep -hi 'Request-Line:' 
    Set Test Variable    ${PCAP_PROTO_GREP_END_STRING}    | egrep -v 'egrep|OPTIONS'
    ${TC_RESULT} =    START IMS AUTO
    log    ${TC_RESULT}


AUTO_IMS_REG_012
    [Documentation]    "To verify that behavior of I-CSCF Application when Subscriber not present in HSS"
    [Tags]    CRIT_P1_IMS_REG
    Set Test Variable    ${STATE_MACHINE}    AUTO_IMS_REG_012
    Set Test Variable    @{PCAP_XML_CONVERSION_END_STRING}    -Y sip -V | sed -n '/Session Initiation Protocol/,/Content-Length/p' | sed 's/^ *//' | sed '/Session Initiation Protocol/i ###############@@@@@@@@NEW SIP MESSAGE@@@@@@@@@##################\n'
    Set Test Variable    ${PCAP_PROTO_GREP}    egrep -hi 'Request-Line:' 
    Set Test Variable    ${PCAP_PROTO_GREP_END_STRING}    | egrep -v 'egrep|OPTIONS'
    ${TC_RESULT} =    START IMS AUTO
    log    ${TC_RESULT}

AUTO_IMS_REG_013
    [Documentation]    "To verify that S-CSCF application is sending the Notify request after the configured time of SCSCF_SCHEDULING_INTERVAL in SubsprofileConfig.xml file."
    [Tags]    CRIT_P1_IMS_REG
    Set Test Variable    ${STATE_MACHINE}    AUTO_IMS_REG_013
    Set Test Variable    @{PCAP_XML_CONVERSION_END_STRING}    -Y sip -V | sed -n '/Session Initiation Protocol/,/Content-Length/p' | sed 's/^ *//' | sed '/Session Initiation Protocol/i ###############@@@@@@@@NEW SIP MESSAGE@@@@@@@@@##################\n'
    Set Test Variable    ${PCAP_PROTO_GREP}    egrep -hi 'Request-Line:' 
    Set Test Variable    ${PCAP_PROTO_GREP_END_STRING}    | egrep -v 'egrep|OPTIONS'
    ${TC_RESULT} =    START IMS AUTO
    log    ${TC_RESULT}

AUTO_IMS_REG_014
    [Documentation]    "To verify that SCSCF application is sending 421 Request to ICSCF application when IPSEC_MANDATE flag is set as 1 in ScscfConfig.xml file and REGISTER request is received without supported header as Sec-Agree."
    [Tags]    CRIT_P1_IMS_REG
    Set Test Variable    ${STATE_MACHINE}    AUTO_IMS_REG_014
    Set Test Variable    @{PCAP_XML_CONVERSION_END_STRING}    -Y sip -V | sed -n '/Session Initiation Protocol/,/Content-Length/p' | sed 's/^ *//' | sed '/Session Initiation Protocol/i ###############@@@@@@@@NEW SIP MESSAGE@@@@@@@@@##################\n'
    Set Test Variable    ${PCAP_PROTO_GREP}    egrep -hi 'Request-Line:' 
    Set Test Variable    ${PCAP_PROTO_GREP_END_STRING}    | egrep -v 'egrep|OPTIONS'
    ${TC_RESULT} =    START IMS AUTO
    log    ${TC_RESULT}

AUTO_IMS_REG_015
    [Documentation]    "To verify that SCSCF application is sending 401 UnAuthorized Request to ICSCF application when IPSEC_MANDATE flag is set as 1 in ScscfConfig.xml file and REGISTER request is received with supported header as Sec-Agree."
    [Tags]    CRIT_P1_IMS_REG
    Set Test Variable    ${STATE_MACHINE}    AUTO_IMS_REG_015
    Set Test Variable    @{PCAP_XML_CONVERSION_END_STRING}    -Y sip -V | sed -n '/Session Initiation Protocol/,/Content-Length/p' | sed 's/^ *//' | sed '/Session Initiation Protocol/i ###############@@@@@@@@NEW SIP MESSAGE@@@@@@@@@##################\n'
    Set Test Variable    ${PCAP_PROTO_GREP}    egrep -hi 'Request-Line:' 
    Set Test Variable    ${PCAP_PROTO_GREP_END_STRING}    | egrep -v 'egrep|OPTIONS'
    ${TC_RESULT} =    START IMS AUTO
    log    ${TC_RESULT}

AUTO_IMS_REG_016
    [Documentation]    "To verify that Re-registration is successful when SCSCF application is sending 421 UnAuthorized Request to ICSCF application when IPSEC_MANDATE flag is set as 1 in ScscfConfig.xml file and REGISTER request is received withoit supported header as Sec-Agree."
    [Tags]    CRIT_P1_IMS_REG
    Set Test Variable    ${STATE_MACHINE}    AUTO_IMS_REG_016
    Set Test Variable    @{PCAP_XML_CONVERSION_END_STRING}    -Y sip -V | sed -n '/Session Initiation Protocol/,/Content-Length/p' | sed 's/^ *//' | sed '/Session Initiation Protocol/i ###############@@@@@@@@NEW SIP MESSAGE@@@@@@@@@##################\n'
    Set Test Variable    ${PCAP_PROTO_GREP}    egrep -hi 'Request-Line:' 
    Set Test Variable    ${PCAP_PROTO_GREP_END_STRING}    | egrep -v 'egrep|OPTIONS'
    ${TC_RESULT} =    START IMS AUTO
    log    ${TC_RESULT}

AUTO_IMS_REG_017
    [Documentation]    "To verify that De-registration is successful when SCSCF application is sending 421 UnAuthorized Request to ICSCF application when IPSEC_MANDATE flag is set as 1 in ScscfConfig.xml file and REGISTER request is received without supported header as Sec-Agree."
    [Tags]    CRIT_P1_IMS_REG
    Set Test Variable    ${STATE_MACHINE}    AUTO_IMS_REG_017
    Set Test Variable    @{PCAP_XML_CONVERSION_END_STRING}    -Y sip -V | sed -n '/Session Initiation Protocol/,/Content-Length/p' | sed 's/^ *//' | sed '/Session Initiation Protocol/i ###############@@@@@@@@NEW SIP MESSAGE@@@@@@@@@##################\n'
    Set Test Variable    ${PCAP_PROTO_GREP}    egrep -hi 'Request-Line:' 
    Set Test Variable    ${PCAP_PROTO_GREP_END_STRING}    | egrep -v 'egrep|OPTIONS'
    ${TC_RESULT} =    START IMS AUTO
    log    ${TC_RESULT}

AUTO_IMS_REG_018
    [Documentation]    "To verify that once the unsubscrition is sent from UE, SCSCF application is sending SAR towards HSS and update the subscriber as Deregistered in both HSS and IMS DB."
    [Tags]    CRIT_P1_IMS_REG
    Set Test Variable    ${STATE_MACHINE}    AUTO_IMS_REG_018
    ${TC_RESULT} =    START IMS AUTO
    log    ${TC_RESULT}

AUTO_IMS_REG_019
    [Documentation]    "To verify whether first Subscription with no Expires header is sent from UE, SCSCF application should send the configured value of 7200 from the Scscfconfig.xml file."
    [Tags]    CRIT_P1_IMS_REG
    Set Test Variable    ${STATE_MACHINE}    AUTO_IMS_REG_019
    ${TC_RESULT} =    START IMS AUTO
    log    ${TC_RESULT}

AUTO_IMS_REG_020
    [Documentation]    "To verify whether SCSCF application is sending the configured value of 7200 from the Scscfconfig.xml file when 2 SUBSCRIBE request is sent with no Expires header from UE."
    [Tags]    CRIT_P1_IMS_REG
    Set Test Variable    ${STATE_MACHINE}    AUTO_IMS_REG_020
    ${TC_RESULT} =    START IMS AUTO
    log    ${TC_RESULT}

AUTO_IMS_REG_021
    [Documentation]    "To verify whether SCSCF application is sending the configured value of 7200 from the Scscfconfig.xml file when First SUBSCRIBE request is sent with Expires header from UE and Second SUBSCRIBE request is sent with no Expires header."
    [Tags]    CRIT_P1_IMS_REG
    Set Test Variable    ${STATE_MACHINE}    AUTO_IMS_REG_021
    ${TC_RESULT} =    START IMS AUTO
    log    ${TC_RESULT}

AUTO_IMS_REG_022
    [Documentation]    "To verify whether IMS nodes are supporting Sha1 algorithm during the IMS registration."
    [Tags]    CRIT_P1_IMS_REG
    Set Test Variable    ${STATE_MACHINE}    AUTO_IMS_REG_022
    ${TC_RESULT} =    START IMS AUTO
    log    ${TC_RESULT}

AUTO_IMS_REG_023
    [Documentation]    "To verify whether IMS nodes are supporting Sha1 algorithm during the IMS registration with Subscribe and Notify request."
    [Tags]    CRIT_P1_IMS_REG
    Set Test Variable    ${STATE_MACHINE}    AUTO_IMS_REG_023
    ${TC_RESULT} =    START IMS AUTO
    log    ${TC_RESULT}

AUTO_IMS_REG_024
    [Documentation]    "To verify whether IMS nodes are supporting Sha1 algorithm during the IMS Re-registration with Subscribe and Notify request."
    [Tags]    CRIT_P1_IMS_REG
    Set Test Variable    ${STATE_MACHINE}    AUTO_IMS_REG_024
    ${TC_RESULT} =    START IMS AUTO
    log    ${TC_RESULT}

AUTO_IMS_REG_025
    [Documentation]    "To verify whether IMS nodes are supporting Sha1 algorithm during the IMS De-registration with Subscribe and Notify request."
    [Tags]    CRIT_P1_IMS_REG
    Set Test Variable    ${STATE_MACHINE}    AUTO_IMS_REG_025
    ${TC_RESULT} =    START IMS AUTO
    log    ${TC_RESULT}

AUTO_IMS_REG_026
    [Documentation]    "To verify whether S-CSCF application is adding the username of UE in PRIM_EVENT_CHARGING_FUNC_NAME when Username is received less than 128 bytes."
    [Tags]    CRIT_P1_IMS_REG
    Set Test Variable    ${STATE_MACHINE}    AUTO_IMS_REG_026
    ${TC_RESULT} =    START IMS AUTO
    log    ${TC_RESULT}

AUTO_IMS_REG_027
    [Documentation]    "To verify whether S-CSCF application is adding the username of UE in PRIM_EVENT_CHARGING_FUNC_NAME and SEC_EVENT_CHARGING_FUNC_NAME when Username is received greater than 128 bytes."
    [Tags]    CRIT_P1_IMS_REG
    Set Test Variable    ${STATE_MACHINE}    AUTO_IMS_REG_027
    ${TC_RESULT} =    START IMS AUTO
    log    ${TC_RESULT}

AUTO_IMS_REG_028
    [Documentation]    "To verify whether S-CSCF application is adding the username of UE in PRIM_EVENT_CHARGING_FUNC_NAME and SEC_EVENT_CHARGING_FUNC_NAME when Username is received greater than 256 bytes."
    [Tags]    CRIT_P1_IMS_REG
    Set Test Variable    ${STATE_MACHINE}    AUTO_IMS_REG_028
    ${TC_RESULT} =    START IMS AUTO
    log    ${TC_RESULT}

AUTO_IMS_REG_030
    [Documentation]    "To verify whether I-CSCF application is sending 403 forbidden when IMS service is disabled for the subscriber in HSS application"
    [Tags]    CRIT_P1_IMS_REG
    Set Test Variable    ${STATE_MACHINE}    AUTO_IMS_REG_030
    ${TC_RESULT} =    START IMS AUTO
    log    ${TC_RESULT}

*** Keywords ***
