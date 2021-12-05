import serial
import serial.tools.list_ports
import struct
import re
import time
#pip install serical

class Communication():
    #字节转float，接收数据后转化
    def bytesToFloat(h1,h2,h3,h4):
        ba = bytearray()
        ba.append(h4)
        ba.append(h3)
        ba.append(h2)
        ba.append(h1)
        #print(struct.unpack("!f",ba)[0])
        return struct.unpack("!f",ba)[0]

    #float转字，发送数据前转化
    def floatToBytes(f):
        bs = struct.pack("f",f)
        return (bs[3],bs[2],bs[1],bs[0])

    #初始化 
    def __init__(self,com,bps,timeout):
        self.port = com
        self.bps = bps
        self.timeout =timeout
        global Ret
        try:
            # 打开串口，并得到串口对象
             self.main_engine= serial.Serial(self.port,self.bps,timeout=self.timeout)
            # 判断是否打开成功
             if (self.main_engine.is_open):
               Ret = True
        except Exception as e:
            Ret = False
            print("---异常---：", e)

    # 打印设备基本信息
    def Print_Name(self):
        print(self.main_engine.name) #设备名字
        print(self.main_engine.port)#读或者写端口
        print(self.main_engine.baudrate)#波特率
        print(self.main_engine.bytesize)#字节大小
        print(self.main_engine.parity)#校验位
        print(self.main_engine.stopbits)#停止位
        print(self.main_engine.timeout)#读超时设置
        print(self.main_engine.writeTimeout)#写超时
        print(self.main_engine.xonxoff)#软件流控
        print(self.main_engine.rtscts)#软件流控
        print(self.main_engine.dsrdtr)#硬件流控
        print(self.main_engine.interCharTimeout)#字符间隔超时

    #打开串口
    def Open_Engine(self):
        self.main_engine.open()

    #关闭串口
    def Close_Engine(self):
        self.main_engine.close()
        #print('关闭串口：',self.main_engine.is_open)  # 检验串口是否打开

    #发数据
    def Send_data(self,data):
        self.main_engine.write(data)

    #更多示例
    # self.main_engine.write(chr(0x06).encode("utf-8"))  # 十六制发送一个数据
    # print(self.main_engine.read().hex())  #  # 十六进制的读取读一个字节
    # print(self.main_engine.read())#读一个字节
    # print(self.main_engine.read(10).decode("gbk"))#读十个字节
    # print(self.main_engine.readline().decode("gbk"))#读一行
    # print(self.main_engine.readlines())#读取多行，返回列表，必须匹配超时（timeout)使用
    # print(self.main_engine.in_waiting)#获取输入缓冲区的剩余字节数
    # print(self.main_engine.out_waiting)#获取输出缓冲区的字节数
    # print(self.main_engine.readall())#读取全部字符。
    
    # 接收原始数据
    def Recive_data(self,way):
        try:
            if self.main_engine.in_waiting:
                # 一个字节一个字节的接收
                if(way == 0):
                    for i in range(self.main_engine.in_waiting):
                        print("接收ascii数据："+str(self.Read_Size(1)))
                        data1 = self.Read_Size(1).hex()#转为十六进制
                        data2 = int(data1,16)#转为十进制
                        print("收到数据十六进制："+data1+"  收到数据十进制："+str(data2))
                # 接收一串数据，常用
                if(way == 1):
                    data = self.main_engine.read(22)
                    #print("接收ascii数据：", data)
                    return(data)
        except Exception as e:
            print("异常报错：",e)

    # DSP接收数据，端口号和DSP数据个数
    def ReadSCI_data(com,datalen):
        #启动
        Engine1 = Communication(com,115200,0.5)        
        if (Ret):
            #启动后延迟一端时间
            time.sleep(1)
            data = bytearray(Engine1.Recive_data(1))
            datagroup = []
            i = 0
            for i in range(datalen):
                #忽略起始位'S'，占用一个字节。 每个数据4个字节。因此每4个字节转化成float型
                datagroup.append(Communication.bytesToFloat(data[1+4*i],data[2+4*i],data[3+4*i],data[4+4*i]))
            #关闭
            Engine1.Close_Engine()
            return(datagroup)
 
    # 向DSP发送数据，com1,[1,2,3,4,5]
    def SendSCI_data(com,datagroup):        
        Engine1 = Communication(com,115200,0.5)
        if (Ret):
            #起始位‘S’对应的十六进制ASCII码为53
            data = '53'  
            for datatmp in datagroup:        
                #float转成4个10进制字节  
                bs = struct.pack("f",datatmp)
                for a in bs:
                    tmp = hex(a).split('0x')[1]
                    #把0填充成00，1填充成01
                    if len(tmp) == 1:
                        tmp = '0'+tmp
                    data=data+' '+tmp
            #起始位‘E’对应的十六进制ASCII码为45           
            data=data+' 45'
            #转化成串口能够读取的数据
            data = bytes.fromhex(data)
            Engine1.Send_data(data)
        Engine1.Close_Engine()


