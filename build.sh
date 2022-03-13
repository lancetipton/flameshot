# Builds flameshot app using cmake, then copies the built app into the /Application directory
# Should be run from the root directory =>  "$ bash ./build.sh"

# Ensure qt5 and cmake are installed befor running this command
# brew install qt5
# brew install cmake

LOG_PREFIX="[BUILD SCRIPT]"
BUILD_DIR="./build"

log_msg(){
  echo ""
  echo "$LOG_PREFIX $1"
}

if [[ -d "$BUILD_DIR" ]]; then
  log_msg "Removing old build directory"
  rm -rf $BUILD_DIR
fi

log_msg "Creating new build direct/ory..."
mkdir $BUILD_DIR

log_msg "Navigating to build directory..."
cd $BUILD_DIR

log_msg "Running cmake with Qt5 from build directory"
cmake ../ -DQt5_DIR=$(brew --prefix qt5)/lib/cmake/Qt5

log_msg "Running make from $BUILD_DIR directory..."
make

log_msg "Coping flameshot.app to applications directory ..."
cp -rf ./src/flameshot.app /Applications/flameshot.app