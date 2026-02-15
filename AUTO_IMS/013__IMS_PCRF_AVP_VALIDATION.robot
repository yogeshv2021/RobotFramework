*** Settings ***
Documentation     IMS_PCRF_AVP_VALIDATION_TEST_SUITE
Suite Setup       SUITE STARTUP
Suite teardown    CLOSE EXISTING CONNECTION
Test Teardown     TEST STOP
Force Tags        IMS_PCRF_AVP_VALIDATION
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
AUTO_IMS_VoLTE_A_NUM_REG_1
    [Documentation]    "To verify IMS VoLTE Registration of Calling A party msisdn."
    [Tags]    CRIT_P1_IMS_VoLTE_CALL_REG
    Set Test Variable    ${STATE_MACHINE}    AUTO_IMS_REG_CALLING
    ${TC_RESULT} =    START IMS AUTO
    log    ${TC_RESULT}

IMS_PCRF_AVP_VALIDATION_001
    [Documentation]    "To verify whether PCRF application is sending the AVP's properly in CCA when requested QOS is lesser than configured QOS in PcrfConfigdata.xml file and ENABLE_CONFIGURED_QOS_GX is set as 0 while performing the MO Volte call to VF Trunk call."
    [Tags]    CRIT_P1_IMS_PCRF_AVP_VALIDATION
    Set Test Variable    ${CLIENT_SERVER_SCENARIO}    ${1}
    Set Test Variable    ${SEAGULL_EXECUTION}    ${1}
    Set Test Variable    ${SEAGULL_EXECUTION_TYPE}    ${2}
    Set Test Variable    ${SEAGULL_SCENARIO_NAME}    IMS_PCRF_SCENARIO_AVP_001
    Set Test Variable    ${SEAGULL_SESSION_ID}    121
    Set Test Variable    ${CLIENT_STATE_MACHINE}    AUTO_VoLTE_UAC_077
    Set Test Variable    ${SERVER_STATE_MACHINE}    AUTO_VoLTE_UAS_077
    ${TC_RESULT} =    START IMS AUTO
    log    ${TC_RESULT}

IMS_PCRF_AVP_VALIDATION_002
    [Documentation]    "To verify whether PCRF application is sending the AVP's properly in CCA when requested QOS is greater than configured QOS in PcrfConfigdata.xml file and ENABLE_CONFIGURED_QOS_GX is set as 0 while performing the MO Volte call to VF Trunk call."
    [Tags]    CRIT_P1_IMS_PCRF_AVP_VALIDATION
    Set Test Variable    ${CLIENT_SERVER_SCENARIO}    ${1}
    Set Test Variable    ${SEAGULL_EXECUTION}    ${1}
    Set Test Variable    ${SEAGULL_EXECUTION_TYPE}    ${2}
    Set Test Variable    ${SEAGULL_SCENARIO_NAME}    IMS_PCRF_SCENARIO_AVP_002
    Set Test Variable    ${SEAGULL_SESSION_ID}    122
    Set Test Variable    ${CLIENT_STATE_MACHINE}    AUTO_VoLTE_UAC_078
    Set Test Variable    ${SERVER_STATE_MACHINE}    AUTO_VoLTE_UAS_078
    ${TC_RESULT} =    START IMS AUTO
    log    ${TC_RESULT}

IMS_PCRF_AVP_VALIDATION_003
    [Documentation]    "To verify whether PCRF application is sending the AVP's properly in CCA when requested QOS is equal to the configured QOS in PcrfConfigdata.xml file and ENABLE_CONFIGURED_QOS_GX is set as 0 while performing the MO Volte call to VF Trunk call."
    [Tags]    CRIT_P1_IMS_PCRF_AVP_VALIDATION
    Set Test Variable    ${CLIENT_SERVER_SCENARIO}    ${1}
    Set Test Variable    ${SEAGULL_EXECUTION}    ${1}
    Set Test Variable    ${SEAGULL_EXECUTION_TYPE}    ${2}
    Set Test Variable    ${SEAGULL_SCENARIO_NAME}    IMS_PCRF_SCENARIO_AVP_003
    Set Test Variable    ${SEAGULL_SESSION_ID}    123
    Set Test Variable    ${CLIENT_STATE_MACHINE}    AUTO_VoLTE_UAC_079
    Set Test Variable    ${SERVER_STATE_MACHINE}    AUTO_VoLTE_UAS_079
    ${TC_RESULT} =    START IMS AUTO
    log    ${TC_RESULT}

