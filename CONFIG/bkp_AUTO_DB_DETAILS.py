##############DB DETAILS######################

######Type of Database Used Eg:- cx_Oracle for ORACLE########
###### DB_TYPE = [ "cx_Oracle" , "mySQL" ] ######

DB_TYPE = ["cx_Oracle" , "cx_Oracle", "cx_Oracle", "cx_Oracle" ]

postfix = "-end"



#################Enter ALIAS NAME FOR PRECONDITION OF EACH PRODUCTS Name##################################################
##########precondition_input_alias= [ "DNGRRBS" , "PCRF" ]###############



precondition_input_alias = ["IMS" , "HSS", "RRBS", "PCRF"]



#################Enter ALIAS NAME FOR ONCALLCONDITION OF EACH PRODUCTS Name##################################################
##########oncallcondition_input_alias= [ "DNGRRBS" , "PCRF" ]###############


oncallcondition_input_alias = ["IMS" , "HSS", "RRBS", "PCRF"]



#################Enter ALIAS NAME FOR POSTCONDITION OF EACH PRODUCTS Name##################################################
##########postcondition_input_alias= [ "DNGRRBS" , "PCRF" ]###############


postcondition_input_alias = ["IMS" , "HSS", "RRBS", "PCRF"]



#################Enter DB Connection String##################################################
##########DB_CONNECTION_STRING= [ "lycarrbsdb1/lyca@192.192.192.192/auto" , "lycarrbsdb2/lyca@192.192.192.192/auto" ]###############


##########DB_CONNECTION_STRING= ["database='IMS', user='ims', password='ims', host='192.168.151.120', port=3306","HLR_AUTO/lyca@192.168.151.166:1521/stnewdb"]


DB_CONNECTION_STRING= ["IMSAUTO/LYCA@192.168.151.147:1521/ST11GDB","HLR_AUTO/lyca@192.168.151.166:1521/stnewdb", "TEST_BLUSCP/lyca@192.168.151.166:1521/stnewdb", "IMSPCRFFUNDB/LYCA@192.168.151.147:1521/ST11GDB"]



#################Enter the DB Queries that needs to be analysed when DB Post Condition Fails##################################################
####################PLACE HOLDER MSISDN needs to be placed in the DB Query & MSISDN needs to be passed in the testcase########################


DEBUGGING_QUERIES=["/opt/product/AUTOMATION/TEST_AUTOMATION_FRAMEWORK/IMS_SOLARIS_IPV6_EXP_MSTACK/INPUTS/ims_db_debug_query.txt"]

DUMMY_PLACE_HOLDERS=[ "MSISDN", "BUNDLE_CODE", "TARIFF_CODE", "NETWORK" ]



##############################1- Update System Time in DB ;0 - Do not Update System Time in DB######################
DB_UPDATE_TIME=0
