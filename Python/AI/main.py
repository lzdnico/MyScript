import torch
from torch._C import device
import torch.nn as nn
import torch.optim as optim   #优化器
from torchvision import datasets,transforms  #数据 形状变化
from src.ExampleNet import ExampleNet

def main():

    device = torch.device("cuda" if torch.cuda.is_available() else "cpu")

    epochs = 20                                #训练批次
    batch_size = 512                           #每次传入512条数据

    net = ExampleNet().to(device)              #实例化网络
    loss_fun = nn.MSELoss()                    #损失函数
    optimizer = optim.Adam(net.parameters())   #优化器

    transform_train = transforms.Compose([    #形状变换
        transforms.Resize(32),                 #32*32数据
        transforms.CenterCrop(32),             #定义中心
        transforms.ToTensor(),                 #张量
        transforms.Normalize((0.4914,0.4822,0.4465),(0.2023,0.1994,0.2010)) #归一化
    ])

    datasets.CIFAR10("datasets/",train=True,download=True,transform=transform_train) #数据集

    transform_test = transforms.Compose([    #形状变换
        transforms.ToTensor(),                #张量
        transforms.Normalize((0.4914,0.4822,0.4465),(0.2023,0.1994,0.2010)) #归一化
    ])

    testdataset = datasets.CIFAR10("datasets/",train=False,download=False,transform=transform_test) #数据集

    dataloder = torch.utils.data.DataLoader(datasets,batch_size=batch_size,shuffle=True)

    testdataloder = torch.utils.data.DataLoader(testdataset,batch_size=batch_size,shuffle=False)

    for i in range(epochs):
        net.train()
        print("epoch:{}".format(i))
        for j,(input,target) in enumerate(dataloder):
            input = input.to(device)
            output = net(input)
            target = torch.zeros(target.size(0),10).scatter_(1,target.view(-1,1),1).to(device)
            loss = loss_fun(output,target)

            optimizer.zero_grad()
            loss.backward()
            