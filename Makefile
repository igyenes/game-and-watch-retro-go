TARGET = gw_retro_go

DEBUG = 0

OPT = -O2 -ggdb3

# To enable verbose, append VERBOSE=1 to make, e.g.:
# make VERBOSE=1
ifneq ($(strip $(VERBOSE)),1)
V = @
endif

######################################
# source
######################################
# C sources
C_SOURCES =  \
Core/Src/bilinear.c \
Core/Src/gw_buttons.c \
Core/Src/gw_flash.c \
Core/Src/gw_lcd.c \
Core/Src/gw_malloc.c \
Core/Src/game_genie.c \
Core/Src/main.c \
Core/Src/sha256.c \
Core/Src/flashapp.c \
Core/Src/bq24072.c \
Core/Src/porting/lib/lz4_depack.c \
Core/Src/porting/lib/lzma/LzmaDec.c \
Core/Src/porting/lib/lzma/lzma.c \
Core/Src/porting/lib/hw_jpeg_decoder.c \
Core/Src/porting/common.c \
Core/Src/porting/odroid_audio.c \
Core/Src/porting/odroid_display.c \
Core/Src/porting/odroid_input.c \
Core/Src/porting/odroid_netplay.c \
Core/Src/porting/odroid_overlay.c \
Core/Src/porting/odroid_sdcard.c \
Core/Src/porting/odroid_system.c \
Core/Src/porting/crc32.c \
Core/Src/stm32h7xx_hal_msp.c \
Core/Src/stm32h7xx_it.c \
Core/Src/system_stm32h7xx.c

GNUBOY_C_SOURCES = \
Core/Src/porting/gb/main_gb.c \
retro-go-stm32/gnuboy-go/components/gnuboy/cpu.c \
retro-go-stm32/gnuboy-go/components/gnuboy/debug.c \
retro-go-stm32/gnuboy-go/components/gnuboy/emu.c \
retro-go-stm32/gnuboy-go/components/gnuboy/hw.c \
retro-go-stm32/gnuboy-go/components/gnuboy/lcd.c \
retro-go-stm32/gnuboy-go/components/gnuboy/loader.c \
retro-go-stm32/gnuboy-go/components/gnuboy/mem.c \
retro-go-stm32/gnuboy-go/components/gnuboy/rtc.c \
retro-go-stm32/gnuboy-go/components/gnuboy/sound.c \