IMS_PCRF_AVP_VALIDATION_004
    [Documentation]    "To verify whether PCRF application is sending the AVP's properly in CCA when requested QOS is lesser than configured QOS in PcrfConfigdata.xml file and ENABLE_CONFIGURED_QOS_GX is set as 1 while performing the MO Volte call to VF Trunk call."
    [Tags]    CRIT_P1_IMS_PCRF_AVP_VALIDATION
    Set Test Variable    ${CLIENT_SERVER_SCENARIO}    ${1}
    Set Test Variable    ${SEAGULL_EXECUTION}    ${1}
    Set Test Variable    ${SEAGULL_EXECUTION_TYPE}    ${2}
    Set Test Variable    ${SEAGULL_SCENARIO_NAME}    IMS_PCRF_SCENARIO_AVP_004
    Set Test Variable    ${SEAGULL_SESSION_ID}    124
    Set Test Variable    ${CLIENT_STATE_MACHINE}    AUTO_VoLTE_UAC_077
    Set Test Variable    ${SERVER_STATE_MACHINE}    AUTO_VoLTE_UAS_077
    ${TC_RESULT} =    START IMS AUTO
    log    ${TC_RESULT}

IMS_PCRF_AVP_VALIDATION_005
    [Documentation]    "To verify whether PCRF application is sending the AVP's properly in CCA when requested QOS is greater than configured QOS in PcrfConfigdata.xml file and ENABLE_CONFIGURED_QOS_GX is set as 1 while performing the MO Volte call to VF Trunk call."
    [Tags]    CRIT_P1_IMS_PCRF_AVP_VALIDATION
    Set Test Variable    ${CLIENT_SERVER_SCENARIO}    ${1}
    Set Test Variable    ${SEAGULL_EXECUTION}    ${1}
    Set Test Variable    ${SEAGULL_EXECUTION_TYPE}    ${2}
    Set Test Variable    ${SEAGULL_SCENARIO_NAME}    IMS_PCRF_SCENARIO_AVP_005
    Set Test Variable    ${SEAGULL_SESSION_ID}    125
    Set Test Variable    ${CLIENT_STATE_MACHINE}    AUTO_VoLTE_UAC_078
    Set Test Variable    ${SERVER_STATE_MACHINE}    AUTO_VoLTE_UAS_078
    ${TC_RESULT} =    START IMS AUTO
    log    ${TC_RESULT}

IMS_PCRF_AVP_VALIDATION_006
    [Documentation]    "To verify whether PCRF application is sending the AVP's properly in CCA when requested QOS is equal to the configured QOS in PcrfConfigdata.xml file and ENABLE_CONFIGURED_QOS_GX is set as 1 while performing the MO Volte call to VF Trunk call."
    [Tags]    CRIT_P1_IMS_PCRF_AVP_VALIDATION
    Set Test Variable    ${CLIENT_SERVER_SCENARIO}    ${1}
    Set Test Variable    ${SEAGULL_EXECUTION}    ${1}
    Set Test Variable    ${SEAGULL_EXECUTION_TYPE}    ${2}
    Set Test Variable    ${SEAGULL_SCENARIO_NAME}    IMS_PCRF_SCENARIO_AVP_006
    Set Test Variable    ${SEAGULL_SESSION_ID}    126
    Set Test Variable    ${CLIENT_STATE_MACHINE}    AUTO_VoLTE_UAC_079
    Set Test Variable    ${SERVER_STATE_MACHINE}    AUTO_VoLTE_UAS_079
    ${TC_RESULT} =    START IMS AUTO
    log    ${TC_RESULT}

IMS_PCRF_AVP_VALIDATION_007
    [Documentation]    "To verify whether PCRF application is sending the AVP's properly in RAR when MO Volte call subscriber perform the call to the Other Network Subscriber with OVERRIDE_QOSINFO_RX is set as 1 in PcrfConfig.xml file and A-party alone is sending the AS value and B-party not sending the AS value with RR and RS bandwidth are not sent from both parties in the message body."
    [Tags]    CRIT_P1_IMS_PCRF_AVP_VALIDATION
    Set Test Variable    ${CLIENT_SERVER_SCENARIO}    ${1}
    Set Test Variable    ${SEAGULL_EXECUTION}    ${1}
    Set Test Variable    ${SEAGULL_EXECUTION_TYPE}    ${2}
    Set Test Variable    ${SEAGULL_SCENARIO_NAME}    IMS_PCRF_SCENARIO_AVP_007
    Set Test Variable    ${SEAGULL_SESSION_ID}    127
    Set Test Variable    ${CLIENT_STATE_MACHINE}    AUTO_VoLTE_UAC_080
    Set Test Variable    ${SERVER_STATE_MACHINE}    AUTO_VoLTE_UAS_080
    ${TC_RESULT} =    START IMS AUTO
    log    ${TC_RESULT}

