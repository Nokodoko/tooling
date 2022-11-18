function mounty() {
    sudo mount /dev/sdc3 /mnt &&
    sudo mount /dev/sdc4 /mnt/home &&
    sudo mount /dev/sdc1 /mnt/boot &&
    sudo arch-chroot /mnt
}

function mounta() {
    sudo mount /dev/sda3 /mnt &&
    sudo mount /dev/sda4 /mnt/home &&
    sudo mount /dev/sda1 /mnt/boot &&
    sudo arch-chroot /mnt
}