NES_C_SOURCES = \
Core/Src/porting/nes/main_nes.c \
Core/Src/porting/nes/nofrendo_stm32.c \
retro-go-stm32/nofrendo-go/components/nofrendo/cpu/dis6502.c \
retro-go-stm32/nofrendo-go/components/nofrendo/cpu/nes6502.c \
retro-go-stm32/nofrendo-go/components/nofrendo/mappers/map000.c \
retro-go-stm32/nofrendo-go/components/nofrendo/mappers/map001.c \
retro-go-stm32/nofrendo-go/components/nofrendo/mappers/map002.c \
retro-go-stm32/nofrendo-go/components/nofrendo/mappers/map003.c \
retro-go-stm32/nofrendo-go/components/nofrendo/mappers/map004.c \
retro-go-stm32/nofrendo-go/components/nofrendo/mappers/map005.c \
retro-go-stm32/nofrendo-go/components/nofrendo/mappers/map007.c \
retro-go-stm32/nofrendo-go/components/nofrendo/mappers/map008.c \
retro-go-stm32/nofrendo-go/components/nofrendo/mappers/map009.c \
retro-go-stm32/nofrendo-go/components/nofrendo/mappers/map010.c \
retro-go-stm32/nofrendo-go/components/nofrendo/mappers/map011.c \
retro-go-stm32/nofrendo-go/components/nofrendo/mappers/map015.c \
retro-go-stm32/nofrendo-go/components/nofrendo/mappers/map016.c \
retro-go-stm32/nofrendo-go/components/nofrendo/mappers/map018.c \
retro-go-stm32/nofrendo-go/components/nofrendo/mappers/map019.c \
retro-go-stm32/nofrendo-go/components/nofrendo/mappers/map021.c \
retro-go-stm32/nofrendo-go/components/nofrendo/mappers/map020.c \
retro-go-stm32/nofrendo-go/components/nofrendo/mappers/map022.c \
retro-go-stm32/nofrendo-go/components/nofrendo/mappers/map023.c \
retro-go-stm32/nofrendo-go/components/nofrendo/mappers/map024.c \
retro-go-stm32/nofrendo-go/components/nofrendo/mappers/map030.c \
retro-go-stm32/nofrendo-go/components/nofrendo/mappers/map032.c \
retro-go-stm32/nofrendo-go/components/nofrendo/mappers/map033.c \
retro-go-stm32/nofrendo-go/components/nofrendo/mappers/map034.c \
retro-go-stm32/nofrendo-go/components/nofrendo/mappers/map040.c \
retro-go-stm32/nofrendo-go/components/nofrendo/mappers/map041.c \
retro-go-stm32/nofrendo-go/components/nofrendo/mappers/map042.c \
retro-go-stm32/nofrendo-go/components/nofrendo/mappers/map046.c \
retro-go-stm32/nofrendo-go/components/nofrendo/mappers/map050.c \
retro-go-stm32/nofrendo-go/components/nofrendo/mappers/map064.c \
retro-go-stm32/nofrendo-go/components/nofrendo/mappers/map065.c \
retro-go-stm32/nofrendo-go/components/nofrendo/mappers/map066.c \
retro-go-stm32/nofrendo-go/components/nofrendo/mappers/map070.c \
retro-go-stm32/nofrendo-go/components/nofrendo/mappers/map071.c \
retro-go-stm32/nofrendo-go/components/nofrendo/mappers/map073.c \
retro-go-stm32/nofrendo-go/components/nofrendo/mappers/map074.c \
retro-go-stm32/nofrendo-go/components/nofrendo/mappers/map075.c \
retro-go-stm32/nofrendo-go/components/nofrendo/mappers/map076.c \
retro-go-stm32/nofrendo-go/components/nofrendo/mappers/map078.c \
retro-go-stm32/nofrendo-go/components/nofrendo/mappers/map079.c \
retro-go-stm32/nofrendo-go/components/nofrendo/mappers/map085.c \
retro-go-stm32/nofrendo-go/components/nofrendo/mappers/map087.c \
retro-go-stm32/nofrendo-go/components/nofrendo/mappers/map093.c \
retro-go-stm32/nofrendo-go/components/nofrendo/mappers/map094.c \
retro-go-stm32/nofrendo-go/components/nofrendo/mappers/map119.c \
retro-go-stm32/nofrendo-go/components/nofrendo/mappers/map160.c \
retro-go-stm32/nofrendo-go/components/nofrendo/mappers/map162.c \
retro-go-stm32/nofrendo-go/components/nofrendo/mappers/map185.c \
retro-go-stm32/nofrendo-go/components/nofrendo/mappers/map191.c \
retro-go-stm32/nofrendo-go/components/nofrendo/mappers/map192.c \
retro-go-stm32/nofrendo-go/components/nofrendo/mappers/map193.c \
retro-go-stm32/nofrendo-go/components/nofrendo/mappers/map194.c \
retro-go-stm32/nofrendo-go/components/nofrendo/mappers/map195.c \
retro-go-stm32/nofrendo-go/components/nofrendo/mappers/map228.c \
retro-go-stm32/nofrendo-go/components/nofrendo/mappers/map206.c \
retro-go-stm32/nofrendo-go/components/nofrendo/mappers/map229.c \
retro-go-stm32/nofrendo-go/components/nofrendo/mappers/map231.c \
retro-go-stm32/nofrendo-go/components/nofrendo/mappers/map252.c \
retro-go-stm32/nofrendo-go/components/nofrendo/mappers/map253.c \
retro-go-stm32/nofrendo-go/components/nofrendo/nes/nes_apu.c \
retro-go-stm32/nofrendo-go/components/nofrendo/nes/nes_input.c \
retro-go-stm32/nofrendo-go/components/nofrendo/nes/nes_mem.c \
retro-go-stm32/nofrendo-go/components/nofrendo/nes/nes_mmc.c \
retro-go-stm32/nofrendo-go/components/nofrendo/nes/nes_ppu.c \
retro-go-stm32/nofrendo-go/components/nofrendo/nes/nes_rom.c \
retro-go-stm32/nofrendo-go/components/nofrendo/nes/nes_state.c \
retro-go-stm32/nofrendo-go/components/nofrendo/nes/nes.c

