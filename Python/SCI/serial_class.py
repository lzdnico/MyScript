#!/usr/bin/env python
# -*- coding: utf-8 -*-

import serial
import time

class serial_user():
	def __init__(self,portx="com1",bps=9600):
		self.portx=portx
		self.bps=bps
		self.Ret=False
		self.uart=None
	
	def uart_open(self):
		self.uart=serial.Serial(self.portx,self.bps,timeout=0.5)
		if(self.uart.isOpen()):
			self.Ret=True
			print("The Uart is OK!")
		else:
			self.Ret=False
			print("--Failed--")	

	def serial_send(self,send_data):
		send_data=send_data.encode()
		self.uart.write(send_data)

	def serial_send_byte(self,send_data):
		# send_data=send_data.encode()
		self.uart.write(send_data)

	
	def serial_read_VI(self):   ##读取DC-Source的功率
		read_data=self.uart.readline()
        # print('read_data',read_data)
		read_data=read_data.decode()
		# print('read_data', read_data)
		read_data=read_data[:-1]  # 去掉最后一个mian字符(实际是去除最后一个/n字符)
		data_list=read_data.split(':')# 按照分号分成两块
		# print(data_list)
		# print(float(data_list[1]))
		return float(data_list[1])  #取出第二个数然后变成浮点型，因为是从开始计数的，所以1就是取第二个数


	def serial_read_load_Pow(self):   ##读取电阻负载的功率
		read_data=self.uart.readline()
		read_data=read_data.decode()
		# print(float(read_data))
		return float(read_data)

	def serial_close(self):
		self.uart.close()
		   

if __name__ == '__main__':
	ser1=serial_user("com1",9600)
	ser1.uart_open()

	ser1.serial_send('ADDR 21:VOLT 15\n')
	time.sleep(3)

	ser1.serial_send('ADDR 21:MEAS:VOLT?\n')
	data_volt=ser1.serial_read_VI()

	ser1.serial_send('ADDR 21:MEAS:CURR?\n')
	data_curr=ser1.serial_read_VI()
	print('data:',data_curr)
	ser1.serial_close()

	
	


