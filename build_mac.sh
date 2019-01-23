
install_dir=../../QtAv.install
ffmpeg_dir=/Users/nsite/Documents/qts/ffmpeg-4.0.2-macos64-shared
qt5_dir=/Users/nsite/Documents/Qt5.9.0/5.9/clang_64/lib/cmake/Qt5


cmake ..  -DQt5_DIR=$qt5_dir -DFFMPEG_DIR=$ffmpeg_dir -DBUILD_PLAYERS=OFF -DBUILD_EXAMPLES=OFF -DBUILD_TESTS=OFF -DCMAKE_DEBUG_POSTFIX="_debug" -DCMAKE_BUILD_TYPE=Debug -DCMAKE_INSTALL_PREFIX=$install_dir
cmake --build . --target install -j 8