SMSPLUSGX_C_SOURCES = \
retro-go-stm32/smsplusgx-go/components/smsplus/loadrom.c \
retro-go-stm32/smsplusgx-go/components/smsplus/render.c \
retro-go-stm32/smsplusgx-go/components/smsplus/sms.c \
retro-go-stm32/smsplusgx-go/components/smsplus/state.c \
retro-go-stm32/smsplusgx-go/components/smsplus/vdp.c \
retro-go-stm32/smsplusgx-go/components/smsplus/pio.c \
retro-go-stm32/smsplusgx-go/components/smsplus/tms.c \
retro-go-stm32/smsplusgx-go/components/smsplus/memz80.c \
retro-go-stm32/smsplusgx-go/components/smsplus/system.c \
retro-go-stm32/smsplusgx-go/components/smsplus/cpu/z80.c \
retro-go-stm32/smsplusgx-go/components/smsplus/sound/emu2413.c \
retro-go-stm32/smsplusgx-go/components/smsplus/sound/fmintf.c \
retro-go-stm32/smsplusgx-go/components/smsplus/sound/sn76489.c \
retro-go-stm32/smsplusgx-go/components/smsplus/sound/sms_sound.c \
retro-go-stm32/smsplusgx-go/components/smsplus/sound/ym2413.c \
Core/Src/porting/smsplusgx/main_smsplusgx.c

PCE_C_SOURCES = \
retro-go-stm32/pce-go/components/pce-go/gfx.c \
retro-go-stm32/pce-go/components/pce-go/h6280.c \
retro-go-stm32/pce-go/components/pce-go/pce.c \
Core/Src/porting/pce/sound_pce.c \
Core/Src/porting/pce/main_pce.c

CORE_MSX = blueMSX-go
LIBRETRO_COMM_DIR  = $(CORE_MSX)/libretro-common

