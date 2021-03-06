#!/bin/sh

if [ "$#" -ne 5 ]; then
	echo "Usage: ./create_vm.sh vm1 Red-Hat 1024 20000 /tmp/CentOS-7-x86_64-Everything-2009.iso" 
	exit
fi
# ./create_vm.sh vm1 Debian_64 1024 20000 3393 Downloads/debian-7.1.0-amd64-netinst.iso
# VBoxManage startvm vm1 -type headless
# VBoxManage unregistervm vm1 --delete


VM_NAME=$1
OS_TYPE=$2
MEMORY_SIZE=$3
HDD_SIZE=$4
#VRDEPORT=$5
DVD_PATH=$5

HDD_PATH=.VirtualBox/Machines/$VM_NAME/$VM_NAME.vdi


VBoxManage createvm -name $VM_NAME -ostype $OS_TYPE --register
VBoxManage modifyvm $VM_NAME \
    --memory $MEMORY_SIZE \
    --vram 12 \
    --pae off \
    --rtcuseutc on \
    --nic1 NAT \
    --accelerate3d off \
    --accelerate2dvideo off \
    --audio none
VBoxManage createvdi --filename $HDD_PATH --size $HDD_SIZE

VBoxManage storagectl $VM_NAME --name "IDE Controller" --add ide
VBoxManage storagectl $VM_NAME --name "SATA Controller" --add sata

VBoxManage storageattach $VM_NAME --storagectl "IDE Controller" --port 1 --device 0 --type dvddrive --medium $DVD_PATH
VBoxManage storageattach $VM_NAME --storagectl "SATA Controller" --port 0 --device 0 --type hdd --medium $HDD_PATH

