virtualenv2 venv
source venv/bin/activate
./build_android.sh
./build_kernel_leeco.sh
./make_boot.sh leeco
./make_recovery.sh leeco
./make_system.sh