MSX_C_SOURCES = \
$(CORE_MSX)/Src/Libretro/Timer.c \
$(CORE_MSX)/Src/Libretro/Emulator.c \
$(CORE_MSX)/Src/Bios/Patch.c \
$(CORE_MSX)/Src/Memory/DeviceManager.c \
$(CORE_MSX)/Src/Memory/IoPort.c \
$(CORE_MSX)/Src/Memory/MegaromCartridge.c \
$(CORE_MSX)/Src/Memory/ramNormal.c \
$(CORE_MSX)/Src/Memory/ramMapper.c \
$(CORE_MSX)/Src/Memory/ramMapperIo.c \
$(CORE_MSX)/Src/Memory/RomLoader.c \
$(CORE_MSX)/Src/Memory/romMapperASCII8.c \
$(CORE_MSX)/Src/Memory/romMapperASCII16.c \
$(CORE_MSX)/Src/Memory/romMapperASCII16nf.c \
$(CORE_MSX)/Src/Memory/romMapperBasic.c \
$(CORE_MSX)/Src/Memory/romMapperCasette.c \
$(CORE_MSX)/Src/Memory/romMapperDRAM.c \
$(CORE_MSX)/Src/Memory/romMapperF4device.c \
$(CORE_MSX)/Src/Memory/romMapperKoei.c \
$(CORE_MSX)/Src/Memory/romMapperKonami4.c \
$(CORE_MSX)/Src/Memory/romMapperKonami4nf.c \
$(CORE_MSX)/Src/Memory/romMapperKonami5.c \
$(CORE_MSX)/Src/Memory/romMapperLodeRunner.c \
$(CORE_MSX)/Src/Memory/romMapperMsxDos2.c \
$(CORE_MSX)/Src/Memory/romMapperMsxMusic.c \
$(CORE_MSX)/Src/Memory/romMapperNormal.c \
$(CORE_MSX)/Src/Memory/romMapperPlain.c \
$(CORE_MSX)/Src/Memory/romMapperRType.c \
$(CORE_MSX)/Src/Memory/romMapperStandard.c \
$(CORE_MSX)/Src/Memory/romMapperSunriseIDE.c \
$(CORE_MSX)/Src/Memory/romMapperSCCplus.c \
$(CORE_MSX)/Src/Memory/romMapperTC8566AF.c \
$(CORE_MSX)/Src/Memory/SlotManager.c \
$(CORE_MSX)/Src/VideoChips/VDP_YJK.c \
$(CORE_MSX)/Src/VideoChips/VDP_MSX.c \
$(CORE_MSX)/Src/VideoChips/V9938.c \
$(CORE_MSX)/Src/VideoChips/VideoManager.c \
$(CORE_MSX)/Src/Z80/R800.c \
$(CORE_MSX)/Src/Z80/R800SaveState.c \
$(CORE_MSX)/Src/Input/JoystickPort.c \
$(CORE_MSX)/Src/Input/MsxJoystick.c \
$(CORE_MSX)/Src/IoDevice/Disk.c \
$(CORE_MSX)/Src/IoDevice/HarddiskIDE.c \
$(CORE_MSX)/Src/IoDevice/I8255.c \
$(CORE_MSX)/Src/IoDevice/MsxPPI.c \
$(CORE_MSX)/Src/IoDevice/RTC.c \
$(CORE_MSX)/Src/IoDevice/SunriseIDE.c \
$(CORE_MSX)/Src/IoDevice/TC8566AF.c \
$(CORE_MSX)/Src/SoundChips/AudioMixer.c \
$(CORE_MSX)/Src/SoundChips/AY8910.c \
$(CORE_MSX)/Src/SoundChips/SCC.c \
$(CORE_MSX)/Src/SoundChips/MsxPsg.c \
$(CORE_MSX)/Src/SoundChips/YM2413_msx.c \
$(CORE_MSX)/Src/SoundChips/emu2413_msx.c \
$(CORE_MSX)/Src/Emulator/AppConfig.c \
$(CORE_MSX)/Src/Emulator/LaunchFile.c \
$(CORE_MSX)/Src/Emulator/Properties.c \
$(CORE_MSX)/Src/Utils/IsFileExtension.c \
$(CORE_MSX)/Src/Utils/StrcmpNoCase.c \
$(CORE_MSX)/Src/Utils/TokenExtract.c \
$(CORE_MSX)/Src/Board/Board.c \
$(CORE_MSX)/Src/Board/Machine.c \
$(CORE_MSX)/Src/Board/MSX.c \
$(CORE_MSX)/Src/Input/InputEvent.c \
Core/Src/porting/msx/main_msx.c \
Core/Src/porting/msx/save_msx.c

GW_C_SOURCES = \
LCD-Game-Emulator/src/cpus/sm500op.c \
LCD-Game-Emulator/src/cpus/sm510op.c \
LCD-Game-Emulator/src/cpus/sm500core.c \
LCD-Game-Emulator/src/cpus/sm5acore.c \
LCD-Game-Emulator/src/cpus/sm510core.c \
LCD-Game-Emulator/src/cpus/sm511core.c \
LCD-Game-Emulator/src/cpus/sm510base.c \
LCD-Game-Emulator/src/gw_sys/gw_romloader.c \
LCD-Game-Emulator/src/gw_sys/gw_graphic.c \
LCD-Game-Emulator/src/gw_sys/gw_system.c \
Core/Src/porting/gw/main_gw.c

WSV_C_SOURCES = \
potator/common/controls.c \
potator/common/gpu.c \
potator/common/m6502/m6502.c \
potator/common/memorymap.c \
potator/common/timer.c \
potator/common/watara.c \
potator/common/wsv_sound.c \
Core/Src/porting/wsv/main_wsv.c

MD_C_SOURCES = \
gwenesis/src/cpus/M68K/m68kcpu.c \
gwenesis/src/cpus/Z80/Z80.c \
gwenesis/src/sound/z80inst.c \
gwenesis/src/sound/ym2612.c \
gwenesis/src/sound/gwenesis_sn76489.c \
gwenesis/src/bus/gwenesis_bus.c \
gwenesis/src/io/gwenesis_io.c \
gwenesis/src/vdp/gwenesis_vdp_mem.c \
gwenesis/src/vdp/gwenesis_vdp_gfx.c \
gwenesis/src/savestate/gwenesis_savestate.c \
Core/Src/porting/gwenesis/save_gwenesis.c \
Core/Src/porting/gwenesis/main_gwenesis.c

