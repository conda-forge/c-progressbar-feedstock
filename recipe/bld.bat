mkdir build && cd build
if errorlevel 1 exit 1

cmake -G "NMake Makefiles" ^
         -DCMAKE_BUILD_TYPE=Release ^
         -DCMAKE_INSTALL_PREFIX:PATH=%PREFIX% ^
         ..
if errorlevel 1 exit 1

cmake --build . --config Release --target install
if errorlevel 1 exit 1

ctest -V --output-on-failure -C Release
if errorlevel 1 exit 1
