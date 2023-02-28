<!--
 * @Descripttion: 
 * @version: 
 * @Author: cuiyonggan
 * @Date: 2023-02-28 09:29:00
 * @LastEditors: Please set LastEditors
 * @LastEditTime: 2023-02-28 17:42:53
-->
# gcc更新
## 安装
sudo yum install centos-release-scl-rh
yum install devtoolset-8-gcc devtoolset-8-gcc-c++
## 设置环境
sudo vim /etc/profile
添加下面的代码
source /opt/rh/devtoolset-8/enable

## 查看是否安装成功
yum list installed | grep devtoolset-8-gcc

# nccl安装
## 下载nccl
https://github.com/NVIDIA/nccl
unzip nccl-master
## 安装nccl
cd nccl-master
sudo make -j12 src.build BUILDDIR=/usr/local/nccl CUDA_HOME=/usr/local/cuda-11.3 NVCC_GENCODE="-gencode=arch=compute_70,code=sm_70"

sudo cp sudo cp /usr/local/nccl/lib/libnccl.so.2.16.5 /usr/lib64
## 添加环境变量
sudo vim /etc/profile

NCCL_HOME=/usr/local/nccl
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:$NCCL_HOME/lib
export PATH=$PATH:$NCCL_HOME/bin
## 测试
### 下载测试包
https://github.com/nvidia/nccl-tests

unzip nccl-tests-master.zip
cd nccl-tests
make -j12 CUDA_HOME=/usr/local/cuda-11.3 NCCL_HOME=/usr/local/nccl
#### 在 8 个 GPU ( ) 上运行-g 8，从 8 字节扫描到 128MBytes：
./build/all_reduce_perf -b 8 -e 128M -f 2 -g 2

# openmpi安装
## 下载openmpi
https://download.open-mpi.org/release/open-mpi/v4.1/openmpi-4.1.5.tar.bz2
## 解压
tar -zxvf openmpi-4.1.5.tar.gz
## 编译安装
cd openmpi-4.1.5
sudo ./configure --prefix=/usr/local/openmpi 
sudo make -j12
sudo make install
## 设置环境变量
sudo vim /etc/profile

MPI_HOME=/usr/local/openmpi
export PATH=${MPI_HOME}/bin:$PATH
export LD_LIBRARY_PATH=${MPI_HOME}/lib:$LD_LIBRARY_PATH
export MANPATH=${MPI_HOME}/share/man:$MANPATH

## 验证是否安装成功
cd openmpi-4.1.5/examples
sudo make -j12
mpirun -np 4 hello_c




# HOROVOD安装
官方网址：https://github.com/horovod/horovod#install
## 安装horovodpip 包
HOROVOD_WITHOUT_PYTORCH=1 HOROVOD_WITH_TENSORFLOW=1 HOROVOD_WITHOUT_MXNET=1 HOROVOD_WITH_MPI=1 HOROVOD_GPU_OPERATIONS=NCCL HOROVOD_NCCL_INCLUDE=/usr/local/nccl/include HOROVOD_NCCL_LIB=/usr/local/nccl/lib HOROVOD_CUDA_HOME=/usr/local/cuda-11.3 pip install horovod==0.23.0 -i https://pypi.tuna.tsinghua.edu.cn/simple
## 验证
--no-cache-dir