IMS_PCRF_AVP_VALIDATION_008
    [Documentation]    "To verify whether PCRF application is sending the AVP's properly in RAR when MO Volte call subscriber perform the call to the Other Network Subscriber with OVERRIDE_QOSINFO_RX is set as 1 in PcrfConfig.xml file and both Parties not sending the AS value with RR and RS bandwidth are not sent from both parties in the message body."
    [Tags]    CRIT_P1_IMS_PCRF_AVP_VALIDATION
    Set Test Variable    ${CLIENT_SERVER_SCENARIO}    ${1}
    Set Test Variable    ${SEAGULL_EXECUTION}    ${1}
    Set Test Variable    ${SEAGULL_EXECUTION_TYPE}    ${2}
    Set Test Variable    ${SEAGULL_SCENARIO_NAME}    IMS_PCRF_SCENARIO_AVP_008
    Set Test Variable    ${SEAGULL_SESSION_ID}    128
    Set Test Variable    ${CLIENT_STATE_MACHINE}    AUTO_VoLTE_UAC_081
    Set Test Variable    ${SERVER_STATE_MACHINE}    AUTO_VoLTE_UAS_081
    ${TC_RESULT} =    START IMS AUTO
    log    ${TC_RESULT}

IMS_PCRF_AVP_VALIDATION_009
    [Documentation]    "To verify whether PCRF application is sending the AVP's properly in RAR when MO Volte call subscriber perform the call to the Other Network Subscriber with OVERRIDE_QOSINFO_RX is set as 1 in PcrfConfig.xml file and both Parties are sending the AS value with RR and RS bandwidth are sent from both parties in the message body."
    [Tags]    CRIT_P1_IMS_PCRF_AVP_VALIDATION
    Set Test Variable    ${CLIENT_SERVER_SCENARIO}    ${1}
    Set Test Variable    ${SEAGULL_EXECUTION}    ${1}
    Set Test Variable    ${SEAGULL_EXECUTION_TYPE}    ${2}
    Set Test Variable    ${SEAGULL_SCENARIO_NAME}    IMS_PCRF_SCENARIO_AVP_009
    Set Test Variable    ${SEAGULL_SESSION_ID}    129
    Set Test Variable    ${CLIENT_STATE_MACHINE}    AUTO_VoLTE_UAC_082
    Set Test Variable    ${SERVER_STATE_MACHINE}    AUTO_VoLTE_UAS_082
    ${TC_RESULT} =    START IMS AUTO
    log    ${TC_RESULT}

IMS_PCRF_AVP_VALIDATION_010
    [Documentation]    "To verify whether PCRF application is sending the AVP's properly in RAR when MO Volte call subscriber perform the call to the Other Network Subscriber with OVERRIDE_QOSINFO_RX is set as 1 in PcrfConfig.xml file and both Parties are sending the AS value with RR and RS bandwidth are not sent from  B-party in the message body."
    [Tags]    CRIT_P1_IMS_PCRF_AVP_VALIDATION
    Set Test Variable    ${CLIENT_SERVER_SCENARIO}    ${1}
    Set Test Variable    ${SEAGULL_EXECUTION}    ${1}
    Set Test Variable    ${SEAGULL_EXECUTION_TYPE}    ${2}
    Set Test Variable    ${SEAGULL_SCENARIO_NAME}    IMS_PCRF_SCENARIO_AVP_010
    Set Test Variable    ${SEAGULL_SESSION_ID}    130
    Set Test Variable    ${CLIENT_STATE_MACHINE}    AUTO_VoLTE_UAC_083
    Set Test Variable    ${SERVER_STATE_MACHINE}    AUTO_VoLTE_UAS_083
    ${TC_RESULT} =    START IMS AUTO
    log    ${TC_RESULT}

IMS_PCRF_AVP_VALIDATION_011
    [Documentation]    "To verify whether PCRF application is sending the AVP's properly in RAR when MO Volte call subscriber perform the call to the Other Network Subscriber with OVERRIDE_QOSINFO_RX is set as 1 in PcrfConfig.xml file and both Parties are sending the AS value with RR and RS bandwidth are not sent from  A-party in the message body."
    [Tags]    CRIT_P1_IMS_PCRF_AVP_VALIDATION
    Set Test Variable    ${CLIENT_SERVER_SCENARIO}    ${1}
    Set Test Variable    ${SEAGULL_EXECUTION}    ${1}
    Set Test Variable    ${SEAGULL_EXECUTION_TYPE}    ${2}
    Set Test Variable    ${SEAGULL_SCENARIO_NAME}    IMS_PCRF_SCENARIO_AVP_011
    Set Test Variable    ${SEAGULL_SESSION_ID}    131
    Set Test Variable    ${CLIENT_STATE_MACHINE}    AUTO_VoLTE_UAC_084
    Set Test Variable    ${SERVER_STATE_MACHINE}    AUTO_VoLTE_UAS_084
    ${TC_RESULT} =    START IMS AUTO
    log    ${TC_RESULT}

