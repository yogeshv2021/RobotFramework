#####Alias of the Server which is used as center for all PCAP Validations##############
PCAP_SERVER_ALIAS = [ "98_SERVER" ]

PCAP_STRING = [ "sudo /usr/sbin/tcpdump -A -i any -a duration:200 -f 'host 10.8.32.13 or host 10.8.32.12'"]

PCAP_XML_CONVERSION_STRING = [ "/usr/sbin/tshark -n" ]

PCAP_XML_CONVERSION_END_STRING = [ "-T pdml -d tcp.port=8503,diameter -d tcp.port=8501,diameter -R 'diameter.cmd.code == 300||diameter.cmd.code == 301 || diameter.cmd.code == 302 || diameter.cmd.code == 303 || sip'" ]

PCAP_GREP_CHANGE = 0

PCAP_CAPTURE_REMOTE_PATH = [ "/opt/product/testteam/Products/AUTOMATION/IMS_SOLARIS_IPV6_EXP/PCAP/" ]

PCAP_VALIDATION_INPUT_ALIAS= [ "IMS_SOLARIS_IPV6_EXP" ]

PCAP_PROTO_GREP = "egrep -i 'diameter.User-Name|diameter.Public-Identity|diameter.Visited-Network-Identifier|diameter.cmd.code|diameter.Auth-Application-Id|diameter.Experimental-Result-Code|diameter.Server-Name|diameter.Server-Assignment-Type|diameter.User-Data-Already-Available|diameter.Result-Code|diameter.User-Data|diameter.SIP-Number-Auth-Items|diameter.SIP-Authentication-Scheme|diameter.SIP-Authorization'"

PCAP_PROTO_GREP_END_STRING = " "

PCAP_TEMP_PATH = "/opt/product/AUTOMATION/TEST_AUTOMATION_FRAMEWORK/IMS_SOLARIS_IPV6_EXP_MSTACK/INPUTS/INPUT_PATH/TEMP/"

PCAP_EXP_PATH = "/opt/product/AUTOMATION/TEST_AUTOMATION_FRAMEWORK/IMS_SOLARIS_IPV6_EXP_MSTACK/INPUTS/INPUT_PATH/PROTO/"

PCAP_FILE_EXT = "98_SERVER"