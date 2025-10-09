add_ip_from_fusesoc("./i2s.core")

ip_sources(${IP} OPENTITAN_HJSON
    ./data/i2s.hjson
)

regtool(${IP} RTL FILE_SET files_rtl)
regtool(${IP} CDEFINES OUTDIR "${CMAKE_CURRENT_LIST_DIR}/../../../sw/device/lib/drivers/i2s/")
