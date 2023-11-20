add_library(stb
    STATIC
        include/stb_image.h
        include/stb_image_resize.h
        include/stb_image_write.h
        src/stb_image.cpp
        src/stb_image_resize.cpp
        src/stb_image_write.cpp
)

target_include_directories(stb PUBLIC include)
