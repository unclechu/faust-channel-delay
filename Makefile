LV2_URI_PREFIX = https://github.com/unclechu/faust-channel-delay
LV2_STEREO_NAME = channelDelayStereo
LV2_STEREO_BUNDLE = $(LV2_STEREO_NAME).lv2

lv2: lv2-stereo

lv2-stereo: clean-lv2-stereo
	env faust2lv2 $(LV2_STEREO_NAME).dsp -uri-prefix $(LV2_URI_PREFIX)

clean: clean-lv2

clean-lv2: clean-lv2-stereo

clean-lv2-stereo:
	rm -rf $(LV2_STEREO_BUNDLE)
