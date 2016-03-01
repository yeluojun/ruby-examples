require 'mqtt'

client =  MQTT::Client.connect('127.0.0.1')
client.subscribe( 'topic1' )

client.get do |topic,message|
  p topic, message
  # Block is executed for every message received
end
