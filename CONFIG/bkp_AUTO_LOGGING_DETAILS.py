###########-->> Logger Paths used in each server,Logger Paths enclosed between a square bracket,Each set of logger paths of each server enclosed within outside square bracket<--#################

REMOTE_LOGPATH= [   "/home/testteam/Products/AUTOMATION/IMS/P_CSCF/AppLog/",
		    "/home/testteam/Products/AUTOMATION/IMS/I_CSCF/AppLog/",
		    "/home/testteam/Products/AUTOMATION/IMS/S_CSCF/AppLog/",
		    "/home/testteam/Products/AUTOMATION/IMS/TAS/AppLog/",
		    "/home/testteam/Products/AUTOMATION/IMS/PCRF/AppLog/",
		    "/opt/product/testteam/Products/AUTOMATION/HSS_IMS/DIAM-SOUC/diameter_stack_install/bin/LOGGERS/",
		    "/opt/product/testteam/Products/AUTOMATION/HSS_IMS/release/LOGGER/",
		    "/home/testteam/Products/AUTOMATION/IMS/P_CSCF/AppLog/",
		    "/home/testteam/Products/AUTOMATION/IMS/I_CSCF/AppLog/",
		    "/home/testteam/Products/AUTOMATION/IMS/S_CSCF/AppLog/",
		    "/home/testteam/Products/AUTOMATION/IMS/TAS/AppLog/",
		    "/home/testteam/Products/AUTOMATION/IMS/PCRF/AppLog/",
		    "/opt/product/testteam/Products/AUTOMATION/IMS/IMSRRBS/LOGGER/"

                ]


SERVER_ALIAS= [  "98_SERVER", "98_SERVER", "98_SERVER", "98_SERVER", "98_SERVER", "54_SERVER", "54_SERVER", "98_SERVER", "98_SERVER", "98_SERVER", "98_SERVER", "98_SERVER", "54_SERVER"  ]


###########-->>File name prefix of each logger in the result path<--######################################

GREP_PREFIX=[["APPOSS_"],["APPOSS_"],["APPOSS_"],["APPOSS_"],["APPOSS_"],["ACCERLERO_"],["HSS_HLRI005_"],["ACCERLERO_"],["ACCERLERO_"],["ACCERLERO_"],["ACCERLERO_"],["ACCERLERO_"],["Debug_"]]

##########-->> Prefix that needs to be prefixed before log file in the result path<<--####################

LOGGER_PREFIX=[["PCSCF_SIP"],["ICSCF_SIP"],["SCSCF_SIP"],["TAS_SIP"],["PCRF_IMS"],["DIA_"],["HSS_"],["PCSCF_DIA"],["ICSCF_DIA"],["SCSCF_DIA"],["TAS_DIA"],["PCRF_DIA"],["IMS_RRBS"]]

###########LOG PATTERN VALIDATION#################

log_pattern_input_alias= {
                           "IMS" : "PCRF"
                          }
