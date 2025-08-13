# Correct video resolution of Hyper-V VM
Set-VMVideo -VMName "Linux" -HorizontalResolution 3840 -VerticalResolution 2160 -ResolutionType Single

# Enable Enhanced Session Mode
Set-VMHost -EnableEnhancedSessionMode $True

# Create a new virtual switch
New-VMSwitch -Name "NAT-Switch" -SwitchType Internal

# Assign the gateway to the virtual switch
$INTERFACE_INDEX = (Get-NetAdapter -Name "vEthernet(NAT-Switch)").ifIndex
New-NetIPAddress -IPAddress 192.168.1.1 -PrefixLength 24 -InterfaceIndex $INTERFACE_INDEX

# Create a new NAT for the internal network
New-NetNat -Name "NAT-Network" -InternalIPInterfaceAddressPrefix 192.168.1.0/24

# TODO: From Hyper-V Manager assign the VM network to use the new switch called NAT-Switch
# TODO: From within the VM OS click the taskbar network tray icon and choose Network Connections
#         Double-click the Ethernet connection and go to IPv4 Settings
#         Click Add, Address: 192.168.1.11, Netmask: 24, Gateway: 192.168.1.1, DNS: 8.8.8.8

# Copy files from Host to VM
Copy-VMFile -VMName "Linux" -FileSource Host -SourcePath "C:\Users\<user>\Downloads\file-name" -DestinationPath "/home/<user>/Downloads"

