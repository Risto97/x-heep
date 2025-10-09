add_ip(xheep_linker)

ip_link(${IP} 
    ${XHEEP_CFG_IP}
)
ip_sources(${IP} OPENTITAN_LINKER_TEMPLATE
    ./link.ld.tpl
    ./link_flash_load.ld.tpl
    ./link_flash_exec.ld.tpl
)

mcu_gen_template(${IP})
