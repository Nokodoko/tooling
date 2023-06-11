#-----qmk-----#

function flistd() {
    ARG="$1"
    fzf --reverse --border --border-label="$ARG"
}

function qmkBuild() {
    qmk compile -kb "$1" -km "$@"
}
 
function qmkls() {
    pushd ~/Programs/qmk_firmware
    qmk list-keyboards | flistd "QMK Keyboards"
}

function board() {
    pushd ~/Programs/qmk_firmware/keyboards
    cl $(qmk list-keyboards | flistd "QMK Keyboards")
}

#-----helpers-----#
    function listJson() {
        fd -d1 -e json | flist "Json Lister"
    }

    function qmkConvert() {
        qmk json2c "$@"
    }
#-----helpers-----#

function qmkJson () {
    listJson | qmkConvert
}

#-----dfu-commands-----#
    alias dfuErase='sudo dfu-programmer atmega32u4 erase --force && echo "requires double-tap on rest button"'
    alias dfuReset='sudo dfu-programmer atmega32u4 reset'

    function dfuFlash() {
        dfu-programmer atmega32u4 flash $(fd -e hex | flist "Flash Hex Files")
    }
#-----/dfu-commands-----#


#Run the following command to put your elite-c into DFU mode: `sudo dfu-programmer atmega32u4 erase --force`
#5. Run the following command to flash your hex file onto the elite-c: `sudo dfu-programmer atmega32u4 flash <your_hex_file>.hex`
#6. Run the following command to reset your elit
#e-c: `sudo dfu-programmer atmega32u4 reset`
