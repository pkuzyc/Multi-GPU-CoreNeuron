rm -rf build
mkdir build
cd build
module purge
module load /home/zyc/pgi/modulefiles/pgi64/16.10 /home/zyc/pgi/modulefiles/openmpi/1.10.2/2016
export CC=mpicc
export CXX=mpicxx
cmake .. -DCMAKE_C_FLAGS:STRING="-g -O0 -lrt -ta=tesla:cuda8.0" -DCMAKE_CXX_FLAGS:STRING="-g -O0 -lrt -ta=tesla:cuda8.0" -DCOMPILE_LIBRARY_TYPE=STATIC -DCMAKE_INSTALL_PREFIX=/home/zyc/Softwares/GPU-Neuron/install -DCUDA_HOST_COMPILER=`which gcc` -DADDITIONAL_MECHPATH=/home/zyc/Softwares/GPU-Neuron/sources/CoreNeuron/add_mod -DCUDA_PROPAGATE_HOST_FLAGS=OFF -DENABLE_SELECTIVE_GPU_PROFILING=ON -DENABLE_OPENACC=ON
make -j24
make install
