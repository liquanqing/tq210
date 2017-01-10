# lcd
___

## 介绍   

显示控制器支持从摄像头接口控制器的本地总线或者系统内存的视频缓存中传输数据到外部的LCD显示接口
显示驱动支持RGB，i80,YUV3种总线类型，使用高大5层支持多种颜色格式，256级alpha混合，颜色键，坐
标控制，软件滚动，多种窗口大小等的图像覆盖窗口。  
显示控制器支持颜色格式如：**RGB(1~24bpp)** 和 **(YCbCr 4:4:40)** 
![lcd](./pic/LCD_LOGIC.jpg)

## 配置流程
0. 设置LCD引脚功能配置
1. VIDCON0: 配置视频输出格式，和控制显示开关
2. VIDCON1：RGB I/F 控制信号
3. VIDCON2：输出数据格式控制
4. VIDCON3: 画面增强控制
5. I80IFCONx：CPU接口控制
6. VIDTCONx：配置视频输出时间和显示大小
7. WINCONx：窗口类型设置
8. VIDOSDxA，VIDOSDxB：窗口坐标设置
9. VIDOSDxC，VIDOSDxD：OSD大小设置
10. VIDWxALPHA0/1：alpha数据设置
11. BLENDEQx：混合方程设置
12. VIDWxxADDx：源图像地址设置
13. WxKEYCONx：色键设置
14. WxKEYALPHA：色键alpha数据设置
15. WINxMAP：窗口颜色控制
16. GAMMALUT_xx：gamma熟知设置
17. COLORGAINCON： 颜色阀值设置
18. HUExxx：色调系数和偏移设置
19. WPALCON： 调色板设置
20. WxRTQOSCON：RTQoS设置
21. WxPDATAxx：窗口调色板
22. SHDOWCON：阴影控制
23. WxRTQOSCON：QoS控制 