IMS_PCRF_AVP_VALIDATION_012
    [Documentation]    "To verify whether PCRF application is sending the AVP's properly in RAR when MO Volte call subscriber perform the call to the Other Network Subscriber with OVERRIDE_QOSINFO_RX is set as 1 in PcrfConfig.xml file and both Parties are not sending the AS value, RR and RS bandwidth are not sent from both A and B party in the message body."
    [Tags]    CRIT_P1_IMS_PCRF_AVP_VALIDATION
    Set Test Variable    ${CLIENT_SERVER_SCENARIO}    ${1}
    Set Test Variable    ${SEAGULL_EXECUTION}    ${1}
    Set Test Variable    ${SEAGULL_EXECUTION_TYPE}    ${2}
    Set Test Variable    ${SEAGULL_SCENARIO_NAME}    IMS_PCRF_SCENARIO_AVP_012
    Set Test Variable    ${SEAGULL_SESSION_ID}    132
    Set Test Variable    ${CLIENT_STATE_MACHINE}    AUTO_VoLTE_UAC_085
    Set Test Variable    ${SERVER_STATE_MACHINE}    AUTO_VoLTE_UAS_085
    ${TC_RESULT} =    START IMS AUTO
    log    ${TC_RESULT}

IMS_PCRF_AVP_VALIDATION_013
    [Documentation]    "To verify whether PCRF application is sending the AVP's properly in RAR when MO Volte call subscriber perform the call to the Other Network Subscriber with OVERRIDE_QOSINFO_RX is set as 1 in PcrfConfig.xml file and A-party alone is sending the AS value and B-party not sending the AS value with RR and RS bandwidth are not sent from both parties in the message body."
    [Tags]    CRIT_P1_IMS_PCRF_AVP_VALIDATION
    Set Test Variable    ${CLIENT_SERVER_SCENARIO}    ${1}
    Set Test Variable    ${SEAGULL_EXECUTION}    ${1}
    Set Test Variable    ${SEAGULL_EXECUTION_TYPE}    ${2}
    Set Test Variable    ${SEAGULL_SCENARIO_NAME}    IMS_PCRF_SCENARIO_AVP_013
    Set Test Variable    ${SEAGULL_SESSION_ID}    133
    Set Test Variable    ${CLIENT_STATE_MACHINE}    AUTO_VoLTE_UAC_080
    Set Test Variable    ${SERVER_STATE_MACHINE}    AUTO_VoLTE_UAS_080
    ${TC_RESULT} =    START IMS AUTO
    log    ${TC_RESULT}

IMS_PCRF_AVP_VALIDATION_014
    [Documentation]    "To verify whether PCRF application is sending the AVP's properly in RAR when MO Volte call subscriber perform the call to the Other Network Subscriber with OVERRIDE_QOSINFO_RX is set as 1 in PcrfConfig.xml file and both Parties not sending the AS value with RR and RS bandwidth are not sent from both parties in the message body."
    [Tags]    CRIT_P1_IMS_PCRF_AVP_VALIDATION
    Set Test Variable    ${CLIENT_SERVER_SCENARIO}    ${1}
    Set Test Variable    ${SEAGULL_EXECUTION}    ${1}
    Set Test Variable    ${SEAGULL_EXECUTION_TYPE}    ${2}
    Set Test Variable    ${SEAGULL_SCENARIO_NAME}    IMS_PCRF_SCENARIO_AVP_014
    Set Test Variable    ${SEAGULL_SESSION_ID}    134
    Set Test Variable    ${CLIENT_STATE_MACHINE}    AUTO_VoLTE_UAC_081
    Set Test Variable    ${SERVER_STATE_MACHINE}    AUTO_VoLTE_UAS_081
    ${TC_RESULT} =    START IMS AUTO
    log    ${TC_RESULT}

IMS_PCRF_AVP_VALIDATION_015
    [Documentation]    "To verify whether PCRF application is sending the AVP's properly in RAR when MO Volte call subscriber perform the call to the Other Network Subscriber with OVERRIDE_QOSINFO_RX is set as 1 in PcrfConfig.xml file and both Parties are sending the AS value with RR and RS bandwidth are sent from both parties in the message body."
    [Tags]    CRIT_P1_IMS_PCRF_AVP_VALIDATION
    Set Test Variable    ${CLIENT_SERVER_SCENARIO}    ${1}
    Set Test Variable    ${SEAGULL_EXECUTION}    ${1}
    Set Test Variable    ${SEAGULL_EXECUTION_TYPE}    ${2}
    Set Test Variable    ${SEAGULL_SCENARIO_NAME}    IMS_PCRF_SCENARIO_AVP_015
    Set Test Variable    ${SEAGULL_SESSION_ID}    135
    Set Test Variable    ${CLIENT_STATE_MACHINE}    AUTO_VoLTE_UAC_082
    Set Test Variable    ${SERVER_STATE_MACHINE}    AUTO_VoLTE_UAS_082
    ${TC_RESULT} =    START IMS AUTO
    log    ${TC_RESULT}