#调试发送数据
#Engine1 = Communication('com1',115200,0.5)
#data= '\x53\x00\x00\x80\x3f\x00\x00\x80\x3f\x00\x00\xc8\x3f\x00\x00\x80\x3f\x00\x00\x80\x3f\x45'  #无效
#data = '53 00 00 80 3f 00 00 00 3f 00 00 80 3f 00 00 80 3f 00 00 80 3f 45'  #有效
#data = bytes.fromhex(data)
#Engine1.Send_data(data)
#Engine1.Close_Engine()
#调试发送数据结束

#调试数据转化
#Communication.floatToBytes(1.0)
#Communication.bytesToFloat(64,64,64,64)
#调试数据转化结束

#发送数据,flag，D1,D2,D3,死区时间
#500W V1200V V2=200V
# Communication.SendSCI_data('com2',[2000, 0.9, 0.3742, 0.6258, 55])
# time.sleep(0.1)
# # 1000W V1200V V2=200V
# Communication.SendSCI_data('com2',[2000, 0.8, 0.5, 0.5, 55])
# time.sleep(0.1)
# # 500W V1200V V2=160V
# Communication.SendSCI_data('com2',[2000, 0.7, 0.5123, 0.6584, 55])
# time.sleep(0.1)
# # 1000W V1200V V2=160V
# Communication.SendSCI_data('com2',[2000, 0.1, 0.5760, 0.5760, 55])
# time.sleep(0.1)
# Communication.SendSCI_data('com2',[2000, 0.2, 0.5760, 0.5760, 55])
# time.sleep(0.1)
# Communication.SendSCI_data('com2',[2000, 0.3, 0.5760, 0.5760, 55])
# time.sleep(0.1)
# Communication.SendSCI_data('com2',[2000, 0.4, 0.5760, 0.5760, 55])
# time.sleep(0.1)
# Communication.SendSCI_data('com2',[2000, 0.5, 0.5760, 0.5760, 55])
# time.sleep(0.1)
# Communication.SendSCI_data('com2',[2000, 0.6, 0.5760, 0.5760, 55])
# time.sleep(0.1)
# Communication.SendSCI_data('com2',[2000, 0.7, 0.5760, 0.5760, 55])
# time.sleep(0.1)
# Communication.SendSCI_data('com2',[2000, 0.8, 0.5760, 0.5760, 55])
# time.sleep(0.1)
# Communication.SendSCI_data('com2',[2000, 0.9, 0.5760, 0.5760, 55])
# time.sleep(0.1)
# Communication.SendSCI_data('com2',[2000, 1.0, 0.5760, 0.5760, 55])
# time.sleep(0.1)
# Communication.SendSCI_data('com2',[2000, 0.1, 0.5760, 0.5760, 55])
# time.sleep(0.1)
# Communication.SendSCI_data('com2',[2000, 0.2, 0.5760, 0.5760, 55])
# time.sleep(0.1)
# Communication.SendSCI_data('com2',[2000, 0.3, 0.5760, 0.5760, 55])
# time.sleep(0.1)
# Communication.SendSCI_data('com2',[2000, 0.4, 0.5760, 0.5760, 55])
# time.sleep(0.1)
# Communication.SendSCI_data('com2',[2000, 0.5, 0.5760, 0.5760, 55])
# time.sleep(0.1)
# Communication.SendSCI_data('com2',[2000, 0.6, 0.5760, 0.5760, 55])
# time.sleep(0.1)
# Communication.SendSCI_data('com2',[2000, 0.7, 0.5760, 0.5760, 55])
# time.sleep(0.1)
# Communication.SendSCI_data('com2',[2000, 0.8, 0.5760, 0.5760, 55])
# time.sleep(0.1)
# Communication.SendSCI_data('com2',[2000, 0.9, 0.5760, 0.5760, 55])
# time.sleep(0.1)
# Communication.SendSCI_data('com2',[2000, 1.0, 0.5760, 0.5760, 55])
# time.sleep(0.1)
# Communication.SendSCI_data('com2',[2000, 0.1, 0.5760, 0.5760, 55])
# time.sleep(0.1)
# Communication.SendSCI_data('com2',[2000, 0.2, 0.5760, 0.5760, 55])
# time.sleep(0.1)
# Communication.SendSCI_data('com2',[2000, 0.3, 0.5760, 0.5760, 55])
# time.sleep(0.1)
# Communication.SendSCI_data('com2',[2000, 0.4, 0.5760, 0.5760, 55])
# time.sleep(0.1)
# Communication.SendSCI_data('com2',[2000, 0.5, 0.5760, 0.5760, 55])
# time.sleep(0.1)
# Communication.SendSCI_data('com2',[2000, 0.6, 0.5760, 0.5760, 55])
# time.sleep(0.1)
# Communication.SendSCI_data('com2',[2000, 0.7, 0.5760, 0.5760, 55])
# time.sleep(0.1)
# Communication.SendSCI_data('com2',[2000, 0.8, 0.5760, 0.5760, 55])
# time.sleep(0.1)
# Communication.SendSCI_data('com2',[2000, 0.9, 0.5760, 0.5760, 55])
# time.sleep(0.1)
# Communication.SendSCI_data('com2',[2000, 1.0, 0.5760, 0.5760, 55])
# time.sleep(0.1)
# Communication.SendSCI_data('com2',[2000, 0.1, 0.5760, 0.5760, 55])
# time.sleep(0.1)
# Communication.SendSCI_data('com2',[2000, 0.2, 0.5760, 0.5760, 55])
# time.sleep(0.1)
# Communication.SendSCI_data('com2',[2000, 0.3, 0.5760, 0.5760, 55])
# time.sleep(0.1)
# Communication.SendSCI_data('com2',[2000, 0.4, 0.5760, 0.5760, 55])
# time.sleep(0.1)
# Communication.SendSCI_data('com2',[2000, 0.5, 0.5760, 0.5760, 55])
# time.sleep(0.1)
# Communication.SendSCI_data('com2',[2000, 0.6, 0.5760, 0.5760, 55])
# time.sleep(0.1)
# Communication.SendSCI_data('com2',[2000, 0.7, 0.5760, 0.5760, 55])
# time.sleep(0.1)
# Communication.SendSCI_data('com2',[2000, 0.8, 0.5760, 0.5760, 55])
# time.sleep(0.1)
# Communication.SendSCI_data('com2',[2000, 0.9, 0.5760, 0.5760, 55])
# time.sleep(0.1)
# Communication.SendSCI_data('com2',[2000, 1.0, 0.5760, 0.5760, 55])
# time.sleep(0.1)
# Communication.SendSCI_data('com2',[2000, 0.1, 0.5760, 0.5760, 55])
# time.sleep(0.1)
# Communication.SendSCI_data('com2',[2000, 0.2, 0.5760, 0.5760, 55])
# time.sleep(0.1)
# Communication.SendSCI_data('com2',[2000, 0.3, 0.5760, 0.5760, 55])
# time.sleep(0.1)
# Communication.SendSCI_data('com2',[2000, 0.4, 0.5760, 0.5760, 55])
# time.sleep(0.1)
# Communication.SendSCI_data('com2',[2000, 0.5, 0.5760, 0.5760, 55])
# time.sleep(0.1)
# Communication.SendSCI_data('com2',[2000, 0.6, 0.5760, 0.5760, 55])
# time.sleep(0.1)
# Communication.SendSCI_data('com2',[2000, 0.7, 0.5760, 0.5760, 55])
# time.sleep(0.1)
# Communication.SendSCI_data('com2',[2000, 0.8, 0.5760, 0.5760, 55])
# time.sleep(0.1)
# Communication.SendSCI_data('com2',[2000, 0.9, 0.5760, 0.5760, 55])
# time.sleep(0.1)
# Communication.SendSCI_data('com2',[2000, 1.0, 0.5760, 0.5760, 55])
# time.sleep(0.1)

