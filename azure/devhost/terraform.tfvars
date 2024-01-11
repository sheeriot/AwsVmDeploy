# note some variables are set in env.sh to ensure consistency between terraform components
vm_name = "vm0"
# note, many usernames are reserved
vm_user = "devadmin"
vm_size = "Standard_B2s"
ssh_src1 = "76.250.81.157"
ssh_src1name = "dev0-office"
pubkey1_file = "ssh_id-devops-ed25519.pub"

# VM Image
# image_publisher = "Canonical"
# image_offer = "0001-com-ubuntu-server-jammy"
# image_sku = "22_04-lts-gen2"