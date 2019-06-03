import os
import requests

directory = os.path.dirname(os.path.abspath(__file__))+'/observations'

for filename in sorted(os.listdir(directory)):
	print(filename)
	upload_model = requests.get('https://api.o9y.soma.farm/observation?fileType=Image/jpeg', verify=False).json()
	os.rename(directory+'/'+filename, directory+'/'+upload_model['fileName'])
	f = open(directory+'/'+upload_model['fileName'], "rb")
	up_r = requests.put(upload_model['uploadUrl'], data=f.read(), headers={'Content-Type': 'Image/jpeg'})
	print(up_r)
	f.close()
	os.remove(directory+'/'+upload_model['fileName'])
