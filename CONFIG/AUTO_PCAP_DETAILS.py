#####Alias of the Server which is used as center for all PCAP Validations##############
PCAP_SERVER_ALIAS = [ "98_SERVER" ]

PCAP_STRING = [ "sudo /usr/sbin/tcpdump  -A -s 20000 -i any -n \"host 2a03:9ec0:fc01::10 or 2a03:9ec0:fc01::08 or 192.168.151.149 and (port 7100  or port 7200 or port 7300 or port 7800 or 7500 or port 8503 or port 8501 or port 8502 or port 8500 or port 6557 or port 7020) or (host 2a03:9ec0:fc01::10 and port 30000 or port 40000)\" -Z testteam"]

#####PCAP_STRING = [ "sudo /usr/sbin/tcpdump  -A -i any -n \"host fe80::20c:29ff:fe0f:dcf and (port 7100  or port 7200 or port 7300 or port 7800 or 7500 or port 8503 or port 8501 or port 8502 or port 8500 or port 6557 or port 7020)\" -Z testteam"]

PCAP_XML_CONVERSION_STRING = [ "/usr/sbin/tshark -n" ]

PCAP_XML_CONVERSION_END_STRING = [ "-T pdml -d tcp.port=8503,diameter -d tcp.port=8501,diameter -R 'diameter.cmd.code == 300||diameter.cmd.code == 301 || diameter.cmd.code == 302 || diameter.cmd.code == 303 || sip'" ]

PCAP_GREP_CHANGE = 0

PCAP_CAPTURE_REMOTE_PATH = [ "/home/testteam/Products/AUTOMATION/IMS/PCAP/" ]

PCAP_VALIDATION_INPUT_ALIAS= [ "IMS" ]

PCAP_PROTO_GREP = "egrep -i 'diameter.User-Name|diameter.Public-Identity|diameter.Visited-Network-Identifier|diameter.cmd.code|diameter.Auth-Application-Id|diameter.Experimental-Result-Code|diameter.Server-Name|diameter.Server-Assignment-Type|diameter.User-Data-Already-Available|diameter.Result-Code|diameter.User-Data|diameter.SIP-Number-Auth-Items|diameter.SIP-Authentication-Scheme|diameter.SIP-Authorization'"

PCAP_PROTO_GREP_END_STRING = " "

PCAP_STATS_START_STRING = [ "/usr/sbin/tshark -r" ]

PCAP_STATS_SIP_END_STRING  = [ "-q -z sip,stat"]

PCAP_STATS_RTP_END_STRING  = [ "-q -z rtp,streams"]

RTP_PACKET_COUNT = "1260"

RTP_VALIDATION_TYPE = "0"

SIP_VALIDATION_TYPE = "0"

PCAP_STATS_RTP_EXTRACT_START = "head -n-1"

PCAP_STATS_RTP_EXTRACT_END = "sed '1,2d' |tr -s ' ' |cut -d' ' -f1,3,7"

PCAP_TEMP_PATH = "/opt/product/AUTOMATION/TEST_AUTOMATION_FRAMEWORK/IMS_SOLARIS_IPV6_EXP_MSTACK/INPUTS/INPUT_PATH/TEMP/"

PCAP_EXP_PATH = "/opt/product/AUTOMATION/TEST_AUTOMATION_FRAMEWORK/IMS_SOLARIS_IPV6_EXP_MSTACK/INPUTS/INPUT_PATH/PROTO/"

PCAP_FILE_EXT = "98_SERVER"