A7800_C_SOURCES = \
prosystem-go/core/Bios.c \
prosystem-go/core/Cartridge.c \
prosystem-go/core/Database.c \
prosystem-go/core/Hash.c \
prosystem-go/core/Maria.c \
prosystem-go/core/Memory.c \
prosystem-go/core/Palette.c \
prosystem-go/core/Pokey.c \
prosystem-go/core/ProSystem.c \
prosystem-go/core/Region.c \
prosystem-go/core/Riot.c \
prosystem-go/core/Sally.c \
prosystem-go/core/Tia.c \
Core/Src/porting/a7800/main_a7800.c

AMSTRAD_C_SOURCES = \
caprice32-go/cap32/cap32.c \
caprice32-go/cap32/crtc.c \
caprice32-go/cap32/fdc.c \
caprice32-go/cap32/kbdauto.c \
caprice32-go/cap32/psg.c \
caprice32-go/cap32/slots.c \
caprice32-go/cap32/cap32_z80.c \
Core/Src/porting/amstrad/main_amstrad.c \
Core/Src/porting/amstrad/save_amstrad.c \
Core/Src/porting/amstrad/amstrad_catalog.c \
Core/Src/porting/amstrad/amstrad_format.c \
Core/Src/porting/amstrad/amstrad_loader.c \
Core/Src/porting/amstrad/amstrad_video8bpp.c

#caprice32-go/cap32/tape.c \

GNUBOY_C_INCLUDES +=  \
-ICore/Inc \
-ICore/Src/porting/lib \
-ICore/Src/porting/lib/lzma \
-Iretro-go-stm32/components/odroid \
-Iretro-go-stm32/gnuboy-go/components \
-I./

NES_C_INCLUDES +=  \
-ICore/Inc \
-ICore/Src/porting/lib \
-ICore/Src/porting/lib/lzma \
-Iretro-go-stm32/nofrendo-go/components/nofrendo/cpu \
-Iretro-go-stm32/nofrendo-go/components/nofrendo/mappers \
-Iretro-go-stm32/nofrendo-go/components/nofrendo/nes \
-Iretro-go-stm32/nofrendo-go/components/nofrendo \
-Iretro-go-stm32/components/odroid \
-I./

SMSPLUSGX_C_INCLUDES +=  \
-ICore/Inc \
-ICore/Src/porting/lib \
-ICore/Src/porting/lib/lzma \
-Iretro-go-stm32/components/odroid \
-Iretro-go-stm32/gnuboy-go/components \
-Iretro-go-stm32/smsplusgx-go/components/smsplus \
-Iretro-go-stm32/smsplusgx-go/components/smsplus/cpu \
-Iretro-go-stm32/smsplusgx-go/components/smsplus/sound \
-I./

PCE_C_INCLUDES +=  \
-ICore/Inc \
-ICore/Src/porting/lib \
-ICore/Src/porting/lib/lzma \
-Iretro-go-stm32/components/odroid \
-Iretro-go-stm32/gnuboy-go/components \
-Iretro-go-stm32/pce-go/components/pce-go \
-Iretro-go-stm32/smsplusgx-go/components/smsplus \
-Iretro-go-stm32/smsplusgx-go/components/smsplus/cpu \
-Iretro-go-stm32/smsplusgx-go/components/smsplus/sound \
-I./

GW_C_INCLUDES +=  \
-ICore/Inc \
-ICore/Src/porting/lib \
-ICore/Src/porting/lib/lzma \
-Iretro-go-stm32/components/odroid \
-ILCD-Game-Emulator/src \
-ILCD-Game-Emulator/src/cpus \
-ILCD-Game-Emulator/src/gw_sys \
-I./

MD_C_INCLUDES +=  \
-ICore/Inc \
-ICore/Src/porting/lib \
-ICore/Src/porting/lib/lzma \
-Iretro-go-stm32/components/odroid \
-Igwenesis/src/cpus/M68K \
-Igwenesis/src/cpus/Z80 \
-Igwenesis/src/sound \
-Igwenesis/src/bus \
-Igwenesis/src/vdp \
-Igwenesis/src/io \
-Igwenesis/src/savestate \
-I./


