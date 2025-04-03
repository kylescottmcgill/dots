#!

efibootmgr --create --disk /dev/nvme1n1 --part 1 --label Archlinux --loader /vmlinuz-linux --unicode "root=UUID=$(blkid -s UUID -o value /dev/nvme1n1p2) rw initrd=\amd-ucode.img initrd=\initramfs-linux.img"

