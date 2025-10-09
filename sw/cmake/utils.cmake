function(gen_asm TARGET)
    get_target_property(BINARY_DIR ${TARGET} BINARY_DIR)
    add_custom_command(TARGET ${TARGET} POST_BUILD
            COMMAND ${CMAKE_OBJDUMP} -S  $<TARGET_FILE:${TARGET}> > ${BINARY_DIR}/${TARGET}.S
            COMMENT "Invoking: Disassemble")
endfunction()

function(gen_hex TARGET)
    get_target_property(BINARY_DIR ${TARGET} BINARY_DIR)
    add_custom_command(TARGET ${TARGET} POST_BUILD
            COMMAND ${CMAKE_OBJCOPY} -O verilog  $<TARGET_FILE:${TARGET}> ${BINARY_DIR}/${TARGET}.hex
            COMMENT "Invoking: Hexdump")
    add_custom_command(TARGET ${TARGET} POST_BUILD
            COMMAND ${CMAKE_OBJCOPY} --srec-forceS3 --srec-len 1 -O srec $<TARGET_FILE:${TARGET}> ${BINARY_DIR}/${TARGET}.hex.srec
            COMMENT "Invoking: SREC Hexdump")
endfunction()

function(gen_bin TARGET)
    get_target_property(BINARY_DIR ${TARGET} BINARY_DIR)
    add_custom_command(TARGET ${TARGET} POST_BUILD
            COMMAND ${CMAKE_OBJCOPY} -O binary  $<TARGET_FILE:${TARGET}>  ${BINARY_DIR}/${TARGET}.bin
            COMMENT "Invoking: Binary dump")
endfunction()

function(set_linker_script TARGET LINKER_SCRIPT)
    set_target_properties(${TARGET} PROPERTIES LINK_DEPENDS "${LINKER_SCRIPT}")

    target_link_options(${TARGET} PUBLIC
        -T${LINKER_SCRIPT}
        )
endfunction()
