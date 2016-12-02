#!/usr/bin/env python
# -*- coding: utf8 -*-

import RPi.GPIO as GPIO
import MFRC522
import signal
import requests
import time
import json
import webbrowser

continue_reading = True

# Capture SIGINT for cleanup when the script is aborted
def end_read(signal,frame):
    global continue_reading
    print "Ctrl+C capturado, terminando lectura."
    continue_reading = False
    GPIO.cleanup()

# Hook the SIGINT
signal.signal(signal.SIGINT, end_read)

# Create an object of the class MFRC522
MIFAREReader = MFRC522.MFRC522()

# Welcome message
#print "Welcome to the MFRC522 data read example"
print "Por favor acerque su carnet" 
print "Presione Ctrl-C para cancelar."

# This loop keeps checking for chips. If one is near it will get the UID and authenticate
while continue_reading:
    
    # Scan for cards    
    (status,TagType) = MIFAREReader.MFRC522_Request(MIFAREReader.PICC_REQIDL)

    # If a card is found
    if status == MIFAREReader.MI_OK:
        print "Tarjeta detectada"
        continue_reading = False
    
    # Get the UID of the card
    (status,uid) = MIFAREReader.MFRC522_Anticoll()

    # If we have the UID, continue
    if status == MIFAREReader.MI_OK:
        # Print UID
        carnet=""
	for i in uid:
            carnet+=str(i)

        url = 'https://rails-5-osoyei.c9users.io/students/' #url api
	url2 = 'https://rails-5-osoyei.c9users.io/students/' #url WebApp 
        headers = {'Content-Type': 'application/json'}
        payload = {'id': carnet}
        
	r = requests.get(url + carnet)
	print r.status_code
	if r.status_code == 200:
            print "existe "
            #Open URL in a new tab, if a browser window is already open.
            webbrowser.open_new_tab(url2+carnet)
	else:
            print "no existe "
            r = requests.post(url, data=json.dumps(payload), headers=headers)
            if r.status_code == 200:
		webbrowser.open_new_tab(url2+carnet+"/edit")
	    else:
		print "Error"

        #url = "http://www.rails-5-osoyei.c9users.io"
        
        #Open URL in a new tab, if a browser window is already open.
        #webbrowser.open_new_tab(url)
        
        #Datos para el post
    
       #cantidad = 1
       #leerla?
       # elemento = 12345
        #un ejemplo valido?
        #fecha = time.strftime("%x")

        #print fecha
       
