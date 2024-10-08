#Set-PSDebug -Trace 1
echo "Running before_build on windows ..."
mkdir build
echo "Created build dir ..."
cd build
echo "Moved into build dir ..."
cmake .. -G Ninja -DCMAKE_Fortran_COMPILER=ifort -DCMAKE_C_COMPILER=cl -DCMAKE_CXX_COMPILER=cl -DCMAKE_BUILD_TYPE=Release
echo "cmake finished ..."
cmake --build . --config=Release --target install
echo "build finished ..."
python -c "import sys; sys.path.insert(0, '../addon/pycThermopack'); import makescript; makescript.windows_make('v3')"
echo "--- pycThermopack contents ---"
dir ../addon/pycThermopack
echo "--- pycThermopack/thermopack contents ---"
dir ../addon/pycThermopack/thermopack
#Set-PSDebug -Off