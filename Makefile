NVCC=C:/Program Files/NVIDIA GPU Computing Toolkit/CUDA/v11.0
VCVARS=C:/Program Files (x86)/Microsoft Visual Studio/2019/Community/VC/Auxiliary/Build/vcvars64.bat
PLATFORM=windows

build-msvc:
	IF NOT EXIST "bin" MD "bin"
	"$(VCVARS)" && "$(NVCC)/bin/nvcc" "src/main.cu" -o="bin/slime-clusters" -Wno-deprecated-gpu-targets -I"include/boinc" -I"include/boinc/$(PLATFORM)" -L"lib" -lboinc_api -lboinc -luser32 -m64 -O3

build-msvc-debug:
	IF NOT EXIST "bin" MD "bin"
	"$(VCVARS)" && "$(NVCC)/bin/nvcc" "src/main.cu" -o="bin/slime-clusters" -Wno-deprecated-gpu-targets -I"include/boinc" -I"include/boinc/$(PLATFORM)" -L"lib" -lboinc_api -lboinc -luser32 -m64 -O0 -Xcompiler /Zi -Xcompiler /Fdbin// -Xlinker /DEBUG:FULL

build-mingw:
	IF NOT EXIST "bin" MD "bin"
	"$(NVCC)/bin/nvcc" "src/main.cu" -o="bin/slime-clusters" -Wno-deprecated-gpu-targets -I"include/boinc" -I"include/boinc/$(PLATFORM)" -L"lib" -lboinc_api -lboinc -luser32 -m64 -O3 -Xcompiler -static-libgcc -Xcompiler -static-libstdc+

build-mingw-debug:
	IF NOT EXIST "bin" MD "bin"
	"$(NVCC)/bin/nvcc" "src/main.cu" -o="bin/slime-clusters" -Wno-deprecated-gpu-targets -I"include/boinc" -I"include/boinc/$(PLATFORM)" -L"lib" -lboinc_api -lboinc -luser32 -m64 -O0 -Xcompiler -static-libgcc -Xcompiler -static-libstdc+ -Xcompiler -g

clean:
	IF EXIST "bin" RD /S /Q "bin"