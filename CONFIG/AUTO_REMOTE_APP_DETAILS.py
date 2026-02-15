#############-->>Remote Server Details for Old Model <--################ 
APP_HOST = "192.168.151.149"
APP_USERNAME = "testteam"
APP_PASSWORD = "testteam"
APP_PROMPT = "$"
AUTO_PROMPT = "AUTO$"
APP_ALIAS = "IMS_SERVER"
ENCODING = "iso-8859-2"

############-->>Remote Servers Details for New Model<--####################
#####SERVERS = [{"HOST"               : "10.8.32.12",
#####           "USERNAME"            : "root",
#####           "PASSWORD"            : "root123",
#####           "PROMPT"              : "#" or "$",
#####           "ALIAS"               : "120_SERVER",
#####           "PLATFORM"            : "SOLARIS" or "LINUX",
#####           "ENCODING"            : "iso-8859-2",
#####           "LOGIN_TYPE"          : "PASSWORD" or "PUBLICKEY",
#####           "APP_PRODUCTS"        : [
#####                                    "AUTO_DNGRRBS",
#####                                    "AUTO_PCRF",
#####                                    "Auto_dng",
#####                                    "AUTO_DNGRRBS2"
#####                                   ]
#####          }]

SERVERS = [{"HOST"               : "192.168.151.149",
           "USERNAME"            : "testteam",
           "PASSWORD"            : "testteam",
           "PROMPT"              : "$",
           "ALIAS"               : "98_ROOT",
           "PLATFORM"            : "LINUX",
           "ENCODING"            : "iso-8859-2",
           "LOGIN_TYPE"          : "PUBLICKEY",
           "APP_PRODUCTS"        : [
                                   ]
          },


          {"HOST"                : "192.168.151.149",
           "USERNAME"            : "testteam",
           "PASSWORD"            : "testteam",
           "PROMPT"              : "$",
           "ALIAS"               : "98_SERVER",
           "PLATFORM"            : "LINUX",
           "ENCODING"            : "iso-8859-2",
           "LOGIN_TYPE"          : "PUBLICKEY",
           "APP_PRODUCTS"        : [
		
                                   ]
	   },
          {"HOST"               : "192.168.151.54",
           "USERNAME"            : "testteam",
           "PASSWORD"            : "testteam",
           "PROMPT"              : "$",
           "ALIAS"               : "54_SERVER",
           "PLATFORM"            : "LINUX",
           "ENCODING"            : "iso-8859-2",
           "LOGIN_TYPE"          : "PUBLICKEY",
           "APP_PRODUCTS"        : [
		
                                   ]
	   }


          ]


PRODUCT_SERVER_DICTIONARY = {
                               "AUTO_PCSCF"        :  "98_ROOT",
                               "AUTO_PCSCF"        :  "98_SERVER",
                               "AUTO_ICSCF"        :  "98_SERVER",
                               "AUTO_SCSCF"        :  "98_SERVER",
                               "AUTO_TAS"          :  "98_SERVER",
                               "AUTO_IMSPCRF"      :  "98_SERVER",
                               "AUTO_DIAIMSPCRF"   :  "98_SERVER",
                               "AUTO_IMSRRBS"      :  "54_SERVER",
                               "AUTO_DiaServer"    :  "54_SERVER",
                               "pHSS-Auto"         :  "54_SERVER",
                               "AUTO_MRF"          :  "98_SERVER"
                            }