IMS_PCRF_AVP_VALIDATION_016
    [Documentation]    "To verify whether PCRF application is sending the AVP's properly in RAR when MO Volte call subscriber perform the call to the Other Network Subscriber with OVERRIDE_QOSINFO_RX is set as 1 in PcrfConfig.xml file and both Parties are sending the AS value with RR and RS bandwidth are not sent from  B-party in the message body."
    [Tags]    CRIT_P1_IMS_PCRF_AVP_VALIDATION
    Set Test Variable    ${CLIENT_SERVER_SCENARIO}    ${1}
    Set Test Variable    ${SEAGULL_EXECUTION}    ${1}
    Set Test Variable    ${SEAGULL_EXECUTION_TYPE}    ${2}
    Set Test Variable    ${SEAGULL_SCENARIO_NAME}    IMS_PCRF_SCENARIO_AVP_016
    Set Test Variable    ${SEAGULL_SESSION_ID}    136
    Set Test Variable    ${CLIENT_STATE_MACHINE}    AUTO_VoLTE_UAC_083
    Set Test Variable    ${SERVER_STATE_MACHINE}    AUTO_VoLTE_UAS_083
    ${TC_RESULT} =    START IMS AUTO
    log    ${TC_RESULT}

IMS_PCRF_AVP_VALIDATION_017
    [Documentation]    "To verify whether PCRF application is sending the AVP's properly in RAR when MO Volte call subscriber perform the call to the Other Network Subscriber with OVERRIDE_QOSINFO_RX is set as 1 in PcrfConfig.xml file and both Parties are sending the AS value with RR and RS bandwidth are not sent from  A-party in the message body."
    [Tags]    CRIT_P1_IMS_PCRF_AVP_VALIDATION
    Set Test Variable    ${CLIENT_SERVER_SCENARIO}    ${1}
    Set Test Variable    ${SEAGULL_EXECUTION}    ${1}
    Set Test Variable    ${SEAGULL_EXECUTION_TYPE}    ${2}
    Set Test Variable    ${SEAGULL_SCENARIO_NAME}    IMS_PCRF_SCENARIO_AVP_017
    Set Test Variable    ${SEAGULL_SESSION_ID}    137
    Set Test Variable    ${CLIENT_STATE_MACHINE}    AUTO_VoLTE_UAC_084
    Set Test Variable    ${SERVER_STATE_MACHINE}    AUTO_VoLTE_UAS_084
    ${TC_RESULT} =    START IMS AUTO
    log    ${TC_RESULT}

IMS_PCRF_AVP_VALIDATION_018
    [Documentation]    "To verify whether PCRF application is sending the AVP's properly in RAR when MO Volte call subscriber perform the call to the Other Network Subscriber with OVERRIDE_QOSINFO_RX is set as 1 in PcrfConfig.xml file and both Parties are not sending the AS value, RR and RS bandwidth are not sent from both A and B party in the message body."
    [Tags]    CRIT_P1_IMS_PCRF_AVP_VALIDATION
    Set Test Variable    ${CLIENT_SERVER_SCENARIO}    ${1}
    Set Test Variable    ${SEAGULL_EXECUTION}    ${1}
    Set Test Variable    ${SEAGULL_EXECUTION_TYPE}    ${2}
    Set Test Variable    ${SEAGULL_SCENARIO_NAME}    IMS_PCRF_SCENARIO_AVP_018
    Set Test Variable    ${SEAGULL_SESSION_ID}    138
    Set Test Variable    ${CLIENT_STATE_MACHINE}    AUTO_VoLTE_UAC_085
    Set Test Variable    ${SERVER_STATE_MACHINE}    AUTO_VoLTE_UAS_085
    ${TC_RESULT} =    START IMS AUTO
    log    ${TC_RESULT}

AUTO_IMS_VoLTE_B_NUM_REG
    [Documentation]    "To verify IMS VoLTE Registration of Called B party msisdn."
    [Tags]    CRIT_P1_IMS_VoLTE_CALL_REG
    Set Test Variable    ${STATE_MACHINE}    AUTO_IMS_REG_CALLED
    ${TC_RESULT} =    START IMS AUTO
    log    ${TC_RESULT}

