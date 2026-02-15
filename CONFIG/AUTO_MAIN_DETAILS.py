#############-->Model Type 0- OLD MODEL 1-NEW MODEL<--##############
MODEL_TYPE=1

#############-->succes result code<--################
RESULT_CODE=0

#############-->Enter the DUT release name<--################
AUTO_REL= "IMS_RCS-1.0.0.0"

#############-->Enter the DUT revision<--################
AUTO_REV="Rev5"
APP_BINARY= "AUTO_IMS"
APP_AUTOLOGPATH= "/opt/product/testteam/IMS_AUTOMATION/AUTOMATION-RESULTS/IMS_SOLARIS_IPV6_EXP_MSTACK"


#############-->SSH Key Path<--################
ID_RSA= "/root/.ssh/id_rsa"


#############-->>Enter Automation Result Path<<---##########################
RESULT_LOGPATH= "/opt/product/AUTOMATION/AUTOMATION_RESULTS/IMS_SOLARIS_IPV6_EXP_MSTACK/RESULTS"

TIMESTAMP_FILE_PATH = "/opt/product/AUTOMATION/TEST_AUTOMATION_FRAMEWORK/IMS_SOLARIS_IPV6_EXP_MSTACK/"

AUTOMATION_PATH = "/opt/product/AUTOMATION/TEST_AUTOMATION_FRAMEWORK/IMS_SOLARIS_IPV6_EXP_MSTACK/"
AUTOMATION_TEMP_PATH="/opt/product/AUTOMATION/TEST_AUTOMATION_FRAMEWORK/IMS_SOLARIS_IPV6_EXP_MSTACK/TEMP/"
AUTOMATION_FAILPATH = "/opt/product/AUTOMATION/AUTOMATION_RESULTS/IMS_SOLARIS_IPV6_EXP_MSTACK/FAILURE_LOGS"
AUTOMATION_RESULT_PATH= "/opt/product/AUTOMATION/AUTOMATION_RESULTS/IMS_SOLARIS_IPV6_EXP_MSTACK/"

INPUT_HIERARCHY = 1

PRE_POST_VALIDATE_PATH= "/opt/product/AUTOMATION/TEST_AUTOMATION_FRAMEWORK/IMS_SOLARIS_IPV6_EXP_MSTACK/INPUTS/INPUT_PATH/"
BKP_INPUT_PATH= "/opt/product/AUTOMATION/TEST_AUTOMATION_FRAMEWORK/IMS_SOLARIS_IPV6_EXP_MSTACK/INPUTS_98server/BKP_INPUT_PATH/"

LATEST_REF_PATH= "/opt/product/AUTOMATION/TEST_AUTOMATION_FRAMEWORK/IMS_SOLARIS_IPV6_EXP_MSTACK/INPUTS/LATEST_REF_PATH/"
BACKUP_REF_PATH= "/opt/product/AUTOMATION/TEST_AUTOMATION_FRAMEWORK/IMS_SOLARIS_IPV6_EXP_MSTACK/INPUTS/BACKUP_REF_PATH/"

#############-->AUTOMATION START SLEEP TIME<--################
AUTO_START_SLEEP_TIME= "1"

#############-->DISK SPACE CHECKING BEFORE AUTOMATION<--################
DISK_SPACE_CHK= "df -h | grep 247G | cut -d'G' -f3"
MIN_DISK_SPACE=2
ROOT_USER_CHK= "id -u -n"
ROOT_PERMESSION_CHNG="chown -R AUTOMATION:AUTOMATION"

###############-->Do you want PCAP Validation?<--##############
PCAP_Validation=0
XML_DECODE_Validation=0
PROTOCOL_VALIDATION=0
PROTOCOL_VALIDATION_TYPE=0

###############-->Do you want Shell Command Execution?<--##############
SHELL_COMMAND_VALIDATION=1
SHELL_PRE_CMD=1
SHELL_ON_CALL_CMD=1
SHELL_POST_CMD=1



###############-->Do you want Logger to be captured?<--##############
LOGGER_Validation=1
LOG_PATTERN_VALIDATION=0



###############-->Do you want State Machine Needs to be executed<--##################
SCENARIO_EXECUTION=1

###############-->Do you want Seagull State Machine Needs to be executed<--##################
SEAGULL_EXECUTION=0

###############-->Do you want SIPP State Machine Needs to be executed<--##################
SIPP_EXECUTION=1

##############--> 1 - TEST CASE ID EQUALS TO SCENARIO ID 2 - TEST CASE ID NOT EQUALS TO SCENARIO ID AND SCENARIO ID WILL BE GIVEN AT RUNTIME<--##########
SEAGULL_EXECUTION_TYPE=1

##############--> 1 - TEST CASE ID EQUALS TO SCENARIO ID 2 - TEST CASE ID NOT EQUALS TO SCENARIO ID AND SCENARIO ID WILL BE GIVEN AT RUNTIME<--##########
SIPP_EXECUTION_TYPE=2

###############-->Do you want Kill old SIPP & SEAGULL Scenarios before execution<--##################
KILL_OLD_SIPP_SEAGULL_SCENARIOS=1

###############-->Do you want MGTS State Machine Needs to be executed<--##################
MGTS_EXECUTION=0



###############-->Do you want CDR Validation?<--##############
CDR_Validation=0

###############-->Do you want SOAP AND XML Validation?<--##############
SOAP_Validation=0
XML_Validation=0



###############-->Do you want DB Validation?<--##############
DB_Validation=1
PRE_DB_Validation=1                        ########For PRE DB QUEIRES#########################
ON_CALL_DB_Validation=1                    ########For ON CALL DB QUEIRES#####################
POST_DB_QUERY_Validation=1                 ########For POST DB QUEIRES########################



###############-->Number of seconds To wait after post execution<--############
POST_SLEEP_EXECUTION=10

##############-->TEST CASE DEPENDANCY VALIDATION<---################
TC_DEPENDENCY_ENABLE=0

##############-->Consolidated Test Case Results<--#############################
CONSOLIDATED_RESULT_FILE="/opt/product/AUTOMATION/AUTOMATION_RESULTS/IMS_SOLARIS_IPV6_EXP_MSTACK/CONSOLIDATED_RESULTS/"


############-->RESULT VALUES<--#####################
SCEN_RESULT="NONE"
cdr_status="NONE"
pcap_status="NONE"
autostop_status="NONE"
postdb_status="NONE"
http_status="NONE"
shellpre_status="NONE"
shelloncall_status="NONE"
shellpost_status="NONE"
protocol_status="NONE"
SEAGULL_RESULT="NONE"

TESTCASE_SCEN_STATUS="NONE"
TESTCASE_POSTDB_STATUS="NONE"
TESTCASE_CDR_STATUS="NONE"
TESTCASE_PCAP_STATUS="NONE"
TESTCASE_PROTOCOL_STATUS="NONE"
TESTCASE_RESULT="NONE"
TESTCASE_SHELLPRE_STATUS="NONE"
TESTCASE_SHELLON_STATUS="NONE"
TESTCASE_SHELLPOST_STATUS="NONE"
TESTCASE_HTTP_STATUS="NONE"
TESTCASE_SEAGULL_STATUS="NONE"
