```
docker run \
    --device=/dev/sda \
    -v $(pwd):/workspace \
    --rm ansible-executer \
    ansible-playbook playbook_flash_image.yml --extra-vars "os_hostname=flasher sd_card_image=/workspace/img/hostapd.img"
```