IMS_PCRF_AVP_VALIDATION_019
    [Documentation]    "To verify whether PCRF application is sending the AVP's properly in RAR when Outside subscriber perform the call to the MT Volte Subscriber with OVERRIDE_QOSINFO_RX is set as 1 in PcrfConfig.xml file and A-party alone is sending the AS value and B-party not sending the AS value with RR and RS bandwidth are not sent from both parties in the message body."
    [Tags]    CRIT_P1_IMS_PCRF_AVP_VALIDATION
    Set Test Variable    ${CLIENT_SERVER_SCENARIO}    ${1}
    Set Test Variable    ${SEAGULL_EXECUTION}    ${1}
    Set Test Variable    ${SEAGULL_EXECUTION_TYPE}    ${2}
    Set Test Variable    ${SEAGULL_SCENARIO_NAME}    IMS_PCRF_SCENARIO_AVP_019
    Set Test Variable    ${SEAGULL_SESSION_ID}    139
    Set Test Variable    ${CLIENT_STATE_MACHINE}    AUTO_VoLTE_UAC_086
    Set Test Variable    ${SERVER_STATE_MACHINE}    AUTO_VoLTE_UAS_086
    ${TC_RESULT} =    START IMS AUTO
    log    ${TC_RESULT}

IMS_PCRF_AVP_VALIDATION_020
    [Documentation]    "To verify whether PCRF application is sending the AVP's properly in RAR when Outside subscriber perform the call to the MT Volte Subscriber with OVERRIDE_QOSINFO_RX is set as 1 in PcrfConfig.xml file and both Parties not sending the AS value with RR and RS bandwidth are not sent from both parties in the message body."
    [Tags]    CRIT_P1_IMS_PCRF_AVP_VALIDATION
    Set Test Variable    ${CLIENT_SERVER_SCENARIO}    ${1}
    Set Test Variable    ${SEAGULL_EXECUTION}    ${1}
    Set Test Variable    ${SEAGULL_EXECUTION_TYPE}    ${2}
    Set Test Variable    ${SEAGULL_SCENARIO_NAME}    IMS_PCRF_SCENARIO_AVP_020
    Set Test Variable    ${SEAGULL_SESSION_ID}    140
    Set Test Variable    ${CLIENT_STATE_MACHINE}    AUTO_VoLTE_UAC_087
    Set Test Variable    ${SERVER_STATE_MACHINE}    AUTO_VoLTE_UAS_087
    ${TC_RESULT} =    START IMS AUTO
    log    ${TC_RESULT}

IMS_PCRF_AVP_VALIDATION_021
    [Documentation]    "To verify whether PCRF application is sending the AVP's properly in RAR when Outside subscriber perform the call to the MT Volte Subscriber with OVERRIDE_QOSINFO_RX is set as 1 in PcrfConfig.xml file and both Parties are sending the AS value with RR and RS bandwidth are sent from both parties in the message body."
    [Tags]    CRIT_P1_IMS_PCRF_AVP_VALIDATION
    Set Test Variable    ${CLIENT_SERVER_SCENARIO}    ${1}
    Set Test Variable    ${SEAGULL_EXECUTION}    ${1}
    Set Test Variable    ${SEAGULL_EXECUTION_TYPE}    ${2}
    Set Test Variable    ${SEAGULL_SCENARIO_NAME}    IMS_PCRF_SCENARIO_AVP_021
    Set Test Variable    ${SEAGULL_SESSION_ID}    141
    Set Test Variable    ${CLIENT_STATE_MACHINE}    AUTO_VoLTE_UAC_088
    Set Test Variable    ${SERVER_STATE_MACHINE}    AUTO_VoLTE_UAS_088
    ${TC_RESULT} =    START IMS AUTO
    log    ${TC_RESULT}

IMS_PCRF_AVP_VALIDATION_022
    [Documentation]    "To verify whether PCRF application is sending the AVP's properly in RAR when Outside subscriber perform the call to the MT Volte Subscriber with OVERRIDE_QOSINFO_RX is set as 1 in PcrfConfig.xml file and both Parties are sending the AS value with RR and RS bandwidth are not sent from  B-party in the message body."
    [Tags]    CRIT_P1_IMS_PCRF_AVP_VALIDATION
    Set Test Variable    ${CLIENT_SERVER_SCENARIO}    ${1}
    Set Test Variable    ${SEAGULL_EXECUTION}    ${1}
    Set Test Variable    ${SEAGULL_EXECUTION_TYPE}    ${2}
    Set Test Variable    ${SEAGULL_SCENARIO_NAME}    IMS_PCRF_SCENARIO_AVP_022
    Set Test Variable    ${SEAGULL_SESSION_ID}    142
    Set Test Variable    ${CLIENT_STATE_MACHINE}    AUTO_VoLTE_UAC_089
    Set Test Variable    ${SERVER_STATE_MACHINE}    AUTO_VoLTE_UAS_089
    ${TC_RESULT} =    START IMS AUTO
    log    ${TC_RESULT}