C_INCLUDES +=  \
-ICore/Inc \
-ICore/Src/porting/lib \
-ICore/Src/porting/lib/lzma \
-Iretro-go-stm32/nofrendo-go/components/nofrendo/cpu \
-Iretro-go-stm32/nofrendo-go/components/nofrendo/mappers \
-Iretro-go-stm32/nofrendo-go/components/nofrendo/nes \
-Iretro-go-stm32/nofrendo-go/components/nofrendo \
-Iretro-go-stm32/components/odroid \
-Iretro-go-stm32/gnuboy-go/components \
-Iretro-go-stm32/smsplusgx-go/components/smsplus \
-I./

GNUBOY_C_INCLUDES +=  \
-ICore/Inc \
-ICore/Src/porting/lib \
-ICore/Src/porting/lib/lzma \
-Iretro-go-stm32/components/odroid \
-Iretro-go-stm32/gnuboy-go/components \
-I./

MSX_C_INCLUDES += \
-ICore/Inc \
-ICore/Src/porting/lib \
-ICore/Src/porting/lib/lzma \
-I$(CORE_MSX) \
-I$(LIBRETRO_COMM_DIR)/include \
-I$(CORE_MSX)/Src/Arch \
-I$(CORE_MSX)/Src/Bios \
-I$(CORE_MSX)/Src/Board \
-I$(CORE_MSX)/Src/BuildInfo \
-I$(CORE_MSX)/Src/Common \
-I$(CORE_MSX)/Src/Debugger \
-I$(CORE_MSX)/Src/Emulator \
-I$(CORE_MSX)/Src/IoDevice \
-I$(CORE_MSX)/Src/Language \
-I$(CORE_MSX)/Src/Media \
-I$(CORE_MSX)/Src/Memory \
-I$(CORE_MSX)/Src/Resources \
-I$(CORE_MSX)/Src/SoundChips \
-I$(CORE_MSX)/Src/TinyXML \
-I$(CORE_MSX)/Src/Utils \
-I$(CORE_MSX)/Src/VideoChips \
-I$(CORE_MSX)/Src/VideoRender \
-I$(CORE_MSX)/Src/Z80 \
-I$(CORE_MSX)/Src/Input \
-I$(CORE_MSX)/Src/Libretro \
-I./

WSV_C_INCLUDES += \
-ICore/Inc \
-ICore/Src/porting/lib \
-ICore/Src/porting/lib/lzma \
-Ipotator/common \
-I./

A7800_C_INCLUDES += \
-ICore/Inc \
-ICore/Src/porting/lib \
-ICore/Src/porting/lib/lzma \
-Iprosystem-go/core \
-I./

AMSTRAD_C_INCLUDES +=  \
-ICore/Inc \
-ICore/Src/porting/lib \
-ICore/Src/porting/lib/lzma \
-Iretro-go-stm32/components/odroid \
-Icaprice32-go/cap32 \
-I./

include Makefile.common


$(BUILD_DIR)/$(TARGET)_extflash.bin: $(BUILD_DIR)/$(TARGET).elf | $(BUILD_DIR)
	$(V)$(ECHO) [ BIN ] $(notdir $@)
	$(V)$(BIN) -j ._itcram_hot -j ._ram_exec -j ._extflash -j .overlay_nes -j .overlay_gb -j .overlay_sms -j .overlay_col -j .overlay_pce -j .overlay_msx -j .overlay_gw -j .overlay_wsv -j .overlay_md -j .overlay_a7800 -j .overlay_amstrad $< $(BUILD_DIR)/$(TARGET)_extflash.bin

$(BUILD_DIR)/$(TARGET)_intflash.bin: $(BUILD_DIR)/$(TARGET).elf | $(BUILD_DIR)
	$(V)$(ECHO) [ BIN ] $(notdir $@)
	$(V)$(BIN) -j .isr_vector -j .text -j .rodata -j .ARM.extab -j .preinit_array -j .init_array -j .fini_array -j .data $< $(BUILD_DIR)/$(TARGET)_intflash.bin

$(BUILD_DIR)/$(TARGET)_intflash2.bin: $(BUILD_DIR)/$(TARGET).elf | $(BUILD_DIR)
	$(V)$(ECHO) [ BIN ] $(notdir $@)
	$(V)$(BIN) -j .flash2 $< $(BUILD_DIR)/$(TARGET)_intflash2.bin