PRODUCT_SCRIPT_DICTIONARY = {
                               "AUTO_PCSCF"          :  "/home/testteam/Products/AUTOMATION/IMS/P_CSCF/:bash start_pcscf.sh",
                               "AUTO_ICSCF"          :  "/home/testteam/Products/AUTOMATION/IMS/I_CSCF/:bash start_icscf.sh",
                               "AUTO_SCSCF"          :  "/home/testteam/Products/AUTOMATION/IMS/S_CSCF/:bash start_scscf.sh",
                               "AUTO_TAS"            :  "/home/testteam/Products/AUTOMATION/IMS/TAS/:bash start_tas.sh",
                               "AUTO_IMSPCRF"        :  "/home/testteam/Products/AUTOMATION/IMS/PCRF/:bash start_pcrf.sh",
                               "AUTO_DIAIMSPCRF"     :  "/home/testteam/Products/AUTOMATION/IMS/IMSDIASTACK/bin/:bash start_diaimspcrf.sh",
                               "AUTO_IMSRRBS"        :  "/opt/product/testteam/Products/AUTOMATION/IMS/IMSRRBS/:bash auto_run.sh",
                               "AUTO_DiaServer"      :  "/opt/product/testteam/Products/AUTOMATION/HSS_IMS/DIAM-SOUC/diameter_stack_install/bin/:bash auto_run.sh",
                               "pHSS-Auto"           :  "/opt/product/testteam/Products/AUTOMATION/HSS_IMS/release/:bash auto_run.sh",
                               "AUTO_MRF"            :  "/home/testteam/Products/AUTOMATION/IMS/MRF/IMS_MRF_INSTALL/bin/:bash mrf_auto_run.sh"
                            }

GRACE_EXIT_DICTIONARY = {
                               "AUTO_PCSCF"          :  "kill -2",
                               "AUTO_ICSCF"          :  "kill -2",
                               "AUTO_SCSCF"          :  "kill -2",
                               "AUTO_TAS"            :  "kill -2",
                               "AUTO_IMSPCRF"        :  "kill -2",
                               "AUTO_DIAIMSPCRF"     :  "kill -2",
                               "AUTO_IMSRRBS"        :  "kill -2",
                               "AUTO_DiaServer"      :  "kill -2",
                               "pHSS-Auto"           :  "kill -2",
                               "AUTO_MRF"            :  "kill -2"
                      }

REMOTE_DISK_SPACE_CHK= { 
                             "98_ROOT"                  : "df -h | grep -w '/' | cut -d'G' -f3",
                             "98_SERVER"                : "df -h | grep -w '/' | cut -d'G' -f3",
                             "54_SERVER"                : "df -h | grep '/opt/product' | cut -d'G' -f3"
                       }


#CONFIG_ALIASES = {
#                    "DNGRRBS_CONFIG"         : [ "98_SERVER","/opt/product/testteam/Products/AUTOMATION/DNGRRBS/release/","/opt/product/AUTOMATION/TEST_AUTOMATION_FRAMEWORK/PCRF/INPUTS/APPCONFIG/RESULTS/SCPConfigData.xml","/opt/product/AUTOMATION/TEST_AUTOMATION_FRAMEWORK/PCRF/INPUTS/APPCONFIG/TEMPLATES/SCPConfigData-TEMPLATE.xml","/opt/product/AUTOMATION/TEST_AUTOMATION_FRAMEWORK/PCRF/INPUTS/APPCONFIG/VALUES/SCPConfigData-VALUES.xml" ]
#                 }

CONFIG_ALIASES = {
                     "AUTO_IMSRRBS_CONFIG"         : [ "98_SERVER","/opt/product/testteam/Products/AUTOMATION/IMS/IMSRRBS","/opt/product/AUTOMATION/TEST_AUTOMATION_FRAMEWORK/IMS_SOLARIS_IPV6_EXP_MSTACK/INPUTS/APPCONFIG/RESULTS/SCPConfigData.xml","/opt/product/AUTOMATION/TEST_AUTOMATION_FRAMEWORK/IMS_SOLARIS_IPV6_EXP_MSTACK/INPUTS/APPCONFIG/TEMPLATES/SCPConfigData-TEMPLATE.xml","/opt/product/AUTOMATION/TEST_AUTOMATION_FRAMEWORK/IMS_SOLARIS_IPV6_EXP_MSTACK/INPUTS/APPCONFIG/VALUES/SCPConfigData-VALUES.xml","::" ]
                 }


SLEEP_TIME = 10
REMOTE_START_TYPE = 0

