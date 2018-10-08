#!/vendor/bin/sh

# VoLTE haxx
settings_file_global="/data/system/users/0/settings_global.xml"
multi_sim_data_call_hits=$(grep -q -c "multi_sim_data_call\" value=\"-1\"" $settings_file_global)
if [ $multi_sim_data_call_hits == 0 ]; then
    sed -i 's/"multi_sim_data_call" value="[0-9]"/"multi_sim_data_call" value="-1"/g' $settings_file_global
    restorecon $settings_file_global
fi
