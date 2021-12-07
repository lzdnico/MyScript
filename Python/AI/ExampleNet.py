import torch
import torch.nn as nn

class ExampleNet(nn.modules):
    def __init__(self):
        super().__init__()
        self.fc1 = nn.Sequential(
            nn.Conv2d(3,24,3),    #第一层网络
            nn.ReLU(),            #激活
            nn.MaxPool2d(2),      #池化
            nn.Conv2d(24,48,3),   #第二层网络
            nn.ReLU(),            #激活
            nn.MaxPool2d(2),      #池化
            nn.Conv2d(48,32,3),   #第三层网络
            nn.ReLU()
        )
        self.fc2 = nn.Sequential(
            nn.Linear(4*4*32,120),
            nn.ReLU(),
            nn.Linear(120,84),
            nn.ReLU(),
            nn.Linear(84,10)
        )

    def forward(self,x):
        fc1_out = self.fc1(x)
        fc1 = torch.reshape(fc1_out,shape=(-1,4*4*32))
        out = self.fc2(fc1)
        return out