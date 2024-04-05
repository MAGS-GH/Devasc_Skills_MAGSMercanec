import requests
import json
import urllib3

urllib3.disable_warnings()

# Data on my current VRouter
base_url = "https://192.168.56.101:443/restconf/data/Cisco-IOS-XE-native:native"
auth = ('cisco', 'cisco123!')

# OPTIONS Request
options_url = f"{base_url}/logging/monitor/severity"
headers = {'Accept': 'application/yang-data+json'}
response = requests.options(options_url, headers=headers, auth=auth, verify=False)
print(f"OPTIONS Response: {response.status_code}")

# POST Request
post_url = f"{base_url}/logging/monitor"
headers = {
    'Content-Type': 'application/yang-data+json',
    'Accept': 'application/yang-data+json',
}
data = {"severity": "alerts"}
response = requests.post(post_url, headers=headers, auth=auth, data=json.dumps(data), verify=False)
print(f"POST Response: {response.status_code}")

# PUT Request
put_url = f"{base_url}/logging/monitor/severity"
data = {"severity": "warnings"}
response = requests.put(put_url, headers=headers, auth=auth, data=json.dumps(data), verify=False)
print(f"PUT Response: {response.status_code}")

# PATCH Request
patch_url = base_url
data = {
    "native": {
        "logging": {
            "monitor": {
                "severity": "informational"
            }
        }
    }
}
response = requests.patch(patch_url, headers=headers, auth=auth, data=json.dumps(data), verify=False)
print(f"PATCH Response: {response.status_code}")

# GET Request
get_url = f"{base_url}/logging/monitor/severity"
response = requests.get(get_url, headers=headers, auth=auth, verify=False)
print(f"GET Response: {response.json()}")

# DELETE Request
delete_url = get_url
response = requests.delete(delete_url, headers=headers, auth=auth, verify=False)
print(f"DELETE Response: {response.status_code}")
