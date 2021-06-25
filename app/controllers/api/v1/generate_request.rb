require 'json'
require 'rest-client'


	auth = {"Authorization": "Bearer BQBw5OAq2Q4DZW7kshL1FrOZCaF6MTcsisIH_cdEx9vEoOehlzSHg5HDo3Aq59VM1J06df9z_6JPzi6fPrZlAbV9JMI69z2oTnHDhOb2ToXZ1Xvw12gmGGjdLtYi0jAY84Kqv-RMqDUbdcDLB874z3LGf2ab7wKwPyEZhNibTlhatHU"}

	endpoint1 = RestClient.get(
	'https://api.spotify.com/v1/search?q=Daft+Punk&type=artist',
	headers=auth)
	data1 = JSON.parse(endpoint1)
	href = data1['artists']['href']
	artis = data1['artists']['items'][0]['href']
	puts artis


#https://accounts.spotify.com/authorize?client_id=9bd71a997cef48f4883d2f6151c8f736&redirect_uri=https%3A%2F%2Fexample.com%2Fcallback%2F&scope=user-read-private%20user-read-email&response_type=token&state=123

#BQBUByQFa7rv6Si2V1B5NFe-o4AbO7jZsYe3p776P6qy1llX-dMVpLG1-ikEsJkVKgNWvSoINtlr8KblxRqooX9SdDpIS5bRBIUB25zpAAsi2LKy_8kaDcpIrGJENgbw1L1LEEeDBAUmM30uc0BICjZ0oBQ8-i-nWfUxULRkUX0o9g4