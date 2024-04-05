import requests #We need requests to execute line 4!
import datetime
import json
requests.packages.urllib3.disable_warnings() #urllib3 is the package we need
DNAC_scheme='https://'
DNAC_authority='sandboxdnac.cisco.com'
DNAC_port=':443'
DNAC_path_token='/dna/system/api/v1/auth/token'
DNAC_path='/dna/intent/api/v1/network-device'
DNAC_user='devnetuser'
DNAC_psw='Cisco123!'
#DATEANDTIME
print("Currentdateandtime:")
print(datetime.datetime.now()) #To print the current time we use datetime.now() method
#TOKENREQUEST
token_req_url=DNAC_scheme+DNAC_authority+DNAC_path_token
auth=(DNAC_user,DNAC_psw)
#We use POST because the HTTP request tike is POST
req=requests.request('POST',token_req_url,auth=auth,verify=False)
token=req.json()['Token']
#INVENTORYREQUEST
req_url=DNAC_scheme+DNAC_authority+DNAC_port+DNAC_path
headers={'X-AUTH-TOKEN':token} #We use the token from line 20
resp_devices=requests.request('GET',req_url,headers=headers,verify=False)
resp_devices_json=resp_devices.json()
#FILTERRESPONSEDATA
for device in resp_devices_json['response']:
    if device['type']!=None:
        #print(device)
        print('===')
        print('Hostname:'+ device['hostname'])
        print('Family: '+ device['family']) #We take 'family' attribute from device
        print('MAC:'+device['macAddress'])
        print('IP:'+device['managementIpAddress'])
        print('Softwareversion:'+device['softwareVersion'])
        print('Reachability:'+device['reachabilityStatus'])