# 安装前置环境
## cuda工具包
按照官方指南安装CUDA和cuDNN。Alpa 要求 CUDA >= 11.1 和 cuDNN >= 8.0.5。

## 开启VPN

## 安装python环境
python版本：3.7，3.8，3.9
cupy版本：cupy-cuda11x
``` shell
conda create --name cyg_alpa python=3.9
conda activate cyg_alpa
```

## 从源安装alpa
### 克隆alpa
`git clone --recursive https://github.com/alpa-projects/alpa.git`

### 安装 Alpa python 包
```shell
cd alpa
pip3 install -e ".[dev]"  # Note that the suffix `[dev]` is required to build custom modules.
```

### 构建并安装alpa修改的jaxlib，使用gcc 10.2.1编译通过
```shell
source /opt/rh/devtoolset-10/enable
export CC=/opt/rh/devtoolset-8/root/usr/bin/gcc
export CPP=/opt/rh/devtoolset-8/root/usr/bin/cpp
export CXX=/opt/rh/devtoolset-8/root/usr/bin/c++

cd build_jaxlib
python3 build/build.py --enable_cuda --dev_install --bazel_options=--override_repository=org_tensorflow=$(pwd)/../third_party/tensorflow-alpa
cd dist
pip3 install -e .
```

# 问题
## 运行 model.init 出现 27348 segmentation fault  python quickstart.py
编译的Alpa-modified Jaxlib有问题。
通过更新gcc 从8.3.1至10.2.1来解决问题。

## 运行test_install.py 出现jaxlib.xla_extension.XlaRuntimeError: DEADLINE_EXCEEDED: Connect() timed out after 0 with 1 attempts. Most recent failure was: UNAVAILABLE: Socket closed
某些套接字端口已关闭，Alpa/XLA 无法启动客户端
重启后问题消失
