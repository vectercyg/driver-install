<!--
 * @Descripttion: 
 * @version: 
 * @Author: cuiyonggan
 * @Date: 2023-02-28 09:41:15
 * @LastEditors: 
 * @LastEditTime: 2023-02-28 09:43:48
-->
# GPU驱动安装
## 前期准备
### 查看支持CUDA的GPU列表
lspci | grep -i nvidia
### 查看系统版本架构
uname -m && cat /etc/redhat-release
### 验证GCC编译环境
gcc -v
### 验证系统是否安装了正确的内核头文件和开发包
sudo yum install kernel-devel-$(uname -r) kernel-headers-$(uname -r)

## 开始安装nvidia驱动
### 屏蔽默认带有的nouveau
sudo vim /etc/modprobe.d/blacklist-nouveau.conf
#### 添加
blacklist nouveau
options nouveau modeset=0
#### 重启
sudo reboot
#### 验证是否成功，成功无输出
lsmod | grep nouveau
#### 下载对应版本的驱动
https://cn.download.nvidia.cn/XFree86/Linux-x86_64/525.89.02/NVIDIA-Linux-x86_64-525.89.02.run

### 驱动安装
#### 使用root权限
su root
#### 给驱动文件增加可执行权限
chmod 777 NVIDIA-Linux-x86_64-525.89.02.run
#### 执行驱动安装程序，不构建xconf
./NVIDIA-Linux-x86_64-525.89.02.run
#### 验证是否成功安装驱动
nvidia-smi

## 开始安装CUDA、cudnn
### 卸载旧版本cuda
#### 进入CUDA安装目录
cd /usr/local/bin/
./cuda-uninstaller

### 开始安装CUDA
#### 下载对应版本的CUDA文件
https://developer.download.nvidia.com/compute/cuda/11.3.1/local_installers/cuda_11.3.1_465.19.01_linux.run
#### 修改文件执行权限
chmod 777 NVIDIA-Linux-x86_64-525.89.02.run
#### 执行安装程序，accept，取消显卡驱动安装
sh NVIDIA-Linux-x86_64-525.89.02.run

### 开始安装cudnn
#### 下载对应版本的相关文件
https://developer.download.nvidia.com/compute/cudnn/secure/8.6.0/local_installers/11.8/cudnn-linux-x86_64-8.6.0.163_cuda11-archive.tar.xz?hkfC1wlvl5qWNk79oFbZlHJ3aCqFFWePBEQRsely6eI1vAhjpRbXzGChqShOrgwr86yvv1nGXim1FnBk4zj5lHwihvpFzkCW9qtGiZYAsYLkFpoLtrCoAzUse25uuCaJGKWJtDI-OM3fdv_D3yP__MbLfV128uM_vnPCrPBthCzjtwSPXpkXNnO4E5kPsILVZ0yRolcEdo1XQGVWaJ9Vw6AX&t=eyJscyI6InJlZiIsImxzZCI6IlJFRi1hc2suaGVsbG9iaS5jb20vIn0=
#### 解压并复制文件
tar -Jxf cudnn-linux-x86_64-8.6.0.163_cuda11-archive.tar.xz
sudo cp include/* /usr/local/cuda-11.3/targets/x86_64-linux/include/
sudo cp lib/* /usr/local/cuda-11.3/targets/x86_64-linux/lib/
#### 修改访问权限
sudo chmod +x /usr/local/cuda-11.3/targets/x86_64-linux/lib/libcudnn*
sudo chmod +x /usr/local/cuda-11.3/targets/x86_64-linux/include/cudnn.h

### 设置环境变量
#### 打开配置文件
sudo vim profile
#### 添加以下内容
export CUDA_HOME=/usr/local/cuda-11.3
export PATH=$CUDA_HOME/bin/:$PATH
export LD_LIBRARY_PATH=$CUDA_HOME/targets/x86_64-linux/lib/:$LD_LIBRARY_PATH

### 验证安装是否成功
nvcc -V

## 最终验证
### 进入sample文件夹
cd /usr/local/cuda-11.3/samples/
### 编译
sudo make -j8
### 运行示例
cd /usr/local/cuda-11.3/samples/bin/x86_64/linux/release/
./bandwidthTest
 
