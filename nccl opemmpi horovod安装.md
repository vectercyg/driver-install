<!--
 * @Descripttion: 
 * @version: 
 * @Author: cuiyonggan
 * @Date: 2023-02-28 09:29:00
 * @LastEditors: Please set LastEditors
 * @LastEditTime: 2023-02-28 09:33:30
-->
# nccl安装
## 下载nccl
https://github.com/NVIDIA/nccl
unzip nccl-master
## 构建nccl
cd nccl-master
make -j12 src.build BUILDDIR=/home/wangty/nccl CUDA_HOME=/usr/local/cuda-11.6 NVCC_GENCODE="-gencode=arch=compute_35,code=sm_35"
