FetchContent_Declare(uvtarget
    GIT_REPOSITORY "https://github.com/risto97/uvtarget.git"
    GIT_TAG main)

FetchContent_MakeAvailable(uvtarget)
include("${uvtarget_SOURCE_DIR}/Uv.cmake")

uv_initialize(
    # Pin to a specific Python verison
    PYTHON_VERSION 3.12
    # Move the workspace pyproject+lock to a subdirectory
    MANAGED_PYPROJECT_FILE python/pyproject.toml
    # # Give the workspace a name
    WORKSPACE_PACKAGE_NAME xheep_py
    # WORKSPACE_VENV ${CMAKE_BINARY_DIR}/.venv
    # # Enable installation, to a venv at this path
    # INSTALLATION_VENV /opt/basis/.venv
    # # Setup storage for the venv, required for `sudo make install`
    # INSTALLATION_VENV_CACHE /opt/basis/cache
    )

uv_add_dev_dependency("jinja2>=2.0.0")
uv_add_dev_dependency("dataclasses")
uv_add_dev_dependency("hjson==3.1.0")
uv_add_dev_dependency("jsonref==1.0.1")
uv_add_dev_dependency("Mako==1.1.6")
uv_add_dev_dependency("MarkupSafe==2.0.1")
uv_add_dev_dependency("pyaml==23.5.8")
uv_add_dev_dependency("PyYAML==6.0.2")
uv_add_dev_dependency("setuptools")
