import numpy as np
import random
from serial_class import  serial_user
import struct
import time
import matlab.engine



class Environment():
    def __init__(self):
        self.v0 = np.zeros(1)
        self.v1 = np.zeros(1)
        self.p_ref = np.zeros(1)
     #   self.eng = matlab.engine.start_matlab()

        self.ser0 = serial_user("com1",115200) #电源通信串口
        self.ser0.uart_open()
        self.ser1 = serial_user("com2",115200) #DSP通信串口
        self.ser1.uart_open()
        self.ser2 = serial_user("com3",115200) #负载通信串口
        self.ser2.uart_open()
        #self.ser1=serial_user("/dev/ttyUSB1",9600)
        #self.ser1.uart_open()



    def reset(self):
        self.v0 = random.randrange(100, 140)
        self.v1 = random.randrange(40, 50)
        self.p_ref = random.randrange(60, 200)
        # self.p0 = random.randrange(0, int(9.26*self.v0))

     #   self.p0 = 1

        # y1 = np.hstack((self.v0-100)/(140-100), (self.v1-40)/(50-40), (self.p_ref-1)/(200-1))
        # y1 = np.hstack(((self.v0 - 100) / (140 - 100), (self.v1 - 40) / (50 - 40), self.p0 / 200))
        y1 = np.hstack((self.v0/120, self.v1/45, self.p_ref/130))
        return y1

    def get_state(self):
        self.v0 = random.randrange(100, 140)
        self.v1 = random.randrange(40, 50)
        self.p_ref = random.randrange(60, 200)
        # self.p0 = random.randrange(0, int(9.26*self.v0))

     #   self.p0 = 1

        # y1 = np.hstack((self.v0-100)/(140-100), (self.v1-40)/(50-40), (self.p0-1)/(200-1))
        # y1 = np.hstack(((self.v0 - 100) / (140 - 100), (self.v1 - 40) / (50 - 40), self.p0 / 200))
        y1 = np.hstack((self.v0/120, self.v1/45, self.p_ref/130))
        return y1
    
    def Communicate_DSP(self,  send_data):
        if self.ser1.Ret:
            #起始位‘S’对应的十六进制ASCII码为53
            data = '53'  
            for datatmp in send_data:        
                #float转成4个10进制字节  
                bs = struct.pack("f",datatmp)
                for a in bs:
                    tmp = hex(a).split('0x')[1]
                    #把0填充成00，1填充成01
                    if len(tmp) == 1:
                        tmp = '0'+tmp
                    data=data+' '+tmp
            #终止位‘E’对应的十六进制ASCII码为45
            data=data+' 45'
            #转化成串口能够读取的数据
            data = bytes.fromhex(data)
            self.ser1.serial_send_byte(data)
        else:
            print('serial_1 open error')

    
    def Communicate_DCsource_send(self,  power_data):
        string_power_data=str(power_data)
        send_data_source='VOLT '+string_power_data+ '\n'
        if  self.ser0.Ret:
            self.ser0.serial_send(send_data_source)
        else:
            print('serial_0_send open error')


    def Communicate_DCsource_read(self):
        if  self.ser0.Ret:
            # self.ser0.serial_send('FETC:VOLT?\n')
            # time.sleep(0.05)  ##延时0.05秒以后读取电压
            # data_volt = self.ser0.serial_read_load_Pow()
            # print('v0=',data_volt)
            self.ser0.serial_send('MEAS:POW?\n')
            time.sleep(0.15)  ##延时0.1秒以后读取电流
            data_P0w = self.ser0.serial_read_load_Pow()

            if data_P0w == 0:  ###如果独到的功率等于零，延时0.1秒再读一次
                time.sleep(0.1)  ##延时0.1秒以后读取功率
                self.ser0.serial_send('MEAS:POW?\n')
                time.sleep(0.15)  ##延时0.1秒以后读取功率
                data_P0w = self.ser0.serial_read_load_Pow()

            return data_P0w
        else:
            print('serial_0_read open error')
            return -1


    def Communicate_load_set_send(self,  Res): #设置负载阻抗
        string_load_data=str(Res)
        send_data_comd='SYST:REM'+ '\n'
        if  self.ser2.Ret:
            self.ser2.serial_send(send_data_comd)
        else:
            print('serial_2_send open error')
        time.sleep(0.1)  ##延时0.05秒以后发送电阻指令
        send_data_load='RES '+string_load_data+ '\n'
        if  self.ser2.Ret:
            self.ser2.serial_send(send_data_load)
        else:
            print('serial_2_send open error')

    def Communicate_load_read(self): #读负载功率
            if  self.ser2.Ret:
                self.ser2.serial_send('FETC:POW?\n')
                time.sleep(0.15)  ##延时0.1秒以后读取功率
                data_P1w=self.ser2.serial_read_load_Pow()

                if data_P1w == 0:  ###如果独到的功率等于零，延时0.1秒再读一次
                    time.sleep(0.1)  ##延时0.1秒以后读取电流
                    self.ser0.serial_send('FETC:POW?\n')
                    time.sleep(0.15)  ##延时0.1秒以后读取电流
                    data_P1w = self.ser0.serial_read_load_Pow()

                return data_P1w  ##因为88系列无法读功率，所以用下面的电压和电流代替
                # self.ser2.serial_send('MEAS:VOLT?\n')
                # time.sleep(0.1)  ##延时0.1秒以后读取电压
                # data_Vow = self.ser2.serial_read_load_Pow()
                # self.ser2.serial_send('MEAS:CURR?\n')
                # time.sleep(0.1)  ##延时0.1秒以后读取电流
                # data_Iow = self.ser2.serial_read_load_Pow()
                # return data_Vow*data_Iow
            else:
                print('serial_2_read open error')
                return -1

    def Communicate_Read(self):  # 读电源和负载的功率
        if self.ser2.Ret:
            self.ser2.serial_send('FETC:POW?\n')
        if self.ser0.Ret:
            self.ser0.serial_send('FETC:POW?\n')
        time.sleep(0.2)  ##延时0.1秒以后读取功率
        data_P0w = self.ser0.serial_read_load_Pow()
        data_P1w = self.ser2.serial_read_load_Pow()
        return data_P0w, data_P1w ##因为88系列无法读功率，所以用下面的电压和电流代替


    def my_AVERAGE_main(self, data_list):  # python求数组去掉最大值与最小值后的平均值, 需要在datalist前面加一个self，定义全局变量
        if len(data_list) == 0:
            return 0
        if len(data_list) > 2:
            data_list.remove(min(data_list))
            data_list.remove(max(data_list))
            average_data = float(sum(data_list)) / len(data_list)
            return average_data
        elif len(data_list) <= 2:
            average_data = float(sum(data_list)) / len(data_list)
            return average_data
        # 调用,average = my_AVERAGE_main(数组变量名)
        # 例:


    def get_reward(self, action):
        trans = np.zeros(6, float)
        trans[0] = self.v0
        trans[1] = self.v1
        trans[2] = self.p_ref

        R = ((trans[1]**2) / trans[2]) ##计算电阻的值

        for i in range(3):
            trans[i+3] = (action[i] + 1)/2   ##默认action [i]为-1~1，此处用公式将其范围规定到对应的范围

        self.Communicate_DSP([2000, trans[3], trans[4], trans[5], 45])  ##1. 先修改移相
        self.Communicate_DCsource_send(trans[0]) ##2. 设置电压值
        self.Communicate_load_set_send(R)  ##3.设置负载

        time.sleep(1)  ##等待0.5秒以后第一次读取数据
        P0_1, P1_1  = self.Communicate_Read()
        P0_2, P1_2 = self.Communicate_Read()
        P0_3, P1_3 = self.Communicate_Read()
        P0_4, P1_4 = self.Communicate_Read()
        P0_5, P1_5 = self.Communicate_Read()

        #  1. 求电源去掉最大最小的平均值
        list_0 = [P0_1, P0_2, P0_3, P0_4, P0_5]
        P0 = self.my_AVERAGE_main(list_0)

        #  2. 求负载去掉最大最小的平均值
        list_1 = [P1_1, P1_2, P1_3, P1_4, P1_5]
        P1 = self.my_AVERAGE_main(list_1)  #调用时加一个self

        # 1. self.reward = P1 / (P0 + 0.00001) - 40 * (((P1 - self.p_ref) / 200) ** 2)  ##除以最大功率得标幺功率
        # self.reward = 2 * P1 / (P0 + 0.00001) - 100 * (((P1 - self.p_ref) / 200) ** 2)  ##除以最大功率得标幺功率


        PPP = abs(P1 - self.p_ref)
        self.reward = 8 * P1 / (P0 + 0.00001) - (PPP / 10)  ##奖励函数7


        if self.reward >= 100:
            time.sleep(0.1)  ##等待1秒以后再读去数据进行计算
            P0, P1 = self.Communicate_Read()
            self.reward = 8 * P1 / (P0 + 0.00001) - (PPP / 10)  ##除以最大功率得标幺功率
            if self.reward >= 100:
                self.reward = -300

        transition = matlab.double(trans.tolist())

        print('trans: ', transition)  # 将当前动作和目标输出，输出double型
        print('P0_x: ', P0_1, P0_2, P0_3, P0_4, P0_5)
        print('P1_x: ', P1_1, P1_2, P1_3, P1_4, P1_5)
        print('reward=', self.reward, 'y=', 100 * P1 / (P0 + 0.0001), 'P0= ', P0, 'P1=', P1)  ##将运行结果输出
        return self.reward