IMS_PCRF_AVP_VALIDATION_023
    [Documentation]    "To verify whether PCRF application is sending the AVP's properly in RAR when Outside subscriber perform the call to the MT Volte Subscriber with OVERRIDE_QOSINFO_RX is set as 1 in PcrfConfig.xml file and both Parties are sending the AS value with RR and RS bandwidth are not sent from  A-party in the message body."
    [Tags]    CRIT_P1_IMS_PCRF_AVP_VALIDATION
    Set Test Variable    ${CLIENT_SERVER_SCENARIO}    ${1}
    Set Test Variable    ${SEAGULL_EXECUTION}    ${1}
    Set Test Variable    ${SEAGULL_EXECUTION_TYPE}    ${2}
    Set Test Variable    ${SEAGULL_SCENARIO_NAME}    IMS_PCRF_SCENARIO_AVP_023
    Set Test Variable    ${SEAGULL_SESSION_ID}    143
    Set Test Variable    ${CLIENT_STATE_MACHINE}    AUTO_VoLTE_UAC_090
    Set Test Variable    ${SERVER_STATE_MACHINE}    AUTO_VoLTE_UAS_090
    ${TC_RESULT} =    START IMS AUTO
    log    ${TC_RESULT}

IMS_PCRF_AVP_VALIDATION_024
    [Documentation]    "To verify whether PCRF application is sending the AVP's properly in RAR when Outside subscriber perform the call to the MT Volte Subscriber with OVERRIDE_QOSINFO_RX is set as 1 in PcrfConfig.xml file and both Parties are not sending the AS value, RR and RS bandwidth are not sent from both A and B party in the message body."
    [Tags]    CRIT_P1_IMS_PCRF_AVP_VALIDATION
    Set Test Variable    ${CLIENT_SERVER_SCENARIO}    ${1}
    Set Test Variable    ${SEAGULL_EXECUTION}    ${1}
    Set Test Variable    ${SEAGULL_EXECUTION_TYPE}    ${2}
    Set Test Variable    ${SEAGULL_SCENARIO_NAME}    IMS_PCRF_SCENARIO_AVP_024
    Set Test Variable    ${SEAGULL_SESSION_ID}    144
    Set Test Variable    ${CLIENT_STATE_MACHINE}    AUTO_VoLTE_UAC_091
    Set Test Variable    ${SERVER_STATE_MACHINE}    AUTO_VoLTE_UAS_091
    ${TC_RESULT} =    START IMS AUTO
    log    ${TC_RESULT}

IMS_PCRF_AVP_VALIDATION_025
    [Documentation]    "To verify whether PCRF application is sending the AVP's properly in RAR when Outside subscriber perform the call to the MT Volte Subscriber with OVERRIDE_QOSINFO_RX is set as 0 in PcrfConfig.xml file and A-party alone is sending the AS value and B-party not sending the AS value with RR and RS bandwidth are not sent from both parties in the message body."
    [Tags]    CRIT_P1_IMS_PCRF_AVP_VALIDATION
    Set Test Variable    ${CLIENT_SERVER_SCENARIO}    ${1}
    Set Test Variable    ${SEAGULL_EXECUTION}    ${1}
    Set Test Variable    ${SEAGULL_EXECUTION_TYPE}    ${2}
    Set Test Variable    ${SEAGULL_SCENARIO_NAME}    IMS_PCRF_SCENARIO_AVP_025
    Set Test Variable    ${SEAGULL_SESSION_ID}    145
    Set Test Variable    ${CLIENT_STATE_MACHINE}    AUTO_VoLTE_UAC_086
    Set Test Variable    ${SERVER_STATE_MACHINE}    AUTO_VoLTE_UAS_086
    ${TC_RESULT} =    START IMS AUTO
    log    ${TC_RESULT}

IMS_PCRF_AVP_VALIDATION_026
    [Documentation]    "To verify whether PCRF application is sending the AVP's properly in RAR when Outside subscriber perform the call to the MT Volte Subscriber with OVERRIDE_QOSINFO_RX is set as 0 in PcrfConfig.xml file and both Parties not sending the AS value with RR and RS bandwidth are not sent from both parties in the message body."
    [Tags]    CRIT_P1_IMS_PCRF_AVP_VALIDATION
    Set Test Variable    ${CLIENT_SERVER_SCENARIO}    ${1}
    Set Test Variable    ${SEAGULL_EXECUTION}    ${1}
    Set Test Variable    ${SEAGULL_EXECUTION_TYPE}    ${2}
    Set Test Variable    ${SEAGULL_SCENARIO_NAME}    IMS_PCRF_SCENARIO_AVP_026
    Set Test Variable    ${SEAGULL_SESSION_ID}    146
    Set Test Variable    ${CLIENT_STATE_MACHINE}    AUTO_VoLTE_UAC_087
    Set Test Variable    ${SERVER_STATE_MACHINE}    AUTO_VoLTE_UAS_087
    ${TC_RESULT} =    START IMS AUTO
    log    ${TC_RESULT}

