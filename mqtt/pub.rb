require 'mqtt'

client = MQTT::Client.connect('127.0.0.1')
client.publish( 'topic1', 'hello word' )