include(FetchContent)

FetchContent_Declare(
    magic_enum
    GIT_REPOSITORY    https://github.com/Neargye/magic_enum.git # 指定git仓库地址
    GIT_TAG           v0.9.3 # 指定版本
    SOURCE_DIR        ${CMAKE_SOURCE_DIR}/third-party/magic_enum # 源码下载到此目录下
)

FetchContent_MakeAvailable(magic_enum)