IMS_PCRF_AVP_VALIDATION_027
    [Documentation]    "To verify whether PCRF application is sending the AVP's properly in RAR when Outside subscriber perform the call to the MT Volte Subscriber with OVERRIDE_QOSINFO_RX is set as 0 in PcrfConfig.xml file and both Parties are sending the AS value with RR and RS bandwidth are sent from both parties in the message body."
    [Tags]    CRIT_P1_IMS_PCRF_AVP_VALIDATION
    Set Test Variable    ${CLIENT_SERVER_SCENARIO}    ${1}
    Set Test Variable    ${SEAGULL_EXECUTION}    ${1}
    Set Test Variable    ${SEAGULL_EXECUTION_TYPE}    ${2}
    Set Test Variable    ${SEAGULL_SCENARIO_NAME}    IMS_PCRF_SCENARIO_AVP_027
    Set Test Variable    ${SEAGULL_SESSION_ID}    147
    Set Test Variable    ${CLIENT_STATE_MACHINE}    AUTO_VoLTE_UAC_088
    Set Test Variable    ${SERVER_STATE_MACHINE}    AUTO_VoLTE_UAS_088
    ${TC_RESULT} =    START IMS AUTO
    log    ${TC_RESULT}

IMS_PCRF_AVP_VALIDATION_028
    [Documentation]    "To verify whether PCRF application is sending the AVP's properly in RAR when Outside subscriber perform the call to the MT Volte Subscriber with OVERRIDE_QOSINFO_RX is set as 0 in PcrfConfig.xml file and both Parties are sending the AS value with RR and RS bandwidth are not sent from  B-party in the message body."
    [Tags]    CRIT_P1_IMS_PCRF_AVP_VALIDATION
    Set Test Variable    ${CLIENT_SERVER_SCENARIO}    ${1}
    Set Test Variable    ${SEAGULL_EXECUTION}    ${1}
    Set Test Variable    ${SEAGULL_EXECUTION_TYPE}    ${2}
    Set Test Variable    ${SEAGULL_SCENARIO_NAME}    IMS_PCRF_SCENARIO_AVP_028
    Set Test Variable    ${SEAGULL_SESSION_ID}    148
    Set Test Variable    ${CLIENT_STATE_MACHINE}    AUTO_VoLTE_UAC_089
    Set Test Variable    ${SERVER_STATE_MACHINE}    AUTO_VoLTE_UAS_089
    ${TC_RESULT} =    START IMS AUTO
    log    ${TC_RESULT}

IMS_PCRF_AVP_VALIDATION_029
    [Documentation]    "To verify whether PCRF application is sending the AVP's properly in RAR when Outside subscriber perform the call to the MT Volte Subscriber with OVERRIDE_QOSINFO_RX is set as 0 in PcrfConfig.xml file and both Parties are sending the AS value with RR and RS bandwidth are not sent from  A-party in the message body."
    [Tags]    CRIT_P1_IMS_PCRF_AVP_VALIDATION
    Set Test Variable    ${CLIENT_SERVER_SCENARIO}    ${1}
    Set Test Variable    ${SEAGULL_EXECUTION}    ${1}
    Set Test Variable    ${SEAGULL_EXECUTION_TYPE}    ${2}
    Set Test Variable    ${SEAGULL_SCENARIO_NAME}    IMS_PCRF_SCENARIO_AVP_029
    Set Test Variable    ${SEAGULL_SESSION_ID}    149
    Set Test Variable    ${CLIENT_STATE_MACHINE}    AUTO_VoLTE_UAC_090
    Set Test Variable    ${SERVER_STATE_MACHINE}    AUTO_VoLTE_UAS_090
    ${TC_RESULT} =    START IMS AUTO
    log    ${TC_RESULT}

IMS_PCRF_AVP_VALIDATION_030
    [Documentation]    "To verify whether PCRF application is sending the AVP's properly in RAR when Outside subscriber perform the call to the MT Volte Subscriber with OVERRIDE_QOSINFO_RX is set as 0 in PcrfConfig.xml file and both Parties are not sending the AS value, RR and RS bandwidth are not sent from both A and B party in the message body."
    [Tags]    CRIT_P1_IMS_PCRF_AVP_VALIDATION
    Set Test Variable    ${CLIENT_SERVER_SCENARIO}    ${1}
    Set Test Variable    ${SEAGULL_EXECUTION}    ${1}
    Set Test Variable    ${SEAGULL_EXECUTION_TYPE}    ${2}
    Set Test Variable    ${SEAGULL_SCENARIO_NAME}    IMS_PCRF_SCENARIO_AVP_030
    Set Test Variable    ${SEAGULL_SESSION_ID}    150
    Set Test Variable    ${CLIENT_STATE_MACHINE}    AUTO_VoLTE_UAC_091
    Set Test Variable    ${SERVER_STATE_MACHINE}    AUTO_VoLTE_UAS_091
    ${TC_RESULT} =    START IMS AUTO
    log    ${TC_RESULT}

*** Keywords ***


