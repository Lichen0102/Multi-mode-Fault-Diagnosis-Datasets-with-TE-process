# Multimode dataset of Tennessee Eastman v1.0

## Background

**Tennessee Eastman** (TE) model Is an important tool in all disciplines of systems theory, for comparative studies or validation of algorithms. Its strength is that it is based on real process modeling. This leads to a rather complex nonlinear model of a multi-component system. Due to the frequent use of the model, it is very beneficial that this model, or more precisely its code, works flawlessly [1]. On this basis, a revision and extension of TE process model is proposed and is shown in Fig.  1.

<img src=".\Typora\typora-user-images\image-20230112105115641.png" alt="image-20230112105115641"  />

Fig. 1 P&ID of the revised process model; additional measurements in red [1]

## Usage

- If you want to use the datasets in the project, you can download them directly by using *Python* or *Matlab*.

- Example (Normal data of mode 1):

  1) Python

  ```
  import scipy.io as scio
  
  data00 = scio.loadmat('xxx/MultimodeTEP/M1/m1d00')['m1d00']
  
  data00_X = data00[:,:53]
  
  data00_Y = data00[:,53:]
  ```

  2) Matlab

  ```
  load xxx/MultimodeTEP/M1/m1d00
  
  data00_X = m1d00(:,1:53)
  
  data00_Y = m1d00(:,53:81)
  ```

- If you want to regenerate the dataset, you can run *MultiLoop_mode1.mdl* to *MultiLoop_mode6.mdl*.

## Dataset Introduction

We have made six modes of datasets in 72 hours, and there are 28 faults in every mode. All of them contain 12 variables of input, 41 variables of measurement and 28 variables of disturbance. The adjusted parameters are saved in *Mode1xInitial.mat* —*Mode6xInitial.mat*. The parameters of different modes are listed in Fig. 2 and Fig. 3.

<img src=".\Typora\typora-user-images\image-20230112125428450.png" alt="image-20230112125428450115641"  />

Fig. 2 Measurements of different modes

<img src=".\Typora\typora-user-images\image-20230112125508800.png" alt="image-20230112125508800"  />

Fig. 3 Main variables of different modes

### Adjustment of mode

- User can adjust parameters to achieve different modes by themselves.

- Example (mode 2)

  1. Copy files  *Mode_1_Init.m, Mode1xInitial.mat and MultiLoop_mode1.mdl* and rename to *Mode_2_Init.m, Mode2xInitial.mat and MultiLoop_mode2.mdl*.
  2. Modify Mode1xInitial in 29 lines in *Mode_2_Init.m* to Mode2xInitial.
  3. Modify Mode_1_Init to Mode_2_Init by opening  MultiLoop_mode2.mdl  and the steps as follow figures:

  <img src=".\Typora\typora-user-images\image-20230112133934854.png" alt="image-20230112133934854"  />

  <img src=".\Typora\typora-user-images\image-20230112133904366.png" alt="image-20230112133904366"  />

  4. Running *upda.m* and modify as follows:

     ```
     clear all;
     clc;
     load Mode2xInitial
     for i =1:35
         blockName = xInitial.signals(i).blockName;
         blockName(15) = '2';
         xInitial.signals(i).blockName = blockName;
     end
     save ('Mode2xInitial.mat','xInitial')
     ```
  
  5. Adjust the  parameters *MultiLoop_mode2.mdl* according to  Fig. 2 and Fig. 3. Note that the value of parameters adjusted each time should not be too large, otherwise the simulation will end quickly. And run the following code after each successful adjustment.

     ```
     xInitial = xFinal
     ```
  
  6. All parameters are adjusted to the final mode and run:

     ```
     save('Mode2xInitial.mat','xInitial')
     ```

### Mode

We selected normal data under six modes for display, as shown in Fig. 4.

<img src=".\Typora\typora-user-images\image-20230112131540357.png" alt="image-20230112131540357" style="zoom:50%;" />

Fig. 4 Normal data of six modes; mode 1 in red; mode 2 in green; mode 3 in blue; mode 4 in turquoise; mode 5 in yellow; mode 6 in black

### Fault

We selected part of the measured data of some faults in mode 6 for display.

<img src=".\Typora\typora-user-images\image-20230112143030234.png" alt="image-20230112143030234" style="zoom: 50%;" />

A

<img src=".\Typora\typora-user-images\image-20230112143054024.png" alt="image-20230112143054024" style="zoom:50%;" />

B

<img src=".\Typora\typora-user-images\image-20230112143122419.png" alt="image-20230112143122419" style="zoom:50%;" />

C

<img src=".\Typora\typora-user-images\image-20230112143136774.png" alt="image-20230112143136774" style="zoom:50%;" />

D

<img src=".\Typora\typora-user-images\image-20230112143150417.png" alt="image-20230112143150417" style="zoom:50%;" />

E

<img src=".\Typora\typora-user-images\image-20230112143228409.png" alt="image-20230112143228409" style="zoom:50%;" />

F

<img src=".\Typora\typora-user-images\image-20230112143248418.png" alt="image-20230112143248418" style="zoom:50%;" />

G

<img src=".\Typora\typora-user-images\image-20230112143402757.png" alt="image-20230112143402757" style="zoom:50%;" />

Fig. 5 Data of mode 6; A-E show the results between normal data and different faults; F and G show the results between different faults. 

## Change Log

v1.0(2023/01/12)

## About us

- We are from the research group of Prof. Xiao He, Department of Automation, Tsinghua University.
- Welcome to discuss and put forward valuable suggestions. Email: [liuzy21@mails.tsinghua.edu.cn](mailto:liuzy21@mails.tsinghua.edu.cn), yan12@mails.tsinghua.edu.cn.

[1] Andreas, Bathelt, N, et al. Revision of the Tennessee Eastman Process Model[J]. IFAC-PapersOnLine, 2015, 48(8):309-314.