Communication.SendSCI_data('com2',[2000, 0.1, 0.5760, 0.5760, 55])
# time.sleep(0.1)
Communication.SendSCI_data('com2',[2000, 0.2, 0.5760, 0.5760, 55])
# time.sleep(0.1)
Communication.SendSCI_data('com2',[2000, 0.3, 0.5760, 0.5760, 55])
# time.sleep(0.1)
Communication.SendSCI_data('com2',[2000, 0.4, 0.5760, 0.5760, 55])
# time.sleep(0.1)
Communication.SendSCI_data('com2',[2000, 0.5, 0.5760, 0.5760, 55])
# time.sleep(0.1)
Communication.SendSCI_data('com2',[2000, 0.6, 0.5760, 0.5760, 55])
# time.sleep(0.1)
Communication.SendSCI_data('com2',[2000, 0.7, 0.5760, 0.5760, 55])
# time.sleep(0.1)
Communication.SendSCI_data('com2',[2000, 0.8, 0.5760, 0.5760, 55])
# time.sleep(0.1)
Communication.SendSCI_data('com2',[2000, 0.9, 0.5760, 0.5760, 55])
# time.sleep(0.1)
Communication.SendSCI_data('com2',[2000, 1.0, 0.5760, 0.5760, 55])
Communication.SendSCI_data('com2',[2000, 0.1, 0.5760, 0.5760, 55])
# time.sleep(0.1)
Communication.SendSCI_data('com2',[2000, 0.2, 0.5760, 0.5760, 55])
# time.sleep(0.1)
Communication.SendSCI_data('com2',[2000, 0.3, 0.5760, 0.5760, 55])
# time.sleep(0.1)
Communication.SendSCI_data('com2',[2000, 0.4, 0.5760, 0.5760, 55])
# time.sleep(0.1)
Communication.SendSCI_data('com2',[2000, 0.5, 0.5760, 0.5760, 55])
# time.sleep(0.1)
Communication.SendSCI_data('com2',[2000, 0.6, 0.5760, 0.5760, 55])
# time.sleep(0.1)
Communication.SendSCI_data('com2',[2000, 0.7, 0.5760, 0.5760, 55])
# time.sleep(0.1)
Communication.SendSCI_data('com2',[2000, 0.8, 0.5760, 0.5760, 55])
# time.sleep(0.1)
Communication.SendSCI_data('com2',[2000, 0.9, 0.5760, 0.5760, 55])
# time.sleep(0.1)
Communication.SendSCI_data('com2',[2000, 1.0, 0.5760, 0.5760, 55])
Communication.SendSCI_data('com2',[2000, 0.1, 0.5760, 0.5760, 55])
# time.sleep(0.1)
Communication.SendSCI_data('com2',[2000, 0.2, 0.5760, 0.5760, 55])
# time.sleep(0.1)
Communication.SendSCI_data('com2',[2000, 0.3, 0.5760, 0.5760, 55])
# time.sleep(0.1)
Communication.SendSCI_data('com2',[2000, 0.4, 0.5760, 0.5760, 55])
# time.sleep(0.1)
Communication.SendSCI_data('com2',[2000, 0.5, 0.5760, 0.5760, 55])
# time.sleep(0.1)
Communication.SendSCI_data('com2',[2000, 0.6, 0.5760, 0.5760, 55])
# time.sleep(0.1)
Communication.SendSCI_data('com2',[2000, 0.7, 0.5760, 0.5760, 55])
# time.sleep(0.1)
Communication.SendSCI_data('com2',[2000, 0.8, 0.5760, 0.5760, 55])
# time.sleep(0.1)
Communication.SendSCI_data('com2',[2000, 0.9, 0.5760, 0.5760, 55])
# time.sleep(0.1)
Communication.SendSCI_data('com2',[2000, 1.0, 0.5760, 0.5760, 55])
Communication.SendSCI_data('com2',[2000, 0.1, 0.5760, 0.5760, 55])
# time.sleep(0.1)
Communication.SendSCI_data('com2',[2000, 0.2, 0.5760, 0.5760, 55])
# time.sleep(0.1)
Communication.SendSCI_data('com2',[2000, 0.3, 0.5760, 0.5760, 55])
# time.sleep(0.1)
Communication.SendSCI_data('com2',[2000, 0.4, 0.5760, 0.5760, 55])
# time.sleep(0.1)
Communication.SendSCI_data('com2',[2000, 0.5, 0.5760, 0.5760, 55])
# time.sleep(0.1)
Communication.SendSCI_data('com2',[2000, 0.6, 0.5760, 0.5760, 55])
# time.sleep(0.1)
Communication.SendSCI_data('com2',[2000, 0.7, 0.5760, 0.5760, 55])
# time.sleep(0.1)
Communication.SendSCI_data('com2',[2000, 0.8, 0.5760, 0.5760, 55])
# time.sleep(0.1)
Communication.SendSCI_data('com2',[2000, 0.9, 0.5760, 0.5760, 55])
# time.sleep(0.1)
Communication.SendSCI_data('com2',[2000, 1.0, 0.5760, 0.5760, 55])
Communication.SendSCI_data('com2',[2000, 0.1, 0.5760, 0.5760, 55])
# time.sleep(0.1)
Communication.SendSCI_data('com2',[2000, 0.2, 0.5760, 0.5760, 55])
# time.sleep(0.1)
Communication.SendSCI_data('com2',[2000, 0.3, 0.5760, 0.5760, 55])
# time.sleep(0.1)
Communication.SendSCI_data('com2',[2000, 0.4, 0.5760, 0.5760, 55])
# time.sleep(0.1)
Communication.SendSCI_data('com2',[2000, 0.5, 0.5760, 0.5760, 55])
# time.sleep(0.1)
Communication.SendSCI_data('com2',[2000, 0.6, 0.5760, 0.5760, 55])
# time.sleep(0.1)
Communication.SendSCI_data('com2',[2000, 0.7, 0.5760, 0.5760, 55])
# time.sleep(0.1)
Communication.SendSCI_data('com2',[2000, 0.8, 0.5760, 0.5760, 55])
# time.sleep(0.1)
Communication.SendSCI_data('com2',[2000, 0.9, 0.5760, 0.5760, 55])
# time.sleep(0.1)
Communication.SendSCI_data('com2',[2000, 1.0, 0.5760, 0.5760, 55])

a = 11
if a >= 10:
    print('000')
    if a == 11:
        print('999')

else:
    print('111')







while True:
    time.sleep(0.1)
    print(time.asctime( time.localtime(time.time()) ),Communication.ReadSCI_data('com2',4)) 





