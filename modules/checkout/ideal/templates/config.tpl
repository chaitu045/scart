PRIVATEKEY=isc_privatekey.pem
PRIVATEKEYPASS={{ PrivateKeyPass|raw }}
PRIVATECERT=isc_privatecert.crt
CERTIFICATE0=rabo.cer
CERTIFICATE1=ing.cer
ACQUIRERURL={{ AcquirerURL|raw }}
ACQUIRERTIMEOUT=10
#enter your merchant id below
MERCHANTID={{ MerchantID|raw }}
SUBID=0
#enter payment confirmation url
MERCHANTRETURNURL={{ ReturnURL|raw }}
#5 minute payment expiry
EXPIRATIONPERIOD=PT5M
#enter the path to the logfile below
LOGFILE=Connector_log.txt
TraceLevel = ERROR
#PROXY=
#PROXYACQURL=